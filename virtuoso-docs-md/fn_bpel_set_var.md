<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.setVariableData — sets BPEL variable data within code invoked
from \<bpelv:exec binding="SQL"\> activity

</div>

<div>

## Synopsis

<div>

|                                        |                          |
|----------------------------------------|--------------------------|
| ` `**`BPEL.BPEL.setVariableData`**` (` | in `var_name ` varchar , |
|                                        | in `value ` any ,        |
|                                        | in `part ` varchar ,     |
|                                        | in `query ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### var_name

<span class="type">varchar </span> the name of BPEL variable

</div>

<div>

### value

<span class="type">any </span> the value to be set. Can be XML tree or
varchar

</div>

<div>

### part

<span class="type">varchar default null </span> the part of BPEL
variable in question.

</div>

<div>

### query

<span class="type">varchar default null</span> XPATH query for selecting
data in the BPEL variable

</div>

</div>

<div>

## Return Types

this function has no return value.

</div>

<div>

## Description

`BPEL.BPEL.setVariableData ` Sets the data selected by "query" in the
part (named by "part" argument) of the BPEL variable. If there is no
variable with such name or the query contains syntax errors or if its
evaluation signals a run time error, the appropriate error is signalled.
This procedure may only be used in Virtuoso/PL code invoked from a BPEL
process.

</div>

<div>

## Examples

<div>

**Example 24.649. Simple example**

<div>

``` screen
declare country any;

...

if (country is null)
  BPEL.BPEL.setVariableData ('res',
    xtree_doc (']]&gt;<destResponse><country>Unknown</country></destResponse><![CDATA['),
    'repl_payload');
 else
  BPEL.BPEL.setVariableData ('res',
    country,
    'repl_payload',
    '/destResponse/country');
      
```

</div>

</div>

  

</div>

</div>
