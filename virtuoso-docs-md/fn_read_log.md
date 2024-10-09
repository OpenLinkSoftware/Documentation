<div>

<div>

</div>

<div>

## Name

read_log — reads Virtuoso log

</div>

<div>

## Synopsis

<div>

|                       |                        |
|-----------------------|------------------------|
| ` `**`read_log`**` (` | in `file ` varchar ,   |
|                       | in `pos ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `read_log ` function reads from the Virtuoso Transactions log file
from a given position.

</div>

<div>

## Parameters

<div>

### file

Virtuoso transaction log file.

</div>

<div>

### pos

A given position from which the read to start from.

</div>

</div>

<div>

## Return Types

The function returns array of transaction values.

</div>

<div>

## Examples

<div>

**Example 24.211. Sample example**

<div>

``` screen
-- insert sample data so to change the rdf_quad index:
SQL> SPARQL INSERT INTO <g> { <s> <p> <o> };

-- create the following example procedure
SQL>
create procedure rlt (in f any, in inpos int := 0)
{
  declare h, op, g, s, p, o any;
  declare pos int;
  result_names (op, g, s, p, o);
  h := file_open (f, inpos);
  declare r, rr any;
  while ((rr := read_log (h, pos)) is not null)
    {
      declare rw, k any;
      declare i int;
      rw := null;
      k := null;
      for (i := 1; i < length (rr); i := i + 1)
        {
      r := rr[i];
      if (r[0] = 13) -- key insert
        {
          rw := r[2];
          op := 'I';
        }
      else if (r[0] in (1,8,9)) -- insert,soft,replacing
        {
          rw := r[1];
          op := 'I';
        }
      else if (r[0] in (3,14)) -- delete
        {
          rw := r[1];
          op := 'D';
        }
      if (rw is not null)
        {
          k := rw[0];
          if (k = 273) -- RDF_QUAD, should check with SYS_KEYS
        {
          result (op, __ro2sq (rw[1]), __ro2sq (rw[2]), __ro2sq (rw[3]), __ro2sq (rw[4]));
        }
        }
    }
    }
  result (pos + inpos, '', '', '', '');
}
;

-- Call the procedure:

-- in case of no changes to the rdf_quad index are done, it will return:
SQL> rlt('tmp/Virtuoso.trx');
Query result:
op    g   s   p    o
ANY   ANY ANY ANY  ANY
8403
No. of rows in result: 1

-- in case of changes to the rdf_quad index are done ( example with the short INSERT we did above), it will return for example:
SQL> rlt('tmp/Virtuoso.trx');
Query result:
op     g   s   p    o
ANY    ANY ANY ANY  ANY
I      g   s   p    o
71446
No. of rows in result: 2
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_log_enable.html" class="link" title="log_enable"><code
class="function">log_enable </code></a>

<a href="fn_log_text.html" class="link" title="log_text"><code
class="function">log_text </code></a>

<a href="fn_log.html" class="link" title="log"><code
class="function">log </code></a>

<a href="fn_log10.html" class="link" title="log10"><code
class="function">log10 </code></a>

</div>

</div>
