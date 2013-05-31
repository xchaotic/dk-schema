<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:dk="http://dk.com/dk-schema"
    xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xs" version="2.0">
    <xsl:output indent="yes"/>


    <xsl:template match="db:article">
        <!-- generate appendices with samples and screeenshots -->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="*|text()|comment()"/>

            <db:appendix xml:id="samples">
                <!-- TODO: verify that the screenshots exist -->
                <title>Mark up samples</title>
                <para>These code samples are fetched from the samples directory and illustrate how
                    the markup should be used in practice.</para>
                <xsl:for-each select="//db:section[(substring-before(@xml:id,'.')='s')]">
                    <xsl:variable name="sect_name"><xsl:value-of select="substring-after(@xml:id,'.')"/></xsl:variable>
                    <xsl:if test="descendant-or-self::db:link[@role='sample']">
                        
                        <db:section>
                            <xsl:attribute name="xml:id">
                                <xsl:text>c.</xsl:text>
                                <xsl:value-of select="substring-after(@xml:id,'.')"/>
                            </xsl:attribute>
                            <title>
                                <xsl:value-of select="db:title"/>
                            </title>
                            <para>
                                <link>
                                    <xsl:attribute name="linkend">
                                        <xsl:text>s.</xsl:text>
                                        <xsl:value-of select="substring-after(@xml:id,'.')"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="title"/>
                                    <xsl:text> Specification</xsl:text>
                                </link>
                            </para>
                            <xsl:if test="//db:section[@xml:id=concat('s',$sect_name)]/descendant-or-self::db:link[@role='screenshot']">
                            <para>
                                <link>
                                    <xsl:attribute name="linkend">
                                        <xsl:text>ss.</xsl:text>
                                        <xsl:value-of select="substring-after(@xml:id,'.')"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="title"/>
                                    <xsl:text> Screenshot</xsl:text>
                                </link>
                            </para>
                            </xsl:if>    
                            <xsl:for-each select=".//db:link[@role='sample']">
                                <para>
                                  <programlisting language="XML">
                                   <xi:include xmlns:xi="http://www.w3.org/2001/XInclude" parse="text">
                                       <xsl:attribute name="href"><xsl:value-of select="@xlink:href"/></xsl:attribute>
                                   </xi:include>
                                  </programlisting>
                                </para>
                            </xsl:for-each>
                        </db:section>
                    </xsl:if>
                </xsl:for-each>
            </db:appendix>
            <db:appendix xml:id="screenshots">
                <title>Screenshots</title>
                <para>These screenshots are hosted in the screenshots directory on Google Code
                    project page and illustrate what content is suitable for a particular
                    markup.</para>
                <xsl:for-each select="//db:section[(substring-before(@xml:id,'.')='s')]">
                    <xsl:variable name="sect_name"><xsl:value-of select="substring-after(@xml:id,'.')"/></xsl:variable>
                    <xsl:if test=" descendant-or-self::db:link[@role='screenshot']">
                        
                        
                        <db:section>
                            <xsl:attribute name="xml:id">
                                <xsl:text>ss.</xsl:text>
                                <xsl:value-of select="$sect_name"/>
                            </xsl:attribute>
                            <title>
                                <xsl:value-of select="db:title"/>
                            </title>
                            
                            <para>
                                <link>
                                    <xsl:attribute name="linkend">
                                        <xsl:text>s.</xsl:text>
                                        <xsl:value-of select="$sect_name"/>
                                    </xsl:attribute>
                                    
                                    <xsl:text> Specification</xsl:text>
                                </link>
                            </para>
                            <para>
                                <link>
                                    <xsl:attribute name="linkend">
                                        <xsl:text>c.</xsl:text>
                                        <xsl:value-of select="$sect_name"/>
                                    </xsl:attribute>
                                    
                                    <xsl:text> Markup sample</xsl:text>
                                </link>
                            </para>
                            <xsl:for-each select=".//db:link[@role='screenshot']">
                                <mediaobject>
                                    <imageobject>
                                        <imagedata>
                                            <xsl:attribute name="fileref">
                                                <xsl:value-of select="@xlink:href"/>
                                            </xsl:attribute>
                                            
                                            <xsl:attribute name="width">500</xsl:attribute>
                                            <!-- to scale the large images -->
                                        </imagedata>
                                    </imageobject>
                                    <textobject>
                                        <phrase>Screenshot</phrase>
                                        <!-- TODO: generate a more sensible hint -->
                                    </textobject>
                                    
                                </mediaobject>
                            </xsl:for-each>
                        </db:section>
                    </xsl:if>
                </xsl:for-each>
            </db:appendix>
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
            <xsl:if test="db:para/db:link[@role='sample']">
                <para>
                    <link>
                        <xsl:attribute name="linkend">
                            <xsl:text>c.</xsl:text>
                            <xsl:value-of select="substring-after(@xml:id,'.')"/>
                        </xsl:attribute>
                        <!-- ToDO: pull the value of the section title <xsl:value-of select="$title"/>-->
                        <xsl:text> Markup sample</xsl:text>
                    </link>
                </para>
            </xsl:if>
            <!-- Creating the link to the screenshot (if exist) in the appendix -->
            <xsl:if test="db:para/db:link[@role='screenshot']">
                <para>
                    <link>
                        <xsl:attribute name="linkend">
                            <xsl:text>ss.</xsl:text>
                            <xsl:value-of select="substring-after(@xml:id,'.')"/>
                        </xsl:attribute>
                        <!-- ToDO: pull the value of the section title <xsl:value-of select="$title"/>-->
                        <xsl:text> Screenshot</xsl:text>
                    </link>
                </para>
            </xsl:if>
            
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
    
    <xsl:template match="db:section[(substring-before(@xml:id,'.')='s')]/db:title"/>
    <!-- delete duplicate titles in spec sections to preserve to docbook element order -->
    
    <!-- remove duplicate links to samples/screenshots -->
    <xsl:template match="db:link[@role='screenshot']|db:link[@role='sample']"/><!-- TODO: rewrite to 1 statement -->
    <!-- and surrounding paras -->
    <xsl:template match="db:para[@role='xml_link']|db:para[@role='image_link']"></xsl:template>

</xsl:stylesheet>
