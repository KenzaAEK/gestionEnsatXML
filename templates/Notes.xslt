<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Liste des Étudiants</title>
                <style>
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    .low { color: red; }
                    .medium { color: orange; }
                    .high { color: green; }
                </style>
            </head>
            <body>
                <h1>Affichage globale</h1>
                <table>
                    <thead>
                        <tr>
                            <th rowspan="2">Code Apogée</th>
                            <th rowspan="2">Nom</th>
                            <th rowspan="2">Prénom</th>
                            <th rowspan="2">Date de Naissance</th>
                            <!-- Affichage des modules -->
                            <xsl:for-each select="Students/Student[1]/Modules/Module">
                                <th colspan="{count(SubModules/SubModule) + 1}">
                                    <xsl:value-of select="Name"/>
                                </th>
                            </xsl:for-each>
                        </tr>
                        <tr>
                            <xsl:for-each select="Students/Student[1]/Modules/Module">
                                <xsl:for-each select="SubModules/SubModule">
                                    <th><xsl:value-of select="Name"/></th>
                                </xsl:for-each>
                                <th>Note Finale</th>
                            </xsl:for-each>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Parcours des étudiants -->
                        <xsl:for-each select="Students/Student">
                            <tr>
                                <td><xsl:value-of select="CodeApogee"/></td>
                                <td><xsl:value-of select="Nom"/></td>
                                <td><xsl:value-of select="Prenom"/></td>
                                <td><xsl:value-of select="DateNaissance"/></td>
                                <!-- Affichage des sous-modules et notes -->
                                <xsl:for-each select="Modules/Module">
                                    <xsl:for-each select="SubModules/SubModule">
                                        <!-- Pas de style conditionnel ici -->
                                        <td><xsl:value-of select="Note"/></td>
                                    </xsl:for-each>
                                    <!-- Note finale avec style conditionnel -->
                                    <td>
                                        <xsl:attribute name="class">
                                            <xsl:choose>
                                                <xsl:when test="NoteFinale &lt; 8">low</xsl:when>
                                                <xsl:when test="NoteFinale &gt;= 8 and NoteFinale &lt; 12">medium</xsl:when>
                                                <xsl:otherwise>high</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:value-of select="NoteFinale"/>
                                    </td>
                                </xsl:for-each>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
