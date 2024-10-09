<div>

<div>

</div>

<div>

## Name

DAV_COPY , DAV_MOVE , DAV_PROP_SET , DAV_PROP_REMOVE — Functions for
manipulating an existing DAV collection or resource

</div>

<div>

## Synopsis

<div>

|                              |                             |
|------------------------------|-----------------------------|
| `integer `**`DAV_COPY`**` (` | in `path ` varchar ,        |
|                              | in `destination ` varchar , |
|                              | in `overwrite ` integer ,   |
|                              | in `permissions ` varchar , |
|                              | in `uname ` varchar ,       |
|                              | in `gname ` varchar ,       |
|                              | in `auth_uname ` varchar ,  |
|                              | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                              |                             |
|------------------------------|-----------------------------|
| `varchar `**`DAV_MOVE`**` (` | in `path ` varchar ,        |
|                              | in `destination ` varchar , |
|                              | in `overwrite ` integer ,   |
|                              | in `auth_uname ` varchar ,  |
|                              | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                  |                             |
|----------------------------------|-----------------------------|
| `integer `**`DAV_PROP_SET`**` (` | in `path ` varchar ,        |
|                                  | in `propname ` varchar ,    |
|                                  | in `propvalue ` any ,       |
|                                  | in `auth_uname ` varchar ,  |
|                                  | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                     |                             |
|-------------------------------------|-----------------------------|
| `varchar `**`DAV_PROP_REMOVE`**` (` | in `path ` varchar ,        |
|                                     | in `propname ` varchar ,    |
|                                     | in `silent ` integer ,      |
|                                     | in `auth_uname ` varchar ,  |
|                                     | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

DAV_COPY copies the resource or collection taken from path to the
destination. returns COL_ID or RES_ID on success.

DAV_MOVE moves the collection or resource to the destination path
returns 1 on success.

DAV_PROP_SET defines or updates the property with name *`propname`* with
*`propvalue`* . Returns PROP_ID on success.

DAV_PROP_GET returns the value of previously defined property with name
*`propname`* .

DAV_PROP_REMOVE removal of the existing property on target path. If
silent supplied then no error will be returned.

Some attributes of resources and collections are accessible as
predefined properties. E.g., owner user ID of the resource can be
retrieved or changed by `DAV_PROP_GET` or `DAV_PROP_SET` with
*`propname`* equal to ':virtowneruid'. Some of these properties are
read-only for all resources, some are writable for some but not for all
resources. Names of all predefined properties starts with ':' so
application-specific properties should not start with colon. Moreover,
it is strongly suggested to use "unqualified XML names" as property
names, otherwise PROPGET and PROPPATH DAV requests may return invalid
XML responses. *`propname `* .

</div>

<div>

## Parameters

<div>

### path

Directory and name of source to be operated on.

</div>

<div>

### destination

Directory and name of destination.

</div>

<div>

### overwrite

If non zero then overwrite is enabled. Default is 0.

</div>

<div>

### permissions

Access permission of Dav collection or resource. Defaults to
'110100000R' if not supplied.

</div>

<div>

### propname

Property name.

</div>

<div>

### propvalue

Property value.

</div>

<div>

### silent

If specified as non zero, then no error will be returned. Default is 0,
so errors are returned.

</div>

<div>

### uname

User identifier. Default is 'dav'.

</div>

<div>

### gname

Group identifier. Default is 'dav'.

</div>

<div>

### auth_uname

Administration user capable of performing the operation. Default is
null.

</div>

<div>

### auth_pwd

Password of Administrator. Default is null.

</div>

</div>

<div>

## System Properties

Names of 'standard live properties' matches tag names used in PROPFIND
response for same purposes.

Names of virtuoso-specific system properties starts with ':virt'
substring.

In the table below, 'Read/Write' access type means that the application
can try to set the property. This does not mean that the property can be
successfully changed for any particular resource or collection.

<div>

**Table 24.18. System properties supported by DAV_PROP_GET and
DAV_PROP_SET functions**

<div>

| propname          | Access Type | Data Type      | Description                                                                         |
|-------------------|-------------|----------------|-------------------------------------------------------------------------------------|
| :getlastmodified  | Read/Write  | datetime       | Time of the last modification.                                                      |
| :creationdate     | Read/Write  | datetime       | Time of creation.                                                                   |
| :lastaccessed     | Read Only   | datetime       | Time of the last access to the resource, may be inaccurate by a large amount.       |
| :getetag          | Read Only   | varchar        | The value of 'Etag' field of response header as reported by HEAD HTTP request.      |
| :getcontenttype   | Read/Write  | varchar        | MIME type of the resource ('dav/unix-directory' for collections).                   |
| :getcontentlength | Read Only   | integer        | Resource length in bytes. 0 for collections.                                        |
| :resourcetype     | Read Only   | XML entity     | '\<D:collection/\>' for collections, NULL for resources.                            |
| :virtowneruid     | Read/Write  | integer        | User ID of resource owner user.                                                     |
| :virtownergid     | Read/Write  | integer        | Group ID of resource owner group.                                                   |
| :virtpermissions  | Read/Write  | char(10)       | Access permissions string.                                                          |
| :virtacl          | Read/Write  | long varbinary | Access Control List.                                                                |
| :virtdet          | Read/Write  | varchar        | DAV Extension Type of special collection, NULL for plain collections and resources. |

</div>

</div>

  

Note that the value of 'Etag' field depends on ':getlastmodified' value.
Some HTTP clients, such as download managers, web indexing robots and
proxy servers, use 'Etag' field to support caching and/or partial
document transfer. It is unsafe to decrement ':getlastmodified' because
it can confuse such clients.

Only resource/collection owner or DAV administrator can change
':virtowneruid', ':virtownergid', ':virtpermissions' and ':virtacl'.

Only DAV administrator can change ':virtdet' property.

</div>

<div>

## Errors

<div>

**Table 24.19. Errors signalled by DAV\_\* functions**

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

**Example 24.77. Copy and move operations**

<div>

Renaming of the resource and copy the folder. After executing the
commands in the http://\[host:port\]/DAV/user/B/ we will show the
resource B.txt

``` screen
-- initial upload
SQL> select DB.DBA.DAV_COL_CREATE ('/DAV/user/','110100000R', 'dav','dav','dav','dav');
SQL> select DB.DBA.DAV_COL_CREATE ('/DAV/user/A/','110100000R','dav','dav','dav','dav');
SQL> select DB.DBA.DAV_RES_UPLOAD ('/DAV/user/A/A.txt','this is a test','text/plain','110100000R','dav','dav','dav','dav');
SQL> DB.DBA.DAV_MOVE('/DAV/user/A/A.txt', '/DAV/user/A/B.txt', 1,'dav','dav');
SQL> DB.DBA.DAV_COPY('/DAV/user/A/', '/DAV/user/B/', 1, '110110000R','dav','dav','dav','dav');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dav_api_add.html" class="link"
title="DAV add &amp; update functions">DAV content add/update/delete
functions</a>

<a href="fn_dav_api_lock.html" class="link"
title="DAV lock manipulation functions">DAV lock manipulation
functions</a>

<a href="fn_dav_api_search.html" class="link"
title="DAV search functions">DAV search functions</a>

<a href="fn_dav_api_user.html" class="link"
title="WebDAV Users &amp; Groups administration">DAV user management
functions</a>

</div>

</div>
