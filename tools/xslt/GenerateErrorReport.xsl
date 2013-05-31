<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:utsweb="http://sites.utg.edu.gm/utsweb" exclude-result-prefixes="xs" version="2.0">
    <xsl:import href="BrowseAll.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <xsl:param name="type" select="'screenshots'"/>
    <xsl:param name="href" select="'../temp/screenShots.xml'"/>

    <xsl:variable name="dirListLinksDoc" select="doc($href)"/>
    
    <xsl:key name="link" match="link" use="text()"/>
  
    
    <xsl:template match="links">
        <links>
            <xsl:apply-templates/>
        </links>
    </xsl:template>

    <xsl:template match="link">
<xsl:variable name="text" select="text()"/>
        <xsl:variable name="links" as="element()*">
            <xsl:for-each select="$dirListLinksDoc">
                <xsl:copy-of select="key('link',$text)"/>
            </xsl:for-each>
        </xsl:variable>
        <!--<xsl:copy-of select="$links"/>-->
        
        <xsl:choose>
            <xsl:when test="not(exists($links))">
                <error type="missingFile" link="{concat($type,'/',text())}"/>
            </xsl:when>
           
        </xsl:choose>



    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>
