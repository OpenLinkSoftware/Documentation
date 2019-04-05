#!/usr/bin/env make -f

VADPACKER=./vadpacker/vadpacker.py
PACKDATE=$(date +"%Y-%m-%d")
RM=/bin/rm

TARGETS=virtdocs_dav.vad

.PHONY:	all

all:	${TARGETS}

clean:	GNUmakefile
	-${RM} -f ${TARGETS}
	-${RM} -rf virtuoso/*

virtdocs_dav.vad: GNUmakefile docbook-xhtml-out/index.html
	${VADPACKER} --var="VERSION=2" --var="PACKDATE=${PACKDATE}" virtdocs_sticker.xml -o virtdocs_dav.vad
	chmod 644 virtdocs_dav.vad
	ls -lh virtdocs_dav.vad

docbook-xhtml-out/index.html: xmlsource/virtdocs.xml
	./transform-docs.sh 2>&1 | grep -v 'already defined$$'
