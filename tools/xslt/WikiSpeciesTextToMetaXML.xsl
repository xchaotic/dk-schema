<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
    exclude-result-prefixes="#all" version="2.0">
 <!--
     <xsl:param name="input-uri" select="'../input/DinosaursOrnithischiaCleaned.txt'"/>
     <xsl:param name="description" select="'Order Ornithischia'"/>
-->
    <xsl:param name="input-uri" select="'../input/DinosaursSaurischiaCleaned.txt'"/>
    <xsl:param name="description" select="'Order Saurischia'"/>
    <xsl:param name="source" select="'http://species.wikimedia.org/wiki/'"/>
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="/">
        <xsl:variable name="in" select="tokenize(unparsed-text($input-uri,'UTF-8'),'\r\n')"/>
        <xsl:variable name="regexSelectSpecies">
            <xsl:text>«a\s*href=([^»]+)»([^«]+)«/a»(\s|Ñ|»)+«a\s*href=([^»]+)»([^«]+)«/a»(\s|Ñ|»)+«a\s*href=([^»]+)»([^«]+)«/a»(\s|Ñ|»)+«a\s*href=([^»]+)»([^«]+)(«/\w+»)+([^«]+)«(.*)«/table»</xsl:text>
        </xsl:variable>


        <!--   <DEBUG>
            <xsl:value-of select="$in"/>
        </DEBUG>-->
        <group xml:id="concat('WikiSpecies_',replace($description,' ','_'))">
            <name>
                <xsl:value-of select="concat('WikiSpecies ',$description)"/>
            </name>
            <description>
                <xsl:value-of
                    select="concat('The meta data reflects the ',$description,' available
on http://species.wikimedia.org')"
                />
            </description>
            <xsl:for-each select="$in">
                <item xml:id="{concat('DK_',replace(.,' ','_'))}">
                    <name>
                        <xsl:value-of select="."/>
                    </name>
                    <description>
                        <xsl:value-of select="$description"/>
                    </description>
                    <source>
                        <xsl:value-of select="concat($source,replace(.,' ','_'))"/>
                    </source>
                </item>
            </xsl:for-each>
        </group>


    </xsl:template>


</xsl:stylesheet>
