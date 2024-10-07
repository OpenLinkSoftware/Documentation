<div id="fn_ftp_ls" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ftp_ls — FTP dir command; Virtuoso FTP client

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ftp_ls" class="funcsynopsis">

|                        |                                 |
|------------------------|---------------------------------|
| `any `**`ftp_ls`**` (` | in `server ` varchar ,          |
|                        | in `user ` varchar ,            |
|                        | in `pass ` varchar ,            |
|                        | in `remote_dir_name ` varchar , |
|                        | in `is_pasv ` integer `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ftp_ls" class="refsect1">

## Description

Virtuoso has FTP client functionality, that can be used inside
Virtuoso/PL. This Virtuoso function mimics the FTP dir command. As with
any PL, this can be combined with Web Services and SOAP.

</div>

<div id="params_ftp_ls" class="refsect1">

## Parameters

<div id="id89299" class="refsect2">

### server

The remote server address or IP Address.

</div>

<div id="id89302" class="refsect2">

### user

The username for authentication at the FTP server.

</div>

<div id="id89305" class="refsect2">

### pass

The accompanying password for authentication at the FTP server.

</div>

<div id="id89308" class="refsect2">

### remote_dir_name

The full path of the remote directory to list the contents of.

</div>

<div id="id89311" class="refsect2">

### is_pasv

Flag to specify whether to use passive mode. This can be one "1" for
passive mode, or zero "0" for active mode. One "1" is assumed by
default.

</div>

</div>

<div id="ret_ftp_ls" class="refsect1">

## Return Types

This function returns a vector of descriptions from the result of
performing the dir command on the remote server. If errors occur then
these will be returned instead.

</div>

<div id="errors_ftp_get_01" class="refsect1">

## Errors

This function will return any errors returned by the remote FTP server.

</div>

<div id="examples_ftp_ls" class="refsect1">

## Examples

<div id="ex_ftp_put" class="example">

**Example 24.120. Listing files on the remote FTP server**

<div class="example-contents">

The following command will send the vector of the descriptions of the
files in the virtuoso30 directory on the remote sever to the Virtuoso
debug console, assuming the server was started with the -d or +debug
option:

``` screen
select dbg_obj_print(ftp_ls ('ftp.openlinksw.com', 'user_name', 'password', 'virtuoso30'));
```

</div>

</div>

  

</div>

<div id="seealso_ftp_ls" class="refsect1">

## See Also

<a href="fn_ftp_put.html" class="link" title="ftp_put"><code
class="function">ftp_put() </code></a>

<a href="fn_ftp_get.html" class="link" title="ftp_get"><code
class="function">ftp_get() </code></a>

</div>

</div>
