<div>

<div>

</div>

<div>

## Name

http_physical_path — returns the physical path location of the requested
URL

</div>

<div>

## Synopsis

<div>

|                                 |      |
|---------------------------------|------|
| ` `**`http_physical_path`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the absolute path to the physical path location of
current HTTP request

</div>

<div>

## Examples

<div>

**Example 24.174. Retrieving Current Path of Request**

<div>

``` programlisting
  <?vsp
    http (sprintf ('<p>The physical location is : %s </p>', http_physical_path ()));
  ?>
  
```

</div>

</div>

  

</div>

</div>
