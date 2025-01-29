<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo"
    xmlns:date="http://exslt.org/dates-and-times">
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <!-- Modèle de pages -->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                    page-width="297mm" page-height="250mm"
                    margin="1cm">
                    <!-- Région principale -->
                    <fo:region-body  margin="0.10cm" />

                    <!-- Pied de page aka footer -->
                    <fo:region-after  extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <!-- Contenus -->
            <fo:page-sequence master-reference="A4">
                <!-- Contenu du pied de page : numéro de la page -->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center">
                        
                    </fo:block>
                </fo:static-content>
                <!-- Contenu de la partie centrale -->
                <fo:flow flow-name="xsl-region-body"  >
                    <fo:block text-align="center"  margin-bottom="10mm" font-weight="bold">
                        Emploi du temps de la semaine numéro 49 de l'année 2025
                    </fo:block>
                    <fo:block>
                        <fo:table  width="110mm" border-style="ridge" border-width="0.5pt">                               
                            <fo:table-body>                                                     
                                <fo:table-row background-color="lightgray">                                                   
                                    <fo:table-cell width="10mm" border-style="none" text-align="center"  > 
                                        <fo:block> </fo:block>                         
                                    </fo:table-cell>                         
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" > 
                                        <fo:block>Lundi</fo:block>
                                        <fo:block>05/12</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center"> 
                                        <fo:block>Mardi</fo:block>
                                        <fo:block>06/12</fo:block>                  
                                    </fo:table-cell>   
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" > 
                                        <fo:block>Mercredi</fo:block>
                                        <fo:block>07/12</fo:block>                     
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center"> 
                                        <fo:block>Jeudi</fo:block>
                                        <fo:block>08/12</fo:block>                        
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center"> 
                                        <fo:block>Vendredi</fo:block>
                                        <fo:block>09/12</fo:block>                      
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center"> 
                                        <fo:block>Samedi</fo:block>
                                        <fo:block>10/12</fo:block>                         
                                    </fo:table-cell> 
                                </fo:table-row>     
                                
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>8:00</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block> </fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>8:30</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>9:00</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 9:00 - 10:30
                                        </fo:block>
                                    </fo:table-cell>
                                    
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 9:00 - 10:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 9:00 - 10:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 9:00 - 10:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 9:00 - 10:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[1]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[1]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/lundi/séance[1]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mardi/séance[1]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/mardi/séance[1]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mardi/séance[1]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[1]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[1]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mercredi/séance[1]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="#00FF7F">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[1]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[1]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/jeudi/séance[1]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" >
                                        <fo:block font-weight="bold">               
                                            <xsl:variable name="moduleValue" select="//semaine[1]/vendredi/séance[1]/module"/>
                                            <xsl:value-of select="substring($moduleValue, 1, 30)"/>
                                            
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/vendredi/séance[1]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/vendredi/séance[1]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>9:30</fo:block>                         
                                    </fo:table-cell> 



                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>10:00</fo:block>                         
                                    </fo:table-cell> 



                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>10:30</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>11:00</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 11:00 - 12:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="yellow">
                                        <fo:block>
                                            CM - 11:00 - 12:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="yellow">
                                        <fo:block>
                                            CM - 11:00 - 12:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 11:00 - 12:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 11:00 - 12:30
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[2]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[2]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/lundi/séance[2]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mardi/séance[2]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/ mardi/séance[2]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mardi/séance[2]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[2]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/ mercredi/séance[2]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mercredi/séance[2]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="#00FF7F">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[2]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[2]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/jeudi/séance[2]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" >
                                        <fo:block font-weight="bold">               
                                            <xsl:variable name="moduleValue" select="//semaine[1]/vendredi/séance[2]/module"/>
                                            <xsl:value-of select="substring($moduleValue, 1, 30)"/>
                                            
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/vendredi/séance[2]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/vendredi/séance[2]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>11:30</fo:block>                         
                                    </fo:table-cell> 



                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 



                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>12:00</fo:block>                         
                                    </fo:table-cell> 



                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>12:30</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>

                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>13:00</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm" background-color="lightgray">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" > 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm" background-color="lightgray">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" > 
                                        <fo:block>13:30</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 13:30 - 15:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#00FF7F">
                                        <fo:block>
                                            CM - 13:30 - 15:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 13:30 - 15:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 13:30 - 15:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 13:30 - 15:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm" background-color="lightgray">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" > 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[3]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[3]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/lundi/séance[3]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mardi/séance[3]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/mardi/séance[3]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mardi/séance[3]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[3]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[3]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mercredi/séance[3]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[3]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[3]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/jeudi/séance[3]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/vendredi/séance[3]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/vendredi/séance[3]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/vendredi/séance[3]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm" background-color="lightgray">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" > 
                                        <fo:block>14:00</fo:block>                         
                                    </fo:table-cell> 



                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm" background-color="lightgray">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" > 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>14:30</fo:block>                         
                                    </fo:table-cell> 

                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>15:00</fo:block>                         
                                    </fo:table-cell> 
                                    
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>15:30</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="yellow">
                                        <fo:block>
                                            CM - 15:30 - 17:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#00FF7F">
                                        <fo:block>
                                            CM - 15:30 - 17:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="dashed" border-width="1pt" text-align="center" background-color="#80008080">
                                        <fo:block>
                                            CM - 15:30 - 17:00
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[4]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/lundi/séance[4]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/lundi/séance[4]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[4]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/mercredi/séance[4]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/mercredi/séance[4]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center" number-rows-spanned="5" background-color="white">
                                        <fo:block font-weight="bold">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[4]/module"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            <xsl:value-of select="//semaine[1]/jeudi/séance[4]/Professeur"/>
                                        </fo:block>
                                        <fo:block  font-size="10pt">               
                                            Salle: <xsl:value-of select="//semaine[1]/jeudi/séance[4]/salle"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>16:00</fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 


                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>16:30</fo:block>                         
                                    </fo:table-cell> 

                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 

                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>17:00</fo:block>                         
                                    </fo:table-cell> 
                                    
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>

                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>17:30</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block></fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row height="4mm">
                                    <fo:table-cell width="10mm" border-style="none" text-align="center" background-color="lightgray"> 
                                        <fo:block>18:00</fo:block>                         
                                    </fo:table-cell> 
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell width="40mm" border-style="solid" border-width="1pt" text-align="center">
                                        <fo:block> </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                
                                
                                
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
