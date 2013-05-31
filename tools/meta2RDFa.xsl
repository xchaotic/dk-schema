<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns="http://docbook.org/ns/docbook"
    exclude-result-prefixes="xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Sep 16, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> lech rzedzicki lech@kode1100.com</xd:p>
            <xd:p>A stylesheet to convert meta information from DK-Schema metaref to RDFa </xd:p>
        </xd:desc>
    </xd:doc>
    
    <!--<xsl:template match="/"> todo:append attrib to root node
        <xsl:copy>
            <xsl:attribute name="prefix"><xsl:text>prefix="foaf: http://xmlns.com/foaf/0.1/
          dc: http://purl.org/dc/terms/
          dk: http://kode1100.com/ontologies/dk-travel"</xsl:text></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="@*|node()">  <!--identity transform--><!-- keep everything else as is -->
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*[ name() ne meta][@metaref]"><!-- we apply RDFa properties on the element itself, or in case of multiple metaref on the wrapping 'block' element-->
        <xsl:variable name="about">dk:<xsl:value-of select="@xml:id"/></xsl:variable><!-- todo: make it a GUID when aviailable -->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:if test="($about ne 'dk:')">
                <xsl:attribute name="about">
                    
                    <xsl:value-of select="$about"/></xsl:attribute>
                
            </xsl:if>
            <xsl:if test="@metaref">
                <xsl:attribute name="property">dk:<xsl:value-of select="@metaref"/></xsl:attribute>
            </xsl:if>
            
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template> 
    
    <xsl:template match="db:meta[@metaref]">
        <xsl:copy>
            <xsl:copy-of select="@metaref"/>
            <xsl:attribute name="about">dk:<xsl:value-of select="ancestor-or-self::*[@xml:id][1]/@xml:id"/></xsl:attribute>
            <xsl:attribute name="property">dk:<xsl:value-of select="@metaref"/></xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    
    
</xsl:stylesheet>