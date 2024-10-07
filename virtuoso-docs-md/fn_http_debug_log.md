<div id="fn_http_debug_log" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_debug_log — set WebDAV HTTP request logging

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_debug_log" class="funcsynopsis">

|                             |                              |
|-----------------------------|------------------------------|
| ` `**`http_debug_log`**` (` | in `file_path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_debug_log" class="refsect1">

## Description

When an valid path string is supplied and it is allowed in file ACL
list, the WebDAV HTTP requests and responses will be logged in append
mode in to that file. When an open logging session is encountered the
second call will produce an error. Specifying a NULL instead of
file_path string stops the logging.

The log file consists of lines with following fields:

<div class="itemizedlist">

- The request and response are marked by \<\<\< and \>\>\> signs

- Client IP address

- Date and time of request/response

- Timestamp (milliseconds)

- Request/response line

</div>

</div>

<div id="errors_http_debug_log" class="refsect1">

## Errors

<div id="id92436" class="table">

**Table 24.39. Errors signalled by `http_debug_log `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                          | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA041 </span> | <span class="errortext">HTTP debug log is already being generated </span>                           |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA040 </span> | <span class="errortext">Access to \[file name\] is denied due to access control in ini file </span> |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">FA042 </span> | <span class="errortext">Can't open debug log file \[file name\], error : \[OS error\] </span>       |             |

</div>

</div>

  

</div>

<div id="examples_http_debug_log" class="refsect1">

## Examples

<div id="ex_http_debug_log_1" class="example">

**Example 24.157. Logging DAV HTTP Requests**

<div class="example-contents">

``` screen
-- start the log session
SQL> http_debug_log ('dav.log');
... do some operations in WebDAV repository via WebFolders or other client ...
-- stop the session
SQL> http_debug_log (NULL);

Produces in the server working directory a file 'dav.log' with lines looking like this:
...
>>> [127.0.0.1] [02/Oct/2001 13:49:37 +0300] [40806] PROPFIND /DAV/css/one.css HTTP/1.1
<<< [127.0.0.1] [02/Oct/2001 13:49:37 +0300] [40896] HTTP/1.1 207 Multi-Status
...
```

</div>

</div>

  

</div>

</div>
