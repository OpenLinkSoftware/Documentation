<div id="fn_bpel_script_source_update" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.script_source_update — Updates an existing script in BPEL
repository

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_script_source_update_01" class="funcsynopsis">

|                                             |                        |
|---------------------------------------------|------------------------|
| ` `**`BPEL.BPEL.script_source_update`**` (` | in `scp_id ` int ,     |
|                                             | in `url ` varchar ,    |
|                                             | in `content ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_script_source_update_01" class="refsect1">

## Parameters

<div id="id130128" class="refsect2">

### scp_id

<span class="type">int </span> the ID of the BPEL script to be updated
with new source

</div>

<div id="id130132" class="refsect2">

### url

<span class="type">varchar </span> the URL to the script source

</div>

<div id="id130136" class="refsect2">

### content

<span class="type">any </span> as an alternative this is to specify
script source directly.

</div>

</div>

<div id="ret_script_source_update_01" class="refsect1">

## Return Types

This function does not return a value

</div>

<div id="desc_script_source_update_01" class="refsect1">

## Description

`BPEL.BPEL.script_source_update ` is used to update the script source of
an already uploaded script. The script must be in edit mode in order to
do that. The URL and content parameters works as in script_upload.

</div>

<div id="examples_script_source_update_01" class="refsect1">

## Examples

<div id="ex_script_source_update_01" class="example">

**Example 24.645. Simple example**

<div class="example-contents">

``` screen
      SQL> BPEL.BPEL.script_source_update (1, 'file:/LoanFlow.bpel', null);
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
