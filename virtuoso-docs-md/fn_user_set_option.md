<div id="fn_user_set_option" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_SET_OPTION — Set a user option for a given user account.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_set_option" class="funcsynopsis">

|                              |                      |
|------------------------------|----------------------|
| ` `**`USER_SET_OPTION`**` (` | in `name ` varchar , |
|                              | in `opt ` varchar ,  |
|                              | in `value ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_set_option" class="refsect1">

## Description

This function is used to set a User Option. The options can be any one
of those described in
<a href="ch-server.html#vumuseroptions" class="link"
title="User Options">User Options</a> section or any other option. Note
that existing option will be replaced.

</div>

<div id="params_user_set_option" class="refsect1">

## Parameters

<div id="id116853" class="refsect2">

### name

The name of the user account to affect.

</div>

<div id="id116856" class="refsect2">

### opt

Option name.

</div>

<div id="id116859" class="refsect2">

### value

The new value of the named option.

</div>

</div>

<div id="ret_user_set_option" class="refsect1">

## Return Types

None

</div>

<div id="seealso_user_set_option" class="refsect1">

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

<a href="fn_user_change_password.html" class="link"
title="USER_CHANGE_PASSWORD"><code
class="function">USER_CHANGE_PASSWORD() </code></a>

<a href="fn_user_set_qualifier.html" class="link"
title="USER_SET_QUALIFIER"><code
class="function">USER_SET_QUALIFIER() </code></a>

<a href="fn_user_grant_role.html" class="link"
title="USER_GRANT_ROLE"><code
class="function">USER_GRANT_ROLE() </code></a>

<a href="fn_user_revoke_role.html" class="link"
title="USER_REVOKE_ROLE"><code
class="function">USER_REVOKE_ROLE() </code></a>

<a href="fn_user_get_option.html" class="link"
title="USER_GET_OPTION"><code
class="function">USER_GET_OPTIONS() </code></a>

</div>

</div>
