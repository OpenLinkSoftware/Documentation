<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.import_script — Import a new BPEL process

</div>

<div>

## Synopsis

<div>

|                                      |                           |
|--------------------------------------|---------------------------|
| ` `**`BPEL.BPEL.import_script`**` (` | in `base_uri ` varchar ,  |
|                                      | in `base_name ` varchar , |
|                                      | in `scp_id ` int `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### base_uri

<span class="type">varchar </span> the URL to the bpel.xml which
contains information for bpel and wsdl for process and its partnerlinks
wsdl's urls.

</div>

<div>

### base_name

<span class="type">varchar </span> a human readable name for process

</div>

<div>

### scp_id

<span class="type">int </span> id of the process.

</div>

</div>

<div>

## Description

`BPEL.BPEL.import_script ` imports a new BPEL process or refetches the
content of bpel, wsdl files and wsdl for partner links for a given
process. In both cases the process is turned to mode "Edit". Urls of
wsdl files must have absolute paths.

</div>

<div>

## Examples

<div>

**Example 24.652. Simple example**

<div>

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
