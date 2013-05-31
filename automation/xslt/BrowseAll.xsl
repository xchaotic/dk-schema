<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://docbook.org/ns/docbook"
  xmlns:db="http://docbook.org/ns/docbook" xmlns:dk="http://dk.com/dk-schema"
  xmlns:utsweb="http://sites.utg.edu.gm/utsweb"
  xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="#all" version="2.0">


  <xsl:template match="*" utsweb:doc="Match any element and it's attribute but don't copy">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
