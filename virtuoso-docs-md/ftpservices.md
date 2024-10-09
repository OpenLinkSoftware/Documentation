<div>

<div>

<div>

<div>

## 19.7. FTP Services

</div>

</div>

</div>

Virtuoso provides both FTP client and server functionality. The Virtuoso
FTP client functions allow for programmatic access to ftp servers from
Virtuoso/ PL to list, submit and retrieve files from an FTP server. The
Virtuoso FTP server provides FTP access to the Virtuoso WebDAV
repository using the same authentication and permissions system as
WebDAV, and an configurable anonymous user access.

<div>

<div>

<div>

<div>

### 19.7.1. FTP Client

</div>

</div>

</div>

Virtuoso provides three functions that mimic their FTP command
counterparts. These are:

|                                                                                           |
|-------------------------------------------------------------------------------------------|
| <a href="fn_ftp_get.html" class="link" title="ftp_get"><code                              
 class="function">ftp_get()</code></a> - to retrieve a file from an FTP server.             |
| <a href="fn_ftp_put.html" class="link" title="ftp_put"><code                              
 class="function">ftp_put()</code></a> - to submit a file to an FTP server.                 |
| <a href="fn_ftp_ls.html" class="link" title="ftp_ls"><code                                
 class="function">ftp_ls()</code></a> - list the contents of a directory on an FTP server.  |

The Virtuoso client uses free ports within the range 20000 - 30000 for
active mode connections. This is configurable using the parameters:
`FTPServerMinFreePort` and `FTPServerMaxFreePort` in the `HTTPServer`
section of the Virtuoso INI file.

</div>

</div>
