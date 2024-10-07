<div id="fn_dbg_obj_print" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dbg_obj_print — print to the Virtuoso system console

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dbg_obj_print" class="funcsynopsis">

|                            |                  |
|----------------------------|------------------|
| ` `**`dbg_obj_print`**` (` | in `arg1 ` any , |
|                            | `... ` `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dbg_obj_print" class="refsect1">

## Description

`dbg_obj_print ` prints a variable number of arguments onto the system
console (stdout) of Virtuoso server, each argument in its own native
format, on the same line, which is followed by one newline.

</div>

<div id="params_dbg_obj_print" class="refsect1">

## Parameters

`dbg_obj_print ` takes a variable number of any type.

</div>

<div id="ret_dbg_obj_print" class="refsect1">

## Return Values

None

</div>

<div id="errors_dbg_obj_print" class="refsect1">

## Errors

<div id="id86010" class="table">

**Table 24.24. Errors signalled by**

<div class="table-contents">

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="examples_dbg_obj_print" class="refsect1">

## Examples

<div id="ex_dbg_obj_print_1" class="example">

**Example 24.86. Simple Use**

<div class="example-contents">

``` screen
...
declare vec any;
vec := vector ('a', 'b', 'c');
dbg_obj_print (vec)
...
```

Would output this on the console:

``` screen
("a" "b" "c" )
```

</div>

</div>

  

</div>

<div id="seealso_dbg_obj_print" class="refsect1">

## See Also

<a href="fn_dbg_printf.html" class="link" title="dbg_printf"><code
class="function">dbg_printf </code></a>

</div>

</div>
