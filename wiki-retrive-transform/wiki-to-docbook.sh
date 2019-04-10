#!/bin/sh

#
# sudo apt install xmlstarlet xsltproc cadaver parallel tidy pandoc
# brew install xmlstarlet libxslt cadaver parallel tidy-html5 pandoc
#

#
# ./wiki-to-docbook.sh "DAV base URL to wiki cluster" "URL to wiki endpoint" "short cluster name"
#

tlog() {
  echo $(date) $*
}

davbaseURL="$1"
clusterBaseURL="$2"
clustername="$3"

[ -z "$clustername" ] && echo "Please supply a source location, cluster base URL and destination directory" && exit

tlog "Retrieving list of pages for cluster $clustername"

echo ls | cadaver "$davbaseURL" > $clustername.txt

tlog "Making local directories"
mkdir -p $clustername/docbook
mkdir -p $clustername/text
mkdir -p $clustername/plain-html
mkdir -p $clustername/plain-html-tidy
mkdir -p $clustername/md
mkdir -p $clustername/docbook-local
mkdir -p $clustername/creole
mkdir -p $clustername/rdf


count=$(grep -Ei '\.txt' $clustername.txt | sed -E 's/^ *//; s/  *[0-9]+.*$// ; s/\.txt$//' | wc -l)
tlog "Identified [$count] wiki pages in cluster $clustername"

tlog "Retrieving as DocBook, HTML and text formats - go get a coffee"
count=0
grep -Ei '\.txt' $clustername.txt | sed -E 's/^ *//; s/  *[0-9]+.*$// ; s/\.txt$//' |  while read pg
do
  echo "curl -s '$clusterBaseURL/$pg?command=plain-html' > $clustername/plain-html/$pg.html"
  echo "curl -s '$clusterBaseURL/$pg?command=docbook' > $clustername/docbook/$pg.docbook"
  echo "curl -s '$clusterBaseURL/$pg?command=text' > $clustername/text/$pg.txt"
  echo $((count++)) | grep -iq '0$' && ret=$(find $clustername -type f | wc -l) && echo "echo  ...$ret" && echo sleep 1
done | time nice parallel -j4


tlog "Tidying local HTML"
count=0
grep -Ei '\.txt' $clustername.txt | sed -E 's/^ *//; s/  *[0-9]+.*$// ; s/\.txt$//' | head -n 20 | while read pg
do
  tidy -i -c -asxhtml $clustername/plain-html/$pg.html > $clustername/plain-html-tidy/$pg.html 2> /dev/null
  echo $((count++)) | grep -iq '0$' && ret=$(find $clustername -type f | wc -l) && echo "echo  ...$ret" && echo sleep 1
done | time nice parallel -j4


tlog "Running local transformations"
count=0
grep -Ei '\.txt' $clustername.txt | sed -E 's/^ *//; s/  *[0-9]+.*$// ; s/\.txt$//' | head -n 20 | while read pg
do
  echo "xsltproc html2docbook.xsl $clustername/plain-html-tidy/$pg.html > $clustername/docbook-local/$pg.docbook"
  echo "xsltproc html2rdf.xsl $clustername/plain-html-tidy/$pg.html > $clustername/rdf/$pg.rdf"
  echo "xsltproc docbook2creole.xsl $clustername/docbook/$pg.docbook > $clustername/creole/$pg.txt"
  echo "pandoc -f html -t markdown -o $clustername/md/$pg.md $clustername/plain-html-tidy/$pg.html"
  echo $((count++)) | grep -iq '0$' && ret=$(find $clustername -type f | wc -l) && echo "echo  ...$ret" && echo sleep 1
done | time nice parallel -j4


tlog "All done"
