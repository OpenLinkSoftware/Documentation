<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.script_source_update — Updates an existing script in BPEL
repository

</div>

<div>

## Synopsis

<div>

|                                             |                        |
|---------------------------------------------|------------------------|
| ` `**`BPEL.BPEL.script_source_update`**` (` | in `scp_id ` int ,     |
|                                             | in `url ` varchar ,    |
|                                             | in `content ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### scp_id

<span class="type">int </span> the ID of the BPEL script to be updated
with new source

</div>

<div>

### url

<span class="type">varchar </span> the URL to the script source

</div>

<div>

### content

<span class="type">any </span> as an alternative this is to specify
script source directly.

</div>

</div>

<div>

## Return Types

This function does not return a value

</div>

<div>

## Description

`BPEL.BPEL.script_source_update ` is used to update the script source of
an already uploaded script. The script must be in edit mode in order to
do that. The URL and content parameters works as in script_upload.

</div>

<div>

## Examples

<div>

**Example 24.645. Simple example**

<div>

``` screen
      SQL> BPEL.BPEL.script_source_update (1, 'file:/LoanFlow.bpel', null);
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
