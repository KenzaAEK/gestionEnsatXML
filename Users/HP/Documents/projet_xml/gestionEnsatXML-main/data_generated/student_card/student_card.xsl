<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://studentcard.org">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <cards>
            <xsl:for-each select="Students/Student">
                <card>
                    <logoUae uri="../../images/logoUae.png"/>
                    <nameUae>Université Abdelmalek Essaâdi</nameUae>
                    <nameSchool>Ecole Nationale des Sciences Appliquées</nameSchool>
                    <villeSchool>Tanger</villeSchool>
                    <logoEnsa uri="../../images/ensat.png"/>
                    <title>CARTE D'ÉTUDIANT</title>

                    <lastName><xsl:value-of select="Nom"/></lastName>
                    <firstName><xsl:value-of select="Prenom"/></firstName>
                    <codeApoge><xsl:value-of select="CodeApogee"/></codeApoge>

                    <!-- Même photo et QR code pour tous les étudiants -->
                    <photo uri="../../images/photoEtudiante.jpg"/>
                    <scanBar uri="../../images/scanbar.png"/>

                    <footer>Première Inscription : 2021 / 2022</footer>
                </card>
            </xsl:for-each>
        </cards>
    </xsl:template>

</xsl:stylesheet>
