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

  <xsl:template match="/">
    <xsl:variable name="in" select="tokenize(unparsed-text($input-uri,'UTF-8'),'\r\n')"/>
    <xsl:variable name="categories" as="element()*">
      <xsl:for-each select="tokenize($in[1],',')">
        <name>
          <xsl:value-of select="utsweb:cleanFieldTitles(.)"/>
        </name>
      </xsl:for-each>
    </xsl:variable>

    <root>

      <xsl:variable name="rows" as="element()*">
        <xsl:for-each select="$in[position() gt 1]">
          <row>
            <xsl:for-each select="tokenize(.,',')">
              <xsl:element name="column">
                <xsl:value-of select="utsweb:cleanFieldTitles(.)"/>
              </xsl:element>
            </xsl:for-each>
          </row>
        </xsl:for-each>
      </xsl:variable>

      <xsl:variable name="rowsCleanedColumns" as="element()*">
        <xsl:for-each select="$rows">
          <xsl:copy>
            <xsl:for-each select="column">
              <xsl:choose>
                <xsl:when test="string-length(.) ge 1">
                  <xsl:copy>
                    <xsl:value-of select="."/>
                  </xsl:copy>
                </xsl:when>
              </xsl:choose>


            </xsl:for-each>
          </xsl:copy>
        </xsl:for-each>
      </xsl:variable>

      <xsl:variable name="rowsCleanedColumnsItem" as="element()*">
        <xsl:for-each select="$rowsCleanedColumns">
          <xsl:copy>
            <xsl:attribute name="key" select="column[position() ne last()]"/>
            <xsl:for-each select="column">
              <xsl:choose>
                <xsl:when test="position() eq last()">
                  <item xml:id="{concat($idPrefix,utsweb:cleanXMLID(.))}" name="{.}"/>
                </xsl:when>
                <xsl:otherwise>
                  <group xml:id="{concat($idPrefix,utsweb:cleanXMLID(.))}" name="{.}"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </xsl:copy>
        </xsl:for-each>
      </xsl:variable>

      <xsl:variable name="groups" as="element()*">
        <xsl:for-each-group select="$rowsCleanedColumnsItem" group-by="@key">
          <grouping>
            <xsl:copy-of select="current-group()"/>
          </grouping>
        </xsl:for-each-group>
      </xsl:variable>
<xsl:copy-of select="$groups"/>

  <!--    <xsl:for-each select="$groups">
<xsl:for-each select="row[1]/group">
  <group xml:id="{concat($idPrefix,utsweb:cleanXMLID(.))}">

  </group>
</xsl:for-each>
</xsl:for-each>
-->
    </root>

  </xsl:template>

<!--<xsl:template name="recursiveGroupCreation">
<xsl:param name=""></xsl:param></xsl:template>-->

</xsl:stylesheet>
