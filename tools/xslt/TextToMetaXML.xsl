<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
    exclude-result-prefixes="#all" version="2.0">
    <!--
     <xsl:param name="input-uri" select="'../input/DinosaursOrnithischiaCleaned.txt'"/>
     <xsl:param name="description" select="'Order Ornithischia'"/>
-->
    <xsl:include href="Functions.xsl"/>
    <xsl:param name="input-uri" select="'../input/MilitaryHistoryInitialDatabaseCleaned.txt'"/>
    <xsl:param name="description" select="''"/>
    <xsl:param name="idPrefix" select="'MILHIS_'"/>

    <xsl:param name="source" select="'Military History Database'"/>
    <xsl:output indent="yes" method="xml"/>

    <xsl:template match="/">
        <xsl:variable name="in" select="tokenize(unparsed-text($input-uri,'UTF-8'),'\r\n')"/>


        <!--   <DEBUG>
            <xsl:value-of select="$in"/>
        </DEBUG>-->
        <group xml:id="{concat($idPrefix,replace($source,' ','_'))}">
            <name>
                <xsl:value-of select="$source"/>
            </name>
            <description>
                <xsl:value-of select="concat('The meta data is gathered from the ',$source)"/>
            </description>
 
            <xsl:for-each select="$in">
                <item
                    xml:id="{concat($idPrefix,utsweb:cleanXMLID(replace(.,' ','_')))}">
                    <name>
                        <xsl:value-of select="."/>
                    </name>
                    <description>
                        <xsl:value-of select="$description"/>
                    </description>
                    <source>
                        <xsl:value-of select="$source"/>
                    </source>
                </item>
            </xsl:for-each>
        </group>


    </xsl:template>


</xsl:stylesheet>
