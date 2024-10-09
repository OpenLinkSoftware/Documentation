<div>

<div>

</div>

<div>

## Name

http_proxy — proxy request to another host and return content to calling
client

</div>

<div>

## Synopsis

<div>

|                         |                            |
|-------------------------|----------------------------|
| ` `**`http_proxy`**` (` | in `host ` varchar ,       |
|                         | in `header ` any ,         |
|                         | in `content ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to retrieve content from a foreign host and send
the response to the HTTP client of the page calling this. This is useful
for re-routing a request to another server in the middle of a VSP page.

</div>

<div>

## Parameters

<div>

### host

The fully-qualified host name or alias. If a target port is specified
the semi-column ':' character MUST be used as the separator.
('www.foo.com:8080')

</div>

<div>

### header

an array consisting of the HTTP request header lines. Warning: Each line
MUST finish with \<CR\>\<LF\> characters. This header lines will be sent
to the target server without any conversion.

</div>

<div>

### content

In the case of posting of forms this parameter can contain the form data
as specified in HTML standards.

</div>

</div>

<div>

## Examples

<div>

**Example 24.175. Retrieving Current Path of Request**

<div>

``` programlisting
  <?vsp
    http_proxy ('www.foo.com', vector ('GET / HTTP/1.0'), null);
  ?>
  
```

</div>

</div>

  

</div>

</div>
