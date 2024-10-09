<div>

<div>

</div>

<div>

## Name

http_request_status — set the status sent to the client in an HTTP
response

</div>

<div>

## Synopsis

<div>

|                                  |                                |
|----------------------------------|--------------------------------|
| ` `**`http_request_status`**` (` | in `status_line ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This allows a VSP page to control the status sent to the client in the
HTTP response. The argument will be presented as the first line of the
reply instead of the default "HTTP/1.1 200 OK". The string should not
contain a CR or LF at the end.

This allows a page to issue redirects, authentication challenges etc.

Use it with `http_headers` to control the content of the HTTP reply
headers.

</div>

<div>

## Parameters

<div>

### status_line

String conforming to HTTP/1.1 (see RFC2616). Examples of possible status
lines are: 'HTTP/1.1 200 OK', 'HTTP/1.1 500 Internal Server Error',
'HTTP/1.1 401 Not found' or 'HTTP/1.1 400 Bad request' etc.

</div>

</div>

</div>
