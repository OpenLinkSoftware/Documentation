<div>

<div>

</div>

<div>

## Name

dbg_obj_print — print to the Virtuoso system console

</div>

<div>

## Synopsis

<div>

|                            |                  |
|----------------------------|------------------|
| ` `**`dbg_obj_print`**` (` | in `arg1 ` any , |
|                            | `... ` `)`;      |

<div>

 

</div>

</div>

</div>

<div>

## Description

`dbg_obj_print ` prints a variable number of arguments onto the system
console (stdout) of Virtuoso server, each argument in its own native
format, on the same line, which is followed by one newline.

</div>

<div>

## Parameters

`dbg_obj_print ` takes a variable number of any type.

</div>

<div>

## Return Values

None

</div>

<div>

## Errors

<div>

**Table 24.23. Errors signalled by**

<div>

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.86. Simple Use**

<div>

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

<div>

## See Also

<a href="fn_dbg_printf.html" class="link" title="dbg_printf"><code
class="function">dbg_printf </code></a>

</div>

</div>
