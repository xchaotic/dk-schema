<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dk="http://dk.com/dk-schema"
    xmlns:rng="http://relaxng.org/ns/structure/1.0"
    version="2.0">
    <xsl:output  method="text" indent="yes"/>
    
    
    <xsl:template match="/">
        <xsl:text>
        include "dk-extensions.rnc" {
        dk.metaref.attribute = attribute metaref {
        </xsl:text>
        
        <xsl:for-each select="//*[@xml:id]">
            
            "<xsl:value-of select="@xml:id"/>"<xsl:text> </xsl:text>
            <xsl:if test="following::dk:item|following::dk:group|descendant::dk:item|descendant::dk:group"><xsl:text>| </xsl:text></xsl:if>
        </xsl:for-each>
        <xsl:text>
            }}
        </xsl:text>
      
    </xsl:template>
</xsl:stylesheet>