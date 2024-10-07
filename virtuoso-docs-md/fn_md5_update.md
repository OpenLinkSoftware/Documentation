<div id="fn_md5_update" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

md5_update — returns the updated md5 context serialized as varchar

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_md5_update" class="funcsynopsis">

|                                           |                         |
|-------------------------------------------|-------------------------|
| `md5 context update `**`md5_update`**` (` | in `ctx ` varchar ,     |
|                                           | in `data ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_05" class="refsect1">

## Description

This function updates MD5_CTX with data parameter and returns the
(deserialized from ctx parameter) updated context.

</div>

<div id="seealso_md5_update" class="refsect1">

## See Also

<a href="fn_md5_init.html" class="link" title="md5_init">md5_init</a>
<a href="fn_md5_final.html" class="link" title="md5_final">md5_final</a>
,

</div>

</div>
