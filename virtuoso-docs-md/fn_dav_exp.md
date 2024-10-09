<div>

<div>

</div>

<div>

## Name

DAV_EXP — Export a retrieved Web site to another WebDAV enabled server

</div>

<div>

## Synopsis

<div>

|                            |                        |
|----------------------------|------------------------|
| `WS.WS. `**`DAV_EXP`**` (` | in `host ` varchar ,   |
|                            | in `url ` varchar ,    |
|                            | in `root ` varchar ,   |
|                            | in `dst ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to export local content retrieved from a Web Robot
Copy to the local file system.

</div>

<div>

## Parameters

<div>

### host

The target host name

</div>

<div>

### url

start path on target

</div>

<div>

### root

local WebDAV collection that contains the retrieved content

</div>

<div>

### dst

absolute URL to the WebDAV folder to export content to

</div>

</div>

<div>

## Return Types

The function returns a non-zero value (can be an error description) if
an error occurred while exporting.

</div>

<div>

## Errors

<div>

**Table 24.22. Errors signalled by DAV\_\* functions**

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

**Example 24.81. Exporting to the Filesystem**

<div>

``` programlisting
WS.WS.LFS_EXP ('www.foo.com', '/help/', 'sites/www_foo_com', '/tmp/');
WS.WS.DAV_EXP ('www.foo.com', '/help/', 'sites/www_foo_com',
  'http://www.mydrive.com:8990/DAV/sites/');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_lfs_exp.html" class="link" title="LFS_EXP"><code
class="function">WS.WS.LFS_EXP() </code></a>

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
