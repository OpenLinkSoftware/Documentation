<div id="fn_disconnect_user" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

disconnect_user — Disconnect client connections of a given user

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_disconnect_user" class="funcsynopsis">

|                              |                                    |
|------------------------------|------------------------------------|
| ` `**`disconnect_user`**` (` | in `username_pattern ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_disconnect_user" class="refsect1">

## Description

disconnect_user disconnects clients whose username matches the
username_pattern string given as an argument, and returns an integer
value giving the number of clients disconnected. This can be used after
DELETE USER or REVOKE statement to make sure that the affected user has
no open connections.

</div>

<div id="params_disconnect_user" class="refsect1">

## Parameters

<div id="id87329" class="refsect2">

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

<div id="ret_disconnect_user" class="refsect1">

## Return Values

The number of clients disconnected is returned.

</div>

<div id="errors_disconnect_user" class="refsect1">

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

<div id="examples_disconnect_user" class="refsect1">

## Examples

<div id="ex_disconnect_user_1" class="example">

**Example 24.95. Disconnect users**

<div class="example-contents">

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

<div id="seealso_disconnect_user" class="refsect1">

## See Also:

<a href="fn_username.html" class="link" title="username"><code
class="function">username </code></a>

</div>

</div>
