# EduXML 

## Introduction
Bienvenue dans notre app permettant la conversion de fichiers Excel en XML, leur validation, transformation en HTML, et génération de documents PDF. Cette API facilite la gestion des fichiers académiques (étudiants, modules, notes, emploi du temps, etc.) et offre diverses fonctionnalités accessibles via des routes spécifiques.

## Accès en ligne
Vous pouvez également accéder à notre application déployée via le lien suivant :
🔗 [Projet XML ENSA Tanger](https://projetxmlensatanger.streamlit.app/)

## Installation et Exécution
### Prérequis
- Python installé sur votre machine
- pip pour la gestion des dépendances

### Étapes d'installation et d'exécution de l'application Flask
1. **Installation des dépendances**
   `pip install -r requirements.txt`
Les dépendances sont les suivantes :
- flask - pandas - lxml - openpyxl - gunicorn - streamlit
2. **Lancement du serveur Flask**
   `python run.py`
   Cela démarre le serveur et permet d’accéder aux différentes routes pour traiter les fichiers.
   Ouvrir un navigateur et accéder à `http://localhost:5000`
3. **Routes principales**
Conversion Excel vers XML
- `/convert/modules` : Convertit le fichier `Modules_GINF2.xlsx` en XML.
- `/convert/students` : Convertit le fichier `Students_GINF2.xlsx` en XML.
- `/convert/notes` : Convertit le fichier `Notes_GINF2.xlsx` en XML, avec tri et formatage des notes.
Validation des fichiers XML
- `/validate` : Valide les fichiers XML générés avec les DTD et XSD correspondants.
Génération de groupes de TP
- `/generateTP` : Exécute une requête XQuery pour générer les groupes de TP.
Conversion XML en carte étudiant
- `/studenttocard` : Convertit le fichier XML des étudiants en fichier XML des cartes étudiantes.
Transformation XML en HTML
- `/transform/notes` : Génère un fichier HTML pour l'affichage des notes.
- `/transform/ratt` : Génère un HTML pour les notes de rattrapage.
- `/transform/modules` : Génère un fichier HTML pour les modules.
- `/transform/tps` : Génère un fichier HTML pour les groupes de TP.
- `/transform/edt` : Génère un fichier HTML pour l'emploi du temps.
- `/transform/students` : Génère un fichier HTML pour la liste des étudiants.
- `/transform/releve` : Génère un HTML pour le relevé de notes.
Génération de documents PDF
- `/pdf/students` : Génère un PDF contenant la liste des étudiants.
- `/pdf/modules` : Génère un PDF avec la liste des modules.
- `/pdf/notes` : Génère un relevé de notes au format PDF.
- `/pdf/student_card` : Génère un PDF contenant les cartes étudiants.
- `/pdf/edt` : Génère un PDF pour l'emploi du temps.
- `/pdf/releve` : Génère un PDF du relevé de notes.
- `/pdf/tp` : Génère un PDF des groupes de TP.
- `/pdf/ratt` : Génère un PDF des notes de rattrapage.

## Lancement de l'application Streamlit
L'interface utilisateur est développée avec **Streamlit** pour faciliter l'utilisation des fonctionnalités de l'API.

1. **Accéder au dossier de l'application**
   `cd app`
2. **Lancer l'application Streamlit**
   `streamlit run app.py`
    Ouvrir un navigateur et accéder à `http://localhost:8501`

## Travail de : 
- ABOU-EL KASEM Kenza
- ARIB Aymane
- EL BAKALI Malak
  

