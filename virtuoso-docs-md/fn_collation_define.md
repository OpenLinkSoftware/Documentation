<div id="fn_collation_define" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

collation_define — define a new collation

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_collation_define" class="funcsynopsis">

|                               |                                |
|-------------------------------|--------------------------------|
| ` `**`collation_define`**` (` | in `COLLATION_NAME ` varchar , |
|                               | in `FILE_PATH ` varchar ,      |
|                               | in `ADD_TYPE ` integer `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_collation_define" class="refsect1">

## Description

This function lets you define a new collation.

</div>

<div id="params_collation_define" class="refsect1">

## Parameters

<div id="id82388" class="refsect2">

### COLLATION_NAME

The name to be assigned to the new collation.

</div>

<div id="id82391" class="refsect2">

### FILE_PATH

The path and file name of the collation definition file. The path must
be specified in the format appropriate to the operating system hosting
the Virtuoso server.

</div>

<div id="id82394" class="refsect2">

### ADD_TYPE

is the type of the new collation: 1 for 8-bit collation (256-byte blob);
2 for UNICODE collation (65536-byte Unicode blob). A value of 0
instructs the function only to check the validity of the definition file
and to return a resultset containing the codes of the valid exception
definitions.

</div>

</div>

<div id="ret_collation_define" class="refsect1">

## Return Types

If 0 is supplied to the ADD_TYPE parameter then a result set will be
returned containing the codes of the valid definitions.

</div>

</div>
