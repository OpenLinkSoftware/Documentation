<div>

<div>

</div>

<div>

## Name

ses_disconnect — Disconnections a TCP session.

</div>

<div>

## Synopsis

<div>

|                             |                           |
|-----------------------------|---------------------------|
| ` `**`ses_disconnect`**` (` | in `ses ` ses_handle `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to disconnect from a session and destroy the
session handle. After this function is called the session handle becomes
invalid and hence cannot be used for reading or writing as an error will
occur.

</div>

<div>

## Parameters

<div>

### ses

A valid session handle.

</div>

</div>

<div>

## See Also

<a href="fn_ses_connect.html" class="link" title="ses_connect"><code
class="function">ses_connect() </code></a>

<a href="fn_ses_write.html" class="link" title="ses_write"><code
class="function">ses_write() </code></a>

<a href="fn_ses_read_line.html" class="link" title="ses_read_line"><code
class="function">ses_read_line() </code></a>

</div>

</div>
