<div>

<div>

<div>

<div>

### 19.7.2. FTP Server

</div>

</div>

</div>

Virtuoso can provide FTP access to its WebDAV repository. This FTP
server functionality relies on the same credentials and permissions that
WebDAV uses. The server is enabled by listing the `FTPServerPort`
parameter in the `HTTPServer` section of the Virtuoso INI file. This
parameter must be accompanied by a port number to listen at.

``` programlisting
[HTTPServer]
FTPServerPort = 21
```

Will instruct Virtuoso to listen for FTP requests on the default FTP
port of 21.

``` programlisting
[HTTPServer]
...
FTPServerTimeout = 600
...
```

To control timeout of connections use "FTPServerTimeout" ini parameter.
The default time out is 600 sec. This is only for command connection.

The Virtuoso FTP server can be instructed to create a session log file
using the parameter:

``` programlisting
[HTTPServer]
...
FTPServerLogFile = ftpserver
...
```

If specified Virtuoso will produce an FTP server log file with the date
appended to the name given in the parameter and the files extension as
".log". The log file is rotated daily. It will contain the following
information:

`ftpserverDDMMYYYY.log` :-

|                      |
|----------------------|
| Client Host Name     |
| Authorized User      |
| Time                 |
| User Command         |
| Server Response Code |
| Bytes Transferred    |

An example of which is:

``` programlisting
hostname anonymous [22/Oct/2003:15:21:43 +0300] "PASS user@domain.com" 230 0
hostname anonymous [22/Oct/2003:15:23:11 +0300] "LIST" 226 162
hostname dav [22/Oct/2003:15:25:00 +0300] "PASS <hidden>" 230 0
```

Virtuoso can allow special "anonymous" user access to the FTP Server by
supplying the following Virtuoso INI file parameter:

``` programlisting
[HTTPServer]
...
FTPServerAnonymousLogin = 0
...
```

The anonymous user is not a real user, it has no SQL or DAV login
ability. The anonymous user can only access collections or resources
that are set to public. The password of the anonymous user is trivially
checked to contain the "@" symbol and is shown in plain-text for the
"PASS" command detailed in the log file. Valid DAV users passwords are
never revealed in the FTP log file. By default anonymous login is
denied.

``` programlisting
[HTTPServer]
...
FTPServerAnonymousHome = /DAV/dir_name/
...
```

You can control the anonymous user home dir by "FTPServerAnonymousHome"
parameter in the ini fail. By default home dir for anonymous user is DAV
root dir.

The Virtuoso server supports the usual variety of commands such as:

``` programlisting
USER    PASS    CWD     CDUP    HELP
QUIT    PORT    PASV    TYPE    NOOP
STOR    RNFR    RNTO    MODE    RETR
DELE    RMD     MKD     PWD     SYST
SIZE    LIST    NLST    ABOR
```

By default the server uses free ports within the range 20000 - 30000 for
passive mode connections. This is configurable using the parameters:
`FTPServerMinFreePort` and `FTPServerMaxFreePort` in the `HTTPServer`
section of the Virtuoso INI file.

The FTP server root directory is the home directory of the authenticated
DAV user.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="http://www.rfc-editor.org/rfc/rfc959.txt" class="ulink"
target="_top">RFC-959</a></p>
<p><a href="http://www.rfc-editor.org/rfc/rfc2389.txt" class="ulink"
target="_top">RFC-2389</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
