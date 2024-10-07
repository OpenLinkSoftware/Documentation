<div id="fn_http_request_header_full" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_request_header_full — returns array of HTTP request header lines

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_request_header_full" class="funcsynopsis">

|                                          |                                  |
|------------------------------------------|----------------------------------|
| `any `**`http_request_header_full`**` (` | in `array ` any ,                |
|                                          | in `field_name ` varchar ,       |
|                                          | in `default_value ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_request_header_full" class="refsect1">

## Description

This function provides access to the HTTP request header lines.

</div>

<div id="ret_http_request_header_full" class="refsect1">

## Return Types

If no input parameters are supplied then this function returns a copy of
the lines vector of VSP pages. If array and field_name is supplied then
this function will attempt to extract the associated field value, if is
cannot be found then the default_value input will be returned.

</div>

<div id="examples_http_request_header_full" class="refsect1">

## Examples

<div id="ex_http_request_header_full" class="example">

**Example 24.177. Accessing the HTTP request headers**

<div class="example-contents">

``` programlisting
<p>Your request follows</p>
  <?vsp
    http (http_request_header_full(lines, 'Content-Type', '*none*'));
  ?>
  
```

</div>

</div>

  

</div>

</div>
