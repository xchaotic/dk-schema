<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
    version="1.0">

    <p:input port="source">
        <p:inline>
            <xml/>
        </p:inline>
    </p:input>

    <p:output port="result" sequence="true"/>

    <p:declare-step name="saveDocument" type="utsweb:save-output">
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
    
    
    <p:variable name="specificationFile" select="'../../docs/src/dk-schema-spec.xml'"/>
    
    <p:variable name="type" select="'screenshots'"/>
   <!-- <p:variable name="type" select="'samples'"/>-->
    
    <p:variable name="inputFolder" select="concat('../../',$type,'/')"/>
    <p:variable name="dirFileNamesList" select="concat('../temp/',$type,'.xml')"/>
    <p:variable name="errorReportFileName" select="concat('../output/errorReport_',$type,'.xml')"/>
   <p:variable name="docBookCollate_spec_and_samplesFileName" select="'../temp/docBookCollate_spec_and_samples.xml'"/>

    
 
    <p:group name="ProduceScreenShotDirList">

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
            <p:wrap-sequence wrapper="sample"/>
        </p:for-each>

        <p:wrap-sequence wrapper="samples"/>

        <p:xslt name="CondenseDirList" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/CondenseDirList.xsl"/>
            </p:input>
            <p:with-param name="type" select="$type"/>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>

        <utsweb:save-output step-name="save">
            <p:with-option name="save" select="'true'"/>
            <p:with-option name="href" select="$dirFileNamesList"/>
        </utsweb:save-output>

    </p:group>


    <p:group name="errorReportFileName">
        <p:load>
            <p:with-option name="href" select="$specificationFile"/>
        </p:load>

        <p:xslt name="ExtractXLinkRef" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/ExtractXLinkRef.xsl"/>
            </p:input>
            <p:with-param name="type" select="$type"/>
            <p:with-param name="href" select="$dirFileNamesList"/>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>
        
        <p:xslt name="GenerateErrorReport" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/GenerateErrorReport.xsl"/>
            </p:input>
            <p:with-param name="type" select="$type"/>
            <p:with-param name="href" select="$dirFileNamesList"/>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>

        <utsweb:save-output step-name="save">
            <p:with-option name="save" select="'true'"/>
            <p:with-option name="href" select="$errorReportFileName"/>
        </utsweb:save-output>
        
    </p:group>

      <p:group name="collateSpecAndSamplesToPDF">
        <p:load>
            <p:with-option name="href" select="$specificationFile"/>
        </p:load>

        <p:xslt name="ExtractXLinkRef" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/collate_spec_and_samples.xsl"/>
            </p:input>
            <p:with-param name="includeFilePath" select="'../../'"/>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>
             
        <utsweb:save-output step-name="save">
            <p:with-option name="save" select="'true'"/>
            <p:with-option name="href" select="$docBookCollate_spec_and_samplesFileName"/>
        </utsweb:save-output> 
        
    </p:group>


    <p:identity name="end"/>
   
</p:declare-step>
