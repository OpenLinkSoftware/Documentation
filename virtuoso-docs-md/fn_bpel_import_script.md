<div id="fn_bpel_import_script" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.import_script — Import a new BPEL process

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_import_script_01" class="funcsynopsis">

|                                      |                           |
|--------------------------------------|---------------------------|
| ` `**`BPEL.BPEL.import_script`**` (` | in `base_uri ` varchar ,  |
|                                      | in `base_name ` varchar , |
|                                      | in `scp_id ` int `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_import_script_01" class="refsect1">

## Parameters

<div id="id130499" class="refsect2">

### base_uri

<span class="type">varchar </span> the URL to the bpel.xml which
contains information for bpel and wsdl for process and its partnerlinks
wsdl's urls.

</div>

<div id="id130503" class="refsect2">

### base_name

<span class="type">varchar </span> a human readable name for process

</div>

<div id="id130507" class="refsect2">

### scp_id

<span class="type">int </span> id of the process.

</div>

</div>

<div id="desc_import_script_01" class="refsect1">

## Description

`BPEL.BPEL.import_script ` imports a new BPEL process or refetches the
content of bpel, wsdl files and wsdl for partner links for a given
process. In both cases the process is turned to mode "Edit". Urls of
wsdl files must have absolute paths.

</div>

<div id="examples_import_script_01" class="refsect1">

## Examples

<div id="ex_import_script_01" class="example">

**Example 24.652. Simple example**

<div class="example-contents">

``` screen
          SQL>create procedure echo_import ()
             {
              declare scp int;
              BPEL.BPEL.import_script ('file:/echo/bpel.xml', 'Echo', scp);
             }
            ;

      SQL> echo_import ();
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
