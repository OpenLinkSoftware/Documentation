<div>

<div>

</div>

<div>

## Name

http_body_read — Reads the HTTP body from the client HTTP connection and
returns it as a string.

</div>

<div>

## Synopsis

<div>

|                                   |      |
|-----------------------------------|------|
| `string `**`http_body_read`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function reads the HTTP body from the client HTTP connection and
returns it as a string output. This is suitable for processing POST
requests with bodies encoded differently than `multipart/*` and
`application/x-www-form-urlencoded` as in SOAP requests where the POST
body is encoded as `text/xml` ).

</div>

<div>

## Example

<div>

**Example 24.154. Reading a HTTP request entity body**

<div>

Suppose we have the following HTTP request

``` screen
POST /foo/bar.vsp HTTP/1.1
Content-Type: text/xml
Content-Length: ...

<document>abc</document>
```

The following VSP page will read the content and return an XML document
back to the browser.

``` screen
<?vsp
declare ses any;
ses := http_body_read ();
http_header ('Content-Type: text/xml\r\n');
http (string_output_string (ses));
?>
```

</div>

</div>

  

</div>

</div>
