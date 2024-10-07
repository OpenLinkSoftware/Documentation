<div id="fn_user_set_password" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

user_set_password — Allows dba to change a user's password.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_set_password" class="funcsynopsis">

|                                |                                |
|--------------------------------|--------------------------------|
| ` `**`user_set_password`**` (` | in `user_name ` string ,       |
|                                | in `new_password ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_49" class="refsect1">

## Description

Explicitly sets a new password for the SQL account *`user_name`* to
*`new_password`* . Only users in the dba group may execute this
function. It allows the database administrator to reset lost passwords
of SQL accounts. The new password will be set without further
confirmation, so the DBA must be sure of the new password.

</div>

<div id="params_16" class="refsect1">

## Parameters

<div id="id116919" class="refsect2">

### user_name

SQL user account name to change.

</div>

<div id="id116922" class="refsect2">

### new_password

New password for the user as plain text.

</div>

</div>

<div id="errors_user_set_password" class="refsect1">

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

<div id="id116929" class="table">

**Table 24.106. Errors signalled by `user_set_password() `**

<div class="table-contents">

| SQL Code                              | Error Message                                      | Virtuoso Code |
|---------------------------------------|----------------------------------------------------|---------------|
| <span class="errorcode">42000 </span> | Function user_set_password restricted to dba group | SR285         |
| <span class="errorcode">42000 </span> | The user \<user_name\> does not exist              | SR286         |
| <span class="errorcode">42000 </span> | The new password for \<user_name\> cannot be empty | SR287         |

</div>

</div>

  

</div>

</div>
