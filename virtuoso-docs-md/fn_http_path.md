<div>

<div>

</div>

<div>

## Name

http_path — returns the absolute path to the logical path location of
the current http request

</div>

<div>

## Synopsis

<div>

|                        |      |
|------------------------|------|
| ` `**`http_path`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the absolute path to the logical path location of
current HTTP request.

</div>

<div>

## Examples

<div>

**Example 24.172. Retrieving Current Path of Request**

<div>

``` screen
  <?vsp
    http (sprintf ('<p>The current location is : %s </p>', http_path ()));
  ?>
  
```

</div>

</div>

  

</div>

</div>
