<div>

<div>

<div>

<div>

### 1.5.44. How can I perform search for predicate values?

</div>

</div>

</div>

<span class="emphasis">*What?*</span>

Creation of a stored procedure that enables users to find properties
based on their string based token patterns.

<span class="emphasis">*Why?*</span>

When working with datasets from disparate datasources in a common named
graph, there are times when you seek to scope sparql or spasql queries
to specific property IRI/URI patterns without embarking upon inefficient
regex heuristics.

<span class="emphasis">*What?*</span>

Make a stored procedure for querying against the main quad store table
(rdf_quad). Surface the procedure as a magic predicate using "bif:"
prefix. To find all the properties whose predicates start with
"http://www.openlinksw.com/", a Virtuoso/PL procedure can be used as
listed below:

``` programlisting
SQL> create procedure PREDICATES_OF_IRI_PATH (
  in path varchar,
  in dump_iri_ids integer := 0)
{
  declare PRED_IRI varchar;
  declare PRED_IRI_ID IRI_ID;
  declare path_head_len integer;

  if (dump_iri_ids)
    result_names (PRED_IRI_ID);
  else
    result_names (PRED_IRI);

  for ( SELECT RP_NAME, RP_ID
        FROM RDF_PREFIX
        WHERE (RP_NAME >= path) AND (RP_NAME < path || chr(255)) ) do
    {
      declare fourbytes varchar;
      fourbytes := '----';
      fourbytes[0] := bit_shift (RP_ID, -24);
      fourbytes[1] := bit_and (bit_shift (RP_ID, -16), 255);
      fourbytes[2] := bit_and (bit_shift (RP_ID, -8), 255);
      fourbytes[3] := bit_and (RP_ID, 255);

      for ( SELECT RI_NAME, RI_ID from RDF_IRI
            WHERE (RI_NAME >= fourbytes) AND (RI_NAME < fourbytes || chr(255)) ) do
        {
          if (exists (SELECT TOP 1 1 FROM RDF_QUAD WHERE P=RI_ID))
            result (case when (dump_iri_ids) then RI_ID else RP_NAME || subseq (RI_NAME, 4) end);
        }
    }

  for ( path_head_len := length (path)-1; path_head_len >= 0; path_head_len := path_head_len - 1)
    {
      for ( SELECT RP_NAME, RP_ID from RDF_PREFIX
            WHERE RP_NAME = subseq (path, 0, path_head_len) ) do
        {
          declare fourbytes varchar;
          fourbytes := '----';
          fourbytes[0] := bit_shift (RP_ID, -24);
          fourbytes[1] := bit_and (bit_shift (RP_ID, -16), 255);
          fourbytes[2] := bit_and (bit_shift (RP_ID, -8), 255);
          fourbytes[3] := bit_and (RP_ID, 255);

          for ( SELECT RI_NAME, RI_ID from RDF_IRI
                WHERE (RI_NAME >= fourbytes || subseq (path, path_head_len))
                AND (RI_NAME < fourbytes || subseq (path, path_head_len) || chr(255)) ) do
            {
              if (exists (SELECT TOP 1 1 FROM RDF_QUAD WHERE P=RI_ID))
                result (case when (dump_iri_ids) then RI_ID else RP_NAME || subseq (RI_NAME, 4) end);
            }
        }
    }
}
;

Done. -- 16 msec.
```

<span class="emphasis">*Example Usage*</span>

<div>

1.  Execute:

    ``` programlisting
    set echo on;
    ```

2.  Collect all predicates that start with:

    ``` programlisting
    -- http://www.openlinksw.com/
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/', 1);
    VARCHAR
    _______________________________________________________________________________

    #i351
    #i159
    #i10
    #i8
    ...

    -- http://www.openlinksw.com/schemas/virtrdf
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/schemas/virtrdf', 1);
    PRED_IRI_ID
    VARCHAR
    _______________________________________________________________________________

    #i159
    #i10
    #i8
    #i6
    #i160
    #i269
    #i278
    #i275

    -- http://www.openlinksw.com/schemas/virtrdf#
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/schemas/virtrdf#',1);
    PRED_IRI_ID
    VARCHAR
    _______________________________________________________________________________

    #i159
    #i10
    #i8
    #i6
    #i160
    #i269
    #i278
    ...

    -- http://www.openlinksw.com/schemas/virtrdf#i
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/schemas/virtrdf#i',1);
    PRED_IRI_ID
    VARCHAR
    _______________________________________________________________________________

    #i159
    #i10
    #i8

    -- other
    SQL>PREDICATES_OF_IRI_PATH ('no://such :)', 1);
    0 Rows. -- 0 msec.
    ```

3.  Show all predicates that start with:

    ``` programlisting
    -- http://www.openlinksw.com/
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/');
    PRED_IRI
    VARCHAR
    _______________________________________________________________________________

    http://www.openlinksw.com/schemas/DAV#ownerUser
    http://www.openlinksw.com/schemas/virtrdf#inheritFrom
    http://www.openlinksw.com/schemas/virtrdf#isSpecialPredicate
    http://www.openlinksw.com/schemas/virtrdf#item
    http://www.openlinksw.com/schemas/virtrdf#loadAs
    http://www.openlinksw.com/schemas/virtrdf#noInherit
    http://www.openlinksw.com/schemas/virtrdf#qmGraphMap
    http://www.openlinksw.com/schemas/virtrdf#qmMatchingFlags
    http://www.openlinksw.com/schemas/virtrdf#qmObjectMap
    http://www.openlinksw.com/schemas/virtrdf#qmPredicateMap
    http://www.openlinksw.com/schemas/virtrdf#qmSubjectMap
    ...

    -- http://www.openlinksw.com/schemas/virtrdf
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/schemas/virtrdf');
    PRED_IRI
    VARCHAR
    _______________________________________________________________________________

    http://www.openlinksw.com/schemas/virtrdf#inheritFrom
    http://www.openlinksw.com/schemas/virtrdf#isSpecialPredicate
    http://www.openlinksw.com/schemas/virtrdf#item
    http://www.openlinksw.com/schemas/virtrdf#loadAs
    http://www.openlinksw.com/schemas/virtrdf#noInherit
    http://www.openlinksw.com/schemas/virtrdf#qmGraphMap
    http://www.openlinksw.com/schemas/virtrdf#qmMatchingFlags
    http://www.openlinksw.com/schemas/virtrdf#qmObjectMap
    http://www.openlinksw.com/schemas/virtrdf#qmPredicateMap
    http://www.openlinksw.com/schemas/virtrdf#qmSubjectMap
    http://www.openlinksw.com/schemas/virtrdf#qmTableName
    ...

    -- http://www.openlinksw.com/schemas/virtrdf#
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/schemas/virtrdf#');
    PRED_IRI
    VARCHAR
    _______________________________________________________________________________

    http://www.openlinksw.com/schemas/virtrdf#inheritFrom
    http://www.openlinksw.com/schemas/virtrdf#isSpecialPredicate
    http://www.openlinksw.com/schemas/virtrdf#item
    http://www.openlinksw.com/schemas/virtrdf#loadAs
    http://www.openlinksw.com/schemas/virtrdf#noInherit
    http://www.openlinksw.com/schemas/virtrdf#qmGraphMap
    http://www.openlinksw.com/schemas/virtrdf#qmMatchingFlags
    http://www.openlinksw.com/schemas/virtrdf#qmObjectMap
    http://www.openlinksw.com/schemas/virtrdf#qmPredicateMap
    http://www.openlinksw.com/schemas/virtrdf#qmSubjectMap
    http://www.openlinksw.com/schemas/virtrdf#qmTableName
    http://www.openlinksw.com/schemas/virtrdf#qmf01blankOfShortTmpl
    http://www.openlinksw.com/schemas/virtrdf#qmf01uriOfShortTmpl
    http://www.openlinksw.com/schemas/virtrdf#qmfBoolOfShortTmpl
    http://www.openlinksw.com/schemas/virtrdf#qmfBoolTmpl
    ...

    -- http://www.openlinksw.com/schemas/virtrdf#i
    SQL>PREDICATES_OF_IRI_PATH ('http://www.openlinksw.com/schemas/virtrdf#i');
    PRED_IRI
    VARCHAR
    _______________________________________________________________________________

    http://www.openlinksw.com/schemas/virtrdf#inheritFrom
    http://www.openlinksw.com/schemas/virtrdf#isSpecialPredicate
    http://www.openlinksw.com/schemas/virtrdf#item

    3 Rows. -- 15 msec.

    -- other
    SQL>PREDICATES_OF_IRI_PATH ('no://such :)');
    PRED_IRI
    VARCHAR
    _______________________________________________________________________________

    0 Rows. -- 15 msec.
    ```

</div>

If you want to use the procedure's output inside SPARQL queries, it can
be wrapped by a procedure view and it in turn can be used in an Linked
Data View but it is redundant for most applications.

For typical "almost static" data, it is more practical to write a
procedure that will store all found predicates in some dedicated
"dictionary" graph and then use the graph as usual.

</div>
