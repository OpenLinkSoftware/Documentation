<div>

<div>

</div>

<div>

## Name

disconnect_user — Disconnect client connections of a given user

</div>

<div>

## Synopsis

<div>

|                              |                                    |
|------------------------------|------------------------------------|
| ` `**`disconnect_user`**` (` | in `username_pattern ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

disconnect_user disconnects clients whose username matches the
username_pattern string given as an argument, and returns an integer
value giving the number of clients disconnected. This can be used after
DELETE USER or REVOKE statement to make sure that the affected user has
no open connections.

</div>

<div>

## Parameters

<div>

### username_pattern

A string pattern to match users to be disconnected. SQL wildcards
including Virtuoso extensions may be used:

|                                                                |
|----------------------------------------------------------------|
| 'smith' - disconnects user Smith's clients.                    |
| '@smith' - disconnects all users whose name resembles 'smith'. |
| '%' - disconnects all users including the current dba session. |

</div>

</div>

<div>

## Return Values

The number of clients disconnected is returned.

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

<div>

## Examples

<div>

**Example 24.95. Disconnect users**

<div>

This is how the DBA can close all sessions for all users who name starts
with db, including 'dba' which is the DBA itself.

``` screen
SQL> disconnect_user ('db*');

*** Error 08S01: [Virtuoso Driver]CL065: Lost connection to server
at line 7 (7) of Top-Level: disconnect_user ('db*')
bash$
```

</div>

</div>

  

</div>

<div>

## See Also:

<a href="fn_username.html" class="link" title="username"><code
class="function">username </code></a>

</div>

</div>
