<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:db="http://docbook.org/ns/docbook" queryBinding="xslt2" schemaVersion="ISO19757-3">
    <title>Test xml files that are of type dk-extension.rnc </title>
    <ns uri="http://docbook.org/ns/docbook" prefix="db"/>
    <!--  
        1. Whenever condition attribute is used the element 
        should have have an xml:id or cref attribute
        
        condition="dig" cref="EWPB_Chinese_test_p54_1_warmup_1"
        
    -->
    
     
    <pattern id="condition.checks">
        <title>Whenever condition attribute is used the element should have have an xml:id or cref
            attribute</title>

        <rule context="*[exists(@condition)]">
            <assert test="exists(@cref) or exists(@xml:id)">There should be an xml:id or cref
                attribute</assert>
        </rule>  

 
    </pattern> 
   
    
    <pattern id="cref.checks">
        <title>cref points to element with matching xml:id</title>
        
        <rule context="*[exists(@cref)]">
            
            <assert test="exists(//*[matches(@xml:id,current()/@cref)])">             
                cref does not point to element with matching xml:id</assert>
        </rule>
         
    </pattern>
 
 
    <pattern id="component.checks">
        <title>components have xml:id</title>
        
        <rule context="db:book | db:part | db:preface | db:chapter | db:appendix | db:glossary |              db:bibliography | db:article">
            <assert test="exists(@xml:id)">every component should have an xml:id</assert>
        </rule>       
        
    </pattern>
 
 
    <pattern id="section.checks">
        <title>sections have xml:id</title>
        
        <rule context="db:section | db:simplesect | db:bridgehead | db:dlossdiv | db:bibliodiv">
            <assert test="exists(@xml:id)">every section should have an xml:id</assert>
        </rule>       
        
    </pattern>
    
    
 

    <pattern id="block-level.checks">
        <title>Block Level has xml:id</title>
         
        <rule context="db:calloutlist | db:itemizedlist | db:orderedlist |                          db:simplelist | db:variablelist |  db:note |                db:address | db:literallayout |  db:creen |                db:example | db:informalexample | db:figure |              db:informalfigure | db:table |  db:para | db:simpara | db:formalpara |              db:equation | db:informalequation | db:figure |  db:graphic | db:mediaobject |              db:qandaset | db:blockquote |  db:epigraph |  db:highlights |              db:procedure | db:sidebar">
            <assert test="exists(@xml:id)">every block-level element should have an xml:id</assert>
        </rule>
 
 
    </pattern>
   
   
   <!-- 
       b) There is a rather loose <range> element allowed in the schema.
       Have a look here:
       http://code.google.com/p/dk-schema/source/browse/work-in-progress/ranges/DB-5.0%20mark-up/date.xml
       we need to validate two things again:
       -that for every start of range there is an endofrange
       -that startofrange has xml:id - try to have a general xml:id rule and
       reuse it if possible - in this the endofrange element doesn't have to
       have xml:id so we can't simply add it to the list from a)
   -->
    
    <pattern id="range.checks">
        <title>Range Checks</title>
        
        <rule context="db:range[matches(@class,'^startofrange$')]">
            <assert test="exists(following-sibling::db:range[matches(@class,'^endofrange$')])">for every start of range there should be an range with class=endofrange</assert>
            <assert test="exists(@xml:id)">startofrange should have xml:id</assert>
        </rule>
   
      <!--  <rule context="db:range[matches(@class,'^startofrange$')]">
            
        </rule>-->
   
    </pattern>
    
    
<!-- 
    c) keys: many samples on this in the repo, but the idea is that key
    will always be a variablelist, so check that:
    -varaiblelist and each listentry has xml:id (again only if it's a key
    - normal lists don't always have to ahve xml:ids)
  ** NOT DONE THIS ONE  -if the xref has "keyref_include, it would bee good to see if
    varaiblelist is allowed where xref is, nt sure if it can be done in
    schematron
-->
     
    
    <pattern id="keys.checks">
        <title>Keys Checks</title>
        
        <rule context="db:variablelist">
            <assert test="exists(@role) and matches(@role,'^key$')">for every variable list there should be an role = key</assert>
        </rule>
        
        <rule context="db:varlistentry[exists(parent::db:variablelist[exists(@role) and matches(@role,'^key$')])]">
            <assert test="exists(@xml:id)">varlistentry within variablelist with role key should have xml:id</assert>
        </rule>
        
        <rule context="db:varlistentry[exists(parent::db:variablelist[not(exists(@role) and matches(@role,'^key$'))])]">
            <assert test="not(exists(@xml:id))">varlistentry within variablelist without role key should have xml:id</assert>
        </rule>
     
    </pattern>
    
    
</schema>