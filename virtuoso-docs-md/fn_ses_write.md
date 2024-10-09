<div>

<div>

</div>

<div>

## Name

ses_write — Write character data to an open TCP session.

</div>

<div>

## Synopsis

<div>

|                        |                               |
|------------------------|-------------------------------|
| ` `**`ses_write`**` (` | in `buffer ` varchar ,        |
|                        | in `ses ` session_handle `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to write character data taken from the buffer
parameter to an open TCP session. Attempts to write to a close session
will result in an error being returned.

</div>

<div>

## Parameters

<div>

### buffer

Character data to be sent to the session.

</div>

<div>

### ses

A valid session handle. If none is supplied the current VSP context is
assumed.

</div>

</div>

<div>

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
