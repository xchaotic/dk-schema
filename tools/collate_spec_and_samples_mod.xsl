<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output indent="yes"/>


    <xsl:template match="db:article">
        <!-- generate appendices with samples and screeenshots -->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="*|text()|comment()"/>
            <!-- stripped appendix -->
        </xsl:copy>

    </xsl:template>

    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="*|text()|comment()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="db:section[(substring-before(@xml:id,'.')='s')]">
        <!-- generate links in spec sections -->
        <xsl:variable name="title">
            <xsl:value-of select="db:title"/>
        </xsl:variable>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <title>
                <xsl:value-of select="$title"/>
            </title>
            <!-- Creating the link to the sample (if exist) in the appendix -->
            <xsl:for-each select="db:para[@role='xml_link']">
                <xsl:variable name="href" select="db:link/@xlink:href"/>

                <para><emphasis>XML Sample:</emphasis> <link>
                        <xsl:attribute name="xlink:href">
                            <xsl:value-of select="$href"/>
                        </xsl:attribute>
                        <xsl:text/>
                    <xsl:analyze-string select="$href" regex="http://dk-schema.googlecode.com/hg/samples/*/">
                        <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
                    </xsl:analyze-string>
                       </link></para>
            </xsl:for-each>
            
            <xsl:for-each select="db:para[@role='image_link']">
                <xsl:variable name="imagehref" select="db:link/@xlink:href"/>
                
                <para><emphasis>Image Sample: </emphasis><link>
                    <xsl:attribute name="xlink:href">
                        <xsl:value-of select="$imagehref"/>
                    </xsl:attribute>
                    <xsl:text/>
                    <xsl:analyze-string select="$imagehref" regex="http://dk-schema.googlecode.com/hg/screenshots/*/">
                        <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
                    </xsl:analyze-string>
                </link></para>
            </xsl:for-each>
            
            <!--  -->
            <xsl:apply-templates select="*"/>
        </xsl:copy>

    </xsl:template>
    <!-- Creating links to external documentation of docbook elements -->
    <xsl:template match="db:phrase[@role='element']">
        <link>
            <xsl:attribute name="xlink:href">
                <xsl:text>http://www.docbook.org/tdg/en/html/</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>.html</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </link>
    </xsl:template>

    <xsl:template match="db:para[@role='xml_link'] | db:para[@role='image_link']"/>


    <!-- Creating links to external documentation of docbook elements -->
    <xsl:template match="db:phrase[@role='element']">
        <link>
            <xsl:attribute name="xlink:href">
                <xsl:text>http://www.docbook.org/tdg/en/html/</xsl:text><xsl:value-of select="."></xsl:value-of><xsl:text>.html</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </link>
    </xsl:template>
    <!--<xsl:template match="db:link[@role='screenshot']"/> <!-\- remove para with xref to screenshots -\->
        <xsl:template match="db:link[@role='sample']"/> <!-\- remove para with xref to sample -\->-->
    <xsl:template match="db:section[(substring-before(@xml:id,'.')='s')]/db:title"/> <!-- delete duplicate titles in spec sections to preserve to docbook element order -->

</xsl:stylesheet>
