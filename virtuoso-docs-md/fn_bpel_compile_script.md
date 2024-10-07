<div id="fn_bpel_compile_script" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.compile_script — Compile a BPEL script source

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_compile_script_01" class="funcsynopsis">

|                                       |                                     |
|---------------------------------------|-------------------------------------|
| ` `**`BPEL.BPEL.compile_script`**` (` | in `scp_id ` int ,                  |
|                                       | in `vdir ` varchar (default null) , |
|                                       | in `opts ` any (default null) ,     |
|                                       | in `no_check ` int (default 0) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_compile_script_01" class="refsect1">

## Parameters

<div id="id129869" class="refsect2">

### scp_id

<span class="type">int </span> the BPEL process identifier to be
compiled

</div>

<div id="id129873" class="refsect2">

### vdir

<span class="type">varchar </span> virtual directory to be created for
this process (absolute path)

</div>

<div id="id129877" class="refsect2">

### opts

<span class="type">any </span> options to the virtual directory if
specified

</div>

<div id="id129881" class="refsect2">

### no_check

<span class="type">int </span> flag to check or not partner links, bu
default before compilation function will check if every partner link
have corresponding WSDL uploaded

</div>

</div>

<div id="ret_compile_script_01" class="refsect1">

## Return Types

this function has no return value

</div>

<div id="desc_compile_script_01" class="refsect1">

## Description

`BPEL.BPEL.compile_script ` is used to compile BPEL script identified by
scp_id and link to it all WSDL definitions have been associated to it.

</div>

<div id="examples_compile_script_01" class="refsect1">

## Examples

<div id="ex_compile_script_01" class="example">

**Example 24.638. Simple example**

<div class="example-contents">

The following will compile a BPEL script with identifier equals to 1

``` screen
            SQL> create procedure echo_deploy ()
            {
              declare scp int;
              BPEL.BPEL.import_script ('file:/echo/bpel.xml', 'Echo', scp);
              BPEL.BPEL.compile_script (scp, '/Echo');
            };
            Done. -- 0 msec.
        SQL> echo_deploy ();
            Done. -- 2303 msec.
    
```

</div>

</div>

  

</div>

</div>
