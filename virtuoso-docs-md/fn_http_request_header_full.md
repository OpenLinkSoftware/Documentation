<div>

<div>

</div>

<div>

## Name

http_request_header_full — returns array of HTTP request header lines

</div>

<div>

## Synopsis

<div>

|                                          |                                  |
|------------------------------------------|----------------------------------|
| `any `**`http_request_header_full`**` (` | in `array ` any ,                |
|                                          | in `field_name ` varchar ,       |
|                                          | in `default_value ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function provides access to the HTTP request header lines.

</div>

<div>

## Return Types

If no input parameters are supplied then this function returns a copy of
the lines vector of VSP pages. If array and field_name is supplied then
this function will attempt to extract the associated field value, if is
cannot be found then the default_value input will be returned.

</div>

<div>

## Examples

<div>

**Example 24.177. Accessing the HTTP request headers**

<div>

``` programlisting
<p>Your request follows</p>
  <?vsp
    http (http_request_header_full(lines, 'Content-Type', '*none*'));
  ?>
  
```

</div>

</div>

  

</div>

</div>
