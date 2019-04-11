::: {.topic-text}
\

\

[]{#Query Issues (SPARQL, SQL, etc.)}Query Issues (SPARQL, SQL, etc.)
---------------------------------------------------------------------

### []{#and REGEX Searches Produce Different Results}[bif:contains]{style="font-family: monospace"} and REGEX Searches Produce Different Results

[bif:contains]{style="font-family: monospace"} looks for phrases or
independent words, and it may normalize words that use non-canonical
Unicode chars. It can also search in XML/HTML documents. In addition,
even if one and the same query string is valid for both REGEX and
[bif:contains]{style="font-family: monospace"}, then the meaning may
differ. For REGEX, pattern \"Paris Hilton\" is precisely two words
delimited by single whitespace byte. For
[bif:contains]{style="font-family: monospace"}, \"Paris Hilton\" means
that the document should contain word \"Paris\" and word \"Hilton\",\
in any places and in any order. See
<http://docs.openlinksw.com/virtuoso/queryingftcols.html> for details of
[bif:contains]{style="font-family: monospace"} query string syntax.\
:::
