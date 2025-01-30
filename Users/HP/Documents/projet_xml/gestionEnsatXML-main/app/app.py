import streamlit as st
import requests
import os
import io

# ==========================
# 1) Configurer la page
# ==========================
st.set_page_config(
    page_title="Gestion Scolaire",
    page_icon="📚",
    layout="wide"  # Utilisation de toute la largeur
)

FLASK_BASE_URL = "http://127.0.0.1:5000"

# ==========================
# 2) CSS personnalisé
# ==========================
st.markdown("""
    <style>
        /* ---- Couleur de fond de la page ---- */
        body {
            background-color: #1E1E1E;
        }

        /* ---- Conteneur principal (un peu plus large) ---- */
        .main .block-container {
            max-width: 1200px;
            padding: 2rem 2rem;
            background-color: #2C2C2C; /* Pour mieux distinguer la zone de contenu */
            border-radius: 12px;
        }

        /* ---- Titres ---- */
        .header-container h1 {
            font-size: 36px;
            font-weight: 800;
            text-align: center;
            color: #FFFFFF;
            margin-bottom: 0;
        }

        .sub-title {
            font-size: 26px;
            font-weight: 700;
            text-align: center;
            color: #FFA500;
            margin-bottom: 30px;
            margin-top: 40px;
        }

        /* ---- Label pour l'upload ---- */
        .upload-label {
            font-size: 22px;
            font-weight: bold;
            color: #FFFFFF;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        /* On agrandit le texte du file_uploader lui-même */
        .stFileUploader label div {
            font-size: 20px !important;
        }

        /* ---- Boutons : style teal ---- */
        .stButton>button {
            background: linear-gradient(135deg, #7B1FA2, #6A1B9A) !important; /* Dégradé orange */
            color: #ffffff !important;
            border-radius: 8px !important;
            font-size: 20px !important; /* augmente la taille du texte */
            padding: 14px 25px !important; 
            margin: 5px 0px !important;
            border: none;
            transition: 0.2s;
            width: 220px !important;    /* <-- largeur fixe identique pour tous les boutons */
            white-space: nowrap;        /* empêche le texte de passer à la ligne */
        }
        .stButton>button:hover {
            background: linear-gradient(135deg, #FB8C00, #F57C00) !important; 
            transform: scale(1.03);
        }

        /* ---- Boutons de téléchargement ---- */
        .stDownloadButton>button {
            background: linear-gradient(135deg, #FFA726, #FB8C00) !important; /* Exemple : dégradé violet */
            color: white !important;
            border-radius: 25px !important;
            font-size: 20px !important; /* plus grand */
            padding: 14px 25px !important;
            margin: 5px 0px !important;
            border: none;
            width: 220px !important;    /* même largeur que les boutons stButton */
            white-space: nowrap;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
        }
        .stDownloadButton>button:hover {
            background: linear-gradient(135deg, #7B1FA2, #6A1B9A) !important;
            transform: scale(1.03);
        }

        /* ---- Container du header (logos + titre) ---- */
        .header-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            padding: 10px;
            margin-bottom: 30px;
        }
        .header-container img {
            width: 170px;
            height: auto;
        }

        /* ---- Pied de page ---- */
        .footer-text {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            color: #FFFFFF;
            margin-top: 40px;
        }
    </style>
""", unsafe_allow_html=True)


# ==========================
# 3) Header
# ==========================
st.markdown(f"""
    <div class="header-container">
        <img src="{FLASK_BASE_URL}/static/images/logo_ensa.png" alt="ENSA Logo">
        <h1>Gestion des Étudiants, Modules et Notes</h1>
        <img src="{FLASK_BASE_URL}/static/images/logo_uae.png" alt="UAE Logo">
    </div>
""", unsafe_allow_html=True)

# ==========================
# 4) Section : Importation des fichiers
# ==========================
default_files = {
    "students": "data_excel/Students_GINF2.xlsx",
    "modules": "data_excel/Modules_GINF2.xlsx",
    "notes": "data_excel/Notes_GINF2.xlsx"
}

# 📌 Dictionnaire pour stocker les fichiers uploadés
uploaded_files = {key: None for key in default_files}

# 📌 Dictionnaire d'état pour suivre si un fichier par défaut a été utilisé
if "default_used" not in st.session_state:
    st.session_state.default_used = {key: False for key in default_files}

st.markdown('<p class="sub-title">🔼 Charger vos fichiers Excel</p>', unsafe_allow_html=True)

# 📌 Gestion des uploads et du bouton "Utiliser par défaut"
for key, default_path in default_files.items():
    st.markdown(f'<p class="upload-label">📂 Charger le fichier {key.capitalize()} (Excel)</p>', unsafe_allow_html=True)

    col1, col2 = st.columns([3, 1])  # Deux colonnes : file_uploader + bouton

    with col1:
        uploaded_files[key] = st.file_uploader("", type=["xlsx"], key=key)

    with col2:
        st.write("")
        st.write("")
        if st.button(f"🔄 Utiliser {key.capitalize()} par défaut", key=f"default_{key}"):
            if os.path.exists(default_path):  # Vérifier si le fichier par défaut existe
                with open(default_path, "rb") as f:
                    uploaded_files[key] = io.BytesIO(f.read())  # 🔴 Stocker le fichier en mémoire
                st.session_state.default_used[key] = True  # ✅ Marquer comme utilisé
                st.success(f"✅ Fichier par défaut {key} chargé avec succès !")
            else:
                st.error(f"❌ Fichier par défaut {key} introuvable !")

    # 📎 Ajouter un lien de téléchargement SEULEMENT si "Utiliser par défaut" a été cliqué
    if st.session_state.default_used[key]:
        default_filename = os.path.basename(default_path)
        st.markdown(f"[📥 Télécharger {key.capitalize()} par défaut]({FLASK_BASE_URL}/default-excel/{default_filename})", unsafe_allow_html=True)

# 📥 Conversion en XML en prenant en compte les fichiers sélectionnés ou par défaut
if st.button("📤 Convertir les fichiers en XML"):
    for key, default_path in default_files.items():
        save_path = f"data_excel/{key.capitalize()}_GINF2.xlsx"

        if uploaded_files[key]:  # Vérifier si un fichier a été chargé ou sélectionné par défaut
            os.makedirs(os.path.dirname(save_path), exist_ok=True)
            with open(save_path, "wb") as f:
                f.write(uploaded_files[key].getbuffer())  # 🔴 Écrire le fichier stocké en mémoire
            st.success(f"✅ Fichier {key} enregistré avec succès !")
        else:
            # 🔴 Mise à jour automatique pour forcer l'utilisation du fichier par défaut si aucun fichier n'a été trouvé
            if os.path.exists(default_path):
                with open(default_path, "rb") as f:
                    uploaded_files[key] = io.BytesIO(f.read())
                os.makedirs(os.path.dirname(save_path), exist_ok=True)
                with open(save_path, "wb") as f:
                    f.write(uploaded_files[key].getbuffer())  # 🔴 Écrire le fichier en mémoire
                #st.warning(f"⚠️ Aucun fichier chargé pour {key}. Utilisation du fichier par défaut.")

        # 🔥 Conversion en XML
        requests.get(f"{FLASK_BASE_URL}/convert/{key}")
        st.success(f"✅ Fichier {key} converti en XML !")
        st.markdown(f"[📥 Télécharger {key.capitalize()} XML]({FLASK_BASE_URL}/download/xml/{key})", unsafe_allow_html=True)

# ==========================
# 5) Visualiser les HTML
# ==========================
st.markdown('<p class="sub-title">🌐 Visualiser les données sous forme de site web</p>', unsafe_allow_html=True)

html_files = {
    "students": "data_generated/students/Students_GINF2.html",
    "modules": "data_generated/modules/Modules_GINF2.html",
    "notes":   "data_generated/notes/Notes_GINF2.html",
    "ratt":    "data_generated/notes/Ratt_GINF2.html",
    "tps":     "data_generated/tp/TP_GINF2.html",
    "releve":  "data_generated/notes/Releve_GINF2.html"
}

# On récupère la liste des clés (students, modules, notes, etc.)
html_keys = list(html_files.keys())

# Affichage en groupes de 3 boutons par ligne
for i in range(0, len(html_keys), 3):
    row_keys = html_keys[i:i+3]
    # Création de 3 colonnes
    cols = st.columns(len(row_keys))
    for col, key in zip(cols, row_keys):
        with col:
            if st.button(f"📄 Voir {key.capitalize()} (HTML)"):
                requests.get(f"{FLASK_BASE_URL}/transform/{key}")
                st.markdown(
                    f"[🌍 Ouvrir {key.capitalize()}]({FLASK_BASE_URL}/{html_files[key]})",
                    unsafe_allow_html=True
                )


# ==========================
# 6) Téléchargement PDF
# ==========================
st.markdown('<p class="sub-title">📥 Télécharger et générer les fichiers PDF</p>', unsafe_allow_html=True)

html_files2 = {
    "students":     "data_generated/students/Students_GINF2.html",
    "modules":      "data_generated/modules/Modules_GINF2.html",
    "notes":        "data_generated/notes/Notes_GINF2.html",
    
    "tp":           "data_generated/tp/TP_GINF2.html",
    "releve":       "data_generated/notes/releve.html",
    #"student_card": "data_generated/student_card/StudentCard.html",
    "ratt":         "data_generated/notes/Ratt_GINF2.html",
    "edt":          "data_generated/edt/Edt_GINF2.html"
}

pdf_keys = list(html_files2.keys())

# Encore 3 par ligne
for i in range(0, len(pdf_keys), 3):
    row_keys = pdf_keys[i:i+3]
    cols = st.columns(len(row_keys))
    for col, key in zip(cols, row_keys):
        with col:
            if st.button(f"📄 Télécharger PDF {key.capitalize()}"):
                pdf_url = f"{FLASK_BASE_URL}/pdf/{key}"
                response = requests.get(pdf_url)
                if response.status_code == 200:
                    pdf_path = f"{key.capitalize()}_GINF2.pdf"
                    with open(pdf_path, "wb") as f:
                        f.write(response.content)
                    st.success(f"✅ PDF {key} prêt à être téléchargé !")
                    st.download_button(
                        f"⬇️ Télécharger {key.capitalize()}",
                        data=open(pdf_path, "rb"),
                        file_name=pdf_path,
                        mime="application/pdf"
                    )
                else:
                    st.error(f"❌ Erreur lors de la génération du PDF {key}.")


# ==========================
# 7) Pied de page
# ==========================
st.markdown('<p class="footer-text">✅ Utilisez les boutons ci-dessus pour gérer vos fichiers.</p>', unsafe_allow_html=True)
