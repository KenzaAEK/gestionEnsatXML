from lxml import etree
import os

def transform_xml_to_html(xml_file, xslt_file, output_file):
    """
    Transforme un fichier XML en HTML à l'aide d'un fichier XSLT.
    """
    try:
        # Charger le fichier XML
        xml_tree = etree.parse(xml_file)
        
        # Charger le fichier XSLT
        xslt_tree = etree.parse(xslt_file)
        transform = etree.XSLT(xslt_tree)
        
        # Appliquer la transformation
        result_tree = transform(xml_tree)
        
        # Sauvegarder le fichier HTML
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        with open(output_file, "wb") as f:
            f.write(etree.tostring(result_tree, pretty_print=True, method="html"))
        
        print(f"HTML généré avec succès : {output_file}")
        return True
    except Exception as e:
        print(f"Erreur lors de la transformation : {e}")
        return False