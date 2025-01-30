import pandas as pd
from lxml import etree


def ensure_directory(directory_path):
    """
    Vérifie si un dossier existe, sinon le crée.
    """
    import os
    if not os.path.exists(directory_path):
        os.makedirs(directory_path)


def convert_modules_to_xml(input_file, output_file):
    """
    Convertit un fichier Excel contenant des modules en fichier XML avec une structure lisible.
    """
    # Charger le fichier Excel
    data = pd.read_excel(input_file)

    # Initialiser l'élément racine
    root = etree.Element("Modules")

    for _, row in data.iterrows():
        # Ajouter un élément <Module>
        module = etree.SubElement(root, "Module")
        etree.SubElement(module, "ModuleID").text = str(row["ModuleID"])
        etree.SubElement(module, "ModuleName").text = str(row["ModuleName"])
        etree.SubElement(module, "ElementName1").text = str(row["ElementName1"])
        etree.SubElement(module, "ElementName2").text = str(row["ElementName2"])
        etree.SubElement(module, "Dept_Attachement").text = str(row["Dept_Attachement"])

    # Sauvegarder le fichier XML avec indentation
    tree = etree.ElementTree(root)
    with open(output_file, "wb") as f:
        tree.write(f, pretty_print=True, xml_declaration=True, encoding="utf-8")

    print(f"Fichier XML des modules généré avec structure lisible : {output_file}")


def convert_students_to_xml(input_file, output_file):
    """
    Convertit un fichier Excel contenant des étudiants en fichier XML avec une structure lisible.
    """
    # Charger le fichier Excel
    data = pd.read_excel(input_file)

    # Initialiser l'élément racine
    root = etree.Element("Students")

    for _, row in data.iterrows():
        # Ajouter un élément <Student>
        student = etree.SubElement(root, "Student")
        etree.SubElement(student, "CodeApogee").text = str(row["code_apogée"])
        etree.SubElement(student, "CIN").text = str(row["CIN"])
        etree.SubElement(student, "CNE").text = str(row["CNE"])
        etree.SubElement(student, "Nom").text = str(row["Nom"])
        etree.SubElement(student, "Prenom").text = str(row["Prénom"])
        etree.SubElement(student, "LieuNaissance").text = str(row["Lieu_Naissance"])
        etree.SubElement(student, "DateNaissance").text = str(row["Date_Naissance"])

    # Sauvegarder le fichier XML avec indentation
    tree = etree.ElementTree(root)
    with open(output_file, "wb") as f:
        tree.write(f, pretty_print=True, xml_declaration=True, encoding="utf-8")

    print(f"Fichier XML des étudiants généré avec structure lisible : {output_file}")


def convert_notes_to_xml(input_file, output_file):
    """
    Conversion spécifique pour les notes, avec structure imbriquée et lisible.
    """
    # Charger le fichier Excel
    data = pd.read_excel(input_file)

    # Grouper par étudiant
    grouped = data.groupby("CodeApogee")

    # Initialiser l'élément racine
    root = etree.Element("Students")

    for code_apogee, group in grouped:
        # Ajouter un élément <Student> pour chaque étudiant
        student = etree.SubElement(root, "Student")
        etree.SubElement(student, "CodeApogee").text = str(code_apogee)
        etree.SubElement(student, "Nom").text = group["Nom"].iloc[0]
        etree.SubElement(student, "Prenom").text = group["Prenom"].iloc[0]
        etree.SubElement(student, "DateNaissance").text = group["DateNaissance"].iloc[0]

        # Ajouter les modules
        modules_elem = etree.SubElement(student, "Modules")
        module_grouped = group.groupby("Module")

        for module_name, module_group in module_grouped:
            module = etree.SubElement(modules_elem, "Module")
            etree.SubElement(module, "Name").text = module_name

            # Ajouter les sous-modules
            submodules_elem = etree.SubElement(module, "SubModules")
            for _, row in module_group.iterrows():
                if row["SousModule"] != "Note Finale":
                    submodule = etree.SubElement(submodules_elem, "SubModule")
                    etree.SubElement(submodule, "Name").text = row["SousModule"]
                    etree.SubElement(submodule, "Note").text = str(row["Note"])
                else:
                    # Ajouter la note finale
                    etree.SubElement(module, "NoteFinale").text = str(row["Note"])

    # Sauvegarder le fichier XML avec indentation
    tree = etree.ElementTree(root)
    with open(output_file, "wb") as f:
        tree.write(f, pretty_print=True, xml_declaration=True, encoding="utf-8")

    print(f"Fichier XML spécifique aux notes généré avec structure lisible : {output_file}")
