<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mw="http://www.mediawiki.org/xml/export-0.5/"
    xmlns:utsweb="http://sites.utg.edu.gm/utsweb" exclude-result-prefixes="#all" version="2.0">
    <xsl:param name="input-uri" select="'../input/schema.org.NutritionInformation.htm'"/>
    <xsl:param name="source" select="'http://species.wikimedia.org/wiki/'"/>
    <xsl:output indent="yes" method="xml"/>
    <xsl:include href="BrowseAll.xsl"/>

    <xsl:template match="mw:mediawiki">
        <group xml:id="WikiSpeciesClassisReptitiliaFromGoogleSearch">
            <name>
                <xsl:value-of select="'Classis Reptitilia'"/>
            </name>
            <description>
                <xsl:text>Generated from a wikidump created by searching wikispecies using google
for classis:Reptilia</xsl:text>
            </description>
            <xsl:apply-templates select="mw:page/mw:title"/>
        </group>
    </xsl:template>
    <xsl:template match="mw:title">


        <item xml:id="{concat('DK_',replace(text(),' ','_'))}">
            <name>
                <xsl:value-of select="text()"/>
            </name>
            <description>
                <xsl:value-of select="regex-group(5)"/>
            </description>
            <source>
                <xsl:value-of select="concat($source,replace(text(),' ','_'))"/>
            </source>
        </item>

    </xsl:template>




    <!--<xsl:analyze-string select="$in" regex="{$regexGroupInfo}" flags="i">
            <xsl:matching-substring>
                <group
                    xml:id="{concat(regex-group(2),'_',regex-group(5),'_',regex-group(8),'_',regex-group(11))}">
                    <xsl:variable name="name" select="regex-group(11)"/>
                    <name>
                        <xsl:value-of select="$name"/>
                    </name>
                    <description>
                        <xsl:value-of select="regex-group(13)"/>
                    </description>
                    <debug><xsl:value-of  select="regex-group(14)"/></debug>
                    <xsl:variable name="regexSelectProperties"
                        select="concat('«a\s*href=&quot;',$name,'&quot;»(.+)$')"/>
<!-\-<debug><xsl:value-of select="$regexSelectProperties"/></debug>-\->
                    <xsl:analyze-string select="regex-group(14)" regex="{$regexSelectProperties}" flags="i">
                        <xsl:matching-substring>
                            <xsl:variable name="regexSelectPropertyInfo">
                                <xsl:text>«th\s*class="prop-nam"[^»]*»«code»([^«]+)«/code»«/th»«td\s*class="prop-ect"»(«a href=[^»]+»([^«]+)«/a»|(\w+))«/td»«td class="prop-desc"»([^«]+)«/td»</xsl:text>
                            </xsl:variable>
                            <xsl:analyze-string select="regex-group(1)"
                                regex="{$regexSelectPropertyInfo}" flags="i">
                                <xsl:matching-substring>
                                    <item xml:id="{concat('DK_',regex-group(1))}">
                                        <name><xsl:value-of select="regex-group(1)"/></name>
                                        <description><xsl:value-of select="regex-group(5)"/></description>
                                        <source><xsl:value-of select="$source"/></source>
                                    </item>
                                </xsl:matching-substring>
                            </xsl:analyze-string>

                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </group>

            </xsl:matching-substring>
        </xsl:analyze-string>-->




</xsl:stylesheet>
