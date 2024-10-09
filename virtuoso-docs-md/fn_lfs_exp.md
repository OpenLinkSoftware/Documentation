<div>

<div>

</div>

<div>

## Name

LFS_EXP — Export retrieved web site to the local file system

</div>

<div>

## Synopsis

<div>

|                            |                        |
|----------------------------|------------------------|
| `WS.WS. `**`LFS_EXP`**` (` | in `host ` varchar ,   |
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

absolute path to the file system directory to export content to

</div>

</div>

<div>

## Return Types

The function returns a non-zero value (can be an error description) if
an error occurred while exporting.

</div>

<div>

## Examples

<div>

**Example 24.206. Exporting to the Filesystem**

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

<a href="fn_dav_exp.html" class="link" title="DAV_EXP">WS.WS.DAV_EXP</a>

</div>

</div>
