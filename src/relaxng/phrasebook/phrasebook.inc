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
             

    #phrasebook entries should be allowed for all block elements and inside a para and top-level
    db.publishing.blocks |=  pb.phrase_entry
    db.publishing.inlines |=  pb.inline_phrase_entry   
  

# new element for the sense, groups together all information relating to one word sense in a phrasebook entry, for example definitions, examples, and translation equivalents.
pb.sense =
  [ r:remap [ db:phrase [ role = "phrase_sense" ] ] ]
  element sense {  pb.def* & pb.usg* & db.all.inlines* & db.common.attributes}
  
  
pb.form =
  [ r:remap [ db:phrase [ role = "phrase_form" ] ] ]
  element form {  pb.orth* & pb.pron* & pb.usg* & db.all.inlines* & db.common.attributes}
  
pb.def =
  [ r:remap [ db:phrase [ role = "phrase_definition" ] ] ]
  element def { db.all.inlines* }
  
pb.usg =
  [ r:remap [ db:phrase [ role = "phrase_usage" ] ] ]
  element usg { db.all.inlines*}

pb.orth =
  [ r:remap [ db:phrase [ role = "phrase_orthographic_form" ] ] ]
  element orth { db.all.inlines*}
  
pb.pron =
  [ r:remap [ db:phrase [ role = "phrase_pronounciation" ] ] ]
  element pron { db.all.inlines*}

## grammatical classification element
pb.partofspeech =
  [ r:remap [ db:phrase [ role = "phrase_partofspeech" ] ] ]
  element partofspeech { db.all.inlines*}
pb.phrase_gender =
  [ r:remap [ db:phrase [ role = "phrase_gender" ] ] ]
  element phrase_gender { db.all.inlines*}  
  
pb.phrase_number =
  [ r:remap [ db:phrase [ role = "phrase_number" ] ] ]
  element phrase_number { db.all.inlines*}  


# element for grammatical classification
pb.gramGrp = 
 [ r:remap [ db:phrase [ role = "phrase_grammatical_group" ] ] ]
  element gramGrp { pb.partofspeech? & pb.phrase_gender? & pb.phrase_number? & db.all.inlines*}

# new element for the main phrasebook entry
  pb.phrase_entry =
  [ r:remap [ db:para [ role = "phrase_entry" ] ] ]
  element phrase_entry { pb.phrase_entry.attributes & pb.sense* & pb.form* & pb.gramGrp? & pb.usg* & pb.def* & db.all.inlines* }
  pb.phrase_entry.attributes = db.common.attributes 
  
  pb.inline_phrase_entry =   
  [ r:remap [ db:phrase [ role = "phrase_entry" ] ] ]
  element inline_phrase_entry {  pb.inline_phrase_entry.attributes & pb.sense* & pb.form* & pb.gramGrp? & pb.usg* & pb.def* & db.all.inlines* }
  pb.inline_phrase_entry.attributes = db.common.attributes 
