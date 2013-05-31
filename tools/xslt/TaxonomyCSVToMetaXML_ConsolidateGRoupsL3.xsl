<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
  exclude-result-prefixes="#all" version="2.0">

  <xsl:include href="Functions.xsl"/>
  <xsl:param name="input-uri" select="'../input/MilitaryHistory_Taxonomy.csv'"/>
  <xsl:param name="description" select="''"/>
  <xsl:param name="idPrefix" select="'MILHIS_'"/>

  <xsl:param name="source" select="'Military History Database'"/>
  <xsl:output indent="yes" method="xml"/>

  <xsl:template match="root">
    <root>

      <xsl:apply-templates/>

    </root>
  </xsl:template>

  <xsl:template match="root/group">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="root/group/group">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:call-template name="CopyGroup"/>
      <xsl:apply-templates select="item"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template name="CopyGroup">
    <xsl:for-each-group select="group" group-by="@xml:id">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:copy-of select="current-group()/*"/>
      </xsl:copy>
    </xsl:for-each-group>
  </xsl:template>

  <xsl:template match="item">
    <xsl:copy-of select="."/>
  </xsl:template>

</xsl:stylesheet>
