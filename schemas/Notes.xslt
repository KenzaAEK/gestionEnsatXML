<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Résultats des Notes</title>
        <style>
          table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            font-family: Arial, sans-serif;
          }
          th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 8px;
          }
          th {
            background-color: #f2f2f2;
          }
          .red {
            background-color: red;
            color: white;
          }
          .orange {
            background-color: orange;
            color: black;
          }
          .green {
            background-color: green;
            color: white;
          }
        </style>
      </head>
      <body>
        <h1 style="text-align: center;">Résultats des Notes</h1>
        <table>
          <tr>
            <th>Code Apogée</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Module</th>
            <th>Note</th>
          </tr>
          <xsl:for-each select="Students/Student">
            <xsl:for-each select="Modules/Module">
              <tr>
                <td><xsl:value-of select="../CodeApogee"/></td>
                <td><xsl:value-of select="../Nom"/></td>
                <td><xsl:value-of select="../Prenom"/></td>
                <td><xsl:value-of select="Name"/></td>
                <td>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="NoteFinale &lt; 8">red</xsl:when>
                      <xsl:when test="NoteFinale &gt;= 8 and NoteFinale &lt; 12">orange</xsl:when>
                      <xsl:when test="NoteFinale &gt;= 12">green</xsl:when>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:value-of select="NoteFinale"/>
                </td>
              </tr>
            </xsl:for-each>
          </xsl:for-each>
        </table>

        <h2 style="text-align: center;">Étudiants pour le Rattrapage</h2>
        <ul style="width: 60%; margin: 20px auto;">
          <xsl:for-each select="Students/Student">
            <xsl:if test="Modules/Module/NoteFinale &lt; 12">
              <li>
                <xsl:value-of select="Nom"/> <xsl:value-of select="Prenom"/> 
                - Module : <xsl:value-of select="Modules/Module[NoteFinale &lt; 12]/Name"/>
              </li>
            </xsl:if>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
