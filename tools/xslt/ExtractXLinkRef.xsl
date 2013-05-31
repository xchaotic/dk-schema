<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:db="http://docbook.org/ns/docbook"
    xmlns:dk="http://dk.com/dk-schema" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:utsweb="http://sites.utg.edu.gm/utsweb" exclude-result-prefixes="xs" version="2.0">
    <xsl:import href="BrowseAll.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <xsl:param name="type" select="'screenshots'"/>

    
    <xsl:template match="db:book" exclude-result-prefixes="#all">
        <links>
            <xsl:apply-templates/>
        </links>
    </xsl:template>

    <xsl:template match="db:link">

        <xsl:if test="contains(@xlink:href,'dk-schema.googlecode.com') and contains(@xlink:href,$type)">
            <xsl:element name="link">
                <xsl:value-of select="substring-after(@xlink:href,concat($type,'/'))"/>
            </xsl:element>
        </xsl:if>

    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>
