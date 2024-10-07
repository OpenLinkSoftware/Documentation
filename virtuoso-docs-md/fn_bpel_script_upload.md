<div id="fn_bpel_script_upload" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.script_upload — Upload a new BPEL script source

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_script_upload_01" class="funcsynopsis">

|                                      |                        |
|--------------------------------------|------------------------|
| ` `**`BPEL.BPEL.script_upload`**` (` | in `name ` varchar ,   |
|                                      | in `url ` varchar ,    |
|                                      | in `content ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_script_upload_01" class="refsect1">

## Parameters

<div id="id130173" class="refsect2">

### name

<span class="type">varchar </span> a human readable name for script

</div>

<div id="id130177" class="refsect2">

### url

<span class="type">varchar </span> the URL to the script source

</div>

<div id="id130181" class="refsect2">

### content

<span class="type">any </span> as an alternative to the URL, the content
can be specified.

</div>

</div>

<div id="ret_script_upload_01" class="refsect1">

## Return Types

returns an integer unique identifier for the uploaded script

</div>

<div id="desc_script_upload_01" class="refsect1">

## Description

`BPEL.BPEL.script_upload ` uploads a new BPEL script, makes expanded
version, and put into edit mode. If content is supplied the function
will not try to download or check the URL specified.

</div>

<div id="examples_script_upload_01" class="refsect1">

## Examples

<div id="ex_script_upload_01" class="example">

**Example 24.646. Simple example**

<div class="example-contents">

``` screen
      SQL> select BPEL.BPEL.script_upload ('LoanFlow', 'file:/LoanFlow.bpel', null);
      unnamed
      INTEGER
      _______________________________________________________________________________

      1
      
```

</div>

</div>

  

</div>

</div>
