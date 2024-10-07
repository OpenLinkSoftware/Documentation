<div id="fn_user_set_qualifier" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_SET_QUALIFIER — Change the default catalog (qualifier/database) of
a user account.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_set_qualifier" class="funcsynopsis">

|                                 |                         |
|---------------------------------|-------------------------|
| ` `**`USER_SET_QUALIFIER`**` (` | in `name ` varchar ,    |
|                                 | in `qual ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_set_qualifier" class="refsect1">

## Description

This function is used to change the default catalog (qualifier/database)
of a given user account.

</div>

<div id="params_user_set_qualifier" class="refsect1">

## Parameters

<div id="id116789" class="refsect2">

### name

A string containing the name of the user account.

</div>

<div id="id116792" class="refsect2">

### qual

A string containing the initial default qualifier of the session after a
SQL client login.

</div>

</div>

<div id="ret_user_set_qualifier" class="refsect1">

## Return Types

None

</div>

<div id="seealso_user_set_qualifier" class="refsect1">

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
