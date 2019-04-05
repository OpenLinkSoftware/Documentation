#!/bin/bash

# Batch sponge all the existing docs server

baseg="$1"
[ -z "$baseg" ] && baseg="urn:openlink:mdata:virtdocs"

cartridgeinstanceURL="$2"
[ -z "$cartridgeinstanceURL" ] && cartridgeinstanceURL="http://localhost:8889/about/html/"

sqlinstance="$3"
[ -z "$sqlinstance" ] && sqlinstance="localhost:1111"

echo "Bulk sponging"

while read i
do
    upstream=$(echo $i | sed -E 's#/ch-#/#')
    echo "curl -s $cartridgeinstanceURL$upstream > /dev/null"
    #    echo 'define get:soft "soft"'
    #    echo "sparql load <$upstream> into <$baseg> ;"
done < file-list.txt | parallel -j 3

echo "Done initial grab"

while read i
do
    upstream=$(echo $i | sed -E 's#/ch-#/#')
echo "
    sparql INSERT 
      { 
        GRAPH <$baseg>
          {
    ?s ?p ?o
          }
      }
    WHERE
      { 
        GRAPH  <$upstream>
          {
            ?s ?p ?o 
          } 
      }    ;
commit work;
"  | isql "$sqlinstance"
done < file-list.txt 


echo "All done"
