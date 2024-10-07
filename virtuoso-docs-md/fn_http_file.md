<div id="fn_http_file" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_file — Send a file to the HTTP client

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_file" class="funcsynopsis">

|                               |                         |
|-------------------------------|-------------------------|
| `varchar `**`http_file`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_file" class="refsect1">

## Description

This function causes the contents of the file specified by path to be
sent as the response of the calling request. The file is not sent until
the code calling this returns. Content types etc. are defaulted based on
the file's extension. If this function is called, other output to the
HTTP client by the caller is discarded.

</div>

<div id="params_http_file" class="refsect1">

## Parameters

<div id="id92517" class="refsect2">

### path

Path to the file to send

</div>

</div>

<div id="examples_http_file" class="refsect1">

## Examples

<div id="ex_http_file" class="example">

**Example 24.159. Sending A File To HTTP Client**

<div class="example-contents">

``` programlisting
<?vsp
http_file ('/index.html');
?>
      
```

</div>

</div>

  

</div>

</div>
