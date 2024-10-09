<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.script_upload — Upload a new BPEL script source

</div>

<div>

## Synopsis

<div>

|                                      |                        |
|--------------------------------------|------------------------|
| ` `**`BPEL.BPEL.script_upload`**` (` | in `name ` varchar ,   |
|                                      | in `url ` varchar ,    |
|                                      | in `content ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### name

<span class="type">varchar </span> a human readable name for script

</div>

<div>

### url

<span class="type">varchar </span> the URL to the script source

</div>

<div>

### content

<span class="type">any </span> as an alternative to the URL, the content
can be specified.

</div>

</div>

<div>

## Return Types

returns an integer unique identifier for the uploaded script

</div>

<div>

## Description

`BPEL.BPEL.script_upload ` uploads a new BPEL script, makes expanded
version, and put into edit mode. If content is supplied the function
will not try to download or check the URL specified.

</div>

<div>

## Examples

<div>

**Example 24.646. Simple example**

<div>

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
