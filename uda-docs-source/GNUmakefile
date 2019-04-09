#!/usr/bin/env make -f

VADPACKER=./vadpacker/vadpacker.py
PACKDATE=$(date +"%Y-%m-%d")
RM=/bin/rm

TARGETS=udadocs_dav.vad

.PHONY:	all

all:	${TARGETS}

clean:	GNUmakefile
	-${RM} -f ${TARGETS}
	-${RM} -rf uda/content/*

udadocs_dav.vad: GNUmakefile uda/content/index.html uda/content/landing-page/index.html uda/content/landing-page/sitemap.xml
	${VADPACKER} --var="VERSION=2" --var="PACKDATE=${PACKDATE}" udadocs_sticker.xml -o udadocs_dav.vad
	chmod 644 udadocs_dav.vad
	ls -lh udadocs_dav.vad
	echo "Done"

uda/content/index.html: uda/udadocs.xml
	./transform-docs.sh 2>&1 | grep -v 'already defined$$'

uda/content/landing-page/index.html: uda/landing-page/index.html
	mkdir -p uda/content/landing-page
	cp -a uda/landing-page/index.html uda/content/landing-page/index.html

uda/content/landing-page/sitemap.xml: uda/landing-page/sitemap.xml
	mkdir -p uda/content/landing-page
	cp -a uda/landing-page/sitemap.xml uda/content/landing-page/sitemap.xml


