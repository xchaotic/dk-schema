<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:presets="http://dk.com/dk-schema"
    xmlns="http://relaxng.org/ns/structure/1.0"
    version="2.0">
    <xsl:output  method="xml" indent="yes"/>
    <xsl:template match="/">
    <define name="dk.meta.cidref.enumeration">
        <choice>
            <xsl:for-each select="//presets:category|//presets:group">
                <value><xsl:value-of select="./@xml:id"/></value>
            </xsl:for-each>
        </choice>
    </define>
    </xsl:template>
</xsl:stylesheet>