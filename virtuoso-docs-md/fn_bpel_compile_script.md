<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.compile_script — Compile a BPEL script source

</div>

<div>

## Synopsis

<div>

|                                       |                                     |
|---------------------------------------|-------------------------------------|
| ` `**`BPEL.BPEL.compile_script`**` (` | in `scp_id ` int ,                  |
|                                       | in `vdir ` varchar (default null) , |
|                                       | in `opts ` any (default null) ,     |
|                                       | in `no_check ` int (default 0) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### scp_id

<span class="type">int </span> the BPEL process identifier to be
compiled

</div>

<div>

### vdir

<span class="type">varchar </span> virtual directory to be created for
this process (absolute path)

</div>

<div>

### opts

<span class="type">any </span> options to the virtual directory if
specified

</div>

<div>

### no_check

<span class="type">int </span> flag to check or not partner links, bu
default before compilation function will check if every partner link
have corresponding WSDL uploaded

</div>

</div>

<div>

## Return Types

this function has no return value

</div>

<div>

## Description

`BPEL.BPEL.compile_script ` is used to compile BPEL script identified by
scp_id and link to it all WSDL definitions have been associated to it.

</div>

<div>

## Examples

<div>

**Example 24.638. Simple example**

<div>

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
