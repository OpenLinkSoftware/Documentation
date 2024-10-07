<div id="fn_set_user_id" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

set_user_id — sets the current user for execution

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_set_user_id" class="funcsynopsis">

|                                 |                             |
|---------------------------------|-----------------------------|
| `integer `**`set_user_id`**` (` | in `user_name ` varchar ,   |
|                                 | in `mode ` integer ,        |
|                                 | in `password ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_set_user_id" class="refsect1">

## Description

This function changes the effective user and group to that of the user
defined by user_name parameter. When called by a user with DBA group
privileges, the optional password may be omitted. Otherwise it has to be
the valid password for user_name. The mode parameter determines
persistence (context) of effects of the call: If omitted or set to
integer value 1, the effective user privileges will remain in effect
within current stored procedure context only - upon returning, the
effective user privileges will be automatically reset to state effective
before set_user_id. When mode is equal to integer value 0, the effective
user privileges will remain set for duration of current ODBC session,
current request in web server context, or until next call of
set_user_id. This function is analogous to the UNIX 'su' command.

</div>

<div id="params_set_user_id" class="refsect1">

## Parameters

<div id="id109794" class="refsect2">

### user_name

the name of SQL user account to be used as effective user and group.

</div>

<div id="id109797" class="refsect2">

### mode

optional, integer 1 (default) means change of privileges remains in
effect only while within current stored procedure context.

</div>

<div id="id109800" class="refsect2">

### password

this optional parameter is needed if calling the function without DBA
privileges. Password of the user *`user_name`* .

</div>

</div>

<div id="ret_set_user_id" class="refsect1">

## Return Types

No return value

</div>

</div>
