<div id="fn_user_change_password" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_CHANGE_PASSWORD — Change the password of an existing user account.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_change_password" class="funcsynopsis">

|                                   |                            |
|-----------------------------------|----------------------------|
| ` `**`USER_CHANGE_PASSWORD`**` (` | in `name ` varchar ,       |
|                                   | in `old_pwd ` varchar ,    |
|                                   | in `new_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_change_password" class="refsect1">

## Description

This function is used to change the password of an existing user
account.

</div>

<div id="params_user_change_password" class="refsect1">

## Parameters

<div id="id116291" class="refsect2">

### name

A string containing the name of the user whose password is to be
changed.

</div>

<div id="id116294" class="refsect2">

### old_pwd

A string containing the old password of the user.

</div>

<div id="id116297" class="refsect2">

### new_pwd

A string containing the new password to be used.

</div>

</div>

<div id="ret_user_change_password" class="refsect1">

## Return Types

None

</div>

<div id="seealso_user_change_password" class="refsect1">

## See Also

<a href="ch-server.html#vumuseroptions" class="link"
title="User Options">User Options Section</a>

<a href="fn_user_create.html" class="link" title="USER_CREATE"><code
class="function">USER_CREATE() </code></a>

<a href="fn_user_role_create.html" class="link"
title="USER_ROLE_CREATE"><code
class="function">USER_ROLE_CREATE() </code></a>

<a href="fn_user_drop.html" class="link" title="USER_DROP"><code
class="function">USER_DROP() </code></a>

<a href="fn_user_role_drop.html" class="link"
title="USER_ROLE_DROP"><code
class="function">USER_ROLE_DROP() </code></a>

<a href="fn_user_set_qualifier.html" class="link"
title="USER_SET_QUALIFIER"><code
class="function">USER_SET_QUALIFIER() </code></a>

<a href="fn_user_grant_role.html" class="link"
title="USER_GRANT_ROLE"><code
class="function">USER_GRANT_ROLE() </code></a>

<a href="fn_user_revoke_role.html" class="link"
title="USER_REVOKE_ROLE"><code
class="function">USER_REVOKE_ROLE() </code></a>

<a href="fn_user_set_option.html" class="link"
title="USER_SET_OPTION"><code
class="function">USER_SET_OPTIONS() </code></a>

<a href="fn_user_get_option.html" class="link"
title="USER_GET_OPTION"><code
class="function">USER_GET_OPTIONS() </code></a>

</div>

</div>
