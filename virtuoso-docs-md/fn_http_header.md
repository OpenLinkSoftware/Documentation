<div id="fn_http_header" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_header — Specifies non-default HTTP response headers

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_header" class="funcsynopsis">

|                          |                         |
|--------------------------|-------------------------|
| ` `**`http_header`**` (` | in `head ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_header" class="refsect1">

## Description

This function is used to add additional HTTP header lines to the server
response. The http_header parameter MUST finish with \<CR\>\<LF\>
characters. Warning: Each call of this function cancels the effect of
the previous call. In order to add to previously set header lines, use
the `http_header_get` function to retrieve the current headers.

A Content-Type or Media-Type header specified as a part of the headers
given with this function will override the default. Otherwise the header
lines set using this function add to but do not replace the default
response headers. Note that this function cannot set the status line.
Use http_request_status for that.

</div>

<div id="examples_http_header" class="refsect1">

## Examples

<div id="ex_http_header" class="example">

**Example 24.164. Modifying the headers**

<div class="example-contents">

``` programlisting
<?vsp
http_header ('Content-type: text/plain\r\n');
-- the effect is browser will display content as text document
?>
  
```

</div>

</div>

  

</div>

</div>
