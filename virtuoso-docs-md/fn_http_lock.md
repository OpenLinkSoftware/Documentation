<div id="fn_http_lock" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_lock — Locks the HTTP Web Server port

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_lock" class="funcsynopsis">

|                           |                        |
|---------------------------|------------------------|
| `any `**`http_lock`**` (` | in `pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_lock" class="refsect1">

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

<div id="params_http_lock" class="refsect1">

## Parameters

<div id="id91854" class="refsect2">

### pwd

The password of the dba user.

</div>

</div>

<div id="examples_http_lock" class="refsect1">

## Examples

<div id="ex_http_lock" class="example">

**Example 24.152. Simple Use**

<div class="example-contents">

``` screen
SQL> http_lock('password');

Done. -- 0 msec.
SQL>
```

</div>

</div>

  

</div>

<div id="seealso_http_lock" class="refsect1">

## See Also

<a href="fn_http_unlock.html" class="link" title="http_unlock"><code
class="function">http_unlock() </code></a>

</div>

</div>
