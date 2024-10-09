<div>

<div>

</div>

<div>

## Name

DAV_COL_CREATE , DAV_RES_UPLOAD , DAV_DELETE — functions for adding,
updating, deleting of DAV collections or resources

</div>

<div>

## Synopsis

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| `integer `**`DAV_COL_CREATE`**` (` | in `path ` varchar ,        |
|                                    | in `permissions ` varchar , |
|                                    | in `uname ` varchar ,       |
|                                    | in `gname ` varchar ,       |
|                                    | in `auth_uname ` varchar ,  |
|                                    | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| `varchar `**`DAV_RES_UPLOAD`**` (` | in `path ` varchar ,        |
|                                    | in `content ` any ,         |
|                                    | in `type ` varchar ,        |
|                                    | in `permissions ` varchar , |
|                                    | in `uname ` varchar ,       |
|                                    | in `gname ` varchar ,       |
|                                    | in `auth_uname ` varchar ,  |
|                                    | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

<div>

|                                |                             |
|--------------------------------|-----------------------------|
| `integer `**`DAV_DELETE`**` (` | in `path ` varchar ,        |
|                                | in `silent ` integer ,      |
|                                | in `auth_uname ` varchar ,  |
|                                | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`DAV_COL_CREATE ` creates a new collection on path, with supplied
security permissions, returning a collection id (COL_ID) upon success.

`DAV_RES_UPLOAD ` creates or replaces an existing resource on path with
content, mime type and supplied security permissions. Returns a resource
id (RES_ID) on success.

`DAV_DELETE ` Removes an existing collection/resource. If *`silent`* is
set to a nonzero value, no errors codes will be returned. returns 1 on
success.

</div>

<div>

## Parameters

<div>

### path

Collection (directory) path and name of destination of upload.

</div>

<div>

### content

The resource data to upload.

</div>

<div>

### type

Mime type of the uploaded resource. Defaults to '' if not supplied.

</div>

<div>

### permissions

Access permission string of Dav collection or resource. Defaults to
'110100000R' if not supplied.

</div>

<div>

### silent

If non-zero, no errors will be returned. Default is 0, meaning errors
are returned.

</div>

<div>

### uname

Owner user name. Default is 'dav'.

</div>

<div>

### group name

Owner group name. Default is 'dav'.

</div>

<div>

### auth_uname

Name of administration user capable of performing the operation. default
is null.

</div>

<div>

### auth_pwd

Administrator password. Default is null.

</div>

</div>

<div>

## Errors

<div>

**Table 24.17. Errors signalled by DAV\_\* functions**

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

**Example 24.76. Creating a resource and collection**

<div>

The following example shows collection creation, resource upload and
removal. This sequence of commands would leave a resource A.txt in
`http://[host:port]/DAV/user/A/`

``` screen
SQL> select DB.DBA.DAV_COL_CREATE ('/DAV/user/','110100000R', 'dav','dav','dav','dav');
SQL> select DB.DBA.DAV_COL_CREATE ('/DAV/user/A/','110100000R','dav','dav','dav','dav');
SQL> select DB.DBA.DAV_RES_UPLOAD ('/DAV/user/A/A.txt','this is a test','text/plain','110100000R','dav','dav','dav','dav');
SQL> select DB.DBA.DAV_RES_UPLOAD ('/DAV/user/A/B.txt','this is a second test','text/plain','110100000R','dav','dav','dav','dav');
SQL> select DB.DBA.DAV_DELETE ('/DAV/user/A/B.txt', 0, 'dav', 'dav');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_dav_api_change.html" class="link"
title="DAV manipulation functions">DAV content manipulation
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
