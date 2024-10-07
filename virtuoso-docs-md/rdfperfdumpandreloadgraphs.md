<div id="rdfperfdumpandreloadgraphs" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.9. Dump and Reload Graphs

</div>

</div>

</div>

<div id="rdfperfdumpandreloadgraphswhat" class="section">

<div class="titlepage">

<div>

<div>

#### What?

</div>

</div>

</div>

How to export RDF model data from Virtuoso's Quad Store.

</div>

<div id="rdfperfdumpandreloadgraphswhy" class="section">

<div class="titlepage">

<div>

<div>

#### Why?

</div>

</div>

</div>

Every DBMS needs to offer a mechanism for bulk export and import of
data.

Virtuoso supports dumping and reloading graph model data (e.g., RDF), as
well as relational data (e.g., SQL) (discussed elsewhere).

</div>

<div id="rdfperfdumpandreloadgraphshow" class="section">

<div class="titlepage">

<div>

<div>

#### How?

</div>

</div>

</div>

We have created stored procedures for the task. The dump procedures
leverage SPARQL to facilitate selective data dump(s) from one or more
Named Graphs, each denoted by an IRI.

<div id="rdfperfdumpandreloadgraphsproc" class="section">

<div class="titlepage">

<div>

<div>

##### Dump One Graph

</div>

</div>

</div>

The procedure dump_one_graph can be used to dump any single Named Graph.

<div id="rdfperfdumpandreloadgraphsprocparams" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

<div class="itemizedlist">

- IN

  <span class="emphasis">*srcgraph*</span>

  VARCHAR -- source graph

- IN

  <span class="emphasis">*out_file*</span>

  VARCHAR -- output file

- IN

  <span class="emphasis">*file_length_limit*</span>

  INTEGER -- maximum length of dump files

</div>

</div>

<div id="rdfperfdumpandreloadgraphsprocsrc" class="section">

<div class="titlepage">

<div>

<div>

###### Procedure source

</div>

</div>

</div>

``` programlisting
CREATE PROCEDURE dump_one_graph
  ( IN  srcgraph           VARCHAR
  , IN  out_file           VARCHAR
  , IN  file_length_limit  INTEGER  := 1000000000
  )
  {
    DECLARE  file_name     VARCHAR;
    DECLARE  env,  ses           ANY;
    DECLARE  ses_len
          ,  max_ses_len
          ,  file_len
          ,  file_idx      INTEGER;
   SET ISOLATION = 'uncommitted';
   max_ses_len  := 10000000;
   file_len     := 0;
   file_idx     := 1;
   file_name    := sprintf ('%s%06d.ttl', out_file, file_idx);
   string_to_file ( file_name || '.graph',
                     srcgraph,
                     -2
                   );
    string_to_file ( file_name,
                     sprintf ( '# Dump of graph <%s>, as of %s\n@base <> .\n',
                               srcgraph,
                               CAST (NOW() AS VARCHAR)
                             ),
                     -2
                   );
   env := vector (dict_new (16000), 0, '', '', '', 0, 0, 0, 0, 0);
   ses := string_output ();
   FOR (SELECT * FROM ( SPARQL DEFINE input:storage ""
                         SELECT ?s ?p ?o { GRAPH `iri(?:srcgraph)` { ?s ?p ?o } }
                       ) AS sub OPTION (LOOP)) DO
      {
        http_ttl_triple (env, "s", "p", "o", ses);
        ses_len := length (ses);
        IF (ses_len > max_ses_len)
          {
            file_len := file_len + ses_len;
            IF (file_len > file_length_limit)
              {
                http (' .\n', ses);
                string_to_file (file_name, ses, -1);
                gz_compress_file (file_name, file_name||'.gz');
                file_delete (file_name);
                file_len := 0;
                file_idx := file_idx + 1;
                file_name := sprintf ('%s%06d.ttl', out_file, file_idx);
                string_to_file ( file_name,
                                 sprintf ( '# Dump of graph <%s>, as of %s (part %d)\n@base <> .\n',
                                           srcgraph,
                                           CAST (NOW() AS VARCHAR),
                                           file_idx),
                                 -2
                               );
                 env := VECTOR (dict_new (16000), 0, '', '', '', 0, 0, 0, 0, 0);
              }
            ELSE
              string_to_file (file_name, ses, -1);
            ses := string_output ();
          }
      }
    IF (LENGTH (ses))
      {
        http (' .\n', ses);
        string_to_file (file_name, ses, -1);
        gz_compress_file (file_name, file_name||'.gz');
        file_delete (file_name);
      }
  }
;
          
```

To load the procedure into Virtuoso, it can simply be copied and pasted
into the Virtuoso `isql` command line tool or Interactive SQL UI of the
Conductor and executed.

</div>

<div id="rdfperfdumpandreloadgraphsprocexample" class="section">

<div class="titlepage">

<div>

<div>

###### Example

</div>

</div>

</div>

Call the `dump_one_graph` procedure with appropriate arguments:

``` programlisting
  $ pwd
  /Applications/OpenLink Virtuoso/Virtuoso 6.1/database

  $ grep DirsAllowed virtuoso.ini
  DirsAllowed              = ., ../vad,

  $ /opt/virtuoso/bin/isql 1111
  Connected to OpenLink Virtuoso
  Driver: 06.01.3127 OpenLink Virtuoso ODBC Driver
  OpenLink Interactive SQL (Virtuoso), version 0.9849b.
  Type HELP; for help and EXIT; to exit.
  SQL> dump_one_graph ('http://daas.openlinksw.com/data#', './data_', 1000000000);
  Done. -- 1438 msec.

  $
  As a result, a dump of the graph <http://daas.openlinksw.com/data#> will be found in the files data_XX (located in your Virtuoso db folder):


  $ ls
  data_000001.ttl
  data_000002.ttl
  ....
  data_000001.ttl.graph
              
```

</div>

</div>

<div id="rdfperfdumpandreloadgraphdumpmlpgraph" class="section">

<div class="titlepage">

<div>

<div>

##### Dump Multiple Graphs

</div>

</div>

</div>

The <span class="emphasis">*dump_graphs*</span> procedure can be used to
dump all the graphs in a Virtuoso server to a set of turtle (.ttl) data
files in the specified dump directory.

<div id="rdfperfdumpandreloadgraphdumpmlpgraphparams" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

The procedure dump_graphs has the following parameters:

<div class="itemizedlist">

- IN

  <span class="emphasis">*dir*</span>

  VARCHAR -- dump directory

- IN

  <span class="emphasis">*file_length_limit*</span>

  INTEGER -- maximum length of dump files

</div>

Note: The dump directory must be included in the DirsAllowed parameter
of the Virtuoso configuration file (virtuoso.ini), or the Virtuoso
server will not be able to create or access the data files.

</div>

<div id="rdfperfdumpandreloadgraphdumpmlpgraphsource" class="section">

<div class="titlepage">

<div>

<div>

###### Source

</div>

</div>

</div>

The procedure <span class="emphasis">*dump_graphs*</span> has the
following source:

``` programlisting
CREATE PROCEDURE dump_graphs
  ( IN  dir               VARCHAR  :=  'dumps'   ,
    IN  file_length_limit INTEGER  :=  1000000000
  )
  {
    DECLARE inx INT;
    inx := 1;
    SET ISOLATION = 'uncommitted';
    FOR ( SELECT *
            FROM ( SPARQL DEFINE input:storage ""
                   SELECT DISTINCT ?g { GRAPH ?g { ?s ?p ?o } .
                                        FILTER ( ?g != virtrdf: )
                                      }
                 ) AS sub OPTION ( LOOP )) DO
      {
        dump_one_graph ( "g",
                         sprintf ('%s/graph%06d_', dir, inx),
                         file_length_limit
                       );
        inx := inx + 1;
      }
  }
;
```

</div>

<div id="rdfperfdumpandreloadgraphdumpmlpgraphex" class="section">

<div class="titlepage">

<div>

<div>

###### Example

</div>

</div>

</div>

<div class="orderedlist">

1.  Call the

    <span class="emphasis">*dump_graphs* </span>

    procedure:

    ``` programlisting
    $ pwd
    /Applications/OpenLink Virtuoso/Virtuoso 6.1/database

    $ grep DirsAllowed virtuoso.ini
    DirsAllowed              = ., ../vad, ./dumps

    $ /opt/virtuoso/bin/isql 1111
    Connected to OpenLink Virtuoso
    Driver: 06.01.3127 OpenLink Virtuoso ODBC Driver
    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL> dump_graphs();

    Done. -- 998 msec.
    SQL> quit;
    ```

2.  As a result, a dump of the graph will be found in the files
    dumps/data_XX (located in your Virtuoso db folder):

    ``` programlisting
    <verbatim>
    $ ls dumps
    graph000001_000001.ttl      graph000005_000001.ttl
    graph000001_000001.ttl.graph    graph000005_000001.ttl.graph
    graph000002_000001.ttl      graph000006_000001.ttl
    graph000002_000001.ttl.graph    graph000006_000001.ttl.graph
    graph000003_000001.ttl      graph000007_000001.ttl
    graph000003_000001.ttl.graph    graph000007_000001.ttl.graph
    graph000004_000001.ttl      graph000008_000001.ttl
    graph000004_000001.ttl.graph    graph000008_000001.ttl.graph
    ```

</div>

</div>

</div>

<div id="rdfperfdumpandreloadgraphloadgraph" class="section">

<div class="titlepage">

<div>

<div>

##### Load Graphs

</div>

</div>

</div>

The stored procedure <span class="emphasis">*load_graphs*</span>
procedure performs a bulk load from a file.

<div id="rdfperfdumpandreloadgraphloadgraphparams" class="section">

<div class="titlepage">

<div>

<div>

###### Parameters

</div>

</div>

</div>

The procedure load_graphs has the following parameters:

<div class="itemizedlist">

- IN

  <span class="emphasis">*dir*</span>

  VARCHAR -- dump directory

</div>

Note: The dump directory must be included in the DirsAllowed parameter
of the Virtuoso configuration file (virtuoso.ini), or the Virtuoso
server will not be able to create or access the data files.

</div>

<div id="rdfperfdumpandreloadgraphloadgraphsource" class="section">

<div class="titlepage">

<div>

<div>

###### Source

</div>

</div>

</div>

The procedure <span class="emphasis">*load_graphs*</span> has the
following source:

``` programlisting
CREATE PROCEDURE load_graphs
  ( IN  dir  VARCHAR := 'dumps/' )
{
  DECLARE arr ANY;
  DECLARE g VARCHAR;

  arr := sys_dirlist (dir, 1);
  log_enable (2, 1);
  FOREACH (VARCHAR f IN arr) DO
    {
      IF (f LIKE '*.ttl')
    {
      DECLARE CONTINUE HANDLER FOR SQLSTATE '*'
        {
          log_message (sprintf ('Error in %s', f));
        };
      g := file_to_string (dir || '/' || f || '.graph');
      DB.DBA.TTLP_MT (file_open (dir || '/' || f), g, g, 255);
    }
    }
  EXEC ('CHECKPOINT');
}
;
```

</div>

<div id="rdfperfdumpandreloadgraphloadgraphex" class="section">

<div class="titlepage">

<div>

<div>

###### Example

</div>

</div>

</div>

``` programlisting
$ /opt/virtuoso/bin/isql 1112
Connected to OpenLink Virtuoso
Driver: 06.01.3127 OpenLink Virtuoso ODBC Driver
OpenLink Interactive SQL (Virtuoso), version 0.9849b.
Type HELP; for help and EXIT; to exit.
SQL> load_graphs();

Done. -- 2392 msec.
SQL>
```

</div>

</div>

</div>

</div>
