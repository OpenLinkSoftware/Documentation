<div>

<div>

</div>

<div>

## Name

ses_read_line — Read a line of character data from a TCP session.

</div>

<div>

## Synopsis

<div>

|                                   |                                        |
|-----------------------------------|----------------------------------------|
| `varchar `**`ses_read_line`**` (` | in `ses ` any ,                        |
|                                   | in `throw_exception_on_eof ` integer , |
|                                   | in `binary_mode ` integer `)`;         |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to read a line of character data from an open TCP
session. This function will read characters until it reaches an end of
line up to a maximum of 1024 characters. The session can be passed as a
session_handle. If the session_handle is omitted then execution is in
current session/VSP context and will read from the open HTTP session.
`Ses_read_line()` will suspend execution while attempting to read from
the session until the timeout period of 100 seconds expires. When the
timeout expires an error will be produced to indicate that the operation
was unsuccessful.

</div>

<div>

## Parameters

<div>

### ses

Optional session handle. If none is supplied the current TCP client
session is assumed. If this is NULL then the function will read from the
string session to be sent to the client upon request completion.

</div>

<div>

### throw_exception_on_eof

Controls whether to throw an error if there is a problem reading from
the session or simply return null in text mode or what ever content has
has been read so far in binary mode. If this parameter is set to 1, then
an error will be thrown. If this parameter is set to 0 then either null
or remaining content will be returned as above.

</div>

<div>

### binary_mode

Instructs the function to be in binary or text mode.

|                                                                                                                                             |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| Binary mode: the function reads a maximum of 1024 bytes and returns as much as it read as a varchar.                                        |
| Text mode: the function reads up to 0x0A, it will trim all the \[0x0A\|0x0D\] characters at the end of the string and return it as varchar. |

</div>

</div>

<div>

## Return Types

The characters read from the session are returned from this function.

</div>

<div>

## Examples

<div>

**Example 24.371. Simple demonstration of reading from the HTTP
session**

<div>

This example reads the first line of the session and outputs the
contents. This code can be run from a vsp file.

``` screen
<p>Some text</p>
<?vsp
    declare xx any;
    xx := ses_read_line (NULL);

    http (sprintf ('length is %d, "%s"', length (xx), xx));
?>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_ses_connect.html" class="link" title="ses_connect"><code
class="function">ses_connect() </code></a>

<a href="fn_ses_disconnect.html" class="link"
title="ses_disconnect"><code
class="function">ses_disconnect() </code></a>

<a href="fn_ses_write.html" class="link" title="ses_write"><code
class="function">ses_write() </code></a>

</div>

</div>
