#!/bin/zsh

devdoc=~/Documents/openlink/webdev/virtuoso-docs-develop/xmlsource/alldocs-develop.xml
fixdoc=~/Documents/openlink/webdev/virtuoso-docs/xmlsource/alldocs.xml

xmlstarlet sel -t -m "//*[@id]" -v "@id" -n < $devdoc 2> /dev/null|tr '[A-Z]' '[a-z]' | sort -u > ids-dev.txt
xmlstarlet sel -t -m "//*[@xml:id]" -v "@xml:id" -n < $fixdoc 2> /dev/null| tr '[A-Z]' '[a-z]' | sort -u  > ids-fix.txt

diff --suppress-common-lines -iEZbwBadu ids-dev.txt ids-fix.txt |awk '/^-/' > ids-diff.txt


