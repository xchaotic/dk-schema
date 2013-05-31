# Using input.sch and input.xml as the schematron file and input file (just as in the examples above), 
# the first transform generates an XSLT stylesheet called tmp.xsl. The next transform uses this stylesheet, 
# and the input file, input.xml to produce an output file called input.report.xml. 

clear
echo Usage: build $1 = iso schematron file, no extension. $2 is the input xml file, with extension.
echo E.g. build input input.xml will produce input.report.xml as output

if [ $# -ne 2 ]
   then
   echo "Usage: build <filename>.sch <filename.ext> to use filename.sch to validate filename.ext"
   exit 2
fi

if [ -f $1.sch ]
   then
     echo
   else
     echo Schema file $1 not found
     exit 2
fi

if [ -e $2 ]
   then
   echo
   else
     echo input file $2 not found
     exit 2
fi



if [ -e tmp.xsl  ]
  then
    rm -f tmp.xsl
fi

if [ -e $1.report.xml ]
   then
    rm $1.report.xml
fi
echo Validate the schema
cp=/myjava/jing.jar:/myjava/saxon652.jar:/myjava/xercesImpl.jar:/myjava/xml-apis.jar

java -classpath $cp com.thaiopensource.relaxng.util.Driver docs/isoSchematron.rng $1.sch

if [ $? -eq 0 ]
   then
     echo $1.sch is valid
   else
     echo Invalid Schematron file
     exit 2
fi


echo Generate the stylesheet from $1

java  -mx250m -ms250m  -cp .:/myjava:/myjava/saxon8.jar:/myjava/xercesImpl.jar \
       net.sf.saxon.Transform    -x org.apache.xerces.parsers.SAXParser -w1   \
       -o tmp.xsl    $1.sch /sgml/schematron/iso/iso_svrl.xsl  "generate-paths=yes"

# Add source document paths with the parameter "generate-paths=yes"





if [ $? -eq 0 ]
  then 
  echo run the input file $2 against the generated stylesheet $1.xsl to produce $1.report.xml

  java  -mx250m -ms250m  -cp .:/myjava:/myjava/saxon8.jar:/myjava/xercesImpl.jar \
    net.sf.saxon.Transform    -x org.apache.xerces.parsers.SAXParser -w1   -o $1.report.xml $2 tmp.xsl

  if [ -e $1.report.xml ]
   then
    #cat $1.report.xml
    java -classpath $cp com.thaiopensource.relaxng.util.Driver docs/svrlDP.rng $1.report.xml
    if [ $? -eq 0  ]
      then
      echo $1.report.xml is valid
    else
      echo $1.report.xml is invalid
    fi
  fi

fi
echo Done
