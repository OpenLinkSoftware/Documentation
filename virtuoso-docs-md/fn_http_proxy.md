<div id="fn_http_proxy" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_proxy — proxy request to another host and return content to calling
client

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_proxy" class="funcsynopsis">

|                         |                            |
|-------------------------|----------------------------|
| ` `**`http_proxy`**` (` | in `host ` varchar ,       |
|                         | in `header ` any ,         |
|                         | in `content ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_proxy" class="refsect1">

## Description

This function is used to retrieve content from a foreign host and send
the response to the HTTP client of the page calling this. This is useful
for re-routing a request to another server in the middle of a VSP page.

</div>

<div id="params_http_proxy" class="refsect1">

## Parameters

<div id="id93301" class="refsect2">

### host

The fully-qualified host name or alias. If a target port is specified
the semi-column ':' character MUST be used as the separator.
('www.foo.com:8080')

</div>

<div id="id93304" class="refsect2">

### header

an array consisting of the HTTP request header lines. Warning: Each line
MUST finish with \<CR\>\<LF\> characters. This header lines will be sent
to the target server without any conversion.

</div>

<div id="id93307" class="refsect2">

### content

In the case of posting of forms this parameter can contain the form data
as specified in HTML standards.

</div>

</div>

<div id="examples_http_proxy" class="refsect1">

## Examples

<div id="ex_http_proxy" class="example">

**Example 24.175. Retrieving Current Path of Request**

<div class="example-contents">

``` programlisting
  <?vsp
    http_proxy ('www.foo.com', vector ('GET / HTTP/1.0'), null);
  ?>
  
```

</div>

</div>

  

</div>

</div>
