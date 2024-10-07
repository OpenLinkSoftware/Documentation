<div id="fn_ftp_put" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ftp_put — FTP put command; Virtuoso FTP client

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ftp_put" class="funcsynopsis">

|                             |                                  |
|-----------------------------|----------------------------------|
| `integer `**`ftp_put`**` (` | in `server ` varchar ,           |
|                             | in `user ` varchar ,             |
|                             | in `pass ` varchar ,             |
|                             | in `local_file_name ` varchar ,  |
|                             | in `remote_file_name ` varchar , |
|                             | in `is_pasv ` integer `)`;       |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ftp_put" class="refsect1">

## Description

Virtuoso has FTP client functionality, that can be used inside
Virtuoso/PL. This Virtuoso function mimics the FTP put command. As with
any PL, this can be combined with Web Services and SOAP.

</div>

<div id="params_ftp_put" class="refsect1">

## Parameters

<div id="id89363" class="refsect2">

### server

The remote server address or IP Address.

</div>

<div id="id89366" class="refsect2">

### user

The username for authentication at the FTP server.

</div>

<div id="id89369" class="refsect2">

### pass

The accompanying password for authentication at the FTP server.

</div>

<div id="id89372" class="refsect2">

### local_file_name

The full path and file name of the local file to be uploaded. This is
relative to the server root directory. This directory must be included
in DirsAllowed ACL list in the Virtuoso.INI file.

</div>

<div id="id89375" class="refsect2">

### remote_file_name

Full path and file name to the file on the FTP server to be uploaded.

</div>

<div id="id89378" class="refsect2">

### is_pasv

Flag to specify whether to use passive mode. This can be one "1" for
passive mode, or zero "0" for active mode. One "1" is assumed by
default.

</div>

</div>

<div id="ret_ftp_put" class="refsect1">

## Return Types

This function returns either 1 for success, or the error returned from
the server.

</div>

<div id="errors_ftp_get_02" class="refsect1">

## Errors

This function will return any errors returned by the remote FTP server.

</div>

<div id="examples_ftp_put" class="refsect1">

## Examples

<div id="ex_ftp_put_01" class="example">

**Example 24.121. Uploading a file to an FTP server**

<div class="example-contents">

To upload the file virtuoso30.tar.gz to the ftp server
ftp.openlinksw.com, one can use:

``` screen
select ftp_put ('ftp.openlinksw.com', 'user_name', 'password', 'virtuoso30.tar.gz', 'virtuoso30.tar.gz');
```

This will upload the file that occurs on the local server root
directory, and save it to the remote servers root directory.

</div>

</div>

  

</div>

<div id="seealso_ftp_put" class="refsect1">

## See Also

<a href="fn_ftp_put.html" class="link" title="ftp_put"><code
class="function">ftp_put() </code></a>

<a href="fn_ftp_ls.html" class="link" title="ftp_ls"><code
class="function">ftp_ls() </code></a>

</div>

</div>
