<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xslo="http://www.w3.org/1999/XSL/TransformAlias"
		xmlns:r="http://nwalsh.com/xmlns/schema-remap/"
		xmlns:rng="http://relaxng.org/ns/structure/1.0"
		xmlns:exsl="http://exslt.org/common"
		extension-element-prefixes="exsl"
		exclude-result-prefixes="exsl rng r"
		version="1.0">

<xsl:output indent="yes"/>

<xsl:namespace-alias stylesheet-prefix="xslo" result-prefix="xsl"/>

<xsl:template match="/">
  <xslo:stylesheet version="1.0">
    <xsl:attribute name="exsl:dummy" xmlns:exsl="http://exslt.org/common">dummy</xsl:attribute>

    <xslo:template match="/" mode="stripNS">
      <xslo:variable name="unspecialized">
	<xslo:apply-templates mode="remap"/>
      </xslo:variable>
      <xslo:apply-templates select="exsl:node-set($unspecialized)/node()" mode="stripNS"/>
    </xslo:template>

    <xsl:for-each select="//rng:element[r:remap]">
      <xslo:template match="*[local-name() = '{@name}'][namespace-uri() = '{//ancestor-or-self::*[@ns][1]/@ns}']" mode="remap">
	<xsl:choose>
	  <xsl:when test="r:remap//r:content">
	    <xsl:apply-templates select="r:remap/node()" mode="copy"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:element name="{local-name(r:remap/*[1])}" namespace="{namespace-uri(r:remap/*[1])}">
	      <xsl:copy-of select="r:remap/*[1]/@*"/>
	      <xslo:apply-templates mode="remap"/>
	    </xsl:element>
	  </xsl:otherwise>
	</xsl:choose>
      </xslo:template>
    </xsl:for-each>

    <xslo:template match="node()|@*" mode="remap">
      <xslo:copy>
	<xslo:apply-templates select="node()|@*" mode="remap"/>
      </xslo:copy>
    </xslo:template>

  </xslo:stylesheet>

</xsl:template>

<xsl:template match="node()|@*" mode="copy">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*" mode="copy"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="r:content" mode="copy">
  <xslo:apply-templates mode="remap"/>
</xsl:template>

</xsl:stylesheet>