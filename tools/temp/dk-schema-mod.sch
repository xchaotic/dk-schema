

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

