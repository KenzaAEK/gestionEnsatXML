<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:e="http://GINF2Emploi.org"
    version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>Emploi du Temps ENSA Tanger GINF2</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f8f8f8;
                        margin: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        background-color: white;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 10px;
                        text-align: center;
                        min-height: 50px;
                        font-size: 14px;
                    }
                    th {
                        background-color: #d3d3d3;
                        font-size: 16px;
                        padding: 12px;
                    }
                    .CM { background-color: #F9FCA9; color: black; font-weight: bold; border-radius: 10px; padding: 5px; }
                    .TP { background-color: #42E427; color: black; font-weight: bold; border-radius: 10px; padding: 5px; }
                    .TD { background-color: #C17FE9; color: white; font-weight: bold; border-radius: 10px; padding: 5px; }
                </style>
            </head>
            <body>
                <h2 style="text-align: center; color: #02306E; font-size: 24px;"><xsl:value-of select="e:emploi/e:TopBar/e:Title"/></h2>
                <h3 style="text-align: center; font-size: 18px;">Semaine: <xsl:value-of select="e:emploi/e:TopBar/e:SemNum"/> - Année: <xsl:value-of select="e:emploi/e:TopBar/e:AnneeNum"/></h3>
                <table>
                    <tr>
                        <th>Heure</th>
                        <xsl:for-each select="e:emploi/e:Days/e:day">
                            <th><xsl:value-of select="@name"/></th>
                        </xsl:for-each>
                    </tr>
                    
                    <xsl:for-each select="e:emploi/e:times/e:time">
                        <tr>
                            <td><xsl:value-of select="@t"/></td>
                            <xsl:for-each select="e:emploi/e:Days/e:day">
                                <td>
                                    <xsl:variable name="currentDay" select="@name"/>
                                    <xsl:variable name="currentTime" select="current()/@t"/>
                                    
                                    <xsl:for-each select="e:time[@t=$currentTime]/e:matiere">
                                        <xsl:if test="ancestor::e:day/@name = $currentDay">
                                            <div class="{e:type}" style="padding: 10px; margin: 5px; border-radius: 8px; font-size: 14px;">
                                                <strong><xsl:value-of select="e:nom"/></strong><br/>
                                                <em><xsl:value-of select="e:nomProf"/></em><br/>
                                                <span>Salle: <xsl:value-of select="e:salle"/></span>
                                            </div>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
