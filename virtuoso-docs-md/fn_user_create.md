<div>

<div>

</div>

<div>

## Name

USER_CREATE — create a new user account

</div>

<div>

## Synopsis

<div>

|                          |                           |
|--------------------------|---------------------------|
| ` `**`USER_CREATE`**` (` | in `name ` varchar ,      |
|                          | in `password ` varchar ,  |
|                          | in `options ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function creates a new user account. The account is valid for SQL
and/or DAV, depending n options.

</div>

<div>

## Parameters

<div>

### name

The name of the user account as a string.

</div>

<div>

### password

The clear text password for the user account.

</div>

<div>

### options

A vector of name-value pairs for user options, even elements for option
names, odd ones for values. Arbitrary options can be supplied. The
Virtuoso reserved options can be found in the
<a href="ch-server.html#vumuseroptions" class="link"
title="User Options">User Options</a> sub-section of the User
Administration Section.

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

<a href="fn_user_set_option.html" class="link"
title="USER_SET_OPTION"><code
class="function">USER_SET_OPTIONS() </code></a>

<a href="fn_user_get_option.html" class="link"
title="USER_GET_OPTION"><code
class="function">USER_GET_OPTIONS() </code></a>

</div>

</div>
