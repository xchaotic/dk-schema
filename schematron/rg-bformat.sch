<s:schema xmlns:s="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
   <s:ns xmlns:db="http://docbook.org/ns/docbook" prefix="db" uri="http://docbook.org/ns/docbook"/>
   

   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="Glossary-firstterm" >
      <s:rule context="db:firstterm[@linkend]">
         <s:assert
            test="local-name(//*[@xml:id=current()/@linkend]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'"
            >@linkend on firstterm must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="Footnoteref">
      <s:rule context="db:footnoteref">
         <s:assert
            test="local-name(//*[@xml:id=current()/@linkend]) = 'footnote' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'"
            >@linkend on footnoteref must point to a footnote.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="glossterm">
      <s:rule context="db:glossterm[@linkend]">
         <s:assert
            test="local-name(//*[@xml:id=current()/@linkend]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@linkend]) = 'http://docbook.org/ns/docbook'"
            >@linkend on glossterm must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="glossee">
      <s:rule context="db:glosssee[@otherterm]">
         <s:assert
            test="local-name(//*[@xml:id=current()/@otherterm]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@otherterm]) = 'http://docbook.org/ns/docbook'"
            >@otherterm on glosssee must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="glossseealso">
      <s:rule context="db:glossseealso[@otherterm]">
         <s:assert
            test="local-name(//*[@xml:id=current()/@otherterm]) = 'glossentry' and namespace-uri(//*[@xml:id=current()/@otherterm]) = 'http://docbook.org/ns/docbook'"
            >@otherterm on glossseealso must point to a glossentry.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="glossterm_1">
      <s:rule context="db:termdef">
         <s:assert test="count(db:firstterm) = 1">A termdef must contain exactly one
            firstterm</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="rootver">
      <s:rule context="/db:title">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:subject">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:abstract">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:date">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:publisher">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:set">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:book">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:dedication">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:acknowledgements">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:appendix">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:chapter">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:part">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:preface">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:section">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:article">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:calloutlist">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:programlistingco">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:screenco">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:imageobjectco">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:glosslist">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:glossary">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:glossdiv">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:index">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:setindex">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:indexdiv">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:equation">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:informalequation">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:qandaset">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:qandadiv">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:qandaentry">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:task">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:tasksummary">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:taskprerequisites">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:taskrelated">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:any">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:poetry">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:dialogue">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:drama">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
      <s:rule context="/db:para">
         <s:assert test="@version">If this element is the root element, it must have a version
            attribute.</s:assert>
      </s:rule>
   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="title_cardinality">
      <s:rule context="db:seglistitem">
         <s:assert test="count(db:seg) = count(../db:segtitle)">The number of seg elements must be
            the same as the number of segtitle elements in the parent segmentedlist</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="removed_elements">
      <s:rule context="db:caption">
         <s:assert test="not(.//db:equation)">equation must not occur among the children or
            descendants of caption</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or
            descendants of caption</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants
            of caption</s:assert>
         <s:assert test="not(.//db:sidebar)">sidebar must not occur among the children or
            descendants of caption</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of
            caption</s:assert>
         <s:assert test="not(.//db:task)">task must not occur among the children or descendants of
            caption</s:assert>
      </s:rule>
      <s:rule context="db:equation">
         <s:assert test="not(.//db:equation)">equation must not occur among the children or
            descendants of equation</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or
            descendants of equation</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants
            of equation</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of
            equation</s:assert>
      </s:rule>
      <s:rule context="db:example">
         <s:assert test="not(.//db:equation)">equation must not occur among the children or
            descendants of example</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or
            descendants of example</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants
            of example</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of
            example</s:assert>
      </s:rule>
      <s:rule context="db:figure">
         <s:assert test="not(.//db:equation)">equation must not occur among the children or
            descendants of figure</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or
            descendants of figure</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants
            of figure</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of
            figure</s:assert>
      </s:rule>
      <s:rule context="db:table">
         <s:assert test="not(.//db:equation)">equation must not occur among the children or
            descendants of table</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or
            descendants of table</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants
            of table</s:assert>
         <s:assert test="not(.//db:informaltable)">informaltable must not occur among the children
            or descendants of table</s:assert>
      </s:rule>
      <s:rule context="db:footnote">
         <s:assert test="not(.//db:epigraph)">epigraph must not occur among the children or
            descendants of footnote</s:assert>
         <s:assert test="not(.//db:equation)">equation must not occur among the children or
            descendants of footnote</s:assert>
         <s:assert test="not(.//db:example)">example must not occur among the children or
            descendants of footnote</s:assert>
         <s:assert test="not(.//db:figure)">figure must not occur among the children or descendants
            of footnote</s:assert>
         <s:assert test="not(.//db:footnote)">footnote must not occur among the children or
            descendants of footnote</s:assert>
         <s:assert test="not(.//db:indexterm)">indexterm must not occur among the children or
            descendants of footnote</s:assert>
         <s:assert test="not(.//db:sidebar)">sidebar must not occur among the children or
            descendants of footnote</s:assert>
         <s:assert test="not(.//db:table)">table must not occur among the children or descendants of
            footnote</s:assert>
         <s:assert test="not(.//db:task)">task must not occur among the children or descendants of
            footnote</s:assert>
      </s:rule>
      <s:rule context="db:sidebar">
         <s:assert test="not(.//db:sidebar)">sidebar must not occur among the children or
            descendants of sidebar</s:assert>
      </s:rule>
   </s:pattern>
   <!-- following are copied from dk-extensions.sch -->
   <!--  
        1. Whenever condition attribute is used the element 
        should have have an xml:id or cref attribute
        
        condition="dig" cref="EWPB_Chinese_test_p54_1_warmup_1"
        
    -->
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="condition.checks">

      <s:p>Whenever condition attribute is used the element should have have an xml:id or cref
         attribute</s:p>

      <s:rule context="*[exists(@condition)]">
         <s:assert test="exists(@cref) or exists(@xml:id)">There should be an xml:id or cref
            attribute</s:assert>
      </s:rule>


   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="cref.checks">
      <s:p>cref points to element with matching xml:id</s:p>

      <s:rule context="*[exists(@cref)]">

         <s:assert test="exists(//*[matches(@xml:id,current()/@cref)])"> cref does point to element
            with matching xml:id</s:assert>
      </s:rule>

   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="component.checks">
      <s:p>components have xml:id</s:p>

      <s:rule
         context="db:book | db:part | db:preface | db:chapter | db:appendix | db:glossary |              db:bibliography | db:article">
         <s:assert test="exists(@xml:id)">every component should have an xml:id</s:assert>
      </s:rule>

   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="section.checks">
      <s:p>sections have xml:id</s:p>

      <s:rule context="db:section | db:simplesect | db:bridgehead | db:dlossdiv | db:bibliodiv">
         <s:assert test="exists(@xml:id)">every section should have an xml:id</s:assert>
      </s:rule>

   </s:pattern>
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="block-level.checks">
      <s:p>Block Level has xml:id</s:p>

      <s:rule
         context="db:calloutlist | db:itemizedlist | db:orderedlist | db:simplelist | db:variablelist |  db:note | db:figure | db:informalfigure | db:table | db:figure |  db:graphic | db:mediaobject | db:qandaset ">
         <s:assert test="exists(@xml:id)">These block-level elements should have an xml:id</s:assert>
      </s:rule>


   </s:pattern>
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
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="range.checks">
      <s:p>Range Checks</s:p>

      <s:rule context="db:range[matches(@class,'^startofrange$')]">
         <s:assert test="exists(following-sibling::db:range[matches(@class,'^endofrange$')])">for
            every start of range there should be an range with class=endofrange</s:assert>
         <s:assert test="exists(@xml:id)">startofrange should have xml:id</s:assert>
      </s:rule>

      <!--  <rule context="db:range[matches(@class,'^startofrange$')]">
            
            </rule>-->

   </s:pattern>
   <!-- 
        c) keys: many samples on this in the repo, but the idea is that key
        will always be a variablelist, so check that:
        -varaiblelist and each listentry has xml:id (again only if it's a key
        - normal lists don't always have to ahve xml:ids)
        ** NOT DONE THIS ONE  -if the xref has "keyref_include, it would bee good to see if
        varaiblelist is allowed where xref is, nt sure if it can be done in
        schematron
    -->
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="keys.checks">
      <s:p>Keys Checks</s:p>

      <s:rule context="db:variablelist">
         <s:assert test="exists(@role) and matches(@role,'^key$')">for every variable list there
            should be an role = key</s:assert>
      </s:rule>

      <s:rule
         context="db:varlistentry[exists(parent::db:variablelist[exists(@role) and matches(@role,'^key$')])]">
         <s:assert test="exists(@xml:id)">varlistentry within variablelist with role key should have
            xml:id</s:assert>
      </s:rule>

      <s:rule
         context="db:varlistentry[exists(parent::db:variablelist[not(exists(@role) and matches(@role,'^key$'))])]">
         <s:assert test="not(exists(@xml:id))">varlistentry within variablelist without role key
            should have xml:id</s:assert>
      </s:rule>

   </s:pattern>
   
   <!-- section with @role='article' should not contain nested articles -->
   <s:pattern>
      <s:rule context="db:section[@role='article']" role="error">
         <s:report test="db:section[@role='article']">
            Articles shouldn't contain other articles. 
         </s:report>
      </s:rule>
   </s:pattern>
   
   <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="biblioid.metaref">
      <s:p>ISBNs for different products and territories</s:p>
      <s:rule context="db:biblioid" role="error">
         <s:assert test=" @metaref = 'US_epub_ISBN' or @metaref = 'UK_epub_ISBN' or @metaref = 'US_print_ISBN' or @metaref = 'UK_print_ISBN'">
            biblioid should use metaref to indicate the type of product and territory from the following list: US_epub_ISBN US_epub_ISBN, UK_epub_ISBN, US_print_ISBN, UK_print_ISBN
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- phrase[@role='leadin'] must be the first child, before any text nodes -->
   <s:pattern>
      <s:rule context="db:phrase[@role='leadin']" role="error">
         <s:assert test="not(preceding-sibling::db:phrase)">
            leadin phrases must be the first child, before any text nodes.
         </s:assert>
      </s:rule> 
   </s:pattern>
   
   <!-- phrase[@pagenumber] must be a child of either primaryie or secondaryie -->
   <s:pattern>
      <s:rule context="db:phrase[@role='pagenumber']" role="error">
         <s:assert test="ancestor::db:primaryie | ancestor::db:secondaryie">
            pagenumber phrases can only be the descendants of primaryie or secondaryie elements.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- section with @role='article' should not contain nested articles -->
   <s:pattern id="article">
      <s:rule context="db:section[@role='article']" role="error">
         <s:report test="db:section[@role='article']">
            Articles shouldn't contain other articles. 
         </s:report>
      </s:rule>
   </s:pattern>
   
   <!-- phrase[@pagenumber] must be a child of either primaryie or secondaryie -->
   <s:pattern id="pagenumber">
      <s:rule context="db:phrase[@role='pagenumber']" role="error">
         <s:assert test="ancestor::db:primaryie | ancestor::db:secondaryie">
            pagenumber phrases can only be the descendants of primaryie or secondaryie elements.
         </s:assert>
      </s:rule>
   </s:pattern>



   
   
  
 
   
   
    <s:pattern xmlns:db="http://docbook.org/ns/docbook" id="rend">
      <s:rule context="db:*[@rend and @rend != '']">
         
         <s:assert test="contains(' b i bi u leadin level_H1 level_H2 level_H3 level_H4 level_H5 level_H6', @rend)">The
            rend attribute contains value which is not recognized as a rendering hint.</s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- check that elements that should have an @role have an appropriate; check any relationships to other elements/ @role values -->
   
   <!-- chapter -->
   <s:pattern>
      <s:rule context="db:chapter[@role]" role="error">
         <s:assert test="@role = 'basics' or @role = 'guide'">
            "<s:value-of select="./@role"/>" is not a valid "role" value.
            Chapter elements should only have role attributes of "basics" or "guide".
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- section -->
   <!-- restrict @role values of section elements -->
   <s:pattern>
      <s:rule context="db:section[@role]" role="error">
         <s:assert test="@role = 'article' or @role = 'feature' or @role = 'highlight' or
            @role = 'directory' or @role = 'dir_entry' or @role = 'illustration'
            or @role = 'listing' or @role = 'timeline' or @role = 'timeline_entry' or @role = 'POI'
            or @role = 'history' or @role = 'things_not_to_miss'
            or @role = 'backmatter'">
            "<s:value-of select="./@role"/>" is not a valid "role" value.
            Chapter elements should only have role attributes of "article", "feature",
            "directory", "dir_entry", "illustration", "listing", "timeline", "POI", "history", 
            "things_not_to_miss".
         </s:assert>
      </s:rule>
   </s:pattern>

   
   <!-- section with @role='directory' should not contain nested directories -->
   <s:pattern>
      <s:rule context="db:section[@role='directory']" role="error">
         <s:report test="db:section[@role='directory']">
            Directories shouldn't contain other directories. 
         </s:report>
      </s:rule>
   </s:pattern>
   
   <!-- section with @role = "directory" should contain nested sections with @role= "dir_entry" -->
   <s:pattern>
      <s:rule context="db:section[@role='directory']" role="error">
         <s:assert test="db:section[@role='dir_entry']">
            Directory sections should contain directory entries (@role="dir_entry").
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- section with @role = "dir_entry" must only be child of section with @role = "directory" -->
   <s:pattern>
      <s:rule context="db:section[@role='dir_entry']" role="error">
         <s:assert test="parent::db:section[@role='directory']">
            Directory entries should only be the children of directories.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- section with @role = "timeline" must contain a simplelist with a least one member
    with child timeline_date and timeline_description phrases -->
   <s:pattern>
      <s:rule context="db:section[@role='timeline']" role="error">
         <s:assert test="descendant::db:phrase[@role='date'] or
            descendant::db:para[@role='timeline_description']">
            Timeline sections need to contain dates and description phrases.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- any section with an address which isn't in a directory is probably a POI -->
   <s:pattern>
      <s:rule context="//db:section[not(@metaref='POI')][not(@role='dir_entry')]" role="warning">
         <s:report test="db:*/db:address">
            Is this section a POI? If so, please add the attribute role="POI".
         </s:report>
      </s:rule>
   </s:pattern> 
   
   <!-- para -->
   <!-- paras should only have @role values of: intro, key, note, POI_info, timeline_description -->
   <s:pattern>
      <s:rule context="db:para[@role]" role="error">
         <s:assert test="@role = 'intro' or @role = 'key' or @role = 'note'
             or @role = 'timeline_description'">
            "<s:value-of select="./@role"/>" is not a valid "role" value.
            Para elements should only have role attributes of "intro", "key",
            "note" .
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- para[@role='intro'] should be the first para child -->    
   <s:pattern>
      <s:rule context="db:para[@role='intro']" role="error">
         <s:report test="preceding-sibling::db:para">
            Intro paras should be first para child of the containing section.
         </s:report>
      </s:rule>
   </s:pattern>
   
   
   <!-- para[@metaref='POI_info'] must be child of section with @metaref="POI" -->
   <s:pattern>
      <s:rule context="db:para[@metaref='POI_info']" role="error">
         <s:assert test="parent::db:section[@metaref='POI']">
            POI_info paras should be the children of POI sections.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- phrase -->
   <!-- restrict values of phrase elements -->
   <s:pattern>
      <s:rule context="db:phrase[@role]" role="error">
         <s:assert test="@role = 'leadin' or @role = 'map_ref'
            or @role = 'pagenumber' or @role = 'price' or @role = 'timeline_date'
            or @role = 'timeline_description'  or @role = 'POI_name_alt'
            or @role = 'POI_ref' or @role = 'language_variant'  or @role = 'additional_info'
            or @role = 'description' or @role = 'opening_time' or @role = 'closing_time'
            or @role = 'metro' or @role = 'highlight' or @role = 'POI' or @role = 'POI_name' or @role = 'date'">
            "<s:value-of select="./@role"/>" is not a valid "role" value.
            Phrase elements should only have role attributes of leadin, map_ref, pagenumber, price, 
            timeline_date, timeline_description, POI_name_alt, POI_ref, language_variant,
            addtional_info, description, opening_time, closing_time and metro.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- phrase[@map_ref] must point to mediaobject with @role='map' -->
   <s:pattern>
      <s:rule context="db:phrase[@role='map_ref']" role="error">
         <s:let name="linkID" value="child::db:link/@linkend"/>
         <s:assert test="//db:mediaobject[@xml:id = $linkID]">
            map_ref phrases must contain a link pointing to a map mediaobject.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- timeline_description must have ancestor section with @role="timeline" -->
   <s:pattern>
      <s:rule context="db:para[@role='timeline_description']" role="error">
         <s:assert test="ancestor::db:section[@role='timeline']">
            timeline_description phrases must have ancestor section with @role="timeline".
         </s:assert>
      </s:rule>
   </s:pattern>
   
   
   
   <!-- variable list -->
   <!-- variable lists should only have @role values of:  key -->
   <s:pattern>
      <s:rule context="db:variablelist[@role]" role="error">
         <s:assert test="@role='key'">
            Variablelists can only have 'key' as a role value.
         </s:assert>
      </s:rule>
   </s:pattern> 
   
   
   <!-- xref -->
   <!-- xref elements should only have @role values of map include   -->
   <s:pattern id="xref.role">
      <s:rule context="db:xref[@role]" role="error">
         <s:assert test="@role='map_callout' or @role='key_include'">
            xrefs can only have 'map_callout' as a role value.
         </s:assert>
      </s:rule>
   </s:pattern> 
   
   
   
   <!-- map_callout points to map -->
   <s:pattern>
      <s:rule context="db:xref[@role='map_callout']" role="error">
         <s:let name="linkID" value="@linkend"/>
         <s:assert test="//db:area[@xml:id = $linkID]">
            map_callout xrefs must point to areas in maps
         </s:assert>
      </s:rule>
   </s:pattern>
   
   
   
   <!-- mediaobject -->
   <!-- mediaobject elements should only have @role values of: locator, map, chapter_opener, 
         half_title, toc_image, composite_image, transport_map -->
   <s:pattern>
      <s:rule context="db:mediaobject[@role]" role="error">
         <s:assert test="@role = 'locator' or @role = 'map' or @role = 'chapter_opener'
            or  @role = 'half_title' or @role = 'toc_image' or @role = 'composite_image'
            or @role = 'transport_map' or @role = 'phrasebook'">
            mediaobjects should only have @role values of: locator, map, chapter_opener
         </s:assert>
      </s:rule>
   </s:pattern>
   
   
   <!-- chapter opening should be first mediaobject -->
   <s:pattern>
      <s:rule context="db:mediaobject[@role='chapter_opener']" role="error">
         <s:assert test="not(preceding-sibling::db:mediaobject)">
            chapter opener mediaobjects should be the first mediaobjects in a section
         </s:assert>
      </s:rule>
   </s:pattern>
   
   
   
   <!-- toc -->
   <!-- toc elements should only have @role values of: miniToc    -->
   <s:pattern>
      <s:rule context="db:toc[@role]" role="error">
         <s:assert test="@role = 'miniToc'">
            toc elements should only have role values of: 'miniToc'.
         </s:assert>
      </s:rule>
   </s:pattern>
   
   
   
   
   
   <!-- subtitle -->
   <!-- subtitle elements should only have @role values of runningHead:     -->
   <s:pattern>
      <s:rule context="db:subtitle[@role]" role="error">
         <s:assert test="@role='runningHead'">
            subtitle elements should only have role values of "runningHead".
         </s:assert>
      </s:rule>
   </s:pattern>
   
   <!-- title -->
   <!-- title elements should only have @role values of POI_name:     -->
   <s:pattern>
      <s:rule context="db:title[@role]" role="error">
         <s:assert test="@role='POI_name'">
            title elements should only have role values of "POI_name".
         </s:assert>
      </s:rule>
   </s:pattern>
   
   
   <s:pattern id="POI">
      <s:rule context="*[@metaref='POI']" role="warning">
         <s:assert test="self::db:section">Check that POI value is on section
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="POI_info">
      
      <s:rule context="*[@metaref='POI_info']" role="warning">
         <s:assert test="self::db:para">Check that POI_info is on para element</s:assert>
         
      </s:rule>
   </s:pattern>
   
   <s:pattern id="POI_ref">
      <s:rule context="*[@metaref='POI_ref']" role="warning">
         <s:assert test="self::db:phrase | self::db:member">Check that POI value is on a phrase or list member
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="opening_time"> 
      <s:rule context="*[@metaref='opening_time']" role="warning">
         <s:assert test="self::db:phrase">Check that POI value is on a phrase 
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="closing_time"> 
      <s:rule context="*[@metaref='closing_time']" role="warning">
         <s:assert test="self::db:phrase">Check that POI value is on a phrase 
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="price"> 
      <s:rule context="*[@metaref='price']" role="warning">
         <s:assert test="self::db:phrase">Check that price value is on a phrase 
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="additional_info"> 
      <s:rule context="*[@metaref='additional_info']" role="warning">
         <s:assert test="self::db:phrase">Check that additional_info value is on a phrase 
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   
   
   <!-- RG Specific rules -->
   
   <s:pattern id="basics">
      <s:rule context="*[@metaref='basics']" role="warning">
         <s:assert test="self::db:chapter">Check that value is on chapter
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="guide">
      <s:rule context="*[@metaref='guide']" role="warning">
         <s:assert test="self::db:chapter">Check that value is on chapter
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="chapter_opener">
      <s:rule context="*[@metaref='chapter_opener']" role="error">
         <s:assert test="self::db:mediaobject">Check that value is on mediaobject
            element</s:assert>
      </s:rule>
   </s:pattern>
   <!--<s:pattern id="chapter_opener_position"> 
        <s:rule context="db:chapter/descendant::db:mediaobject/@metaref='chapter_opener']" role="warning">
            <s:assert test="true">Check that basics is the first mediaobject
                element in a chapter</s:assert>
        </s:rule>
    </s:pattern>-->
   
   <s:pattern id="history">
      <s:rule context="*[@metaref='history']" role="warning">
         <s:assert test="self::db:section">Check that value is on section
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="things_not_to_miss">
      <s:rule context="*[@metaref='things_not_to_miss']" role="warning">
         <s:assert test="self::db:section">Check that value is on section
            element</s:assert>
      </s:rule>
   </s:pattern>
   
   <s:pattern id="highlight">
      <s:rule context="*[@metaref='highlight']" role="warning">
         <s:assert test="self::db:phrase">Check that value is on phrase
            element</s:assert>
      </s:rule>
   </s:pattern>

</s:schema>