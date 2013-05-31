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
      <xsl:apply-templates select="//row"/>
    </root>
  </xsl:template>


  <xsl:template match="row">
    <xsl:apply-templates select="group[1]"/>
  </xsl:template>


  <xsl:template match="group">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:copy-of select="node()"/>
      <xsl:apply-templates select="following-sibling::*[1][self::group or self::item]"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="item">
    <xsl:copy-of select="."/>
  </xsl:template>


</xsl:stylesheet>
