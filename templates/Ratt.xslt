<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:key name="modules" match="Module[NoteFinale &lt; 12]" use="Name"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Liste des rattrapages</title>
        <style>
          table {
            width: 60%;
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
          h2 {
            color: #333;
          }
        </style>
      </head>
      <body>
        <!-- Grouper les modules et afficher un seul tableau par module -->
        <xsl:for-each select="Students/Student/Modules/Module[generate-id() = generate-id(key('modules', Name)[1])]">
          <h2>Liste de rattrapage: <xsl:value-of select="Name"/></h2>
          <table>
            <thead>
              <tr>
                <th>Code Apogée</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Note Finale</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="key('modules', Name)">
                <tr>
                  <td><xsl:value-of select="../../CodeApogee"/></td>
                  <td><xsl:value-of select="../../Nom"/></td>
                  <td><xsl:value-of select="../../Prenom"/></td>
                  <td><xsl:value-of select="NoteFinale"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
