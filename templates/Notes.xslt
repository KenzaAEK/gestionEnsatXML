<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8" />

    <xsl:key name="modules" match="Modules/Module" use="Name" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Résultats des Étudiants</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-bottom: 20px;
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
                        background-color: #f8d7da;
                    }
                    .orange {
                        background-color: #fff3cd;
                    }
                    .green {
                        background-color: #d4edda;
                    }
                </style>
            </head>
            <body>
                <h1>Résultats des Étudiants par Module</h1>

                <!-- Table par module -->
                <xsl:for-each select="Students/Student/Modules/Module[generate-id() = generate-id(key('modules', Name)[1])]">
                    <h2><xsl:value-of select="Name" /></h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Code Apogée</th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Date de Naissance</th>
                                <th>Note Finale</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="key('modules', Name)">
                                <xsl:for-each select="../../..">
                                    <tr>
                                        <td><xsl:value-of select="CodeApogee" /></td>
                                        <td><xsl:value-of select="Nom" /></td>
                                        <td><xsl:value-of select="Prenom" /></td>
                                        <td><xsl:value-of select="DateNaissance" /></td>
                                        <td>
                                            <xsl:attribute name="class">
                                                <xsl:choose>
                                                    <xsl:when test="Modules/Module[Name=current()/Name]/NoteFinale &lt; 8">red</xsl:when>
                                                    <xsl:when test="Modules/Module[Name=current()/Name]/NoteFinale &gt;= 8 and Modules/Module[Name=current()/Name]/NoteFinale &lt; 12">orange</xsl:when>
                                                    <xsl:otherwise>green</xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            <xsl:value-of select="Modules/Module[Name=current()/Name]/NoteFinale" />
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
