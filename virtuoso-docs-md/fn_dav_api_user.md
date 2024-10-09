<div>

<div>

</div>

<div>

## Name

DAV_ADD_USER , DAV_DELETE_USER , DAV_HOME_DIR , DAV_ADD_GROUP ,
DAV_DELETE_GROUP — Functions for manipulating an existing DAV collection
or resource

</div>

<div>

## Synopsis

<div>

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

<div>

 

</div>

</div>

<div>

|                                     |                             |
|-------------------------------------|-----------------------------|
| `varchar `**`DAV_DELETE_USER`**` (` | in `uid ` varchar ,         |
|                                     | in `auth_uid ` varchar ,    |
|                                     | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                  |                        |
|----------------------------------|------------------------|
| `varchar `**`DAV_HOME_DIR`**` (` | in `uid ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                   |                             |
|-----------------------------------|-----------------------------|
| `integer `**`DAV_ADD_GROUP`**` (` | in `gid ` varchar ,         |
|                                   | in `auth_uid ` varchar ,    |
|                                   | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                      |                             |
|--------------------------------------|-----------------------------|
| `varchar `**`DAV_DELETE_GROUP`**` (` | in `gid ` varchar ,         |
|                                      | in `auth_uid ` varchar ,    |
|                                      | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### uid

User identifier. Default is 'dav'.

</div>

<div>

### pwd

Password

</div>

<div>

### gid

Group identifier. Default is 'dav'.

</div>

<div>

### perms

Permissions

</div>

<div>

### disable

Disable flag

</div>

<div>

### home

The User's home directory path

</div>

<div>

### full_name

Full name of user

</div>

<div>

### email

User's email

</div>

<div>

### auth_uid

Administration user capable of performing the operation. Default is
null.

</div>

<div>

### auth_pwd

Password of Administrator. Default is null.

</div>

</div>

<div>

## Errors

<div>

**Table 24.21. Errors signalled by DAV\_\* functions**

<div>

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

<div>

## Examples

<div>

**Example 24.80. WebDAV users operations**

<div>

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

<div>

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
