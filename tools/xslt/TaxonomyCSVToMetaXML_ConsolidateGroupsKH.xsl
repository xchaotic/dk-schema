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
    
    <xsl:call-template name="CopyGroup">
      <xsl:with-param name="groups" select="group"/>
    </xsl:call-template>
    
  </xsl:template>
  <xsl:template name="CopyGroup">
    <xsl:param name="groups"/>
    <xsl:for-each-group select="$groups" group-by="@xml:id">
      <group>
        <!--copy the common information about this group-->
        <xsl:copy-of select="@xml:id, @name"/>
        <!--process subgroups based on all children of group members-->
        
        <xsl:call-template name="CopyGroup">
          <xsl:with-param name="groups" select="current-group()/group"/>
        </xsl:call-template>
        <xsl:apply-templates select="item"/>
        
      </group>
    </xsl:for-each-group>
  </xsl:template>

  <xsl:template match="item">
    <xsl:copy-of select="."/>
  </xsl:template>
</xsl:stylesheet>
  