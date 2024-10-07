<div id="rdfiridereferencingexamples" class="section">

<div class="titlepage">

<div>

<div>

### 16.13.4. Examples of other Protocol Resolvers

</div>

</div>

</div>

Example of <span class="emphasis">*LSIDs*</span> : A scientific name
from UBio

``` programlisting
SQL>SPARQL
define get:soft "soft"
SELECT *
FROM <urn:lsid:ubio.org:namebank:11815>
WHERE { ?s ?p ?o }
LIMIT 5;

s                                 p                                           o
VARCHAR                           VARCHAR                                     VARCHAR
_______________________________________________________________________________

urn:lsid:ubio.org:namebank:11815  http://purl.org/dc/elements/1.1/title       Pternistis leucoscepus
urn:lsid:ubio.org:namebank:11815  http://purl.org/dc/elements/1.1/subject     Pternistis leucoscepus (Gray, GR) 1867
urn:lsid:ubio.org:namebank:11815  http://purl.org/dc/elements/1.1/identifier  urn:lsid:ubio.org:namebank:11815
urn:lsid:ubio.org:namebank:11815  http://purl.org/dc/elements/1.1/creator     http://www.ubio.org
urn:lsid:ubio.org:namebank:11815  http://purl.org/dc/elements/1.1/type        Scientific Name

5 Rows. -- 741 msec.
```

Example of <span class="emphasis">*LSIDs*</span> : A segment of the
human genome from GDB

``` programlisting
SQL>SPARQL
define get:soft "soft"
SELECT *
FROM <urn:lsid:gdb.org:GenomicSegment:GDB132938>
WHERE { ?s ?p ?o }
LIMIT 5;

s                                          p                                                     o
VARCHAR                                    VARCHAR                                               VARCHAR
_______________________________________________________________________________

urn:lsid:gdb.org:GenomicSegment:GDB132938  urn:lsid:gdb.org:DBObject-predicates:accessionID      GDB:132938
urn:lsid:gdb.org:GenomicSegment:GDB132938  http://www.ibm.com/LSID/2004/RDF/#lsidLink            urn:lsid:gdb.org:DBObject:GDB132938
urn:lsid:gdb.org:GenomicSegment:GDB132938  urn:lsid:gdb.org:DBObject-predicates:objectClass      DBObject
urn:lsid:gdb.org:GenomicSegment:GDB132938  urn:lsid:gdb.org:DBObject-predicates:displayName      D20S95
urn:lsid:gdb.org:GenomicSegment:GDB132938  urn:lsid:gdb.org:GenomicSegment-predicates:variantsQ  nodeID://1000027961

5 Rows. -- 822 msec.
```

Example of <span class="emphasis">*OAI*</span> : an institutional /
departmental repository.

``` programlisting
SQL>SPARQL
define get:soft "soft"
SELECT *
FROM <oai:etheses.bham.ac.uk:23>
WHERE { ?s ?p ?o }
LIMIT 5;

s                           p                                           o
VARCHAR                     VARCHAR                                     VARCHAR
_____________________________________________________________________________

oai:etheses.bham.ac.uk:23   http://purl.org/dc/elements/1.1/title       A study of the role of ATM mutations in the pathogenesis of B-cell chronic lymphocytic leukaemia
oai:etheses.bham.ac.uk:23   http://purl.org/dc/elements/1.1/date        2007-07
oai:etheses.bham.ac.uk:23   http://purl.org/dc/elements/1.1/subject     RC0254 Neoplasms. Tumors. Oncology (including Cancer)
oai:etheses.bham.ac.uk:23   http://purl.org/dc/elements/1.1/identifier  Austen, Belinda (2007) A study of the role of ATM mutations in the pathogenesis of B-cell chronic lymphocytic leukaemia. Ph.D. thesis, University of Birmingham.
oai:etheses.bham.ac.uk:23   http://purl.org/dc/elements/1.1/identifier  http://etheses.bham.ac.uk/23/1/Austen07PhD.pdf

5 Rows. -- 461 msec.
```

Example of <span class="emphasis">*DOI*</span>

In order to execute correctly queries with doi resolver you need to
have:

<div class="itemizedlist">

- the handle.dll file accessible from your system. For ex. you can put
  it in the Virtuoso bin folder where the rest of the server components
  are.

- in your Virtuoso database ini file in section Plugins added the
  hslookup.dll file, which location should be in the plugins folder
  under your Virtuoso server installation. For ex:

  ``` programlisting
  [Plugins]
  LoadPath = ./plugin
  ...
  Load6    = plain,hslookup
  ```

</div>

``` programlisting
SQL>SPARQL
define get:soft "soft"
SELECT *
FROM <doi:10.1045/march99-bunker>
WHERE { ?s ?p ?o } ;

s                                                      p                                                 o
VARCHAR                                                VARCHAR                                           VARCHAR
_______________________________________________________________________________

http://www.dlib.org/dlib/march99/bunker/03bunker.html  http://www.w3.org/1999/02/22-rdf-syntax-ns#type   http://example.com/schemas/XHTML#
http://www.dlib.org/dlib/march99/bunker/03bunker.html  http://example.com/schemas/XHTML#title     Collaboration as a Key to Digital Library Development: High Performance Image Management at the University of Washington

2 Rows. -- 12388 msec.
```

Other examples

``` programlisting
SQL>SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX doap: <http://usefulinc.com/ns/doap#>
SELECT DISTINCT ?name ?mbox ?projectName
WHERE {
 <http://dig.csail.mit.edu/2005/ajar/ajaw/data#Tabulator>
doap:developer ?dev .
 ?dev foaf:name ?name .
 OPTIONAL { ?dev foaf:mbox ?mbox }
 OPTIONAL { ?dev doap:project ?proj .
            ?proj foaf:name ?projectName }
};

name                 mbox    projectName
VARCHAR              VARCHAR VARCHAR
____________________ ___________________________________________

Adam Lerer           NULL    NULL
Dan Connolly         NULL    NULL
David Li             NULL    NULL
David Sheets         NULL    NULL
James Hollenbach     NULL    NULL
Joe Presbrey         NULL    NULL
Kenny Lu             NULL    NULL
Lydia Chilton        NULL    NULL
Ruth Dhanaraj        NULL    NULL
Sonia Nijhawan       NULL    NULL
Tim Berners-Lee      NULL    NULL
Timothy Berners-Lee  NULL    NULL
Yuhsin Joyce Chen    NULL    NULL

13 Rows. -- 491 msec.
```

``` programlisting
SQL>SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
SELECT DISTINCT ?friendsname ?friendshomepage ?foafsname ?foafshomepage
WHERE
 {
  <http://example.com/dataspace/person/kidehen#this> foaf:knows ?friend .
  ?friend foaf:mbox_sha1sum ?mbox .
  ?friendsURI foaf:mbox_sha1sum ?mbox .
  ?friendsURI foaf:name ?friendsname .
  ?friendsURI foaf:homepage ?friendshomepage .
  OPTIONAL { ?friendsURI foaf:knows ?foaf .
              ?foaf foaf:name ?foafsname .
              ?foaf foaf:homepage ?foafshomepage .
           }
 }
LIMIT 10;

friendsname        friendshomepage                         foafsname        foafshomepage
ANY                ANY                                     ANY              ANY
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Dan Connolly     http://www.w3.org/People/Connolly/
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Henry J. Story   http://bblfish.net/
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Henry Story      http://bblfish.net/
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Henry J. Story   http://bblfish.net/people/henry/card
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Henry Story      http://bblfish.net/people/henry/card
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Ruth Dhanaraj    http://web.mit.edu/ruthdhan/www
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Dan Brickley     http://danbri.org/
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Dan Brickley     http://danbri.org/
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Daniel Krech     http://eikeon.com/
 Tim Berners Lee   http://www.w3.org/People/Berners-Lee/   Daniel Krech     http://eikeon.com/
```

</div>
