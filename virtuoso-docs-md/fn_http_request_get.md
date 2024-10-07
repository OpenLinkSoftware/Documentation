<div id="fn_http_request_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_request_get — Access to the HTTP request line

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_request_get" class="funcsynopsis">

|                               |                                  |
|-------------------------------|----------------------------------|
| ` `**`http_request_get`**` (` | in `variable_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_request_get" class="refsect1">

## Description

This function is used to access the HTTP request line within VSP or VSPX
context. It returns 'CGI' style variables for protocol version, HTTP
method and query string.

</div>

<div id="params_http_request_get" class="refsect1">

## Parameters

<div id="id93420" class="refsect2">

### variable_name

A string designating what to return.

<div id="id93423" class="table">

**Table 24.44. The variable_name keywords**

<div class="table-contents">

| Keyword         | Description                                             |
|-----------------|---------------------------------------------------------|
| SERVER_PROTOCOL | returns HTTP protocol number i.e. 'HTTP/1.0' 'HTTP/1.1' |
| REQUEST_METHOD  | return HTTP method ie. 'POST' 'GET' etc.                |
| QUERY_STRING    | the part of URL after '?' delimiter.                    |

</div>

</div>

  

</div>

</div>

</div>
