<div id="fn_http_path" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_path — returns the absolute path to the logical path location of
the current http request

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_path" class="funcsynopsis">

|                        |      |
|------------------------|------|
| ` `**`http_path`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_path" class="refsect1">

## Description

This function returns the absolute path to the logical path location of
current HTTP request.

</div>

<div id="examples_http_path" class="refsect1">

## Examples

<div id="ex_http_path" class="example">

**Example 24.172. Retrieving Current Path of Request**

<div class="example-contents">

``` screen
  <?vsp
    http (sprintf ('<p>The current location is : %s </p>', http_path ()));
  ?>
  
```

</div>

</div>

  

</div>

</div>
