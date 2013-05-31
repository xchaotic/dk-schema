

   
   
  
 
   
   
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

