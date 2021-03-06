#!/bin/sh

#
# Script wrapper around xsltproc to transform docs into chunked XHTML using regular DocBook XSLT stylesheets 
#

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin
export PATH

thisdir="$PWD"
[ -z "$thisdir" ] && thisdir="`pwd`"

OUTDIR="virtuoso/content"
XSLT="config-wrapper.xslt"
LOGFILE="transform-docs.log"

DATETIME=$(date +"%Y-%m-%dT%H:%M:%S")

TOPNODE="$1"
[ -z "$TOPNODE" ] && TOPNODE=""

#Clean previous attempts

rm -rf "$OUTDIR"
mkdir -p "$OUTDIR"
mkdir -p "$OUTDIR/images"

#Run the XSLT
#     --stringparam  root.filename  'index.html'  \

time nice xsltproc --novalid \
     --xincludestyle \
     --stringparam rootid "$TOPNODE" \
     --stringparam gendatetime "$DATETIME" \
     -o "$OUTDIR/index.html" \
     "$XSLT" \
     xmlsource/virtdocs.xml 2>&1 | tee "$LOGFILE" | grep -Evi 'element section: validity error : ID '

#Generate sitemap
(cd "$OUTDIR" && python "$thisdir"/generate-sitemap.py > sitemap-virtuoso.xml )

#Link CSS & JS stuff
(cd "$OUTDIR/" && ln -s "$thisdir"/opl-style.css . )
(cd "$OUTDIR/" && ln -s "$thisdir"/opl-script.js . )
(cd "$OUTDIR/" && ln -s "$thisdir"/jquery-1.11.3.min.js . )

#Copy images into place
(cd "$OUTDIR/" && cp -av "$thisdir/images" .)
(cd "$OUTDIR/images" && ln -s "$thisdir"/DocBook/images/* . )

#Generate mdata
(cd tools/batch-data && ./mdata-template.sh > mdata.ttl)
