<div id="xmlstoragesystem" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.12. xmlStorageSystem API

</div>

</div>

</div>

xmlStorageSystem is an Web storage system for documents that are
programmable over XML-RPC and SOAP 1.1. Uploaded files are accessible
via HTTP. xmlStorageSystem has methods that allow users to register with
the service; upload a set of files; query the server to find out its
capabilities; and to register a notification request.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                    |
|:--------------------------:|:---------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                          |
|                            | <a href="xmlrpc.html" class="link"                 
                              title="17.10. XML-RPC support">XML-RPC section</a>  |

</div>

The API methods are:

|                                                                       |
|-----------------------------------------------------------------------|
| <a href="fn_xmlstoragesystem.registeruser.html" class="link"          
 title="xmlStorageSystem.registerUser"><code                            
 class="function">xmlStorageSystem.registerUser()</code></a>            |
| <a href="fn_xmlstoragesystem.mailpasswordtouser.html" class="link"    
 title="xmlStorageSystem.mailPasswordToUser"><code                      
 class="function">xmlStorageSystem.mailPasswordToUser()</code></a>      |
| <a href="fn_xmlstoragesystem.getservercapabilities.html" class="link" 
 title="xmlStorageSystem.getServerCapabilities"><code                   
 class="function">xmlStorageSystem.getServerCapabilities()</code></a>   |
| <a href="fn_xmlstoragesystem.deletemultiplefiles.html" class="link"   
 title="xmlStorageSystem.deleteMultipleFiles"><code                     
 class="function">xmlStorageSystem.deleteMultipleFiles()</code></a>     |
| <a href="fn_xmlstoragesystem.savemultiplefiles.html" class="link"     
 title="xmlStorageSystem.saveMultipleFiles"><code                       
 class="function">xmlStorageSystem.saveMultipleFiles()</code></a>       |
| `xmlStorageSystem.requestNotification()`                              |

<div id="xssreltodav" class="section">

<div class="titlepage">

<div>

<div>

#### Relation to the WebDAV Repository

</div>

</div>

</div>

The xmlStorageSystem stores uploaded files in the WebDAV repository.
Upon user registration a "blog" sub-folder will be created in the
user-account home directory, into which these files will be uploaded and
stored using the xmlStorageSystem API.

**Authentication. ** The XML Storage System uses WebDAV enabled accounts
to authenticate. The passwords sent via the xmlStorageSystem API (except
registerUser, see below) must be an MD5 hash of the real user password.
In this way clear text password cannot be captured from network
sniffers.

**Cloud notification services. ** The aggregators scan for changes in an
interval, but in some situations we want to know when a channel has
changed immediately. Notification makes it possible to always be in sync
with bandwidth conservation and unneeded loops. This is possible to
register an aggregator using a xmlStorageSystem.requestNotification
function, also to make aggregator to know about such service it's
parameters are exposed in \<cloud\> sub-element of \<channel\> of the
RSS files. The notification works as follows: aggregator gets registered
via xmlStorageSystem.requestNotification; Then if a registered link
changes, the aggregator will be notified via specified protocol and
method. The aggregator needs to register itself every 24 hour, otherwise
the registration will expire. For full explanation of the cloud element
of RSS file see reference at
"http://backend.userland.com/rss#ltcloudgtSubelementOfLtchannelgt".

</div>

<div id="xssenabledvirtdir" class="section">

<div class="titlepage">

<div>

<div>

#### Enabling XML Storage System in a Virtual Directory

</div>

</div>

</div>

The XML Storage System can be enabled by creating a virtual directory as
a SOAP enabled directory, where the SOAP users is set to DBA or any
other user granted execute permissions to the xmlStorageSystem methods.

<div id="ex_xssvirtdir" class="example">

**Example 14.63. Enabling an xmlStorageSystem Virtual Directory**

<div class="example-contents">

via ISQL tool:

``` programlisting
  SQL> vhost_define (lpath=>'/xmlStorageSystem', ppath=>'/SOAP/',
      soap_user=>'dba');
```

</div>

</div>

  

The xmlStorageSystem takes into account the following user options:

|                                                               |
|---------------------------------------------------------------|
| maxFileSize, integer - maximum file length allowed for upload |
| maxBytesPerUser, integer - maximum total bytes                |

These are set upon initial registration to 1Mb/40Mb respectively and can
be changed via the Visual Server Administration Interface -\> WebDAV -\>
WebDAV users -\> Options link.

</div>

</div>
