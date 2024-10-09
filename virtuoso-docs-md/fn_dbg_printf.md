<div>

<div>

</div>

<div>

## Name

dbg_printf — print formatted output onto the system console

</div>

<div>

## Synopsis

<div>

|                         |                        |
|-------------------------|------------------------|
| ` `**`dbg_printf`**` (` | in `format ` varchar , |
|                         | in `arg1 ` any ,       |
|                         | `... ` ,               |
|                         | in `argn ` any `)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

`dbg_printf ` prints a variable number (max. eight) of arguments to the
system console of Virtuoso server, each argument formatted in C `printf`
style, according to the format string specified in the first argument.

</div>

<div>

## Parameters

<div>

### format

a C sprintf -style format <span class="type">string </span>

</div>

<div>

### argn

The arguments to format and print in any type

</div>

</div>

<div>

## Return Values

None

</div>

<div>

## Examples

<div>

**Example 24.87. Simple example**

<div>

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

<div>

## See Also

<a href="fn_sprintf.html" class="link" title="sprintf">sprintf()</a>

<a href="fn_log_message.html" class="link"
title="log_message">log_message()</a>

</div>

</div>
