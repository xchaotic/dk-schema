 #!/bin/bash
 sed -E 's/^.*s:(schema|ns).*$//' ../schematron/dk-schema.sch > temp/dk-schema-mod.sch
 sed -E 's/^.*s:(schema|ns).*$//' ../src/schematron/rg-bformat-mod.sch > temp/rg-bformat-mod.sch
 cat '../src/schematron/dk-schematron-header.mod' 'temp/dk-schema-mod.sch' 'temp/rg-bformat-mod.sch' '../src/schematron/dk-schematron-footer.mod' > '../schematron/rg-bformat.sch'
 

