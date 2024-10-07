<div id="fn_http_request_status" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_request_status — set the status sent to the client in an HTTP
response

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_request_status" class="funcsynopsis">

|                                  |                                |
|----------------------------------|--------------------------------|
| ` `**`http_request_status`**` (` | in `status_line ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_request_status" class="refsect1">

## Description

This allows a VSP page to control the status sent to the client in the
HTTP response. The argument will be presented as the first line of the
reply instead of the default "HTTP/1.1 200 OK". The string should not
contain a CR or LF at the end.

This allows a page to issue redirects, authentication challenges etc.

Use it with `http_headers` to control the content of the HTTP reply
headers.

</div>

<div id="params_http_request_status" class="refsect1">

## Parameters

<div id="id93398" class="refsect2">

### status_line

String conforming to HTTP/1.1 (see RFC2616). Examples of possible status
lines are: 'HTTP/1.1 200 OK', 'HTTP/1.1 500 Internal Server Error',
'HTTP/1.1 401 Not found' or 'HTTP/1.1 400 Bad request' etc.

</div>

</div>

</div>
