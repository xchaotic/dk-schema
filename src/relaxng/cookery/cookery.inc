namespace a = "http://relaxng.org/ns/compatibility/annotations/1.0"
namespace ctrl = "http://nwalsh.com/xmlns/schema-control/"
default namespace db = "http://docbook.org/ns/docbook"
namespace dcmitype = "http://purl.org/dc/dcmitype/"
namespace dcterms = "http://purl.org/dc/terms/"
namespace html = "http://www.w3.org/1999/xhtml"
namespace mml = "http://www.w3.org/1998/Math/MathML"
namespace rng = "http://relaxng.org/ns/structure/1.0"
namespace s = "http://www.ascc.net/xml/schematron"
namespace svg = "http://www.w3.org/2000/svg"
namespace xlink = "http://www.w3.org/1999/xlink"
namespace r  = "http://nwalsh.com/xmlns/schema-remap/"
             
  
#allow recipe where section would be allowed   

db.publishing.blocks |= dk.recipe


#Alter the step slightly to allow stepnum
db.step.attlist &= dk.stepnum.attribute?

#model the recipe after the Docbook section model
dk.recipe =

 [ r:remap [ db:section [ role = "recipe" ] ] ]
 element recipe { 
      db.section.attlist,
      db.section.info,
      (db.recursive.blocks.or.sections & dk.nutrition? & dk.ingredients? & dk.preparation? ),
      db.navigation.components*
     
      }

#model the preparation after the Docbook procedure model
dk.preparation =

 [ r:remap [ db:procedure [ role = "preparation" ] ] ]
 element preparation { db.procedure.attlist, db.procedure.info, (db.all.blocks* & db.step*) }
 
 #define stepnum to explicitly indicate the step number or out of order numbering...
 dk.stepnum.attribute = 
 
 attribute stepnum { text}
 
 #all the nutrition onfo should be wrapped inside one element
 dk.nutrition =

 [ r:remap [ db:simplelist [ role = "nutrition" ] ] ]
 element nutrition { db.all.inlines* }
 
 #ingredients wrapper
 dk.ingredients =

 [ r:remap [ db:simplelist [ role = "nutrition" ] ] ]
 element ingredients { db.all.inlines* & db.list.blocks }
 
 #define what else is allowed inside a recipe element
 dk.recipe.blocks =

 dk.nutrition? |
 dk.ingredients |
 dk.preparation+
 

