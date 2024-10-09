<div>

<div>

</div>

<div>

## Name

ftp_ls — FTP dir command; Virtuoso FTP client

</div>

<div>

## Synopsis

<div>

|                        |                                 |
|------------------------|---------------------------------|
| `any `**`ftp_ls`**` (` | in `server ` varchar ,          |
|                        | in `user ` varchar ,            |
|                        | in `pass ` varchar ,            |
|                        | in `remote_dir_name ` varchar , |
|                        | in `is_pasv ` integer `)`;      |

<div>

 

</div>

</div>

</div>

<div>

## Description

Virtuoso has FTP client functionality, that can be used inside
Virtuoso/PL. This Virtuoso function mimics the FTP dir command. As with
any PL, this can be combined with Web Services and SOAP.

</div>

<div>

## Parameters

<div>

### server

The remote server address or IP Address.

</div>

<div>

### user

The username for authentication at the FTP server.

</div>

<div>

### pass

The accompanying password for authentication at the FTP server.

</div>

<div>

### remote_dir_name

The full path of the remote directory to list the contents of.

</div>

<div>

### is_pasv

Flag to specify whether to use passive mode. This can be one "1" for
passive mode, or zero "0" for active mode. One "1" is assumed by
default.

</div>

</div>

<div>

## Return Types

This function returns a vector of descriptions from the result of
performing the dir command on the remote server. If errors occur then
these will be returned instead.

</div>

<div>

## Errors

This function will return any errors returned by the remote FTP server.

</div>

<div>

## Examples

<div>

**Example 24.120. Listing files on the remote FTP server**

<div>

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

<div>

## See Also

<a href="fn_ftp_put.html" class="link" title="ftp_put"><code
class="function">ftp_put() </code></a>

<a href="fn_ftp_get.html" class="link" title="ftp_get"><code
class="function">ftp_get() </code></a>

</div>

</div>
