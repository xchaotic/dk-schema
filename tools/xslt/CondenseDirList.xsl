<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:utsweb="http://sites.utg.edu.gm/utsweb" exclude-result-prefixes="xs" version="2.0">
    <xsl:import href="BrowseAll.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <xsl:param name="type" select="'screenshots'"/>
  

    <xsl:template match="samples" exclude-result-prefixes="#all">
        <links>
            <xsl:apply-templates/>
        </links>
    </xsl:template>

    <xsl:template match="c:directory">
        <xsl:variable name="base" select="@xml:base"/>
        <xsl:for-each select="c:file">
            <xsl:element name="link">
                <xsl:value-of select="substring-after(concat($base,@name),concat($type,'/'))"/>
            </xsl:element>
        </xsl:for-each>

    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>
