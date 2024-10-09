<div>

<div>

</div>

<div>

## Name

USER_SET_QUALIFIER — Change the default catalog (qualifier/database) of
a user account.

</div>

<div>

## Synopsis

<div>

|                                 |                         |
|---------------------------------|-------------------------|
| ` `**`USER_SET_QUALIFIER`**` (` | in `name ` varchar ,    |
|                                 | in `qual ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to change the default catalog (qualifier/database)
of a given user account.

</div>

<div>

## Parameters

<div>

### name

A string containing the name of the user account.

</div>

<div>

### qual

A string containing the initial default qualifier of the session after a
SQL client login.

</div>

</div>

<div>

## Return Types

None

</div>

<div>

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
