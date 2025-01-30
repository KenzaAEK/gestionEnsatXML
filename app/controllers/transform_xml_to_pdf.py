import os
import subprocess

def transform_xml_to_pdf(xml_file, xslt_file, output_pdf):
    """
    Transforme un fichier XML en PDF à l'aide d'un fichier XSLT-FO en utilisant Apache FOP.
    """
    try:
        # ✅ Récupérer le chemin d'Apache FOP (il doit être correctement défini)
        fop_path = "C:\\Users\\HP EliteBook\\Downloads\\fop-2.10-bin\\fop-2.10\\fop\\fop.bat"

        # ✅ Vérifier si FOP est bien accessible
        if not os.path.exists(fop_path):
            print(f"❌ Erreur : Le chemin FOP '{fop_path}' n'existe pas !")
            return False

        # ✅ Vérifier si les fichiers XML et XSLT existent
        for file in [xml_file, xslt_file]:
            if not os.path.exists(file):
                print(f"❌ Erreur : Fichier introuvable : {file}")
                return False

        # ✅ Construire la commande sous forme de LISTE pour éviter les erreurs d'espaces
        command = [
            fop_path, "-xml", xml_file, "-xsl", xslt_file, "-pdf", output_pdf
        ]

        # ✅ Exécuter la commande
        print(f"🛠️  Exécution de la commande : {' '.join(command)}")
        subprocess.run(command, shell=True, check=True)

        # ✅ Vérifier si le PDF a bien été généré
        if os.path.exists(output_pdf):
            print(f"✅ PDF généré avec succès : {output_pdf}")
            return True
        else:
            print(f"❌ Erreur : Le fichier PDF '{output_pdf}' n'a pas été généré.")
            return False

    except subprocess.CalledProcessError as e:
        print(f"❌ Erreur lors de la génération du PDF : {e}")
        return False
