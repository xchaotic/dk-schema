#!/bin/bash
java -classpath calabash/saxon9ee.jar:calabash/calabash.jar com.xmlcalabash.drivers.Main xproc/FileMissingDetectionReport.xpl 
echo "File Missing Detection Report Run"

sed -i 's/&lt;/</g' temp/docBookCollate_spec_and_samples.xml 
sed -i 's/&gt;/>/g' temp/docBookCollate_spec_and_samples.xml 

echo "temp/docBookCollate_spec_and_samples.xml produced"

xsltproc --xinclude \
 --stringparam  html.stylesheet "corpstyle.css"  \
 --stringparam  admon.graphics 1 \
 --stringparam  admon.graphics.path /usr/share/xml/docbook/stylesheet/nwalsh/fo/param.xsl \
 --stringparam  font-size 7pt \
 --stringparam  draft.mode  no  \
 --stringparam  fop.extensions 0  \
 --stringparam  fop1.extensions 1  \
 --stringparam  highlight.source 1  \
 --stringparam  highlight.xslthl.config /usr/share/xml/docbook/stylesheet/nwalsh/fo/param.xsl  \
 --stringparam  paper.type A4  \
 xslt/CustomPDFDKSchema.xsl temp/docBookCollate_spec_and_samples.xml > temp/docBookCollate_spec_and_samples.fo

fop -fo temp/docBookCollate_spec_and_samples.fo -pdf ../docs/dk-schema-spec-with-samples.pdf

xsltproc --xinclude \
 --stringparam  admon.graphics 1 \
 --stringparam  admon.graphics.path /usr/share/xml/docbook/stylesheet/nwalsh/fo/param.xsl \
 --stringparam  highlight.source 1  \
 --stringparam  highlight.xslthl.config /usr/share/xml/docbook/stylesheet/docbook-xsl/highlighting/xslthl-config.xml \
 --stringparam  paper.type A4  \
 -o ../docs/dk-schema-spec-with-samples.html /usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl temp/docBookCollate_spec_and_samples.xml


sed -i 's/..\/screenshot/screenshot/g' ../docs/dk-schema-spec-with-samples.html
