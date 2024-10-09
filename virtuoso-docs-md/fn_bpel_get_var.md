<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.getVariableData — gets BPEL variable data within \<bpelv:exec
binding="SQL"\> activity

</div>

<div>

## Synopsis

<div>

|                                        |                          |
|----------------------------------------|--------------------------|
| ` `**`BPEL.BPEL.getVariableData`**` (` | in `var_name ` varchar , |
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

this function returns the selected data from the BPEL variable. This can
be either an XML tree or a varchar or an integer.

</div>

<div>

## Description

`BPEL.BPEL.getVariableData ` Returns select by query expression data
from part (if applicable) of the BPEL variable. If the variable is
unknown, or if the XPATH expression signals an error, the appropriate
error is signalled. This procedure may only be used in Virtuoso/PL code
invoked from a BPEL process.

</div>

<div>

## Examples

<div>

**Example 24.648. Simple example**

<div>

``` screen
declare city, country varchar;
city := cast (BPEL.BPEL.getVariableData ('request',
        'req_payload',
        '/destRequest/city/text()');
      
```

</div>

</div>

  

</div>

</div>
