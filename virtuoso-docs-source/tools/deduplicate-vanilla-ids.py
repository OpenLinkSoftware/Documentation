#!/usr/bin/env python2.7

import re
import sys

xmlids = {}

for l in sys.stdin:
    l = l.rstrip("\n")

    if re.search(' id=".*?"', l) is not None:
        xmlid = re.search(' id="(.*?)"', l).group(1)
        suffix = 0
        if xmlid in xmlids.keys():
            suffix = xmlids[xmlid]+1
        xmlids[xmlid]=suffix

        if suffix>0:
            suffix="_%02d" % suffix
        else:
            suffix=""

        l=re.sub(' id="%s"' % xmlid, ' id="%s%s"' % (xmlid, suffix), l)

    print(l)
