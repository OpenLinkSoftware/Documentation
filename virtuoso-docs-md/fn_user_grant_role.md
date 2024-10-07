<div id="fn_user_grant_role" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_GRANT_ROLE — Assign an existing role to an existing security
object.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_grant_role" class="funcsynopsis">

|                              |                          |
|------------------------------|--------------------------|
| ` `**`USER_GRANT_ROLE`**` (` | in `name ` varchar ,     |
|                              | in `role ` varchar ,     |
|                              | in `grant_opt ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_grant_role" class="refsect1">

## Description

This function is used to assign an existing role to an existing security
object. This is the same as the `GRANT <role> ` statement.

All roles assigned to the role object will be inherited.

</div>

<div id="params_user_grant_role" class="refsect1">

## Parameters

<div id="id116551" class="refsect2">

### name

The name of the security object to affect.

</div>

<div id="id116554" class="refsect2">

### role

The name of the role (group) to be assigned to the security object.

</div>

<div id="id116557" class="refsect2">

### grant_option

A flag (0 or 1) indicating whether this object can grant this role to
other security objects.

</div>

</div>

<div id="ret_user_grant_role" class="refsect1">

## Return Types

None

</div>

<div id="seealso_user_grant_role" class="refsect1">

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