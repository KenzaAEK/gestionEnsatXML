import streamlit as st
import requests
import os

# Définition des URLs pour les routes Flask
FLASK_BASE_URL = "http://127.0.0.1:5000"
FLASK_PUBLIC_URL = "http://localhost:3000"

# 📌 Styles CSS personnalisés
st.markdown("""
    <style>
        body {
            background-color: #1E1E1E;
        }
        .title {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            color: #4CAF50;
            margin-bottom: 15px;
        }
        .sub-title {
            font-size: 26px; /* Augmenté */
            font-weight: bold;
            text-align: center;
            color: #FFA500;
            margin-bottom: 20px;
        }
        .upload-label {
            font-size: 22px !important; /* Augmenté */
            font-weight: bold;
            color: #FFFFFF;
            padding-top: 10px;
        }
        .footer-text {
            font-size: 22px; /* Augmenté */
            font-weight: bold;
            text-align: center;
            color: #FFFFFF;
            margin-top: 40px;
        }
        .stButton>button {
            background-color: #4CAF50 !important;
            color: white !important;
            border-radius: 8px !important;
            font-size: 18px !important;
            padding: 12px !important;
            transition: 0.3s;
        }
        .stButton>button:hover {
            background-color: #388E3C !important;
        }
        .stDownloadButton>button {
            background-color: #FF5722 !important;
            color: white !important;
            border-radius: 8px !important;
            font-size: 18px !important;
            padding: 12px !important;
            transition: 0.3s;
        }
        .stDownloadButton>button:hover {
            background-color: #E64A19 !important;
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }
        .logo {
            width: 120px;
            height: auto;
        }
    </style>
""", unsafe_allow_html=True)

# 📌 Affichage du header avec les logos ENSA et UAE
st.markdown("""
    <div class="header-container">
        <img src="https://upload.wikimedia.org/wikipedia/commons/2/2d/ENSA_logo.png" class="logo">
        <h1 style="text-align: center; color: white;">Gestion des Étudiants, Modules et Notes</h1>
        <img src="https://upload.wikimedia.org/wikipedia/commons/9/97/UAE_logo.png" class="logo">
    </div>
""", unsafe_allow_html=True)

# 📤 Upload des fichiers
st.markdown('<p class="sub-title">🔼 Charger vos fichiers Excel</p>', unsafe_allow_html=True)

uploaded_students = st.file_uploader("📂 **Charger le fichier des étudiants (Excel)**", type=["xlsx"])
uploaded_modules = st.file_uploader("📂 **Charger le fichier des modules (Excel)**", type=["xlsx"])
uploaded_notes = st.file_uploader("📂 **Charger le fichier des notes (Excel)**", type=["xlsx"])

# 📥 Bouton pour convertir les fichiers en XML
if st.button("📤 Convertir les fichiers en XML"):
    if uploaded_students:
        save_path = "data_excel/Students_GINF2.xlsx"
        os.makedirs(os.path.dirname(save_path), exist_ok=True)
        with open(save_path, "wb") as f:
            f.write(uploaded_students.getbuffer())
        requests.get(f"{FLASK_BASE_URL}/convert/students")
        st.success("✅ Fichier étudiants converti en XML !")

    if uploaded_modules:
        save_path = "data_excel/Modules_GINF2.xlsx"
        os.makedirs(os.path.dirname(save_path), exist_ok=True)
        with open(save_path, "wb") as f:
            f.write(uploaded_modules.getbuffer())
        requests.get(f"{FLASK_BASE_URL}/convert/modules")
        st.success("✅ Fichier modules converti en XML !")

    if uploaded_notes:
        save_path = "data_excel/Notes_GINF2.xlsx"
        os.makedirs(os.path.dirname(save_path), exist_ok=True)
        with open(save_path, "wb") as f:
            f.write(uploaded_notes.getbuffer())
        requests.get(f"{FLASK_BASE_URL}/convert/notes")
        st.success("✅ Fichier notes converti en XML !")

# 🌍 AFFICHAGE DES SITES WEB (HTML)
st.markdown('<p class="sub-title">🌐 Visualiser les données sous forme de site web</p>', unsafe_allow_html=True)

col1, col2, col3 = st.columns(3)

with col1:
    if st.button("📄 Voir Étudiants (HTML)"):
        requests.get(f"{FLASK_BASE_URL}/transform/students")
        st.success("✅ Page HTML des étudiants générée !")
        st.markdown(f"[🌍 Ouvrir la page Étudiants](http://localhost:3000/data_generated/students/Students_GINF2.html)", unsafe_allow_html=True)

with col2:
    if st.button("📄 Voir Modules (HTML)"):
        requests.get(f"{FLASK_BASE_URL}/transform/modules")
        st.success("✅ Page HTML des modules générée !")
        st.markdown(f"[🌍 Ouvrir la page Modules](http://localhost:3000/data_generated/modules/Modules_GINF2.html)", unsafe_allow_html=True)

with col3:
    if st.button("📄 Voir Notes (HTML)"):
        requests.get(f"{FLASK_BASE_URL}/transform/notes")
        st.success("✅ Page HTML des notes générée !")
        st.markdown(f"[🌍 Ouvrir la page Notes](http://localhost:3000/data_generated/notes/Notes_GINF2.html)", unsafe_allow_html=True)

# 📥 TÉLÉCHARGEMENT DES PDF
st.markdown('<p class="sub-title">📥 Télécharger les fichiers PDF</p>', unsafe_allow_html=True)

def download_pdf(file_type, label):
    """Télécharger un PDF généré par Flask."""
    pdf_url = f"{FLASK_BASE_URL}/transform/pdf/{file_type}"
    response = requests.get(pdf_url)

    if response.status_code == 200:
        pdf_path = f"{file_type.capitalize()}_GINF2.pdf"
        with open(pdf_path, "wb") as f:
            f.write(response.content)
        st.success(f"✅ {label} généré et prêt à être téléchargé !")
        st.download_button(f"⬇️ {label}", data=open(pdf_path, "rb"), file_name=pdf_path, mime="application/pdf")
    else:
        st.error(f"❌ Erreur lors de la génération de {label}.")

col1, col2, col3 = st.columns(3)

with col1:
    if st.button("📄 Télécharger PDF Étudiants"):
        download_pdf("students", "Télécharger PDF Étudiants")

with col2:
    if st.button("📄 Télécharger PDF Modules"):
        download_pdf("modules", "Télécharger PDF Modules")

with col3:
    if st.button("📄 Télécharger PDF Notes"):
        download_pdf("notes", "Télécharger PDF Notes")

# ✅ Indicateur de fin
st.markdown('<p class="footer-text">✅ Utilisez les boutons ci-dessus pour gérer vos fichiers.</p>', unsafe_allow_html=True)
