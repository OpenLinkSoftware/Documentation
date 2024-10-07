<div id="fn_ses_write" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ses_write — Write character data to an open TCP session.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ses_write" class="funcsynopsis">

|                        |                               |
|------------------------|-------------------------------|
| ` `**`ses_write`**` (` | in `buffer ` varchar ,        |
|                        | in `ses ` session_handle `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ses_write" class="refsect1">

## Description

This function is used to write character data taken from the buffer
parameter to an open TCP session. Attempts to write to a close session
will result in an error being returned.

</div>

<div id="params_ses_write" class="refsect1">

## Parameters

<div id="id109712" class="refsect2">

### buffer

Character data to be sent to the session.

</div>

<div id="id109715" class="refsect2">

### ses

A valid session handle. If none is supplied the current VSP context is
assumed.

</div>

</div>

<div id="seealso_ses_write" class="refsect1">

## See Also

<a href="fn_ses_connect.html" class="link" title="ses_connect"><code
class="function">ses_connect() </code></a>

<a href="fn_ses_disconnect.html" class="link"
title="ses_disconnect"><code
class="function">ses_disconnect() </code></a>

<a href="fn_ses_read_line.html" class="link" title="ses_read_line"><code
class="function">ses_read_line() </code></a>

</div>

</div>
