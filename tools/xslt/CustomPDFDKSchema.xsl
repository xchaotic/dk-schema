<?xml version='1.0'?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">

    <xsl:import href="fo/docbook_custom.xsl"/>

    <xsl:attribute-set name="monospace.verbatim.properties">
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="processing-instruction('db-font-size')">
                    <xsl:value-of select="processing-instruction('db-font-size')"/>
                </xsl:when>
                <xsl:otherwise>inherit</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="formal.object.properties">
        <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
