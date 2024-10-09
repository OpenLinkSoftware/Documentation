<div>

<div>

</div>

<div>

## Name

ftp_get — FTP get command; Virtuoso FTP client

</div>

<div>

## Synopsis

<div>

|                             |                                  |
|-----------------------------|----------------------------------|
| `integer `**`ftp_get`**` (` | in `server ` varchar ,           |
|                             | in `user ` varchar ,             |
|                             | in `pass ` varchar ,             |
|                             | in `remote_file_name ` varchar , |
|                             | in `local_file_name ` varchar ,  |
|                             | in `is_pasv ` integer `)`;       |

<div>

 

</div>

</div>

</div>

<div>

## Description

Virtuoso has FTP client functionality, that can be used inside
Virtuoso/PL. This Virtuoso function mimics the FTP get command. As with
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

### remote_file_name

Full path and file name to the file on the FTP server to be downloaded.

</div>

<div>

### local_file_name

The full path and file name of the local save point. This is relative to
the server root directory. This directory must be included in
DirsAllowed ACL list in the Virtuoso.INI file.

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

This function returns the size of the file written to the local file
system.

</div>

<div>

## Errors

This function will return any errors returned by the remote FTP server.

</div>

<div>

## Examples

<div>

**Example 24.119. Retrieving a file from an FTP server**

<div>

To get the file virtuoso30.tar.gz from the ftp server
ftp.openlinksw.com, one can use:

``` screen
select ftp_get ('ftp.openlinksw.com', 'user_name', 'password', 'virtuoso30.tar.gz', 'virtuoso30.tar.gz');
```

This will download the file which occurs on the root directory of the
server, and save it to the local server root directory.

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_ftp_put.html" class="link" title="ftp_put"><code
class="function">ftp_put() </code></a>

<a href="fn_ftp_ls.html" class="link" title="ftp_ls"><code
class="function">ftp_ls() </code></a>

</div>

</div>
