<div>

<div>

</div>

<div>

## Name

ses_connect — Opens a TCP session and returns its handle.

</div>

<div>

## Synopsis

<div>

|                                        |                                  |
|----------------------------------------|----------------------------------|
| `session_handle `**`ses_connect`**` (` | in `host_and_port ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Requires dba privileges.

This function is used to establish a new TCP connection to the target
host. It returns a special datatype which represents the session handle.

</div>

<div>

## Parameters

<div>

### host_and_port

The host and port number of the target host in the format
\<host\>\[:\<port\>\]. If the optional port number defaults to 80 if not
supplied.

</div>

</div>

<div>

## Return Types

Returns a special internal datatype that represents the session handle.
This session handle can be used in other session functions. Since this
is an internal type it cannot be stored.

</div>

<div>

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
