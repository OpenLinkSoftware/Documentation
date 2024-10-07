<div id="fn_user_drop" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

USER_DROP — This deletes a user ccount, optionally including schema
objects, DAV resources and other possible resources owned by the user.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_user_drop" class="funcsynopsis">

|                        |                            |
|------------------------|----------------------------|
| ` `**`USER_DROP`**` (` | in `name ` varchar ,       |
|                        | in `cascade ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_user_drop" class="refsect1">

## Description

This is used to remove an existing user account from local security
schema.

</div>

<div id="params_user_drop" class="refsect1">

## Parameters

<div id="id116422" class="refsect2">

### name

A string containing the name of the user account to be deleted.

</div>

<div id="id116425" class="refsect2">

### cascade

This flag (0/1) specifies whether to delete the stored
procedures/functions, PL modules, tables and user defined types owned by
the user. It cannot drop assembly definitions (created with CREATE
ASSEMBLY), because CREATE ASSEMBLY is a database wide operation (done by
the DBA group) so the assembly has no owner (since you can not drop
DBA). The default value is zero. Sometimes it is not possible to drop
the resources, for example if a table owned by the user is referenced by
foreign key in a table that would not be dropped. The drop user will
detect that and will print the appropriate error message (giving up the
operation).

</div>

</div>

<div id="ret_user_drop" class="refsect1">

## Return Types

None

</div>

<div id="seealso_user_drop" class="refsect1">

## See Also

<a href="ch-server.html#vumuseroptions" class="link"
title="User Options">User Options Section</a>

<a href="fn_user_create.html" class="link" title="USER_CREATE"><code
class="function">USER_CREATE() </code></a>

<a href="fn_user_role_create.html" class="link"
title="USER_ROLE_CREATE"><code
class="function">USER_ROLE_CREATE() </code></a>

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

<a href="ch-appendixa.html#yacc" class="link"
title="23.1. YACC SQL Grammar Reference"><code
class="function">DROP USER [CASCADE]() </code> statement</a>

</div>

</div>
