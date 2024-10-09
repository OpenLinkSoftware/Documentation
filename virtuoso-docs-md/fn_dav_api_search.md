<div>

<div>

</div>

<div>

## Name

DAV_SEARCH_ID , DAV_SEARCH_PATH , DAV_DIR_LIST — Functions for searching
a DAV collection or resource

</div>

<div>

## Synopsis

<div>

|                                   |                         |
|-----------------------------------|-------------------------|
| `integer `**`DAV_SEARCH_ID`**` (` | in `path ` varchar ,    |
|                                   | in `what ` char(1) `)`; |

<div>

 

</div>

</div>

<div>

|                                     |                         |
|-------------------------------------|-------------------------|
| `varchar `**`DAV_SEARCH_PATH`**` (` | in `id ` integer ,      |
|                                     | in `what ` char(1) `)`; |

<div>

 

</div>

</div>

<div>

|                              |                             |
|------------------------------|-----------------------------|
| `any `**`DAV_DIR_LIST`**` (` | in `path ` varchar ,        |
|                              | in `recursive ` integer ,   |
|                              | in `auth_uid ` varchar ,    |
|                              | in `auth_pwd ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

DAV_SEARCH_ID() returns the RES_ID or COL_ID, depending on the '*`what`*
' parameter passed. ('R'esource or 'C'ollection or 'P'arent collection).

DAV_SEARCH_PATH() returns full path string of resource or collection,
depending on parameter passed. ('R'esource or 'C'ollection or 'P'arent
collection).

DAV_DIR_LIST() returns an array of arrays that contains the following
information about the requested path:

|                                                           |
|-----------------------------------------------------------|
| fullpath                                                  |
| type ('r' or 'c') which indicates resource or collection. |
| length                                                    |
| modification time                                         |
| id                                                        |
| permissions                                               |
| group id                                                  |
| owner id                                                  |
| created                                                   |
| mime type                                                 |

</div>

<div>

## Parameters

<div>

### path

Name of DAV location to search.

</div>

<div>

### what

The type of DAV item to search for: 'R' for resource, 'C' for collection
or 'P' for parent collection.

</div>

<div>

### id

Identifier of resource or collection, for example from DAV_SEARCH_ID().

</div>

<div>

### recursive

If non zero then recurse into subdirectories during the search. Default
is 0 which causes a search in current path only.

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

**Table 24.20. Errors signalled by DAV\_\* functions**

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

**Example 24.79. Searching in WebDAV**

<div>

The example shows retrieval of the resource id by given path string

``` screen
SQL> select DB.DBA.DAV_SEARCH_ID ('/DAV/','c');
callret
VARCHAR
_______________________________________________________________________________

1

SQL> select DB.DBA.DAV_SEARCH_PATH (1,'c');
callret
VARCHAR
_______________________________________________________________________________

/DAV/
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

<a href="fn_dav_api_user.html" class="link"
title="WebDAV Users &amp; Groups administration">DAV user management
functions</a>

</div>

</div>
