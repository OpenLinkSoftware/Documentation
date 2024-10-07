<div id="fn_http_unlock" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_unlock — Unlocks the HTTP Web Server port

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_unlock" class="funcsynopsis">

|                             |                        |
|-----------------------------|------------------------|
| `any `**`http_unlock`**` (` | in `pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_unlock" class="refsect1">

## Description

This function takes as parameter the password of the dba user and
unlocks the HTTP Web Server port

</div>

<div id="params_http_unlock" class="refsect1">

## Parameters

<div id="id91886" class="refsect2">

### pwd

The password of the dba user.

</div>

</div>

<div id="examples_http_unlock" class="refsect1">

## Examples

<div id="ex_http_unlock" class="example">

**Example 24.153. Simple Use**

<div class="example-contents">

``` screen
SQL> http_unlock('password');

Done. -- 0 msec.
SQL>
```

</div>

</div>

  

</div>

<div id="seealso_http_unlock" class="refsect1">

## See Also

<a href="fn_http_lock.html" class="link" title="http_lock"><code
class="function">http_lock() </code></a>

</div>

</div>
