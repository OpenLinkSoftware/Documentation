<div id="fn_ses_connect" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ses_connect — Opens a TCP session and returns its handle.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ses_connect" class="funcsynopsis">

|                                        |                                  |
|----------------------------------------|----------------------------------|
| `session_handle `**`ses_connect`**` (` | in `host_and_port ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ses_connect" class="refsect1">

## Description

Requires dba privileges.

This function is used to establish a new TCP connection to the target
host. It returns a special datatype which represents the session handle.

</div>

<div id="params_ses_connect" class="refsect1">

## Parameters

<div id="id109585" class="refsect2">

### host_and_port

The host and port number of the target host in the format
\<host\>\[:\<port\>\]. If the optional port number defaults to 80 if not
supplied.

</div>

</div>

<div id="ret_ses_connect" class="refsect1">

## Return Types

Returns a special internal datatype that represents the session handle.
This session handle can be used in other session functions. Since this
is an internal type it cannot be stored.

</div>

<div id="seealso_ses_connect" class="refsect1">

## See Also

<a href="fn_ses_disconnect.html" class="link"
title="ses_disconnect"><code
class="function">ses_disconnect() </code></a>

<a href="fn_ses_read_line.html" class="link" title="ses_read_line"><code
class="function">ses_read_line() </code></a>

<a href="fn_ses_write.html" class="link" title="ses_write"><code
class="function">ses_write() </code></a>

</div>

</div>
