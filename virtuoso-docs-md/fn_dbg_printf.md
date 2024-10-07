<div id="fn_dbg_printf" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dbg_printf — print formatted output onto the system console

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dbg_printf" class="funcsynopsis">

|                         |                        |
|-------------------------|------------------------|
| ` `**`dbg_printf`**` (` | in `format ` varchar , |
|                         | in `arg1 ` any ,       |
|                         | `... ` ,               |
|                         | in `argn ` any `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dbg_printf" class="refsect1">

## Description

`dbg_printf ` prints a variable number (max. eight) of arguments to the
system console of Virtuoso server, each argument formatted in C `printf`
style, according to the format string specified in the first argument.

</div>

<div id="params_dbg_printf" class="refsect1">

## Parameters

<div id="id86067" class="refsect2">

### format

a C sprintf -style format <span class="type">string </span>

</div>

<div id="id86071" class="refsect2">

### argn

The arguments to format and print in any type

</div>

</div>

<div id="ret_dbg_printf" class="refsect1">

## Return Values

None

</div>

<div id="examples_dbg_printf" class="refsect1">

## Examples

<div id="ex_dbg_printf_1" class="example">

**Example 24.87. Simple example**

<div class="example-contents">

The frammitz just zilched!

``` screen
                if (frammitz_status 0)
                {
                dbg_printf ('Error: Frammitz status: %d.\nProgram terminated',
                frammitz_status);
                signal ('42666', 'Frammitz zilched');
                }
            
```

Hitting these lines would cause something like this in a client:

``` screen
*** Error 42666: [Virtuoso Driver][Virtuoso Server]Frammitz zilched at line 84 (84) of Top-Level:
                zappi()
            
```

The console output would look like this:

``` screen
Error: Frammitz status: 2.
                Program terminated

            
```

</div>

</div>

  

</div>

<div id="seealso_dbg_printf" class="refsect1">

## See Also

<a href="fn_sprintf.html" class="link" title="sprintf">sprintf()</a>

<a href="fn_log_message.html" class="link"
title="log_message">log_message()</a>

</div>

</div>
