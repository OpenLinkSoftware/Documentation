<div id="fn_explain" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

explain — describe SQL statement compilation

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_explain" class="funcsynopsis">

|                      |                                |
|----------------------|--------------------------------|
| ` `**`explain`**` (` | in `text ` varchar ,           |
|                      | in `cursor_type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_explain" class="refsect1">

## Description

The explain function compiles a SQL statement and returns a description
of that compilation as a result set, return value or parse tree. The
result set consists of one VARCHAR column with one line of the
description in each row. Any given line may be quite long, even several
hundred characters.

The output is not a complete disassembly of the query graph, but it is
detailed enough to show the join order, the sub-query structure, and the
order of evaluation of query predicates, as well as the splitting of a
distributed VDB query over different data sources.

The optional cursor type can be one of the SQL_CURSOR\_\<xx\> constants,
or one of the special values listed below. The default is 0, for FORWARD
ONLY. The special values each have special effect, as listed. If the
statement is a SELECT and the cursor type is not FORWARD ONLY, the
auxiliary SQL statements used by the cursor implementation are shown.

<div id="id88334" class="table">

**Table 24.31. Cursor Type**

<div class="table-contents">

| Cursor Type | Effect                                                                                                                                                             |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 3           | SQL_CURSOR_STATIC                                                                                                                                                  |
| 2           | SQL_CURSOR_DYNAMIC                                                                                                                                                 |
| 1           | SQL_CURSOR_KEYSET_DRIVEN                                                                                                                                           |
| 0           | SQL_CURSOR_FORWARD_ONLY                                                                                                                                            |
| -1          | A result set is printed. Same effect as 0.                                                                                                                         |
| -2          | A parse tree is returned.                                                                                                                                          |
| -5          | A result set is printed, and a diagnostic dump is delivered to the server's standard output. This can be viewed if the server was started with +foreground option. |
| -7          | Cost estimates are returned, associated with any different join orders tried during the compilation.                                                               |

</div>

</div>

  

</div>

<div id="params_explain" class="refsect1">

## Parameters

<div id="id88368" class="refsect2">

### text

<span class="type">varchar </span> SQL statement

</div>

<div id="id88372" class="refsect2">

### cursor_type

<span class="type">integer </span> cursor type

</div>

</div>

<div id="ret_explain" class="refsect1">

## Return Types

Returns types vary with the specified cursor type.

<div id="id88379" class="table">

**Table 24.32. Return Types**

<div class="table-contents">

| Cursor Type        | Return Type   |
|--------------------|---------------|
| 0, 1, 2, 3, -5, -1 | Result set.   |
| -7                 | Return value. |
| -2                 | Parse tree.   |

</div>

</div>

  

</div>

<div id="examples_explain" class="refsect1">

## Examples

<div id="ex_explainsmp" class="example">

**Example 24.108. Simple Example Usage**

<div class="example-contents">

Execute from ISQL:

``` programlisting
SQL> explain('select * from sys_users');
REPORT
VARCHAR
_______________________________________________________________________________

{
from DB.DBA.SYS_USERS by SYS_USERS         17 rows
Key SYS_USERS  ASC ($47 ".U_ID", $46 ".U_NAME", $45 ".U_IS_ROLE", $44 ".U_FULL_NAME", $43 ".U_E_MAIL", $42 ".U_PASSWORD", $41 ".U_GROUP", $40 ".U_LOGI
N_TIME", $39 ".U_ACCOUNT_DISABLED", $38 ".U_DAV_ENABLE", $37 ".U_SQL_ENABLE", $36 ".U_DATA", $35 ".U_METHODS", $34 ".U_DEF_PERMS", $33 ".U_HOME", $32
".U_PASSWORD_HOOK", $31 ".U_PASSWORD_HOOK_DATA", $30 ".U_GET_PASSWORD", $29 ".U_DEF_QUAL", $28 ".U_OPTS")

Current of: <$49 "<DB.DBA.SYS_USERS >" spec 5>
Select ($47 ".U_ID", $46 ".U_NAME", $45 ".U_IS_ROLE", $44 ".U_FULL_NAME", $43 ".U_E_MAIL", $42 ".U_PASSWORD", $41 ".U_GROUP", $40 ".U_LOGIN_TIME", $39
 ".U_ACCOUNT_DISABLED", $38 ".U_DAV_ENABLE", $37 ".U_SQL_ENABLE", $36 ".U_DATA", $35 ".U_METHODS", $34 ".U_DEF_PERMS", $33 ".U_HOME", $32 ".U_PASSWORD
_HOOK", $31 ".U_PASSWORD_HOOK_DATA", $30 ".U_GET_PASSWORD", $29 ".U_DEF_QUAL", $28 ".U_OPTS", <$49 "<DB.DBA.SYS_USERS >" spec 5>)
}

8 Rows. -- 10 msec.
```

</div>

</div>

  

<div id="ex_explain1" class="example">

**Example 24.109. Example with type -1**

<div class="example-contents">

Execute from ISQL:

``` programlisting
SQL> explain('sparql
select *
from <http://myopenlink.net/dataspace/person/kidehen#this>
where {?s ?p ?o} limit 10',-1);
REPORT
VARCHAR
_______________________________________________________________________________

{

Precode:
      0: $27 "hen#this" := Call iri_to_id_nosignal (<constant (http://myopenlink.net/dataspace/person/kidehen#this)>)
      5: BReturn 0
from DB.DBA.RDF_QUAD by RDF_QUAD        0.4 rows
Key RDF_QUAD  ASC ($31 "s-1-1-t0.S", $30 "s-1-1-t0.P", $29 "s-1-1-t0.O")
 inlined <col=412 G = $27 "hen#this">

Current of: <$33 "<DB.DBA.RDF_QUAD s-1-1-t0>" spec 5>

After code:
      0: $34 "s" := Call id_to_iri ($31 "s-1-1-t0.S")
      5: $35 "p" := Call id_to_iri ($30 "s-1-1-t0.P")
      10: $36 "o" := Call __rdf_sqlval_of_obj ($29 "s-1-1-t0.O")
      15: BReturn 0
Select (TOP <constant (10)>) ($34 "s", $35 "p", $36 "o", <$33 "<DB.DBA.RDF_QUAD s-1-1-t0>" spec 5>)
}

18 Rows. -- 10 msec.
```

</div>

</div>

  

<div id="ex_explain2" class="example">

**Example 24.110. Example with type -2**

<div class="example-contents">

Execute from ISQL:

``` programlisting
SQL> select dbg_obj_print(explain('sparql
select *
from <http://myopenlink.net/dataspace/person/kidehen#this>
where {?s ?p ?o} limit 10',-2));
callret
VARCHAR
_______________________________________________________________________________

0

1 Rows. -- 20 msec.
```

As result on the Server console will be shown this output:

``` programlisting
(100 (122 0 10 0 0 0 ) ((21 (609 'id_to_iri' ((201 's-1-1-t0' 'S' ) ) ) 0 's' 0 ) (21 (609 'id_to_iri' ((201 's-1-1-t0' 'P' ) ) ) 0 'p' 0 ) (21 (609 '
__rdf_sqlval_of_obj' ((201 's-1-1-t0' 'O' ) ) ) 0 'o' 0 ) ) 0 (106 ((107 (200 'DB.DBA.RDF_QUAD' 's-1-1-t0' 0 0 0 ) 0 ) ) (9 (201 's-1-1-t0' 'G' ) (609
 'iri_to_id_nosignal' ('http://myopenlink.net/dataspace/person/kidehen#this' ) ) 0 0 0 0 0 0 ) 0 0 0 0 (907 1 ) 0 ) )
```

</div>

</div>

  

<div id="ex_explain5" class="example">

**Example 24.111. Example with type -5**

<div class="example-contents">

Execute from ISQL:

``` programlisting
SQL> explain('sparql select * from <http://myopenlink.net/dataspace/person/kidehen#this> where {?s ?p ?o} limit 10',-5);
REPORT
VARCHAR
_______________________________________________________________________________

{

Precode:
      0: $27 "hen#this" := Call iri_to_id_nosignal (<constant (http://myopenlink.net/dataspace/person/kidehen#this)>)
      5: BReturn 0
from DB.DBA.RDF_QUAD by RDF_QUAD        0.4 rows
Key RDF_QUAD  ASC ($31 "s-1-1-t0.S", $30 "s-1-1-t0.P", $29 "s-1-1-t0.O")
 inlined <col=412 G = $27 "hen#this">

Current of: <$33 "<DB.DBA.RDF_QUAD s-1-1-t0>" spec 5>

After code:
      0: $34 "s" := Call id_to_iri ($31 "s-1-1-t0.S")
      5: $35 "p" := Call id_to_iri ($30 "s-1-1-t0.P")
      10: $36 "o" := Call __rdf_sqlval_of_obj ($29 "s-1-1-t0.O")
      15: BReturn 0
Select (TOP <constant (10)>) ($34 "s", $35 "p", $36 "o", <$33 "<DB.DBA.RDF_QUAD s-1-1-t0>" spec 5>)
}

18 Rows. -- 40 msec.
```

As result on the Server console will be printed this output:

``` programlisting
New best dt0 is:
sequence for dt0 cost       6.9 (0.0135757 msec):RDF_QUAD as t1  on RDF_QUAD ,
{
   dt dt0
  unit       6.9 (0.0135757 msecs) arity       0.4 reached       1
Out cols :
    call id_to_iri: (609 'id_to_iri' ((201 't1' 'S' ) ) )

    call id_to_iri: (609 'id_to_iri' ((201 't1' 'P' ) ) )

    call __rdf_sqlval_of_obj: (609 '__rdf_sqlval_of_obj' ((201 't1' 'O' ) ) )

    call iri_to_id_nosignal: (609 'iri_to_id_nosignal' ('http://myopenlink.net/dataspace/person/kidehen#this' ) )

    Table DB.DBA.RDF_QUAD(s-1-1-t0 t1) by RDF_QUAD   Reached         1 unit       4.6 (0.00907572 msecs) arity       0.4
  col preds:
        pred artm (201 't1' 'G' ) = (609 'iri_to_id_nosignal' ('http://myopenlink.net/dataspace/person/kidehen#this' ) )
      out cols:  O  P  S

    call id_to_iri: (609 'id_to_iri' ((201 't1' 'S' ) ) )

    call id_to_iri: (609 'id_to_iri' ((201 't1' 'P' ) ) )

    call __rdf_sqlval_of_obj: (609 '__rdf_sqlval_of_obj' ((201 't1' 'O' ) ) )
}
```

</div>

</div>

  

<div id="ex_explain7" class="example">

**Example 24.112. Example with type -7**

<div class="example-contents">

Execute from ISQL:

``` programlisting
SQL> select explain('sparql
select *
from <http://myopenlink.net/dataspace/person/kidehen#this>
where {?s ?p ?o} limit 10',-7);
callret
VARCHAR
_______________________________________________________________________________

6.957722663879395

1 Rows. -- 0 msec.
```

</div>

</div>

  

<div id="ex_explainvsp" class="example">

**Example 24.113. Example with vsp printing the result from executing
explain:**

<div class="example-contents">

``` programlisting
<?vsp
  declare meta, data any;
  exec ('explain (?)', null, null, vector ('select * from sys_users'),  0, meta, data);
  foreach (any row in data) do
  {
     http_value (row[0], 'p');
  }
?>
```

Equivalent is:

``` programlisting
<?vsp
  declare meta, data any;
  exec ('explain (?)', null, null, vector ('select * from sys_users'), 0, meta, data);
  for (declare i,l int, i := 0, l := length (data); i < l; i := i + 1)
   {
     http_value (data[i][0], 'p');
   }
?>
?>
```

As result, after accessing this sample vsp, the following output will be
printed:

``` programlisting
{

from DB.DBA.SYS_USERS by SYS_USERS 17 rows

Key SYS_USERS ASC ($47 ".U_ID", $46 ".U_NAME", $45 ".U_IS_ROLE", $44 ".U_FULL_NAME", $43 ".U_E_MAIL", $42 ".U_PASSWORD", $41 ".U_GROUP", $40 ".U_LOGIN_TIME", $39 ".U_ACCOUNT_DISABLED", $38 ".U_DAV_ENABLE", $37 ".U_SQL_ENABLE", $36 ".U_DATA", $35 ".U_METHODS", $34 ".U_DEF_PERMS", $33 ".U_HOME", $32 ".U_PASSWORD_HOOK", $31 ".U_PASSWORD_HOOK_DATA", $30 ".U_GET_PASSWORD", $29 ".U_DEF_QUAL", $28 ".U_OPTS")

Current of: <$49 "<DB.DBA.SYS_USERS >" spec 5>

Select ($47 ".U_ID", $46 ".U_NAME", $45 ".U_IS_ROLE", $44 ".U_FULL_NAME", $43 ".U_E_MAIL", $42 ".U_PASSWORD", $41 ".U_GROUP", $40 ".U_LOGIN_TIME", $39 ".U_ACCOUNT_DISABLED", $38 ".U_DAV_ENABLE", $37 ".U_SQL_ENABLE", $36 ".U_DATA", $35 ".U_METHODS", $34 ".U_DEF_PERMS", $33 ".U_HOME", $32 ".U_PASSWORD_HOOK", $31 ".U_PASSWORD_HOOK_DATA", $30 ".U_GET_PASSWORD", $29 ".U_DEF_QUAL", $28 ".U_OPTS", <$49 "<DB.DBA.SYS_USERS >" spec 5>)

}
?>
```

</div>

</div>

  

</div>

<div id="seealso_explain" class="refsect1">

## See Also

<a href="ch-server.html#perfdiagqueryplans" class="link"
title="Query Plans">Query Plans.</a>

</div>

</div>
