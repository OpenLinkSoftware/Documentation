<div>

<div>

</div>

<div>

## Name

http_request_get — Access to the HTTP request line

</div>

<div>

## Synopsis

<div>

|                               |                                  |
|-------------------------------|----------------------------------|
| ` `**`http_request_get`**` (` | in `variable_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to access the HTTP request line within VSP or VSPX
context. It returns 'CGI' style variables for protocol version, HTTP
method and query string.

</div>

<div>

## Parameters

<div>

### variable_name

A string designating what to return.

<div>

**Table 24.43. The variable_name keywords**

<div>

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
