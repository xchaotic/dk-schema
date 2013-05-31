<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:dk="http://dk.com/dk-schema" version="1.0">

    <p:input port="source">
        <p:inline>
            <xml/>
        </p:inline>
    </p:input>

    <p:output port="result" sequence="true"/>

    <p:declare-step name="saveDocument" type="dk:save-output">
        <p:input port="source" primary="true"/>
        <p:output port="result">
            <p:pipe port="result" step="ident"/>
        </p:output>
        <p:option name="step-name" required="true"/>
        <p:option name="save" select="'false'"/>
        <p:option name="href" required="true"/>
        <p:identity name="ident"/>

        <p:choose>
            <p:when test="$save = 'true'">
                <p:store>
                    <p:with-option name="href" select="$href">
                        <p:pipe port="result" step="ident"/>
                    </p:with-option>
                </p:store>
            </p:when>
            <p:otherwise>
                <p:sink/>
            </p:otherwise>
        </p:choose>
    </p:declare-step>

    <p:declare-step type="cx:message" version="1.0">
        <p:input port="source"/>
        <p:output port="result"/>
        <p:option name="message" required="true"/>
    </p:declare-step>

    <p:variable name="inputFolder" select="'../samples/'"/>
    <p:variable name="outputFile" select="'output.xml'"/>

    <p:directory-list name="dirList">
        <p:with-option name="path" select="$inputFolder">
            <p:empty/>
        </p:with-option>
    </p:directory-list>

    <p:for-each name="samples">
        <p:iteration-source select="/c:directory/c:directory"/>
        <p:output port="result"/>
        <p:variable name="dirpath" select="concat($inputFolder,c:directory/@name, '/')"/>
        <p:directory-list name="dirList2">
            <p:with-option name="path" select="$dirpath"/>
        </p:directory-list>
       
        <p:for-each name="sample">
            <p:iteration-source select="c:directory/c:file"/>           
            <p:choose>
                <p:when test="contains(c:file/@name,'.xml')">
                    <p:load>
                        <p:with-option name="href" select="concat($dirpath,c:file/@name)"/>
                    </p:load>
                  <!--  <p:xslt name="collate_spec_and_samples" version="1.0">
                        <p:input port="stylesheet">
                            <p:document href="collate_spec_and_samples.xsl"/>
                        </p:input>
                        <p:input port="parameters">
                            <p:empty/>
                        </p:input>
                    </p:xslt>-->
                </p:when>
                <p:otherwise>
                    <p:identity/>
                </p:otherwise>
            </p:choose>
          
        </p:for-each>
        <p:wrap-sequence wrapper="sample"/>
    </p:for-each>
    <p:wrap-sequence wrapper="samples"/>

    <dk:save-output step-name="save">
        <p:with-option name="save" select="'true'"/>
        <p:with-option name="href" select="$outputFile"/>
    </dk:save-output>

</p:declare-step>
