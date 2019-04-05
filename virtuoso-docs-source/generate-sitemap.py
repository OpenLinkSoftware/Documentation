#!/usr/bin/env python

#
# Generate a sitemap.xml from docbook-produced documentation
# Uses file mtime and guesstimates priority
#

from glob import glob
from time import strftime, gmtime
import re
import os
import sys
from socket import gethostname

hostname = gethostname()
if re.search("docs", hostname):
    urlbase = "http://docs.openlinksw.com/virtuoso/"
else:
    urlbase = "./"

try:
    urlbase = sys.argv[1]
except:
    pass

sitemap = [(i, os.stat(i).st_mtime) for i in glob("*.html")]

print("""<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
""")

for f, t in sitemap:
    t = strftime("%Y-%m-%dT%H:%M", gmtime(t))
    p = 0.75
    if f == "index.html":
        f = "/"
        p = 0.9
    if re.match("fn_", f):
        p = 0.5
    f=re.sub(".html$","/",f)
    print("""<url>
      <loc>%s%s</loc>
      <lastmod>%s</lastmod>
      <changefreq>monthly</changefreq>
      <priority>%.2f</priority>
   </url>""" % (urlbase, f, t, p))

print("""</urlset>""")
