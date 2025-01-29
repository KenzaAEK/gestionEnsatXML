<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Root template -->
    <xsl:template match="/Students">
        <html>
            <head>
                <title>Liste des Étudiants</title>
                <style>
                    table {
                        width: 90%;
                        border-collapse: collapse;
                        margin: 20px auto;
                        font-family: Arial, sans-serif;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f4f4f4;
                        font-weight: bold;
                    }
                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }
                    tr:hover {
                        background-color: #f1f1f1;
                    }
                    h1 {
                        text-align: center;
                        font-family: Arial, sans-serif;
                    }
                </style>
            </head>
            <body>
                <h1>Liste des Étudiants</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Code Apogée</th>
                            <th>CIN</th>
                            <th>CNE</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Lieu de Naissance</th>
                            <th>Date de Naissance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Iterate through each Student -->
                        <xsl:for-each select="Student">
                            <tr>
                                <td><xsl:value-of select="CodeApogee" /></td>
                                <td><xsl:value-of select="CIN" /></td>
                                <td><xsl:value-of select="CNE" /></td>
                                <td><xsl:value-of select="Nom" /></td>
                                <td><xsl:value-of select="Prenom" /></td>
                                <td><xsl:value-of select="LieuNaissance" /></td>
                                <td><xsl:value-of select="DateNaissance" /></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
