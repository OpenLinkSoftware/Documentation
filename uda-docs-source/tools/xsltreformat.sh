#!/bin/sh

export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin

basic() {
  xmlstarlet fo -s 2
}

nltemplate() {
	sed -E 's#<xsl:template#\n  <xsl:template#g'
}

stylesheet() {
	sed -E '/<xsl:stylesheet/s# #\n    #g'
}

stylespace() {
	sed -E 's#<xsl:stylesheet#\n<xsl:stylesheet#'
}

paramspace() {
	sed -E '1,/<xsl:param/s#<xsl:(param)#\n  <xsl:\1#'
}

outputspace() {
	sed -E '1,/<xsl:output/s#<xsl:(output)#\n  <xsl:\1#'
}

variablespace() {
	sed -E '1,/<xsl:variable/s#<xsl:(variable)#\n  <xsl:\1#'
}

nowhitespaceblanklines() {
	sed -E 's#^[ \t]*$##'
}

comments() {
    sed -E 's#-->#-->\n#g; s#^<!--#\n<!--#g'
}

basic | nltemplate | stylesheet | stylespace | paramspace | outputspace | variablespace | nowhitespaceblanklines | comments
