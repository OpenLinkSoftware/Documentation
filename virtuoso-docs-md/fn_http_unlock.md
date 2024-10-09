<div>

<div>

</div>

<div>

## Name

http_unlock — Unlocks the HTTP Web Server port

</div>

<div>

## Synopsis

<div>

|                             |                        |
|-----------------------------|------------------------|
| `any `**`http_unlock`**` (` | in `pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes as parameter the password of the dba user and
unlocks the HTTP Web Server port

</div>

<div>

## Parameters

<div>

### pwd

The password of the dba user.

</div>

</div>

<div>

## Examples

<div>

**Example 24.153. Simple Use**

<div>

``` screen
SQL> http_unlock('password');

Done. -- 0 msec.
SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_lock.html" class="link" title="http_lock"><code
class="function">http_lock() </code></a>

</div>

</div>
