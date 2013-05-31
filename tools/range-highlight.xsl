<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook"
    exclude-result-prefixes="xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 12, 2011</xd:p>
            <xd:p><xd:b>Author:</xd:b> lech</xd:p>
            <xd:p>A stylesheet to transform from custom range tagging to highlighting all text elements in range in italic</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="@*|node()">  
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="db:phrase">
        <xsl:copy><xsl:if test="preceding::range[@class='startofrange']">
                <xsl:attribute name="rend"><xsl:text>i</xsl:text></xsl:attribute>
        </xsl:if>
            <xsl:copy-of select="@*"/>
            
            <xsl:apply-templates/>
        </xsl:copy>
       
    </xsl:template>
    
    
    
</xsl:stylesheet>