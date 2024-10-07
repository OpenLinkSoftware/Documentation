<div id="fn_lfs_exp" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

LFS_EXP — Export retrieved web site to the local file system

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_lfs_exp" class="funcsynopsis">

|                            |                        |
|----------------------------|------------------------|
| `WS.WS. `**`LFS_EXP`**` (` | in `host ` varchar ,   |
|                            | in `url ` varchar ,    |
|                            | in `root ` varchar ,   |
|                            | in `dst ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_lfs_exp" class="refsect1">

## Description

This function is used to export local content retrieved from a Web Robot
Copy to the local file system.

</div>

<div id="params_lfs_exp" class="refsect1">

## Parameters

<div id="id95698" class="refsect2">

### host

The target host name

</div>

<div id="id95701" class="refsect2">

### url

start path on target

</div>

<div id="id95704" class="refsect2">

### root

local WebDAV collection that contains the retrieved content

</div>

<div id="id95707" class="refsect2">

### dst

absolute path to the file system directory to export content to

</div>

</div>

<div id="ret_lfs_exp" class="refsect1">

## Return Types

The function returns a non-zero value (can be an error description) if
an error occurred while exporting.

</div>

<div id="examples_lfs_exp" class="refsect1">

## Examples

<div id="ex_lfs_exp" class="example">

**Example 24.206. Exporting to the Filesystem**

<div class="example-contents">

``` programlisting
WS.WS.LFS_EXP ('www.foo.com', '/help/', 'sites/www_foo_com', '/tmp/');
WS.WS.DAV_EXP ('www.foo.com', '/help/', 'sites/www_foo_com',
  'http://www.mydrive.com:8990/DAV/sites/');
```

</div>

</div>

  

</div>

<div id="seealso_lfs_exp" class="refsect1">

## See Also

<a href="fn_dav_exp.html" class="link" title="DAV_EXP">WS.WS.DAV_EXP</a>

</div>

</div>
