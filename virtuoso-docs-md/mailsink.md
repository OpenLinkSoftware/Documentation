<div id="mailsink" class="section">

<div class="titlepage">

<div>

<div>

### 19.3.4. The Virtuoso Mail Sink

</div>

</div>

</div>

The Virtuoso Sink is used to store messages received by Windows 2000 IIS
SMTP Service into the MAIL_MESSAGES table in Virtuoso. It consists of an
executable, run as a service, and a VBscript for registering a COM
object with the IIS, interfacing it with the Virtuoso Sink

The User ID(s) in MAIL_MESSAGES to whom the message belongs to is
determined by parsing the <span class="command">**To:**</span> field in
the mail message into a list of recipients. For each entry in the list,
if an @-sign is found, the user ID will consist of the characters to the
left of it, otherwise the whole entry is used.

<div id="id1914" class="section">

<div class="titlepage">

<div>

<div>

#### Registry Entries for the Virtuoso Sink.

</div>

</div>

</div>

``` programlisting
<<<<<<<< VirtuosoSink.reg
REGEDIT4

[HKEY_LOCAL_MACHINE\SOFTWARE\OpenLink Software\VirtuosoSink]
"User"="dba"
"Password"="dba"
"DSN"="Virtuoso"
"ConnectionCount"=dword:00000001
>>>>>>>> VirtuosoSink.reg
```

These are the registry entries used by the Sink service. ConnectionCount
is the number of connections to Virtuoso to be pooled.

</div>

<div id="id1915" class="section">

<div class="titlepage">

<div>

<div>

#### Installation

</div>

</div>

</div>

Use these commands to install the Virtuoso Sink:

|                                                                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="command">**VirtuosoSink /RegServer**</span> Registers the COM Object VirtuosoSink.SMTP into the registry                                                                          |
| <span class="command">**VirtuosoSink /Service**</span> Creates the Service in Manual start mode                                                                                                |
| <span class="command">**cscript smtpreg.vbs /add 1 OnArrival Virtuoso_SMTP_Sink VirtuosoSink.SMTP "mail from=\*"**</span> - Registers the COM Object as a mail sink with the IIS SMTP service. |

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                              |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                    |
|                            | <a                                                                                                           
                              href="http://msdn.microsoft.com/library/psdk/cdosys/_cdosys_implementing_sinks_with_scripting_languages.htm"  
                              class="ulink" target="_top">The MSDN page</a> for more information about registering sinks.                   |

</div>

</div>

<div id="id1916" class="section">

<div class="titlepage">

<div>

<div>

#### Sink Operation

</div>

</div>

</div>

When the service starts it opens a pool of connections to Virtuoso and
waits for a COM event. When the COM callback gets called, the service
invokes a stored procedure and passes the message text to it. The
procedure then stores the message into the database. In event of lost
connection to the database, the service would try once to re-establish
it and re-execute the stored procedure call. Errors and successful
message routings are entered into the Windows 2000 Application Log.

</div>

</div>
