<div>

<div>

</div>

<div>

## Name

http_lock — Locks the HTTP Web Server port

</div>

<div>

## Synopsis

<div>

|                           |                        |
|---------------------------|------------------------|
| `any `**`http_lock`**` (` | in `pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes as parameter the password of the dba user, locks the
HTTP Web Server port and on any http access attempt shows the content of
the html file given as value for the
<span class="emphasis">*MaintenancePage*</span> parameter in the
Virtuoso ini \[HTTPServer\] section:

``` programlisting
-- Virtuoso ini
...
[HTTPServer]
...
MaintenancePage = atomic.html
..
```

Note: the html file should be placed in the HTTP root.

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

**Example 24.152. Simple Use**

<div>

``` screen
SQL> http_lock('password');

Done. -- 0 msec.
SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_unlock.html" class="link" title="http_unlock"><code
class="function">http_unlock() </code></a>

</div>

</div>
