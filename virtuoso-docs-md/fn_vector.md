<div id="fn_vector" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vector — make a vector

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vector" class="funcsynopsis">

|                     |                    |
|---------------------|--------------------|
| ` `**`vector`**` (` | `elem1 ` any ,     |
|                     | `elem2 ` any ,     |
|                     | `... ` ,           |
|                     | `elem-n ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vector" class="refsect1">

## Description

`vector ` returns a new vector (one-dimensional array) constructed from
the given arguments.

</div>

<div id="params_vector" class="refsect1">

## Parameters

<div id="id118263" class="refsect2">

### *`elem1..n `*

Values of any types (not necessarily of one and the same type).

</div>

</div>

<div id="ret_vector" class="refsect1">

## Return Values

A vector (heterogeneous array) of as many elements as there were
arguments containing copies of the arguments.

</div>

<div id="examples_vector" class="refsect1">

## Examples

<div id="ex_vector_1" class="example">

**Example 24.439. Inspecting a vector with dbg_obj_print**

<div class="example-contents">

SQL clients can not process vectors directly so the simplest way to look
at the content of a vector is to print it no server's console.

``` screen
dbg_obj_print (vector (1, 2.34, 'A string', atof('3.14')))
```

</div>

</div>

  

<div id="ex_vector_2" class="example">

**Example 24.440. Pretty-print function for vectors**

<div class="example-contents">

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

<div id="seealso_vector" class="refsect1">

## See Also

<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset </code></a>
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref </code></a>
<a href="fn_vector_concat.html" class="link" title="vector_concat"><code
class="function">vector_concat </code></a>

</div>

</div>
