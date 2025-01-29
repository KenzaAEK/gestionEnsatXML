<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  
  <!-- Titre principal pour le tableau -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Groupes TP et Étudiants</title>
        <style>
          table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
            font-weight: bold;
          }
          tr:nth-child(even) {
            background-color: #f9f9f9;
          }
          tr:nth-child(odd) {
            background-color: #ffffff;
          }
          .group-header {
            background-color: #e0e0e0;
          }
          .student-info {
            width: 50%;
          }
          .student-details {
            width: 50%;
          }
        </style>
      </head>
      <body>
        <h1>Groupes TP et Étudiants</h1>
        <table>
          <thead>
            <tr>
              <th>Groupe TP</th>
              <th>Informations des étudiants</th>
            </tr>
          </thead>
          <tbody>
            <!-- Boucle à travers chaque groupe -->
            <xsl:for-each select="TPGroups/Group">
              <tr class="group-header">
                <!-- Afficher l'ID du groupe -->
                <td colspan="2"><strong>Groupe TP : <xsl:value-of select="@id"/></strong></td>
              </tr>
              <!-- Boucle à travers chaque étudiant dans le groupe -->
              <xsl:for-each select="Student">
                <tr>
                  <!-- Première colonne : Nom et Prénom -->
                  <td class="student-info">
                    <xsl:value-of select="Nom"/> <xsl:value-of select="Prenom"/>
                  </td>
                  <!-- Deuxième colonne : Autres informations -->
                  <td class="student-details">
                    <ul>
                      <li>Code Apogée: <xsl:value-of select="CodeApogee"/></li>
                      <li>CIN: <xsl:value-of select="CIN"/></li>
                      <li>CNE: <xsl:value-of select="CNE"/></li>
                      <li>Lieu de naissance: <xsl:value-of select="LieuNaissance"/></li>
                      <li>Date de naissance: <xsl:value-of select="DateNaissance"/></li>
                    </ul>
                  </td>
                </tr>
              </xsl:for-each>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>