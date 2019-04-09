#!/bin/sh

file="$1"
[ -z "$file" ] && file="alldocs.xml"

echo "Errors by count"
xmllint --valid "$file" 2>&1 | grep 'validity error' | sed -E 's/^.*:.* : //; s/expecting .*$//'| sort | uniq -c | sort -n

echo""

echo -n "Total:"
xmllint --valid "$file" 2>&1 | grep -ic '\^'

echo ""
