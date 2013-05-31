<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:s="http://www.ascc.net/xml/schematron"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:kode1100="kode1100.com/schematron" version="1.0">

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


    <p:variable name="SchematronFilePublisher" select="'../../dk-schema/src/db-publishers-sc.sch'"/>
    <p:variable name="SchematronFileExtension" select="'../../dk-schema/src/dk-extensions.sch'"/>
    <p:variable name="SchematronFileDKSchema" select="'../../dk-schema/dk-schema.sch'"/>




    <p:group name="dk-common-modification">
        
        <p:load>
            <p:with-option name="href" select="$SchematronFileExtension"/>
        </p:load>
        <p:filter select="/s:schema/( s:pattern | comment())"/>
 
        <p:wrap-sequence wrapper="sample"/>
        
        <p:identity name="SchematronFileExtension"/>
        <p:sink/>

        <p:load>
            <p:with-option name="href" select="$SchematronFilePublisher"/>
        </p:load>
        
        <p:filter select="/s:schema/(*| comment() )"/>
        
        <p:wrap-sequence wrapper="sample"/>
        <p:identity name="SchematronFilePublisher"/>
     
        <p:pack name="packer" wrapper="samples" >
            <p:input port="source">
                <p:pipe step="SchematronFilePublisher" port="result"/>
            </p:input>
            <p:input port="alternate">
                <p:pipe step="SchematronFileExtension" port="result"/>
            </p:input>
        </p:pack>

        <p:filter select="samples/sample/(s:pattern | comment() | s:ns[1])"/>
        <p:wrap-sequence wrapper="schema" wrapper-prefix="s" wrapper-namespace="http://www.ascc.net/xml/schematron"></p:wrap-sequence>
    </p:group>

    <kode1100:save-output step-name="save">
        <p:with-option name="save" select="'true'"/>
        <p:with-option name="href" select="$SchematronFileDKSchema"/>
    </kode1100:save-output>
   
</p:declare-step>
