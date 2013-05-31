<?xml version="1.0"?><!--Copyright (C) Crane Softwrights Ltd.
PUBLIC "+//ISBN 1-894049::CSL::Courses::PTUX//DOCUMENT
                                 XPath Exercise Stylesheet//EN"-->
<!DOCTYPE xsl:stylesheet [ <!--corresponding error line at left-->
                       <!--the current node-->
<!--122--><!ENTITY q1  ".">

                       <!--each element child of the current node-->
<!--123--><!ENTITY q2  "*">

                       <!--each ancestor of the current node-->
<!--124--><!ENTITY q3  "ancestor::*">

                       <!--each element child named 'this'-->
<!--125--><!ENTITY q4  "this">

                       <!--the third element child named 'this'-->
<!--126--><!ENTITY q5  "this[3]">

                       <!--the third element child-->
<!--127--><!ENTITY q6  "*[3]">

                       <!--all ancestors named 'that'-->
<!--128--><!ENTITY q7  "ancestor::that">

                       <!--the closest ancestor named 'that'-->
<!--129--><!ENTITY q8  "(ancestor::that)[last()]">

                       <!--the most remote ancestor named 'that'-->
                       <!--130--><!ENTITY q9  "(ancestor::that)[1]">

                       <!--the immediately preceding sibling
                       element-->
<!--131--><!ENTITY q10 "(preceding-sibling::*)[last()]">

                       <!--the immediately following sibling
                       element-->
<!--132--><!ENTITY q11 "following-sibling::*[1]">

                       <!--the closest preceding sibling element
                       named 'that'-->
                       <!--133--><!ENTITY q12 "(preceding-sibling::that)[last()]">

                       <!--the closest following sibling element
                       named 'that'-->
                       <!--134--><!ENTITY q13 "following-sibling::that[1]">

                       <!--the seventh sibling element of the set
                       of all sibling elements of the current node
                       (including the current node)-->
<!--135--><!ENTITY q14 "../*[7]">

                       <!--the first element child named 'this' of
                       the second closest ancestor named 'that'-->
<!--136--><!ENTITY q15 "ancestor::that[2]/this[1]">

                       <!--the second closest ancestor named 'that'
                       whose attribute 'val' is equal to 'x'-->
                       <!--137--><!ENTITY q16 "/..">

                       <!--the closest ancestor with a element child
                       named 'this' where that child has a 'val'
                       attribute of 'z'-->
<!--138--><!ENTITY q17 "(ancestor::*[this/@val='z'])[last()]">

                       <!--the last following sibling element named
                       'this'-->
<!--139--><!ENTITY q18 "following-sibling::this[last()]">

                       <!--the first and last element child with a
                       'val' attribute of 'y'-->
<!--140--><!ENTITY q19 "*/..">

                       <!--all elements in the document with a 'val'
                       attribute of 'x'-->
<!--141--><!ENTITY q20 "/..">

                       <!--all comments in the document (not an
                       attribute value)-->
<!--142--><!ENTITY q21 "/..">

                       <!--the element in which the 'cursor' processing
                       instruction is found-->
<!--143--><!ENTITY q22 "/..">

<!-- the remainder of this exercise file can be left unchanged -->

<!ENTITY a1    " (n-5)">
<!ENTITY a2    " (p-1,p-2,p-3,p-4,p-5)">
<!ENTITY a3    " (doc-elem,a,c,d,h,m)">
<!ENTITY a4    " (p-1,p-2,p-4)">
<!ENTITY a5    " (p-4)">
<!ENTITY a6    " (p-3)">
<!ENTITY a7    " (a,d,h,m)">
<!ENTITY a8    " (m)">
<!ENTITY a9    " (a)">
<!ENTITY a10   " (n-4)">
<!ENTITY a11   " (n-6)">
<!ENTITY a12   " (n-4)">
<!ENTITY a13   " (n-8)">
<!ENTITY a14   " (n-7)">
<!ENTITY a15   " (j)">
<!ENTITY a16   " (a)">
<!ENTITY a17   " (h)">
<!ENTITY a18   " (n-7)">
<!ENTITY a19   " (p-2,p-5)">
<!ENTITY a20   " (a,m,n-1,n-3,n-5,p-1,p-3,n-7,n-9)">
<!ENTITY a21   " (first comment,second comment)">
<!ENTITY a22   " (m)">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

<xsl:output method="html"/>

<xsl:template match="/">                    <!--root rule-->
 <pre>
  <xsl:for-each select="//start">
    <!--current node now at the only element named start in the document-->

 1. <xsl:for-each select="&q1; "><xsl:call-template name="report-ids"/></xsl:for-each>&a1; "&q1;"
 2. <xsl:for-each select="&q2; "><xsl:call-template name="report-ids"/></xsl:for-each>&a2; "&q2;"
 3. <xsl:for-each select="&q3; "><xsl:call-template name="report-ids"/></xsl:for-each>&a3; "&q3;"
 4. <xsl:for-each select="&q4; "><xsl:call-template name="report-ids"/></xsl:for-each>&a4; "&q4;"
 5. <xsl:for-each select="&q5; "><xsl:call-template name="report-ids"/></xsl:for-each>&a5; "&q5;"
 6. <xsl:for-each select="&q6; "><xsl:call-template name="report-ids"/></xsl:for-each>&a6; "&q6;"
 7. <xsl:for-each select="&q7; "><xsl:call-template name="report-ids"/></xsl:for-each>&a7; "&q7;"
 8. <xsl:for-each select="&q8; "><xsl:call-template name="report-ids"/></xsl:for-each>&a8; "&q8;"
 9. <xsl:for-each select="&q9; "><xsl:call-template name="report-ids"/></xsl:for-each>&a9; "&q9;"
10. <xsl:for-each select="&q10;"><xsl:call-template name="report-ids"/></xsl:for-each>&a10; "&q10;"
11. <xsl:for-each select="&q11;"><xsl:call-template name="report-ids"/></xsl:for-each>&a11; "&q11;"
12. <xsl:for-each select="&q12;"><xsl:call-template name="report-ids"/></xsl:for-each>&a12; "&q12;"
13. <xsl:for-each select="&q13;"><xsl:call-template name="report-ids"/></xsl:for-each>&a13; "&q13;"
14. <xsl:for-each select="&q14;"><xsl:call-template name="report-ids"/></xsl:for-each>&a14; "&q14;"
15. <xsl:for-each select="&q15;"><xsl:call-template name="report-ids"/></xsl:for-each>&a15; "&q15;"
16. <xsl:for-each select="&q16;"><xsl:call-template name="report-ids"/></xsl:for-each>&a16; "&q16;"
17. <xsl:for-each select="&q17;"><xsl:call-template name="report-ids"/></xsl:for-each>&a17; "&q17;"
18. <xsl:for-each select="&q18;"><xsl:call-template name="report-ids"/></xsl:for-each>&a18; "&q18;"
19. <xsl:for-each select="&q19;"><xsl:call-template name="report-ids"/></xsl:for-each>&a19; "&q19;"
20. <xsl:for-each select="&q20;"><xsl:call-template name="report-ids"/></xsl:for-each>&a20; "&q20;"
21. <xsl:for-each select="&q21;"><xsl:call-template name="report-val"/></xsl:for-each>&a21; "&q21;"
22. <xsl:for-each select="&q22;"><xsl:call-template name="report-ids"/></xsl:for-each>&a22; "&q22;"

End</xsl:for-each>
 </pre>
</xsl:template>

<xsl:template name="report-ids">
  <xsl:value-of select='@id'/>
  <xsl:if test='position()!=last()'>,</xsl:if>
</xsl:template>

<xsl:template name="report-val">
  <xsl:value-of select='.'/>
  <xsl:if test='position()!=last()'>,</xsl:if>
</xsl:template>

</xsl:stylesheet>
