<div id="pop3server" class="section">

<div class="titlepage">

<div>

<div>

### 19.3.2. POP3 Server

</div>

</div>

</div>

The Virtuoso POP3 Server implementation supports the following commands
as defined in RFC - 1939:

|      |
|------|
| DELE |
| LIST |
| NOOP |
| PASS |
| QUIT |
| RETR |
| RSET |
| STAT |
| TOP  |
| UIDL |
| USER |

The POP3 Server listening port is configured in the HTTP section of the
virtuoso.ini.

POP3Port = xxx, in HTTP section.

If the port is not defined in the configuration file then the POP3
server subsystem will be disabled.

Users and passwords of the POP3 Server are described in the system view
WS.WS.SYS_DAV_USER over SYS_USERS. These users can be administered from
the users section of the Virtuoso Administration User Interface.

The system table DB.DBA.MAIL_MESSAGE is used to stored the messages.

</div>
