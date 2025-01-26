from lxml import etree

def validate_xml_with_xsd(xml_file, xsd_file):
    """
    Valide un fichier XML avec un schéma XSD.
    """
    try:
        # Charger le fichier XSD
        with open(xsd_file, 'r') as schema_file:
            schema_doc = etree.parse(schema_file)
            schema = etree.XMLSchema(schema_doc)
        
        # Charger le fichier XML
        xml_doc = etree.parse(xml_file)
        
        # Validation
        schema.assertValid(xml_doc)
        print(f"{xml_file} est valide selon {xsd_file}.")
        return True
    except etree.DocumentInvalid as e:
        print(f"{xml_file} n'est pas valide :\n{e}")
        return False
    except Exception as e:
        print(f"Erreur lors de la validation : {e}")
        return False


def validate_students(xml_file, xsd_file):
    """
    Valide le fichier Students XML avec un schéma XSD.
    """
    print("\nValidation du fichier Students...")
    return validate_xml_with_xsd(xml_file, xsd_file)


def validate_modules(xml_file, xsd_file):
    """
    Valide le fichier Modules XML avec un schéma XSD.
    """
    print("\nValidation du fichier Modules...")
    return validate_xml_with_xsd(xml_file, xsd_file)


def validate_notes(xml_file, xsd_file, threshold):
    """
    Valide le fichier Notes XML avec un schéma XSD, et vérifie les seuils.
    """
    print("\nValidation du fichier Notes...")
    
    # Validation avec le schéma XSD
    is_valid_xsd = validate_xml_with_xsd(xml_file, xsd_file)
    if not is_valid_xsd:
        return False
    
    # Vérification des seuils pour les notes finales
    print("\nVérification des seuils pour les notes finales...")
    try:
        # Charger le fichier XML
        xml_doc = etree.parse(xml_file)
        
        # Récupérer toutes les notes finales
        students = xml_doc.xpath("//Student")
        for student in students:
            nom = student.find("Nom").text
            prenom = student.find("Prenom").text
            classe_type = student.find("ClasseType").text
            modules = student.xpath(".//Module")
            
            for module in modules:
                note_finale = float(module.find("NoteFinale").text)
                if note_finale < threshold:
                    print(f"Erreur : {nom} {prenom} ({classe_type}) a une note finale {note_finale} inférieure au seuil {threshold}.")
                    return False
        
        print(f"Toutes les notes finales dans {xml_file} respectent le seuil {threshold}.")
        return True
    except Exception as e:
        print(f"Erreur lors de la vérification des seuils : {e}")
        return False
