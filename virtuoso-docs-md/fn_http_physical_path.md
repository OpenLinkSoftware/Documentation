<div id="fn_http_physical_path" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_physical_path — returns the physical path location of the requested
URL

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_physical_path" class="funcsynopsis">

|                                 |      |
|---------------------------------|------|
| ` `**`http_physical_path`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_physical_path" class="refsect1">

## Description

This function returns the absolute path to the physical path location of
current HTTP request

</div>

<div id="examples_http_physical_path" class="refsect1">

## Examples

<div id="ex_http_physical_path" class="example">

**Example 24.174. Retrieving Current Path of Request**

<div class="example-contents">

``` programlisting
  <?vsp
    http (sprintf ('<p>The physical location is : %s </p>', http_physical_path ()));
  ?>
  
```

</div>

</div>

  

</div>

</div>
