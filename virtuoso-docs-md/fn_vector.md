<div>

<div>

</div>

<div>

## Name

vector — make a vector

</div>

<div>

## Synopsis

<div>

|                     |                    |
|---------------------|--------------------|
| ` `**`vector`**` (` | `elem1 ` any ,     |
|                     | `elem2 ` any ,     |
|                     | `... ` ,           |
|                     | `elem-n ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`vector ` returns a new vector (one-dimensional array) constructed from
the given arguments.

</div>

<div>

## Parameters

<div>

### *`elem1..n `*

Values of any types (not necessarily of one and the same type).

</div>

</div>

<div>

## Return Values

A vector (heterogeneous array) of as many elements as there were
arguments containing copies of the arguments.

</div>

<div>

## Examples

<div>

**Example 24.439. Inspecting a vector with dbg_obj_print**

<div>

SQL clients can not process vectors directly so the simplest way to look
at the content of a vector is to print it no server's console.

``` screen
dbg_obj_print (vector (1, 2.34, 'A string', atof('3.14')))
```

</div>

</div>

  

<div>

**Example 24.440. Pretty-print function for vectors**

<div>

The following function gets a heterogeneous vector of strings, nubers
and other vectors and returns a string that is an SQL expression that
will return a copy of a given vector.

``` screen
create procedure DUMP_VEC_IMPL (inout _vec any, inout _ses any)
{
  declare _len, _ctr integer;
  if (193 <> __tag (_vec))
    {
      if (isstring (_vec))
        http (WS.WS.STR_SQL_APOS (_vec), _ses);
      else
        http (cast (_vec as varchar), _ses);
      return;
    }
  _len := length (_vec);
  _ctr := 0;
  http ('\nvector (', _ses);
  while (_ctr < _len)
    {
      if (_ctr > 0)
        http (', ', _ses);
      DUMP_VEC_IMPL (_vec[_ctr], _ses);
      _ctr := _ctr+1;
    }
  http (')', _ses);
}

create function DUMP_VEC (in _vec any)
{
  declare _ses any;
  _ses := string_output();
  DUMP_VEC_IMPL (_vec, _ses);
  return string_output_string (_ses);
}

select DUMP_VEC (vector ('abc', 1, vector (3.1415), vector ()));
callret
VARCHAR
_______________________________________________________________________________

vector ('abc', 1,
vector (3.1415),
vector ())

1 Rows.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset </code></a>
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref </code></a>
<a href="fn_vector_concat.html" class="link" title="vector_concat"><code
class="function">vector_concat </code></a>

</div>

</div>
