from flask import Blueprint, Response, request, send_file
from app.controllers.convert_excel_to_xml import convert_modules_to_xml, convert_students_to_xml, convert_notes_to_xml
from app.controllers.transform_xml_to_html import transform_xml_to_html
from app.controllers.transform_xml_to_pdf import transform_xml_to_pdf
import os

main = Blueprint('main', __name__)

@main.route('/')
def home():
    return "Bienvenue sur l'API de conversion Excel vers XML."

# Route pour les modules
@main.route('/convert/modules', methods=['GET'])
def convert_modules():
    input_file = "data_excel/Modules_GINF2.xlsx"
    output_file = "data_generated/modules/Modules_GINF2.xml"

    # Appeler la fonction spécifique pour les modules
    convert_modules_to_xml(input_file, output_file)

    # Lire le fichier XML pour le retourner en réponse
    with open(output_file, 'r', encoding='utf-8') as f:
        xml_content = f.read()

    return Response(
        xml_content,
        mimetype='text/xml',
        headers={'Content-Disposition': 'attachment;filename=Modules_GINF2.xml'}
    )

# Route pour les étudiants
@main.route('/convert/students', methods=['GET'])
def convert_students():
    input_file = "data_excel/Students_GINF2.xlsx"
    output_file = "data_generated/students/Students_GINF2.xml"

    # Appeler la fonction spécifique pour les étudiants
    convert_students_to_xml(input_file, output_file)

    # Lire le fichier XML pour le retourner en réponse
    with open(output_file, 'r', encoding='utf-8') as f:
        xml_content = f.read()

    return Response(
        xml_content,
        mimetype='text/xml',
        headers={'Content-Disposition': 'attachment;filename=Students_GINF2.xml'}
    )

# Route pour la conversion spécifique aux notes
@main.route('/convert/notes', methods=['GET'])
def convert_specific_notes():
    # Paramètres pour les fichiers Excel et XML
    input_file = "data_excel/Notes_GINF2.xlsx"
    output_file = "data_generated/notes/Notes_GINF2.xml"

    # Appeler la conversion spécifique
    convert_notes_to_xml(input_file, output_file)

    # Lire le fichier XML généré pour le retourner en réponse
    with open(output_file, 'r', encoding='utf-8') as f:
        xml_content = f.read()

    return Response(
        xml_content,
        mimetype='text/xml',
        headers={'Content-Disposition': 'attachment;filename=Notes_GINF2.xml'}
    )

@main.route('/transform/notes', methods=['GET'])
def transform_notes():
    """
    Route pour transformer Notes_GINF2.xml en Notes_GINF2.html.
    """
    xml_file = "data_generated/notes/Notes_GINF2.xml"
    xslt_file = "templates/Notes.xslt"
    output_file = "data_generated/notes/Notes_GINF2.html"

    if transform_xml_to_html(xml_file, xslt_file, output_file):
        return Response(f"HTML généré avec succès : <a href='{output_file}'>{output_file}</a>", mimetype="text/html")
    else:
        return Response("Erreur lors de la transformation XML → HTML.", mimetype="text/html")
    
@main.route('/transform/ratt', methods=['GET'])
def transform_ratt():
    """
    Route pour transformer Notes_GINF2.xml en Notes_GINF2.html.
    """
    xml_file = "data_generated/notes/Notes_GINF2.xml"
    xslt_file = "templates/Ratt.xslt"
    output_file = "data_generated/notes/Ratt_GINF2.html"

    if transform_xml_to_html(xml_file, xslt_file, output_file):
        return Response(f"HTML généré avec succès : <a href='{output_file}'>{output_file}</a>", mimetype="text/html")
    else:
        return Response("Erreur lors de la transformation XML → HTML.", mimetype="text/html")
    
@main.route('/transform/modules', methods=['GET'])
def transform_modules():
    """
    Route pour transformer Modules_GINF2.xml en Modules_GINF2.html.
    """
    xml_file = "data_generated/modules/Modules_GINF2.xml"
    xslt_file = "templates/Modules.xslt"
    output_file = "data_generated/modules/Modules_GINF2.html"

    if transform_xml_to_html(xml_file, xslt_file, output_file):
        return Response(f"HTML généré avec succès : <a href='{output_file}'>{output_file}</a>", mimetype="text/html")
    else:
        return Response("Erreur lors de la transformation XML → HTML.", mimetype="text/html")

@main.route('/transform/students', methods=['GET'])
def transform_students():
    """
    Route pour transformer Students_GINF2.xml en Students_GINF2.html.
    """
    xml_file = "data_generated/students/Students_GINF2.xml"
    xslt_file = "templates/Students.xslt"
    output_file = "data_generated/students/Students_GINF2.html"

    if transform_xml_to_html(xml_file, xslt_file, output_file):
        return Response(f"HTML généré avec succès : <a href='{output_file}'>{output_file}</a>", mimetype="text/html")
    else:
        return Response("Erreur lors de la transformation XML → HTML.", mimetype="text/html")
    
@main.route('/transform/pdf/<file_type>', methods=['GET'])
@main.route('/transform/pdf/<file_type>', methods=['GET'])
def transform_to_pdf(file_type):
    """
    Route pour générer un PDF (students, modules, notes) et permettre son téléchargement.
    """
    try:
        file_mapping = {
            "students": {
                "xml": os.path.abspath("data_generated/students/Students_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/Students.fo"),
                "pdf": os.path.abspath("data_generated/students/Students_GINF2.pdf")
            },
            "modules": {
                "xml": os.path.abspath("data_generated/modules/Modules_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/Modules.fo"),
                "pdf": os.path.abspath("data_generated/modules/Modules_GINF2.pdf")
            },
            "notes": {
                "xml": os.path.abspath("data_generated/notes/Notes_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/Notes.fo"),
                "pdf": os.path.abspath("data_generated/notes/Notes_GINF2.pdf")
            }
        }

        if file_type not in file_mapping:
            return Response(f"Type '{file_type}' non valide.", status=400)

        xml_file = file_mapping[file_type]["xml"]
        xslt_file = file_mapping[file_type]["xslt"]
        output_pdf = file_mapping[file_type]["pdf"]

        # Vérifications des fichiers
        if not os.path.exists(xml_file):
            return Response(f"Fichier XML '{xml_file}' introuvable.", status=400)
        if not os.path.exists(xslt_file):
            return Response(f"Fichier XSLT '{xslt_file}' introuvable.", status=400)

        print(f"🛠️ Vérification PDF : {output_pdf}")

        # Génération du PDF
        transform_xml_to_pdf(xml_file, xslt_file, output_pdf)

        # Vérification finale avant envoi
        if os.path.exists(output_pdf):
            print(f"✅ PDF prêt à être téléchargé : {output_pdf}")
            return send_file(output_pdf, as_attachment=True, mimetype="application/pdf")
        else:
            print(f"❌ Le fichier PDF n'existe pas après la génération !")
            return Response("Erreur lors de la génération du PDF.", status=500)

    except Exception as e:
        print(f"❌ Erreur interne : {str(e)}")
        return Response(f"Erreur interne : {str(e)}", status=500)

@main.route('/transform/Emploi', methods=['GET'])
def transform_emploi():
    """
    Route pour transformer emploi_GINF2.xml en emploi_GINF2.html.
    """
    xml_file = "data_generated/Emploi/emploi_GINF2.xml"
    xslt_file = "templates/emploi_GINF2.xslt"
    output_file = "data_generated/Emploi/emploi_GINF2.html"

    if transform_xml_to_html(xml_file, xslt_file, output_file):
        return Response(f"HTML généré avec succès : <a href='{output_file}'>{output_file}</a>", mimetype="text/html")
    else:
        return Response("Erreur lors de la transformation XML → HTML.", mimetype="text/html")