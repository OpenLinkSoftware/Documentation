<div>

<div>

</div>

<div>

## Name

http_file — Send a file to the HTTP client

</div>

<div>

## Synopsis

<div>

|                               |                         |
|-------------------------------|-------------------------|
| `varchar `**`http_file`**` (` | in `path ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function causes the contents of the file specified by path to be
sent as the response of the calling request. The file is not sent until
the code calling this returns. Content types etc. are defaulted based on
the file's extension. If this function is called, other output to the
HTTP client by the caller is discarded.

</div>

<div>

## Parameters

<div>

### path

Path to the file to send

</div>

</div>

<div>

## Examples

<div>

**Example 24.159. Sending A File To HTTP Client**

<div>

``` programlisting
<?vsp
http_file ('/index.html');
?>
      
```

</div>

</div>

  

</div>

</div>
