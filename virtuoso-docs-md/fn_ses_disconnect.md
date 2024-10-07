<div id="fn_ses_disconnect" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ses_disconnect — Disconnections a TCP session.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ses_disconnect" class="funcsynopsis">

|                             |                           |
|-----------------------------|---------------------------|
| ` `**`ses_disconnect`**` (` | in `ses ` ses_handle `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ses_disconnect" class="refsect1">

## Description

This function is used to disconnect from a session and destroy the
session handle. After this function is called the session handle becomes
invalid and hence cannot be used for reading or writing as an error will
occur.

</div>

<div id="params_ses_disconnect" class="refsect1">

## Parameters

<div id="id109621" class="refsect2">

### ses

A valid session handle.

</div>

</div>

<div id="seealso_ses_disconnect" class="refsect1">

## See Also

<a href="fn_ses_connect.html" class="link" title="ses_connect"><code
class="function">ses_connect() </code></a>

<a href="fn_ses_write.html" class="link" title="ses_write"><code
class="function">ses_write() </code></a>

<a href="fn_ses_read_line.html" class="link" title="ses_read_line"><code
class="function">ses_read_line() </code></a>

</div>

</div>
