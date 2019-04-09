#!/usr/bin/env python

import re
import sys

xmlids = {}

for l in sys.stdin:
    l = l.rstrip("\n")

    if re.search('xml:id=".*?"', l) is not None:
        xmlid = re.search('xml:id="(.*?)"', l).group(1)
        suffix = 0
        if xmlid in xmlids.keys():
            suffix = xmlids[xmlid]+1
        xmlids[xmlid]=suffix

        if suffix>0:
            suffix="_%02d" % suffix
        else:
            suffix=""

        l=re.sub('xml:id="%s"' % xmlid, 'xml:id="%s%s"' % (xmlid, suffix), l)

    print l
