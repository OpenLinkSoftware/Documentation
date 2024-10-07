<div id="rdfnativestorageproviderredland" class="section">

<div class="titlepage">

<div>

<div>

### 16.18.3. Virtuoso Redland Provider

</div>

</div>

</div>

<div id="rdfnativestorageproviderredlandwhatis" class="section">

<div class="titlepage">

<div>

<div>

#### What is Redland

</div>

</div>

</div>

<a href="http://librdf.org/" class="ulink" target="_top">Redland</a> is
a set of free software 'C' libraries that provide support for the
Resource Description Framework (RDF), providing modular, object based
libraries and APIs for manipulating the RDF graph, triples, URIs and
Literals. Redland includes several high-level language APIs providing
RDF manipulation and storage and requires the
<a href="http://librdf.org/raptor/" class="ulink"
target="_top">Raptor</a> RDF parser and
<a href="http://librdf.org/rasqal/" class="ulink"
target="_top">Rasqal</a> RDF syntax and query library for its use.

</div>

<div id="rdfnativestorageproviderredlandwhatisv" class="section">

<div class="titlepage">

<div>

<div>

#### What is the Virtuoso Redland Provider

</div>

</div>

</div>

The Virtuoso Redland RDF Provider is an implementation of the Storage
API, Model and Query interfaces of the Redland framework for RDF. This
provider enables the execution of queries via the Redland Rasqal query
engine or via Virtuoso query engine directly against the Virtuoso Quad
store. The Virtuoso Redland Provider uses ODBC as the data access
mechanism for communicating the Virtuoso Quad Store and requires the
Virtuoso ODBC Driver be installed on the Redland client and a suitable
ODBC DSN be configured for connecting to the target Virtuoso Quad Store
instance. The provider has been tested against the
<a href="http://download.librdf.org/source/" class="ulink"
target="_top">Redland 1.0.8</a> version currently available for
download.

<div class="figure-float">

<div id="rdfnativestorageproviderredland1" class="figure">

**Figure 16.200. Redland Component Stack**

<div class="figure-contents">

<div class="mediaobject">

![Redland Component Stack](images/ui/VirtRedLand.png)

</div>

</div>

</div>

  

</div>

As indicated in the above diagram the Virtuoso Provider can be used to
execute RDF queries either directly against the Virtuoso graph storage
module supporting the
<a href="http://dbpedia.org/resource/SPARQL" class="ulink"
target="_top">SPARQL</a> ,
<a href="http://dbpedia.org/resource/SPARUL" class="ulink"
target="_top">SPARQL</a> SPARUL, <a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSArticleBISPARQL2"
class="ulink" target="_top">SPARQL-BI</a> query languages or via the
Rasqal query engine built into Redland which supports the SPARQL query
language. This is done by simply changing the syntax of the query using
the "vsparql" rather then default "sparql" construct when executing a
query as indicated in the sample queries below:

``` programlisting
rdfproc -r xml -t "user='dba',password='dba',dsn='Demo'" gr query sparql - "SELECT * WHERE { ?s ?p ?o }"   ;; via Redland Rasqal engine

rdfproc -r xml -t "user='dba',password='dba',dsn='Demo'" gr query vsparql - "SELECT * WHERE { ?s ?p ?o }"  ;; direct to Virtuoso storage module
```

The Virtuoso Provider uses the <a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VOSSQL2RDF"
class="ulink" target="_top">SPASQL</a> query language for querying the
remote Virtuoso QUAD store.

</div>

<div id="rdfnativestorageproviderredlandsetup" class="section">

<div class="titlepage">

<div>

<div>

#### Setup

</div>

</div>

</div>

<div id="rdfnativestorageproviderredlandreqfiles" class="section">

<div class="titlepage">

<div>

<div>

##### Required Files

</div>

</div>

</div>

The Virtuoso Redland Provider has been integrated into the Redland RDF
Framework and submitted to the open source project to become part of the
standard distribution available for
<a href="http://librdf.org/INSTALL.html" class="ulink"
target="_top">download</a> . Until this submission has been accepted and
committed into the available Redland release a tar ball created by
OpenLink Software and a diff for application to a Redland 1.0.8 tree can
be obtained from:

<div class="itemizedlist">

- <a
  href="ftp://download.openlinksw.com/support/vos/redland-vos-1.0.8.tar.gz"
  class="ulink"
  target="_top">ftp://download.openlinksw.com/support/vos/redland-vos-1.0.8.tar.gz</a>
  Redland 1.0.8 tar ball with Virtuoso storage support

- <a href="ftp://download.openlinksw.com/support/vos/redland-vos.diff"
  class="ulink" target="_top">Redland 1.0.8 Diff file of changes made for
  Virtuoso storage support</a>

</div>

</div>

<div id="rdfnativestorageprovidersredlandcmsmpr" class="section">

<div class="titlepage">

<div>

<div>

##### Compiling Redland with Virtuoso storage support

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="http://svn.librdf.org/" class="ulink" target="_top">Download
  Redland</a> , extract and apply diff above or download the tar ball
  above with diff already applied and extract to a location of choice.

- The following additional configure options are available for enabling
  the Virtuoso storage support:

  ``` programlisting
    --with-virtuoso(=yes|no) Enable Virtuoso RDF store (default=auto)
    --with-iodbc(=DIR)        Select iODBC support
                              DIR is the iODBC base install directory
                              (default=/usr/local)
    --with-unixodbc(=DIR)   Select UnixODBC support
                              DIR is the UnixODBC base install directory
                              (default=/usr/local)
    --with-datadirect(=DIR) Select DataDirect support
                              DIR is the DataDirect base install directory
                              (default=/usr/local)
    --with-odbc-inc=DIR     Specify custom ODBC include directory
                              (default=/usr/local/include)
    --with-odbc-lib=DIR     Specify custom ODBC lib directory
                              (default=/usr/local/lib)
  ```

- The "--with-virtuoso" option default to being auto enable if a valid
  ODBC Driver Manager (iODBC, UnixODBC? or DataDirect?) or include and
  lib directories for required ODBC header files and libraries are
  located with the suitable setting for one or more of the other ODBC
  related options above. Assuming iODBC is installed the following
  option can be used to enable Virtuoso storage support to be configured
  for compilation into your Redland build:

  ``` programlisting
  ./configure --with-iodbc=/usr/local/iODBC
  ```

- Run "make" to compile the Redland libraries and "sudo make install" to
  install in the default "/usr/local" location

- Test compilation with test utility utils/rdfproc:

  ``` programlisting

  rdfproc test parse http://planetrdf.com/guide/rss.rdf
  rdfproc test print
  rdfproc test serialize ntriples
  ```

  This test will use the default 'hashes' storage.

- Ensure you have the Virtuoso ODBC Driver installed and a valid ODBC
  DSN called "Local Virtuoso" configured for your target Virtuoso Server

- Set the following environment variable:

  ``` programlisting
  export RDFPROC_STORAGE_TYPE=virtuoso                                   ;; Enable Virtuoso Storage
  export ODBCINI=<path_to_odbcini_directory>/odbc.ini                      ;; Enable ODBC DSN to be located
  export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH                     ;; May be required to enable Redland libraries to be located
  ```

- Test Virtuoso storage with the provided test program utils/vtest:

  ``` programlisting
  $ utils/vtest
    1: Remove all triples in <http://red> context
  **PASSED**: removed context triples from the graph
    2: Add triples to <http://red> context
  **PASSED**: add triple to context
    3: Print all triples in <http://red> context
  [[
    {[aa], [bb], [cc]} with context [http://red]
    {[aa], [bb1], [cc]} with context [http://red]
    {[aa], [a2], "cc"} with context [http://red]
    {[aa], [a2], (cc)} with context [http://red]
    {[mm], [nn], "Some long literal with language@en"} with context [http://red]
    {[oo], [pp], "12345^^<http://www.w3.org/2001/XMLSchema#int>"} with context [http://red]
  ]]
  **PASSED**:
    4: Count of triples in <http://red> context
  **PASSED**: graph has 6 triples
    5: Exec:  ARC  aa bb
  Matched node: [cc]
  **PASSED**:
    6: Exec:  ARCS  aa cc
  Matched node: [bb] with context [http://red]
  Matched node: [bb1] with context [http://red]
  : matching nodes: 2
  **PASSED**:
    7: Exec:  ARCS-IN  cc
  Matched arc: [bb] with context [http://red]
  Matched arc: [bb1] with context [http://red]
  **PASSED**: matching arcs: 2
    8: Exec:  ARCS-OUT  aa
  Matched arc: [bb] with context [http://red]
  Matched arc: [bb1] with context [http://red]
  Matched arc: [a2] with context [http://red]
  Matched arc: [a2] with context [http://red]
  **PASSED**: matching arcs: 4
    9: Exec:  CONTAINS aa bb1 cc
  **PASSED**: the graph contains the triple
   10: Exec:  FIND aa - -
  Matched triple: {[aa], [bb], [cc]} with context [http://red]
  Matched triple: {[aa], [bb1], [cc]} with context [http://red]
  Matched triple: {[aa], [a2], "cc"} with context [http://red]
  Matched triple: {[aa], [a2], (cc)} with context [http://red]
  **PASSED**: matching triples: 4
   11: Exec:  HAS-ARC-IN cc bb
  **PASSED**: the graph contains the arc
   12: Exec:  HAS-ARC-OUT aa bb
  **PASSED**: the graph contains the arc
   13: Exec:  SOURCE  aa cc
  Matched node: [aa]
  **PASSED**:
   14: Exec:  SOURCES  bb cc
  Matched node: [aa] with context [http://red]
  : matching nodes: 1
  **PASSED**:
   15: Exec:  TARGET  aa bb
  Matched node: [cc]
  **PASSED**:
   16: Exec:  TARGETS  aa bb
  Matched node: [cc] with context [http://red]
  : matching nodes: 1
  **PASSED**:
   17: Exec:  REMOVE aa bb1 cc
  **PASSED**: removed triple from the graph
   18: Exec:  QUERY "CONSTRUCT {?s ?p ?o} FROM <http://red> WHERE {?s ?p ?o}"
  Matched triple: {[aa], [a2], "cc"}
  Matched triple: {[oo], [pp], "12345^^<http://www.w3.org/2001/XMLSchema#int>"}
  Matched triple: {[aa], [a2], (cc)}
  Matched triple: {[aa], [bb], [cc]}
  Matched triple: {[mm], [nn], "Some long literal with language@en"}
  **PASSED**: matching triples: 5
   19: Exec1:  QUERY_AS_BINDINGS "SELECT * WHERE {graph <http://red> { ?s ?p ?o }}"
  **: Formatting query result as 'xml':
  <?xml version="1.0" encoding="utf-8"?>
  <sparql xmlns="http://www.w3.org/2005/sparql-results#">
    <head>
      <variable name="s"/>
      <variable name="p"/>
      <variable name="o"/>
    </head>
    <results>
      <result>
        <binding name="s"><uri>aa</uri></binding>
        <binding name="p"><uri>bb</uri></binding>
        <binding name="o"><uri>cc</uri></binding>
      </result>
      <result>
        <binding name="s"><uri>aa</uri></binding>
        <binding name="p"><uri>a2</uri></binding>
        <binding name="o"><literal>cc</literal></binding>
      </result>
      <result>
        <binding name="s"><uri>aa</uri></binding>
        <binding name="p"><uri>a2</uri></binding>
        <binding name="o"><bnode>cc</bnode></binding>
      </result>
      <result>
        <binding name="s"><uri>mm</uri></binding>
        <binding name="p"><uri>nn</uri></binding>
        <binding name="o"><literal>Some long literal with language@en</literal></binding>
      </result>
      <result>
        <binding name="s"><uri>oo</uri></binding>
        <binding name="p"><uri>pp</uri></binding>
        <binding name="o"><literal>12345^^<http://www.w3.org/2001/XMLSchema#int></literal></binding>
      </result>
    </results>
  </sparql>
  **PASSED**:
   20: Exec2:  QUERY_AS_BINDINGS "SELECT * WHERE {graph <http://red> { ?s ?p ?o }}"
  : Query returned bindings results:
  result: [s=[aa], p=[bb], o=[cc]]
  result: [s=[aa], p=[a2], o=cc]
  result: [s=[aa], p=[a2], o=(cc)]
  result: [s=[mm], p=[nn], o=Some long literal with language@en]
  result: [s=[oo], p=[pp], o=12345^^<http://www.w3.org/2001/XMLSchema#int>]
  : Query returned 5 results
  **PASSED**:
  =============================================
  PASSED: 20  FAILED:  0
  ```

</div>

</div>

<div id="rdfnativestorageprovidersredlandcp" class="section">

<div class="titlepage">

<div>

<div>

##### Connection Parameters

</div>

</div>

</div>

The Virtuoso provider has the following connection parameters available
fro use:

<div class="itemizedlist">

- <span class="emphasis">*dsn*</span>

  \- ODBC datasource name

- <span class="emphasis">*user*</span>

  \- user name of database server

- <span class="emphasis">*password*</span>

  \- password of database server

- <span class="emphasis">*host*</span>

  \- hostname:portno of the database server

- <span class="emphasis">*charset*</span>

  \- database charset to use

</div>

NOTE: Take care exposing the password as for example, program arguments
or environment variables. The rdfproc utility can help this by reading
the password from standard input. Inside programs, one way to prevent
storing the password in a string is to construct a Redland hash of the
storage options such as via librdf hash_from_string and use
librdf_new_storage_with_options to create a storage. The rdfproc utility
source code demonstrates this.

The storage name parameter given to the storage constructor librdf
new_storage is used inside the virtuoso store to allow multiple stores
inside one Virtuoso database instance as parameterized with the above
options.

This store always provides contexts; the boolean storage option contexts
is not checked.

Examples:

``` programlisting
  /* A new Virtuoso store */
  storage=librdf_new_storage(world, "virtuoso", "db1",
      "dsn='Local Virtuoso',user='demo',password='demo'");

  /* A different, existing Virtuoso store in the same database as above */
  storage=librdf_new_storage(world, "virtuoso", "db2",
      "dsn='Local Virtuoso',user='demo',password='demo'");

  /* An existing Virtuoso store on a different database server */
  storage=librdf_new_storage(world, "virtuoso", "http://red3",
      "dsn='Remote Virtuoso',user='demo',password='demo'");

  /* Opening with an options hash */
  options=librdf_new_hash(world, NULL);
  librdf_hash_from_string(options,
      "dsn='Local Virtuoso',user='demo'");
  librdf_hash_put_strings(options, "password", user_password);
  storage=librdf_new_storage_with_options(world, "virtuoso", "http://red3", options);
```

</div>

</div>

<div id="rdfnativestorageprovidersredlandref" class="section">

<div class="titlepage">

<div>

<div>

#### References

</div>

</div>

</div>

<div class="itemizedlist">

- <a href="http://librdf.org/docs/api/redland-storage.html" class="ulink"
  target="_top">RedLand Triple Store</a>

- <a href="http://librdf.org/docs/api/redland-storage-modules.html"
  class="ulink" target="_top">RedLand Storage Modules</a>

</div>

</div>

</div>
