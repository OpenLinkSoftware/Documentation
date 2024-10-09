<div>

<div>

</div>

<div>

## Name

http_header_get — returns header of current HTTP request

</div>

<div>

## Synopsis

<div>

|                                     |      |
|-------------------------------------|------|
| `varchar `**`http_header_get`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the response header associated with the current HTTP request.
This will not return the default header lines, only those explicitly set
with http_header.

This is useful for incrementally modifying response headers during
processing of a URL.

</div>

<div>

## Return Types

Varchar of the current headers

</div>

<div>

## Examples

<div>

**Example 24.165. Retrieving the current header**

<div>

``` programlisting
<?vsp
http_header (concat (http_header_get (), 'Location: default.html'));
?>
```

</div>

</div>

  

</div>

</div>
