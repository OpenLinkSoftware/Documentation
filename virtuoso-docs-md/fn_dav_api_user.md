<div id="fn_dav_api_user" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DAV_ADD_USER , DAV_DELETE_USER , DAV_HOME_DIR , DAV_ADD_GROUP ,
DAV_DELETE_GROUP — Functions for manipulating an existing DAV collection
or resource

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dav_add_user" class="funcsynopsis">

|                                  |                             |
|----------------------------------|-----------------------------|
| `integer `**`DAV_ADD_USER`**` (` | in `uid ` varchar ,         |
|                                  | in `pwd ` varchar ,         |
|                                  | in `gid ` varchar ,         |
|                                  | in `permis ` varchar ,      |
|                                  | in `disable ` integer ,     |
|                                  | in `home ` varchar ,        |
|                                  | in `full_name ` varchar ,   |
|                                  | in `email ` varchar ,       |
|                                  | in `uid ` varchar ,         |
|                                  | in `auth_uid ` varchar ,    |
|                                  | in `auth_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_delete_user" class="funcsynopsis">

|                                     |                             |
|-------------------------------------|-----------------------------|
| `varchar `**`DAV_DELETE_USER`**` (` | in `uid ` varchar ,         |
|                                     | in `auth_uid ` varchar ,    |
|                                     | in `auth_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_home_dir" class="funcsynopsis">

|                                  |                        |
|----------------------------------|------------------------|
| `varchar `**`DAV_HOME_DIR`**` (` | in `uid ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_add_group" class="funcsynopsis">

|                                   |                             |
|-----------------------------------|-----------------------------|
| `integer `**`DAV_ADD_GROUP`**` (` | in `gid ` varchar ,         |
|                                   | in `auth_uid ` varchar ,    |
|                                   | in `auth_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dav_delete_group" class="funcsynopsis">

|                                      |                             |
|--------------------------------------|-----------------------------|
| `varchar `**`DAV_DELETE_GROUP`**` (` | in `gid ` varchar ,         |
|                                      | in `auth_uid ` varchar ,    |
|                                      | in `auth_pwd ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dav_api_user" class="refsect1">

## Description

DAV_ADD_USER() create a new WebDAV user with login name 'uid' and
password 'pwd'. User will belong to the group named 'gid'. 'perms' are
the default user permissions for creation of new resources. Additional
user info supplied is 'home' directory, 'full name' and 'e-mail'.

DAV_DELETE_USER() remove the existing webDAV user named 'uid'.

DAV_HOME_DIR() returns the home folder for specified WebDAV user named
'uid'.

DAV_ADD_GROUP() create a new webDAV group named 'gid'.

DAV_DELETE_GROUP() remove the existing webDAV group named 'gid'.

</div>

<div id="params_dav_api_user" class="refsect1">

## Parameters

<div id="id85333" class="refsect2">

### uid

User identifier. Default is 'dav'.

</div>

<div id="id85336" class="refsect2">

### pwd

Password

</div>

<div id="id85339" class="refsect2">

### gid

Group identifier. Default is 'dav'.

</div>

<div id="id85342" class="refsect2">

### perms

Permissions

</div>

<div id="id85345" class="refsect2">

### disable

Disable flag

</div>

<div id="id85348" class="refsect2">

### home

The User's home directory path

</div>

<div id="id85351" class="refsect2">

### full_name

Full name of user

</div>

<div id="id85354" class="refsect2">

### email

User's email

</div>

<div id="id85357" class="refsect2">

### auth_uid

Administration user capable of performing the operation. Default is
null.

</div>

<div id="id85360" class="refsect2">

### auth_pwd

Password of Administrator. Default is null.

</div>

</div>

<div id="errors_dav_api_user" class="refsect1">

## Errors

<div id="id85365" class="table">

**Table 24.22. Errors signalled by DAV\_\* functions**

<div class="table-contents">

| Error Code                           | Description                                                                                                              |
|--------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">\>=0 </span> | <span class="errortext">success </span>                                                                                  |
| <span class="errorcode">-1 </span>   | <span class="errortext">The path (target of operation) is not valid </span>                                              |
| <span class="errorcode">-2 </span>   | <span class="errortext">The destination (path) is not valid </span>                                                      |
| <span class="errorcode">-3 </span>   | <span class="errortext">Overwrite flag is not set and destination exists </span>                                         |
| <span class="errorcode">-4 </span>   | <span class="errortext">The target is resource, but source is collection (in copy move operations) </span>               |
| <span class="errorcode">-5 </span>   | <span class="errortext">Permissions are not valid </span>                                                                |
| <span class="errorcode">-6 </span>   | <span class="errortext">uid is not valid </span>                                                                         |
| <span class="errorcode">-7 </span>   | <span class="errortext">gid is not valid </span>                                                                         |
| <span class="errorcode">-8 </span>   | <span class="errortext">Target is locked </span>                                                                         |
| <span class="errorcode">-9 </span>   | <span class="errortext">Destination is locked </span>                                                                    |
| <span class="errorcode">-10 </span>  | <span class="errortext">Property name is reserved (protected or private) </span>                                         |
| <span class="errorcode">-11 </span>  | <span class="errortext">Property does not exists </span>                                                                 |
| <span class="errorcode">-12 </span>  | <span class="errortext">Authentication failed </span>                                                                    |
| <span class="errorcode">-13 </span>  | <span class="errortext">Operation is forbidden (the authenticated user do not have a permissions for the action) </span> |
| <span class="errorcode">-14 </span>  | <span class="errortext">the target type is not valid </span>                                                             |
| <span class="errorcode">-15 </span>  | <span class="errortext">The umask is not valid </span>                                                                   |
| <span class="errorcode">-16 </span>  | <span class="errortext">The property already exists </span>                                                              |
| <span class="errorcode">-17 </span>  | <span class="errortext">Invalid property value </span>                                                                   |
| <span class="errorcode">-18 </span>  | <span class="errortext">no such user </span>                                                                             |
| <span class="errorcode">-19 </span>  | <span class="errortext">no home directory </span>                                                                        |

</div>

</div>

  

</div>

<div id="examples_dav_api_user" class="refsect1">

## Examples

<div id="ex_dav_api_user_1" class="example">

**Example 24.80. WebDAV users operations**

<div class="example-contents">

The example will create a WebDAV user named 'davuser' belongs to the
group 'davgroup'. No home directory supplied. The user account is
enabled after operaion.

``` screen

SQL> DB.DBA.DAV_ADD_GROUP ('davgroup', 'dav', 'dav');
SQL> DB.DBA.DAV_ADD_USER ('davuser', 'secret', 'davgroup', '110100000', 0, NULL, 'Test User Account', 'nobody@foo.bar', 'dav', 'dav');
```

</div>

</div>

  

</div>

<div id="seealso_dav_api_user" class="refsect1">

## See Also

<a href="fn_dav_api_add.html" class="link"
title="DAV add &amp; update functions">DAV content add/update/delete
functions</a>

<a href="fn_dav_api_change.html" class="link"
title="DAV manipulation functions">DAV content manipulation
functions</a>

<a href="fn_dav_api_lock.html" class="link"
title="DAV lock manipulation functions">DAV lock manipulation
functions</a>

<a href="fn_dav_api_search.html" class="link"
title="DAV search functions">DAV search functions</a>

</div>

</div>
