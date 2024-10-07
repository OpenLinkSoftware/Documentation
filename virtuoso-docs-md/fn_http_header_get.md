<div id="fn_http_header_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_header_get — returns header of current HTTP request

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_header_get" class="funcsynopsis">

|                                     |      |
|-------------------------------------|------|
| `varchar `**`http_header_get`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_header_get" class="refsect1">

## Description

Returns the response header associated with the current HTTP request.
This will not return the default header lines, only those explicitly set
with http_header.

This is useful for incrementally modifying response headers during
processing of a URL.

</div>

<div id="ret_http_header_get" class="refsect1">

## Return Types

Varchar of the current headers

</div>

<div id="examples_http_header_get" class="refsect1">

## Examples

<div id="ex_http_header_get" class="example">

**Example 24.165. Retrieving the current header**

<div class="example-contents">

``` programlisting
<?vsp
http_header (concat (http_header_get (), 'Location: default.html'));
?>
```

</div>

</div>

  

</div>

</div>
