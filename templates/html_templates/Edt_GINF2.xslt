<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Emploi du Temps</title>
                <style>
                    h2 { text-align: center; color: black; }
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid black; padding: 0; text-align: center; vertical-align: top; }
                    th { background-color: lightgray; }
                    .course-box { display: flex; flex-direction: column; border: 1px solid black; width: 100%; height: 100px; }
                    .course-header { background-color: #D397F8; padding: 5px; font-size: 12px; font-weight: bold; text-align: center; border-bottom: 1px solid black; }
                    .tp .course-header { background-color: #90EE90; }
                    .important .course-header { background-color: #00FF00; }
                    .course-content { background-color: white; padding: 10px; text-align: center; flex-grow: 1; display: flex; align-items: center; justify-content: center; }
                </style>
            </head>
            <body>
                <h2>Emploi du Temps</h2>
                <table>
                    <tr>
                        <th>Heure</th>
                        <th>Lundi</th>
                        <th>Mardi</th>
                        <th>Mercredi</th>
                        <th>Jeudi</th>
                        <th>Vendredi</th>
                        <th>Samedi</th>
                    </tr>
                    <tr>
                        <td>09:00 - 10:30</td>
                        <td><div class="course-box"><div class="course-header">CM - 09h00 - 10h30</div><div class="course-content">CRYPTOGRAPHIE <br/> LAZAAR <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 09h00 - 10h30</div><div class="course-content">PROGRAMMATION DECL <br/> CHAFIK <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 09h00 - 10h30</div><div class="course-content">TRAITEMENT D IMAGE <br/> LACHKAR <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 09h00 - 10h30</div><div class="course-content">CRYPTOGRAPHIE <br/> LAZAAR <br/> Salle B20</div></div></td>
                        <td><div class="course-box important"><div class="course-header">CM - 09h00 - 10h30</div><div class="course-content">GESTION DES DONNEE <br/> BADIR <br/> Salle B20</div></div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10:30 - 11:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>11:00 - 12:30</td>
                        <td><div class="course-box"><div class="course-header">CM - 11h00 - 12h30</div><div class="course-content">CRYPTOGRAPHIE <br/> LAZAAR <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 11h00 - 12h30</div><div class="course-content">PROGRAMMATION DECL <br/> CHAFIK <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 11h00 - 12h30</div><div class="course-content">TRAITEMENT D IMAGE <br/> LACHKAR <br/> Salle B20</div></div></td>
                        <td><div class="course-box"><div class="course-header">CM - 11h00 - 12h30</div><div class="course-content">DOT NET C SHARP <br/> GHAILANI <br/> Salle B20</div></div></td>
                        <td><div class="course-box important"><div class="course-header">TP - 11h00 - 12h30</div><div class="course-content">GESTION DES DONNEE <br/> BADIR <br/> Salle B20</div></div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>12:30 - 13:30</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>13:30 - 15:00</td>
                        <td><div class="course-box important"><div class="course-header">CM - 13h30 - 15h00</div><div class="course-content">BASES DE DONNEES N <br/> BADIR <br/> Salle B20</div></div></td>
                        <td><div class="course-box"><div class="course-header">CM - 13h30 - 15h00</div><div class="course-content">PROGRAMMATION DECL <br/> EL ALAMI <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 13h30 - 15h00</div><div class="course-content">MANAGEMENT DE PROJ <br/> RAHALI AZOUZI <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 13h30 - 15h00</div><div class="course-content">DOT NET C SHARP <br/> GHAILANI <br/> Salle B20</div></div></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>15:00 - 15:30</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>15:30 - 17:00</td>
                        <td><div class="course-box important"><div class="course-header">TP - 15h30 - 17h00</div><div class="course-content">BASES DE DONNEES N <br/> BADIR <br/> Salle B20</div></div></td>
                        <td></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 15h30 - 17h00</div><div class="course-content">MANAGEMENT DE PROJ <br/> RAHALI AZOUZI <br/> Salle B20</div></div></td>
                        <td><div class="course-box tp"><div class="course-header">TP - 15h30 - 17h00</div><div class="course-content">DOT NET C SHARP <br/> GHAILANI <br/> Salle B20</div></div></td>
                        <td><div class="course-box"><div class="course-header">CM - 14h30 - 16h00</div><div class="course-content">COMPTABILITE 2 <br/> NAITBOUBKER <br/> Salle B20</div></div></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>17:00 - 18:30</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><div class="course-box"><div class="course-header">CM - 16h30 - 18h00</div><div class="course-content">COMPTABILITE 2 <br/> NAITBOUBKER <br/> Salle B20</div></div></td>
                        <td></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>