<div id="fn_dav_api_lock" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DAV_LOCK , DAV_UNLOCK , DAV_IS_LOCKED , DAV_LIST_LOCKS — Operations on
locks of DAV collections and resources

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dav_lock" class="funcsynopsis">

|                              |                              |
|------------------------------|------------------------------|
| `integer `**`DAV_LOCK`**` (` | in `path ` varchar ,         |
|                              | in `locktype ` varchar ,     |
|                              | in `scope ` varchar ,        |
|                              | in `token ` varchar ,        |
|                              | in `owner_name ` varchar ,   |
|                              | in `owned_tokens ` varchar , |
|                              | in `depth ` varchar ,        |
|                              | in `timeout_sec ` integer ,  |
|                              | in `auth_uname ` varchar ,   |
|                              | in `auth_pwd ` varchar `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_unlock" class="funcsynopsis">

|                            |                             |
|----------------------------|-----------------------------|
| `any `**`DAV_UNLOCK`**` (` | in `path ` varchar ,        |
|                            | in `token ` varchar ,       |
|                            | in `auth_uname ` varchar ,  |
|                            | in `auth_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_is_locked" class="funcsynopsis">

|                                   |                                  |
|-----------------------------------|----------------------------------|
| `integer `**`DAV_IS_LOCKED`**` (` | in `id ` any ,                   |
|                                   | in `type ` char(1) ,             |
|                                   | in `owned_tokens ` any := 1 `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_list_locks" class="funcsynopsis">

|                                    |                         |
|------------------------------------|-------------------------|
| `integer `**`DAV_LIST_LOCKS`**` (` | in `id ` any ,          |
|                                    | in `type ` char(1) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dav_api_lock" class="refsect1">

## Description

`DAV_LOCK ` sets a new lock or refresh an existing lock or creates a
lock object.

`DAV_UNLOCK ` releases a lock.

`DAV_IS_LOCKED ` reports whether the resource or collection is locked.

`DAV_LIST_LOCKS ` returns a full list of all locks on a resource or
collection.

It is strongly recommended to carefully study DAV standards before using
these functions in applications. Improper use of DAV locks may result in
subtle application errors that are hard to debug.

</div>

<div id="params_dav_api_lock" class="refsect1">

## Parameters

<div id="id84997" class="refsect2">

### path

Resource or collection path. As usual, collection names must end with
'/' and both sorts of path strings should begin with '/'. If the path
specifies a non-existing resource in an existing collection then a lock
object is created and only lock owner can create a resource with this
name in future.

</div>

<div id="id85000" class="refsect2">

### locktype

The type of lock. Current set of DAV standards specifies only one type
of locks, called 'D:write'; the parameter value is stored 'as is' and
never used, so the recommended value is an empty string.

</div>

<div id="id85003" class="refsect2">

### scope

The scope of lock as a single-char string: 'S' for shared lock, 'X' for
exclusive.

</div>

<div id="id85006" class="refsect2">

### token

The token to update. Empty string or NULL means creation of a new lock,
not an update of the existing one.

</div>

<div id="id85009" class="refsect2">

### owner_name

Lock owner name as it will be displayed to other users that will query
for existing locks. It is strongly recommended to provide commonly used
names such as e-mails to let users ask each other to remove forgotten
locks.

</div>

<div id="id85012" class="refsect2">

### owned_tokens

String of tokens owned by a user, to let user ignore his own tokens. The
string should match syntax of DAV HTTP 'If' parameter. This can be also
an integer, this will work as empty list of tokens.

</div>

<div id="id85015" class="refsect2">

### depth

This specifies the recursive depth of the lock. The string can be '0' to
lock the specified collection only, '1' to lock the collection and its
subcollections, 'infinity' to lock the whole subtree. When the lock is
added to a resource, the value '0' is used, for obvious reason. If NULL
is passed to the function then the effective value is 'infinity' for
collection lock or '0' for resource lock.

</div>

<div id="id85018" class="refsect2">

### timeout_sec

Expiration interval for the lock, in seconds. If 0 or NULL is passed
then HTTP DAV default is used that is equal to 604800 seconds (one
week).

</div>

<div id="id85021" class="refsect2">

### auth_uname

DAV user name to authenticate access. Lock, Lock refresh and unlock
operations on existing resource or collection require write permission.
To create a lock object in a collection, user should have write
permission on that collection. This may cause problem when user first
locks a resource and then loose write permission for some reason: the
user is unable to remove his own lock. Default is NULL that means public
access.

</div>

<div id="id85024" class="refsect2">

### auth_pwd

User password. Default is NULL.

</div>

<div id="id85027" class="refsect2">

### id

Internal identifier of a resource or collection as returned by
DAV_SEARCH_ID().

</div>

</div>

<div id="examples_dav_api_lock" class="refsect1">

## Examples

<div id="ex_dav_api_lock_1" class="example">

**Example 24.78. Two concurrent users**

<div class="example-contents">

The following example shows how two users can prevent each other from
undesired operations.

The sample function DAV_LOCK_DEMO() uses a function DUMP_VEC() that
print the content of vector in Virtuoso/PL syntax. Yon can find the
implementation of this function as one of examples for
<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector() </code></a> Virtuoso/PL function.

``` screen
create procedure DAV_LOCK_DEMO (in dav_passwd varchar := 'dav')
{
  declare ACTION, RETVAL, token_s1, token_s2, token_x varchar;
  result_names (ACTION, RETVAL);
  result ('Adding group lock_demo_grp:',
    DAV_ADD_GROUP ('lock_demo_grp', 'dav', dav_passwd) );
  result ('Adding user lock_u1:',
    DAV_ADD_USER ('lock_u1', 'lock_u1_pwd', 'lock_demo_grp', '110110000T', 0, '/DAV/lock_demo_u1_home/', 'First User of lock demo', 'lock_u1@localhost', 'dav', dav_passwd) );
  result ('Adding user lock_u2:',
    DAV_ADD_USER ('lock_u2', 'lock_u2_pwd', 'lock_demo_grp', '110110000T', 0, '/DAV/lock_demo_u2_home/', 'Second User of lock demo', 'lock_u2@localhost', 'dav', dav_passwd) );
  result ('Adding a collection:',
    DAV_COL_CREATE ('/DAV/lock_demo/', '110110000R', 'lock_u1', 'lock_demo_grp', 'dav', dav_passwd) );
  result ('Uploading /DAV/lock_demo/sample.htm:',
    DAV_RES_UPLOAD ('/DAV/lock_demo/sample.htm', '<html><body>This is /DAV/lock_demo/sample.htm</body></html>', 'text/plain', '110110000R', 'lock_u1', 'lock_demo_grp', 'lock_u1', 'lock_u1_pwd') );
  token_s1 := DAV_LOCK ('/DAV/lock_demo/sample.htm', '', 'S', NULL, 'user1@example.com', '', '0', NULL, 'lock_u1', 'lock_u1_pwd');
  result ('First user set a shared lock:', token_s1);
  token_s2 := DAV_LOCK ('/DAV/lock_demo/sample.htm', '', 'S', NULL, 'user2@example.com', '', '0', NULL, 'lock_u2', 'lock_u2_pwd');
  result ('Second user set a shared lock:', token_s2);
  token_x := DAV_LOCK ('/DAV/lock_demo/sample.htm', '', 'X', NULL, 'user1@example.com', token_s1, '0', NULL, 'lock_u1', 'lock_u1_pwd');
  result ('Lock dump',
    DUMP_VEC (DAV_LIST_LOCKS (DAV_SEARCH_ID ('/DAV/lock_demo/sample.htm', 'R'), 'R')) );
  result ('First user tries to set an exclusive lock:', token_x);
  result ('Second user releases his lock:',
    DAV_UNLOCK ('/DAV/lock_demo/sample.htm', token_s2, 'lock_u2', 'lock_u2_pwd') );
  token_x := DAV_LOCK ('/DAV/lock_demo/sample.htm', '', 'X', NULL, 'user1@example.com', token_s1, '0', NULL, 'lock_u1', 'lock_u1_pwd');
  result ('First user sets an exclusive lock:', token_x);
  result ('First user releases his lock:',
    DAV_UNLOCK ('/DAV/lock_demo/sample.htm', token_s1, 'lock_u1', 'lock_u1_pwd') );
  token_x := DAV_LOCK ('/DAV/lock_demo/sample.htm', '', 'X', NULL, 'user1@example.com', token_s1, '0', NULL, 'lock_u1', 'lock_u1_pwd');
  result ('First user sets an exclusive lock:', token_x);
  result ('Second user tries to add a property to the resource:',
    DAV_PROP_SET ('/DAV/lock_demo/sample.htm', 'sample_prop', 'sample value', 'lock_u2', 'lock_u2_pwd') );
  result ('First user releases his shared:',
    DAV_UNLOCK ('/DAV/lock_demo/sample.htm', token_x, 'lock_u1', 'lock_u1_pwd') );
  result ('Second user adds a property to the resource:',
    DAV_PROP_SET ('/DAV/lock_demo/sample.htm', 'sample_prop', 'sample value', 'lock_u2', 'lock_u2_pwd') );
}

DAV_LOCK_DEMO ();
ACTION   RETVAL
VARCHAR  VARCHAR
_______________________________________________________________________________

Adding group lock_demo_grp:  107
Adding user lock_u1:  108
Adding user lock_u2:  109
Adding a collection:  171
Uploading /DAV/lock_demo/sample.htm:  1103
First user set a shared lock:  1545ce54-3599-11da-8697-8f3efbd86ef2
Second user set a shared lock:  15460590-3599-11da-8697-8f3efbd86ef2
Lock dump  
vector (
vector ('', 'S', '1545ce54-3599-11da-8697-8f3efbd86ef2', 604800, 108, 'user1@example.com'), 
vector ('', 'S', '15460590-3599-11da-8697-8f3efbd86ef2', 604800, 109, 'user2@example.com'))
First user tries to set an exclusive lock:  -8
Second user releases his lock:  15460590-3599-11da-8697-8f3efbd86ef2
First user sets an exclusive lock:  -8
First user releases his lock:  1545ce54-3599-11da-8697-8f3efbd86ef2
First user sets an exclusive lock:  1547251a-3599-11da-8697-8f3efbd86ef2
Second user tries to add a property to the resource:  -8
First user releases his shared:  1547251a-3599-11da-8697-8f3efbd86ef2
Second user adds a property to the resource:  1321
```

</div>

</div>

  

</div>

<div id="seealso_dav_api_add_01" class="refsect1">

## See Also

<a href="fn_dav_api_add.html" class="link"
title="DAV add &amp; update functions">DAV content add/update/delete
functions</a>

<a href="fn_dav_api_change.html" class="link"
title="DAV manipulation functions">DAV content manipulation
functions</a>

<a href="fn_dav_api_search.html" class="link"
title="DAV search functions">DAV search functions</a>

<a href="fn_dav_api_user.html" class="link"
title="WebDAV Users &amp; Groups administration">DAV user management
functions</a>

</div>

</div>
