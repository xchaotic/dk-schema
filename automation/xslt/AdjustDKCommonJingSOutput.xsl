<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:variable name="f" select="unparsed-text('../../dk-schema/src/dk-common.rnc','utf-8')"/>
        
        <xsl:variable name="regexSelect_1Content">
            <xsl:text>(_1\s*=\s*element\s*)(\*)(\s*\{\s*notAllowed\s*\})</xsl:text>
        </xsl:variable>
        
        <xsl:analyze-string select="$f" regex="{$regexSelect_1Content}">
            <xsl:matching-substring>
                <xsl:value-of select="concat(regex-group(1),'conflict',regex-group(3))"/>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>

    </xsl:template>
</xsl:stylesheet>
