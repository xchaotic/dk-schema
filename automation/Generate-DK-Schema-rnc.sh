#!/bin/bash

./CombineSchematron.sh

## 1. dk-extensions.rnc + meta.xml = dk-extensions-with-meta.rnc ( only include "dk-extensions.rnc" and redefine metaref)

java -jar calabash/saxon9he.jar -s:../dk-schema/src/meta.xml -xsl:xslt/generate-dk-extensions-with-meta.xsl -o:../dk-schema/src/dk-extensions-with-meta.rnc
cd ../dk-schema/src/

## 2. dk-extensions.rnc + trang = dk-common.rnc (dk-common.rnc - flat schema, no includes or references to external files)

jing -s -c dk-extensions.rnc > dk-extensions.rng
trang dk-extensions.rng dk-common.rnc 


## 2b. Adjust the _1 element * notAllowed to become _1 element conflict notAllowed
java -jar ../../automation/calabash/saxon9he.jar -s:meta.xml -xsl:../../automation/xslt/AdjustDKCommonJingSOutput.xsl -o:../dk-schema.rnc


## 3. dk-extensions-with-meta.rnc + trang = dk-common-with-meta.rnc (flat file)

jing -s -c  dk-extensions-with-meta.rnc > dk-extensions-with-meta.rng
trang  dk-extensions-with-meta.rng  dk-common-with-meta.rnc

## 4 

mkdir rng
for f in *.rnc; do 
        fn="${f%.*}" 
        jing -s -c "${f}" > "rng/${fn##*/}.rng"

done


