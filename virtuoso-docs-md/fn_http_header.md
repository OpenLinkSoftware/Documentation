<div>

<div>

</div>

<div>

## Name

http_header — Specifies non-default HTTP response headers

</div>

<div>

## Synopsis

<div>

|                          |                         |
|--------------------------|-------------------------|
| ` `**`http_header`**` (` | in `head ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Examples

<div>

**Example 24.164. Modifying the headers**

<div>

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
