<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:kode1100="kode1100.com/schematron"
    version="1.0">

    <p:input port="source">
        <p:inline>
            <xml/>
        </p:inline>
    </p:input>

    <p:output port="result" sequence="true"/>

    <p:declare-step name="saveDocument" type="kode1100:save-output">
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

    <p:variable name="type" select="'samples'"/>
    <p:variable name="xmlFileInput" select="'../schematron/in/EW_ChinesePhraseBook.xml'"/>
    <p:variable name="schematronInput" select="'../schematron/dk-extensions2.sch'"/>
    <p:variable name="relaxNGSchema" select="'../../dk-schema/src/dk-extensions.rnc'"/>
    <p:variable name="mergedOutput" select="'../output/EW_ChinesePhraseBookRelaxNGValidationSchematronOuput.xml'"/>
    
    <!--
     <p:variable name="schematronOutput" select="'../schematron/out/EW_ChinesePhraseBook.svrlt'"/>
     <p:variable name="relaxNGValidationOutput" select="'../schematron/out/EW_ChinesePhraseBookRelaxNGValidation.xml'"/>  
    -->
    
    <p:group name="schematronXSL">

        <p:load>
            <p:with-option name="href" select="$schematronInput"/>
        </p:load>

        <p:xslt name="iso_dsdl_include" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/iso_dsdl_include.xsl"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>
        

        <!-- expand abstract patterns -->
        <p:xslt name="iso_abstract_expand" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/iso_abstract_expand.xsl"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>



        <!-- compile it -->
        <p:xslt name="iso_svrl_for_xslt2" version="1.0">
            <p:input port="stylesheet">
                <p:document href="../xslt/iso_svrl_for_xslt2.xsl"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>

        <kode1100:save-output step-name="save">
            <p:with-option name="save" select="'true'"/>
            <p:with-option name="href" select="'../xslt/dk-extensions.xsl'"/>
        </kode1100:save-output>

        <p:sink/>

    </p:group>

    <p:load>
        <p:with-option name="href" select="$xmlFileInput"/>
    </p:load>

    <!-- validate -->
    <p:xslt name="schematronOutput" version="1.0">
        <p:input port="stylesheet">
            <p:document href="../xslt/dk-extensions.xsl"/>
        </p:input>

        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>

    <!--<kode1100:save-output step-name="save">
        <p:with-option name="save" select="'true'"/>
        <p:with-option name="href" select="$schematronOutput"/>
    </kode1100:save-output>
    -->
   
    <p:directory-list name="tiger">
        <p:with-option name="path" select="'.'"/>
    </p:directory-list>

    <p:group>
        <p:variable name="cwd" select="/c:directory/@*[namespace-uri()='http://www.w3.org/XML/1998/namespace' and local-name()='base']"/>
        
        <p:exec command="java"    name="validate-with-rng"
            result-is-xml="false" wrap-result-lines="true">
            <p:with-option name="args" select="concat('-jar ../jing/jing.jar -c', ' ',
                $relaxNGSchema , ' ', $xmlFileInput)">
                <p:empty/>
            </p:with-option>
            <p:with-option name="cwd" select="replace($cwd,'file:','')"></p:with-option>
        </p:exec>  
        
        
<!--        <kode1100:save-output step-name="save">
            <p:with-option name="save" select="'true'"/>
            <p:with-option name="href" select="$relaxNGValidationOutput"/>
        </kode1100:save-output>
-->        
        
        <p:pack name="packer" wrapper="document">
            <p:input port="source">
                <p:pipe step="validate-with-rng" port="result"/>
            </p:input>
            <p:input port="alternate">
                <p:pipe step="schematronOutput" port="result"/>
            </p:input>
        </p:pack>
        
        
    </p:group>
    
    <kode1100:save-output step-name="save">
        <p:with-option name="save" select="'true'"/>
        <p:with-option name="href" select="$mergedOutput"/>
    </kode1100:save-output>
    
    
   
    
<!--    <p:exec command="java"   cwd="/home/alex/kode1100ClientWork/Lech/005-DKSchema/code2/hg/automation/xproc/"  name="validate-with-rng"
        result-is-xml="false" wrap-result-lines="true">
        <p:with-option name="args" select="concat('-jar ../jing/jing.jar -c', ' ',
            $relaxNGSchema , ' ', $xmlFileInput)">
            <p:empty/>
        </p:with-option>
    </p:exec>   --> 
    
    
  
    
  
    
<!-- 
    <p:exec name="ls" command="/bin/ls" result-is-xml="false" args="-l ../docs"
    wrap-result-lines="true">
-->
   
    
    <p:identity name="end"/>

</p:declare-step>

<!--
    
    Code that could create directory list of all xml files
    
    <p:group name="ProduceScreenShotDirList">
    
    <p:directory-list name="dirList" >
    <p:with-option name="path" select="$inputFolder">
    
    <p:empty/>
    </p:with-option>
    </p:directory-list>
    
    <p:for-each name="samples">
    <p:iteration-source select="/c:directory/c:directory"/>
    <p:output port="result"/>
    <p:variable name="dirpath" select="concat($inputFolder,c:directory/@name, '/')"/>
    <p:directory-list name="dirList2" include-filter=".*xml">
    <p:with-option name="path" select="$dirpath"/>
    </p:directory-list>
    <p:wrap-sequence wrapper="sample"/>
    </p:for-each>
    
    <p:wrap-sequence wrapper="samples"/>
    
    <p:xslt name="MergeFileNameAndPaths" version="1.0">
    <p:input port="stylesheet">
    <p:document href="../xslt/MergeFileNameAndPaths.xsl"/>
    </p:input>
    <p:with-param name="type" select="$type"/>
    <p:input port="parameters">
    <p:empty/>
    </p:input>
    </p:xslt>
    
    <!-\-   <kode1100:save-output step-name="save">
    <p:with-option name="save" select="'true'"/>
    <p:with-option name="href" select="$dirFileNamesList"/>
    </kode1100:save-output>-\->
    
    </p:group>-->
<!--
    Output
    <link>file:/home/alex/kode1100ClientWork/Lech/005-DKSchema/code2/hg/samples/index/index.xml</link>
-->
