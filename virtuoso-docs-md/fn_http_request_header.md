<div id="fn_http_request_header" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_request_header — returns array of HTTP request header lines

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_request_header" class="funcsynopsis">

|                                     |                                  |
|-------------------------------------|----------------------------------|
| `any `**`http_request_header`**` (` | in `array ` any ,                |
|                                     | in `field_name ` varchar ,       |
|                                     | in `attr-name ` varchar ,        |
|                                     | in `default_value ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_request_header" class="refsect1">

## Description

This function provides access to the HTTP request header lines.

</div>

<div id="ret_http_request_header" class="refsect1">

## Return Types

If no input parameters are supplied then this function returns a copy of
the lines vector of VSP pages. If array, field_name and mime_attribute
is supplied then this function will attempt to extract the associated
value, if is cannot be found then the default_value input will be
returned. If attr-name is supplied then the mime attribute from the
field_name will be returned.

Note that when field value is requested then it will be treated as a
MIME field and only value will be returned if found. For example
consider presence of following header line: "Content-Type: text/plain;
charset=utf-8", then if 'Content-Type' is requested, only "text/plain"
will be returned. Use http_request_header_full to obtain the full field
value.

</div>

<div id="examples_http_request_header" class="refsect1">

## Examples

<div id="ex_http_request_header" class="example">

**Example 24.176. Accessing the HTTP request headers**

<div class="example-contents">

``` programlisting
<p>Your request follows</p>
  <?vsp
    declare header any;
    declare ix, len integer;
    declare host varchar;
    header := http_request_header ();
    len := length (header);
    ix := 0;
    while (ix < len)
    {
      http (aref (header, ix));
          ix := ix + 1;
    }
    host := http_request_header(lines, 'Host', null, '*** NO HOST IN REQUEST ***')
  ?>
  
```

</div>

</div>

  

</div>

</div>
