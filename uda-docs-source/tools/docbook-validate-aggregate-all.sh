#!/bin/bash

for i in  ee lite mt
          do
              ( cd $i && echo $i && ../tools/docbook-validate-aggregate.sh alldocs-$i-utf8.xml  | awk '/Total/')
done | awk -F: '{print}; /Total/ {t+=$NF} END {print "Total-Total: ",t}'

