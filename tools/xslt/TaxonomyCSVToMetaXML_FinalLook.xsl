<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
  exclude-result-prefixes="#all" version="2.0">
  <!--<xsl:include href="CopyAll.xsl"/>-->
  <xsl:include href="Functions.xsl"/>
  <xsl:param name="input-uri" select="'../input/MilitaryHistory_Taxonomy.csv'"/>
  <xsl:param name="description" select="''"/>
  <xsl:param name="idPrefix" select="'MILHIS_'"/>

  <xsl:param name="source" select="'Military History Database'"/>
  <xsl:output indent="yes" method="xml"/>

<xsl:template match="root">
  <?oxygen RNGSchema="meta.rnc" type="compact"?>
  <metapresets xmlns="http://dk.com/dk-schema">    
<xsl:apply-templates/>
</metapresets>
</xsl:template>
  <!--  <group xml:id="MILHIS_Fighter_Aircraft" name="Fighter Aircraft">-->
  <xsl:template match="group">
    <xsl:copy>
      <xsl:copy-of select="@xml:id"/>
      <name>
        <xsl:value-of select="@name"/>
      </name>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <!-- <item xml:id="MILHIS_Attack_Aircraft" name="Attack Aircraft"/>-->
  <xsl:template match="item">
    <xsl:copy>
      <xsl:copy-of select="@xml:id"/>
      <name>
        <xsl:value-of select="@name"/>
      </name>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
