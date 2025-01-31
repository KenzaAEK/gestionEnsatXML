from flask import Blueprint, Response, request, send_file, jsonify
from app.controllers.convert_excel_to_xml import convert_modules_to_xml, convert_students_to_xml, convert_notes_to_xml
from app.controllers.validate_xml import validate_with_dtd, validate_with_xsd, validate_students_constraints, validate_notes_constraints
from app.controllers.transform_xml_to_html import transform_xml_to_html
from app.controllers.transform_xml_to_pdf import transform_xml_to_pdf
from app.controllers.convert_student_to_card import generate_student_cards
from app.controllers.generate_tp_groups import execute_xquery
import os
import subprocess

main = Blueprint('main', __name__)

@main.route('/')
def home():
    """
    Page d'accueil affichant toutes les routes disponibles avec leur description.
    """
    routes_description = {
        "Bienvenue": "API pour la conversion Excel en XML, validation, transformation et generation de documents.",

        "Routes principales": {
            "/convert/modules": "Convertit le fichier Modules_GINF2.xlsx en XML.",
            "/convert/students": "Convertit le fichier Students_GINF2.xlsx en XML.",
            "/convert/notes": "Convertit le fichier Notes_GINF2.xlsx en XML, avec tri et formatage des notes.",
            "/validate": "Valide les fichiers XML generes avec les DTD et XSD correspondants.",
            "/generateTP": "Execute une requete XQuery pour generer les groupes de TP.",
            "/studenttocard": "Convertit fichier xml students en ficher xml student cards"
        },

        "Transformation XML en HTML": {
            "/transform/notes": "Genere un fichier HTML pour l'affichage des notes.",
            "/transform/ratt": "Genere un HTML pour les notes de rattrapage.",
            "/transform/modules": "Genere un fichier HTML pour les modules.",
            "/transform/tps": "Genere un fichier HTML pour les groupes de TP.",
            "/transform/edt": "Genere un fichier HTML pour emploi du temps.",
            "/transform/students": "Genere un fichier HTML pour la liste des etudiants.",
            "/transform/releve": "Genere un HTML pour le releve de notes."
        },

        "Generation XML en PDF": {
            "/pdf/students": "Genere un PDF contenant la liste des etudiants.",
            "/pdf/modules": "Genere un PDF avec la liste des modules.",
            "/pdf/notes": "Genere un relevé de notes au format PDF.",
            "/pdf/student_card": "Genere un PDF contenant les cartes etudiants.",
            "/pdf/edt": "Genereun PDF pour emploi du temps.",
            "/pdf/releve": "Genere un PDF du releve de notes.",
            "/pdf/tp": "Genere un PDF des groupes de TP.",
            "/pdf/ratt": "Genere un PDF des notes de rattrapage."
        }
    }
    
    return jsonify(routes_description), 200

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

@main.route('/validate', methods=['GET'])
def validate_files():
    results = []  # Store validation results

    files_to_validate = [
        {"xml": "data_generated/students/Students_GINF2.xml", "dtd": "schemas/Students.dtd", "xsd": "schemas/Students.xsd"},
        {"xml": "data_generated/modules/Modules_GINF2.xml", "dtd": "schemas/Modules.dtd", "xsd": "schemas/Modules.xsd"},
        {"xml": "data_generated/notes/Notes_GINF2.xml", "dtd": "schemas/Notes.dtd", "xsd": "schemas/Notes.xsd"},
    ]

    for file in files_to_validate:
        file_result = {"file": file["xml"], "status": "Valid"}
        try:
            print(f"Validating {file['xml']}...")

            validate_with_dtd(file["xml"], file["dtd"])
            validate_with_xsd(file["xml"], file["xsd"])
            validate_students_constraints(file["xml"])
            validate_notes_constraints(file["xml"])

        except Exception as e:
            file_result["status"] = "Invalid"
            file_result["error"] = str(e)

        results.append(file_result)

    return jsonify(results), 200  

@main.route('/generateTP', methods=['GET'])
def generate_tp():
    """
    Exécute la requête XQuery et génère le fichier XML TP.
    """
    try:
        execute_xquery()
        return jsonify({"message": "Le fichier TP a été généré avec succès"}), 200
    except subprocess.CalledProcessError as e:
        return jsonify({"error": f"Erreur d'exécution de la requête XQuery : {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Erreur inattendue : {str(e)}"}), 500

@main.route('/transform/<file_type>', methods=['GET'])
def transform_html(file_type):
    """
    Route dynamique pour transformer des fichiers XML en HTML en utilisant un mapping prédéfini.
    Route dynamique pour transformer des fichiers XML en HTML en utilisant un mapping prédéfini.
    """
    file_mapping = {
        "notes": {
            "xml": "data_generated/notes/Notes_GINF2.xml",
            "xslt": "templates/html_templates/Notes.xslt",
            "html": "data_generated/notes/Notes_GINF2.html"
        },
        "ratt": {
            "xml": "data_generated/notes/Notes_GINF2.xml",
            "xslt": "templates/html_templates/Ratt.xslt",
            "html": "data_generated/notes/Ratt_GINF2.html"
        },
        "modules": {
            "xml": "data_generated/modules/Modules_GINF2.xml",
            "xslt": "templates/html_templates/Modules.xslt",
            "html": "data_generated/modules/Modules_GINF2.html"
        },
        "tps": {
            "xml": "data_generated/tp/TP_GINF2.xml",
            "xslt": "templates/html_templates/GroupeTP.xslt",
            "html": "data_generated/tp/TP_GINF2.html"
        },
        "edt": {
            "xml": "data_generated/edt/Edt_GINF2.xml",
            "xslt": "templates/html_templates/Edt.xslt",
            "html": "data_generated/edt/Edt_GINF2.html"
        },
        "students": {
            "xml": "data_generated/students/Students_GINF2.xml",
            "xslt": "templates/html_templates/Students.xslt",
            "html": "data_generated/students/Students_GINF2.html"
        },
        "releve": {
            "xml": "data_generated/notes/Notes_GINF2.xml",
            "xslt": "templates/html_templates/Releve.xslt",
            "html": "data_generated/notes/Releve_GINF2.html"
        }
    }

    if file_type not in file_mapping:
        return Response(f"Type de fichier '{file_type}' non valide.", status=400, mimetype="text/html")
    if file_type not in file_mapping:
        return Response(f"Type de fichier '{file_type}' non valide.", status=400, mimetype="text/html")

    config = file_mapping[file_type]
    xml_path = os.path.abspath(config['xml'])
    xslt_path = os.path.abspath(config['xslt'])
    html_path = os.path.abspath(config['html'])
    config = file_mapping[file_type]
    xml_path = os.path.abspath(config['xml'])
    xslt_path = os.path.abspath(config['xslt'])
    html_path = os.path.abspath(config['html'])

    # Vérification de l'existence des fichiers
    if not os.path.exists(xml_path):
        return Response(f"Fichier XML introuvable : {config['xml']}", status=404, mimetype="text/html")
    if not os.path.exists(xslt_path):
        return Response(f"Fichier XSLT introuvable : {config['xslt']}", status=404, mimetype="text/html")

    # Transformation XML → HTML
    if transform_xml_to_html(xml_path, xslt_path, html_path):
        html_url = f"/{config['html'].replace(os.sep, '/')}"  # Génération de l'URL correcte
        return Response(f"HTML généré avec succès : <a href='{html_url}'>{html_url}</a>", mimetype="text/html")
    # Vérification de l'existence des fichiers
    if not os.path.exists(xml_path):
        return Response(f"Fichier XML introuvable : {config['xml']}", status=404, mimetype="text/html")
    if not os.path.exists(xslt_path):
        return Response(f"Fichier XSLT introuvable : {config['xslt']}", status=404, mimetype="text/html")

    # Transformation XML → HTML
    if transform_xml_to_html(xml_path, xslt_path, html_path):
        html_url = f"/{config['html'].replace(os.sep, '/')}"  # Génération de l'URL correcte
        return Response(f"HTML généré avec succès : <a href='{html_url}'>{html_url}</a>", mimetype="text/html")
    else:
        return Response("Erreur lors de la transformation XML → HTML.", mimetype="text/html")
    
@main.route('/pdf/<file_type>', methods=['GET'])
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
            },
             "student_card": {
                "xml": os.path.abspath("data_generated/student_card/StudentCards_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/StudentCards.fo"),
                "pdf": os.path.abspath("data_generated/student_card/StudentCards.pdf")
            },
            "edt": {
                "xml": os.path.abspath("data_generated/edt/Edt_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/Edt.fo"),
                "pdf": os.path.abspath("data_generated/edt/Edt_GINF2.pdf")
            },
            "releve": {
                "xml": os.path.abspath("data_generated/notes/Notes_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/Releve.fo"),
                "pdf": os.path.abspath("data_generated/notes/Releve_GINF2.pdf")
            },
             "tp": {
                "xml": os.path.abspath("data_generated/tp/TP_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/GroupeTP.fo"),
                "pdf": os.path.abspath("data_generated/tp/TP_GINF2.pdf")
            },
             "ratt": {
                "xml": os.path.abspath("data_generated/notes/Notes_GINF2.xml"),
                "xslt": os.path.abspath("templates/pdf_templates/Ratt.fo"),
                "pdf": os.path.abspath("data_generated/notes/Ratt_GINF2.pdf")
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
    
@main.route('/studenttocard', methods=['GET'])
def convert_card():
    input_file = "data_generated/students/Students_GINF2.xml"
    output_file = "data_generated/student_card/StudentCards_GINF2.xml"

    # Vérification si le fichier d'entrée existe
    if not os.path.exists(input_file):
        return jsonify({"error": f"Input file '{input_file}' does not exist"}), 400

    try:
        # Vérification si le fichier de sortie existe déjà
        if not os.path.exists(output_file):
            # Création du dossier parent si nécessaire
            os.makedirs(os.path.dirname(output_file), exist_ok=True)

        # Appel de la fonction pour convertir les étudiants
        generate_student_cards(input_file, output_file)

        return jsonify({"message": f"Output saved to {output_file}"}), 200
    except Exception as e:
        # Retourner une erreur si la conversion échoue
        return jsonify({"error": str(e)}), 500