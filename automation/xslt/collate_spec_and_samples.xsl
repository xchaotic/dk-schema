<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink" 
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output indent="yes"/>
    <xsl:param name="includeFilePath" select="'../../'"/>


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

               
                    <xsl:analyze-string select="$href"
                        regex="http://dk-schema.googlecode.com/hg/(samples/.+)$">
                        <xsl:matching-substring>
                            <example>
                                <title>
                                    <xsl:value-of
                                        select="concat(' ',replace(replace(regex-group(1),'samples/',''),'/',' - '))"
                                    />
                                </title>
                        <xsl:text disable-output-escaping="yes"><![CDATA[<?dbfo pgwide="1"?>]]></xsl:text>
                        <programlisting language="xml"><xsl:text disable-output-escaping="yes"><![CDATA[<?db-font-size 7pt?>]]></xsl:text>
                        <xi:include xmlns:xi="http://www.w3.org/2001/XInclude" href="{concat($includeFilePath,regex-group(1))}" parse="text">
                        <xi:fallback><xsl:value-of select="concat('SAMPLE MISSING: ',concat($includeFilePath,regex-group(1)))"/></xi:fallback>
                        </xi:include>
                                </programlisting>
                            </example>
                        </xsl:matching-substring>
                    </xsl:analyze-string>

                
            </xsl:for-each>

            <xsl:for-each select="db:para[@role='image_link']">
                <xsl:variable name="imagehref" select="db:link/@xlink:href"/>

                
                    
                    <xsl:analyze-string select="$imagehref"
                        regex="http://dk-schema.googlecode.com/hg/(screenshots/.*?\.)(.*)$">
                        <xsl:matching-substring>
                            <figure>
                                <title>
                                    <xsl:value-of
                                        select="replace(concat(' ',replace(regex-group(1),'screenshots/',''),regex-group(2)),'/',' - ')"
                                    />
                                </title>
                                <mediaobject>

                                    <imageobject>
                                        <imagedata scalefit="1" width="100%" contentdepth="100%"
                                            fileref="{concat($includeFilePath,regex-group(1),regex-group(2))}"
                                            format="{regex-group(2)}"/>
                                    </imageobject>

                                </mediaobject>
                            </figure>
                        </xsl:matching-substring>
                    </xsl:analyze-string>


                
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



    <xsl:template match="db:section[(substring-before(@xml:id,'.')='s')]/db:title"/>
    <!-- delete duplicate titles in spec sections to preserve to docbook element order -->

</xsl:stylesheet>
