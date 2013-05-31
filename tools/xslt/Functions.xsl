<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet exclude-result-prefixes="#all" version="2.0"  xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:function as="xs:string" name="utsweb:cleanXMLID">
    <xsl:param name="arg"/>    
    <xsl:variable name="stripNonAplhaNumericCharacters">
      <xsl:text>(\(|\)|/|&amp;|-|&quot;)</xsl:text>
    </xsl:variable>    
    <xsl:sequence select="replace(replace(replace($arg,' - ','_'),' ','_'),$stripNonAplhaNumericCharacters,'')"/>
  </xsl:function>


  <xsl:function as="xs:string" name="utsweb:cleanFieldTitles">
    <xsl:param name="arg"/>
    <xsl:sequence select="replace($arg,'&quot;','')"/>
  </xsl:function>

  <xsl:function as="xs:string" name="utsweb:addStartEndAssertion">
    <xsl:param name="arg"/>
    <xsl:sequence select="concat('^',$arg,'$')"/>
  </xsl:function>

  <xsl:function as="xs:string" name="utsweb:normSpc">
    <xsl:param name="arg"/>
    <xsl:sequence select="normalize-space($arg)"/>
  </xsl:function>



</xsl:stylesheet>
