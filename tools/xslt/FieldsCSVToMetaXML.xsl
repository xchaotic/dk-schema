<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
  exclude-result-prefixes="#all" version="2.0">
  <!--
     <xsl:param name="input-uri" select="'../input/DinosaursOrnithischiaCleaned.txt'"/>
     <xsl:param name="description" select="'Order Ornithischia'"/>
-->
  <xsl:include href="Functions.xsl"/>
  <xsl:param name="input-uri" select="'../input/MilitaryHistory_Fields.csv'"/>
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
    <group xml:id="MILHIS_Fields">
      <name>Fields</name>
      <xsl:for-each select="$in[position() gt 1]">
        <group xml:id="{concat($idPrefix,utsweb:cleanXMLID(tokenize(.,',')[1]))}">
          <name>
            <xsl:value-of select="utsweb:cleanFieldTitles(tokenize(.,',')[1])"/>
          </name>
          <xsl:for-each select="tokenize(.,',')[position() gt 1]">
            <xsl:variable name="containsY" select="contains(utsweb:cleanFieldTitles(.),'Y')"
              as="xs:boolean"/>
            <xsl:variable name="position" select="position() + 1 "/>
            <xsl:choose>
              <xsl:when test="$containsY">
                <xsl:variable name="referencedCategoryTitle"
                  select="$categories[position() eq $position]"/>
                <ref idref="{concat($idPrefix,utsweb:cleanXMLID($referencedCategoryTitle))}"/>
               <!-- <item xml:id="{concat($idPrefix,utsweb:cleanXMLID($referencedCategoryTitle))}">
                  <name><xsl:value-of select="utsweb:cleanFieldTitles($referencedCategoryTitle)"/></name>
                </item>-->
              </xsl:when>
            </xsl:choose>


          </xsl:for-each>
        </group>
      </xsl:for-each>
    </group>

    <!--   <DEBUG>
            <xsl:value-of select="$in"/>
        </DEBUG>-->
    <!--<group xml:id="{concat($idPrefix,replace($source,' ','_'))}">
            <name>
                <xsl:value-of select="$source"/>
            </name>
            <description>
                <xsl:value-of select="concat('The meta data is gathered from the ',$source)"/>
            </description>
            <xsl:variable name="stripNonAplhaNumericCharacters">
                <xsl:text>(\(|\)|/|&amp;|-)</xsl:text>
            </xsl:variable>
            <xsl:for-each select="$in">
                <item
                    xml:id="{concat($idPrefix,replace(replace(.,' ','_'),$stripNonAplhaNumericCharacters,''))}">
                    <name>
                        <xsl:value-of select="."/>
                    </name>
                    <description>
                        <xsl:value-of select="$description"/>
                    </description>
                    <source>
                        <xsl:value-of select="$source"/>
                    </source>
                </item>
            </xsl:for-each>
        </group>-->


  </xsl:template>


</xsl:stylesheet>
