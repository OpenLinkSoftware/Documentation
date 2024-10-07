<div id="ch-internetservices" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 19. Internet Services

</div>

<div>

<div class="abstract">

**Abstract**

This section discusses Virtuoso's support for DAV, email, usenet news,
mime and other internet standards.

The WebDAV repository lets Virtuoso store and index content within the
database. This can then be accessible directly via the HTTP protocol.

This chapter describes the MIME extensions that have been implemented in
Virtuoso.

This covers examples of use of MIME for composition of MIME messages and
content for mail transit of HTTP output.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">19.1. [WebDAV
Server](ch-internetservices.html#webdavserver)</span>

<span class="section">19.1.1. [DAV User
Accounts](ch-internetservices.html#davaccountsforwebuser)</span>

<span class="section">19.1.2. [WebDAV
Authentication](ch-internetservices.html#davauth)</span>

<span class="section">19.1.3. [WebDAV Symbolic
Links](ch-internetservices.html#davsymboliclinks)</span>

<span class="section">19.1.4. [Access Right Permissions of Web
Resources](ch-internetservices.html#accesspermofwebres)</span>

<span class="section">19.1.5. [DAV and RDF
Metadata](ch-internetservices.html#davrdfmetadata)</span>

<span class="section">19.1.6. [Special Attributes of Web
Resources](ch-internetservices.html#customattofwebres)</span>

<span class="section">19.2. [URIQA Semantic Web
Enabler](uriqa.html)</span>

<span class="section">19.2.1. [URIQA HTTP
Methods](uriqa.html#uriqamethods)</span>

<span class="section">19.2.2. [URIQA Web Service](uriqaws.html)</span>

<span class="section">19.2.3. [URIQA Section in Virtuoso Configuration
File](uriqainifile.html)</span>

<span class="section">19.2.4. [URI Matching
Rules](uriqamatching.html)</span>

<span class="section">19.3. [Mail Delivery &
Storage](maildelivstore.html)</span>

<span class="section">19.3.1. [The SMTP
Client](maildelivstore.html#smtpclient)</span>

<span class="section">19.3.2. [POP3 Server](pop3server.html)</span>

<span class="section">19.3.3. [Storing Email in
Virtuoso](smtpreceipt.html)</span>

<span class="section">19.3.4. [The Virtuoso Mail
Sink](mailsink.html)</span>

<span class="section">19.4. [NNTP
Newsgroups](nntpnewsgroups.html)</span>

<span class="section">19.4.1. [NNTP
Client](nntpnewsgroups.html#nntpclient)</span>

<span class="section">19.4.2. [Commands and
Examples](commandsandexamples.html)</span>

<span class="section">19.5. [NNTP Server](newsserver.html)</span>

<span class="section">19.5.1. [Enabling the NNTP
Server](newsserver.html#newssrvenable)</span>

<span class="section">19.5.2. [NNTP Server
Commands](newssrvcmds.html)</span>

<span class="section">19.5.3. [Add Groups to NNTP
Server](newssrvadd_01.html)</span>

<span class="section">19.6. [MIME & Internet Messages](mime.html)</span>

<span class="section">19.6.1. [About Simple Internet (RFC 822)
Messages](mime.html#aboutinternetmsgs)</span>

<span class="section">19.6.2. [MIME Messages - Extension to Simple
Internet Messages](mimesupport.html)</span>

<span class="section">19.6.3. [S/MIME Support](smime.html)</span>

<span class="section">19.7. [FTP Services](ftpservices.html)</span>

<span class="section">19.7.1. [FTP
Client](ftpservices.html#ftpservicesclient)</span>

<span class="section">19.7.2. [FTP
Server](ftpservicesserver.html)</span>

<span class="section">19.8. [VSP Guide](vspguide.html)</span>

<span class="section">19.8.1.
[Introduction](vspguide.html#vspintro)</span>

<span class="section">19.8.2. [Simple HTML FORM
usage](htmlusage.html)</span>

<span class="section">19.8.3. [Interacting with the
Database](dbinteraction.html)</span>

<span class="section">19.8.4. [The Forums
Application](vspforumsapp.html)</span>

<span class="section">19.8.5. [Setting up server-side Cross-Origin
Resource Sharing (CORS) with Virtuoso](corsshare.html)</span>

<span class="section">19.9. [LDAP](ldap_overview_01.html)</span>

<span class="section">19.9.1. [LDAP
Client](ldap_overview_01.html#vldapclient)</span>

<span class="section">19.9.2. [LDAP Server](openldapinstall.html)</span>

</div>

<div id="webdavserver" class="section">

<div class="titlepage">

<div>

<div>

## 19.1. WebDAV Server

</div>

</div>

</div>

Virtuoso supports the WebDAV protocol, which is an extension of HTTP for
cooperative work on the Internet. DAV resources can be of any mime type,
including binary types. The DAV resources are stored in the Virtuoso
database as large objects, they are not in the file system and can only
be accessed through the DAV protocol. Direct SQL access to the DAV
tables is also possible, so there's a set of Virtuoso/PL procedures that
acts as DAV API to let server-side applications access DAV. Virtuoso DAV
can be extended by virtual collections. Instead of accessing DAV tables,
DAV server can retrieve data from applications, thus an application can
generate documents on demand and these documents will be available via
DAV as well as plain DAV resources. Moreover, resources can be submitted
directly to the application via DAV. Virtuoso DAV provides settable
access rights and ownership of resources. Access rights as such are not
covered by the DAV specification but Virtuoso implements both ACLs
(access control lists) and a Unix file system like scheme for ownership
and permissions. SQL accounts enabled for DAV are valid owners of DAV
resources. A resource has both a user owner and a group owner, plus an
optional access control list that can grant privileges to users and
roles alike. A user can have DAV-only access, SQL/ODBC-only access, both
of them or neither. User account information is stored in relational
tables and can be manipulated from SQL or through a Web UI.

Virtuoso DAV can store metadata about resources. These metadata are
extracted from resources automatically, and can be edited by users. In
addition, users can place public and personal 'tags' on resources to
categorize data according for personal needs without interference
between users. Virtuoso DAV has a powerful and scalable search engine
that let application locate resources that match given list of criteria.
The search can process both plain DAV resources and data published by
applications in virtual collections. Search criteria can check for
resource properties, content, metadata and tags.

Certain special processing is provided for the following types of DAV
resources:

|                                                                                                                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Any textual content types are automatically indexed in a free text index.                                                                                                                                             |
| Any XML content types are indexed in the same free text index as other text plus can be queried with the <span class="emphasis">*xcontains*</span> SQL predicate.                                                     |
| Some well-known types of documents are parsed in order to extract metadata, such as author of MS Office document or musical genre of MP3 audio file or resolution of an image.                                        |
| VSP/VSPX pages - DAV resources can be dynamic web pages written in VSP or VSPX. Requesting such a page with GET or POST will execute the logic on the page. This is very convenient way of building web applications. |

DAV resources are stored in an ordinary relational table. The text and
XML query features used with DAV are separately usable from SQL on any
table with the appropriate indexes and are thus not intrinsically
related to DAV.

WebDAV (Web Distributed Authoring and Versioning) is a communication
protocol for the Internet implemented as an extension to HTTP 1.1. The
WebDAV specification was published by the Internet Engineering Task
Force (IETF) in February 1999.

Most operating systems have support for accessing data hosted on DAV
servers.

DAV was designed to provide more methods for handling server resources.
In addition to the usual HTTP methods such as GET, POST, HEAD, PUT,
DELETE, OPTIONS are methods for making directories (or collections), a
lock mechanism, copying of resources and collections, predefined and
userd-defined properties of resources and collections.

DAV consists of HTTP extensions, often with a message body containing
XML. DAV also provides a basic schema for resource metadata by allowing
arbitrary XML properties to be attached to resources.

Virtuoso supports the following HTTP methods:

<div id="id65318" class="decimalstyle">

**Table 19.1. Features List - Virtuoso Web DAV HTTP Method Support**

<div class="decimalstyle-contents">

| HTTP Method                 | Description                                                                                                                                                                                                                                                                                                                                         |
|:----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| HEAD                        | Meta method for examining server properties or network behavior.                                                                                                                                                                                                                                                                                    |
| GET                         | Retrieves documents from the server                                                                                                                                                                                                                                                                                                                 |
| POST, PUT                   | Posts or puts documents on the server                                                                                                                                                                                                                                                                                                               |
| MKCOL                       | Creates a collection                                                                                                                                                                                                                                                                                                                                |
| MOVE                        | For moving resources and/or collections within the server                                                                                                                                                                                                                                                                                           |
| DELETE                      | Removes resources or collections of resources from the server                                                                                                                                                                                                                                                                                       |
| LOCK, UNLOCK                | Locks or unlocks a resource or collection to protect from modification by others                                                                                                                                                                                                                                                                    |
| PROPFIND, PROPPATCH         | Retrieves and sets properties for collections and/or resources. In addition to arbitrary user-defined properties, Virtuoso supports two sets of predefined properties: standard DAV properties (type, creation time, modification time, size etc.) and Virtuoso-specific DAV properties (access control, tags, extensions for virtual collections.) |
| MGET (experimental)         | Retrieves RDF metadata of a document according to URIQA rules                                                                                                                                                                                                                                                                                       |
| MPUT/MDELETE (experimental) | Updates RDF metadata of a document according to URIQA rules and appropriate RDF Schemas                                                                                                                                                                                                                                                             |

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0"
data-summary="Tip: See Also: External References">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also: External References</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="http://www.rfc-editor.org/rfc/rfc2616.txt" class="ulink"
target="_top">IETF RFC 2616 regarding HTTP 1.1</a></p>
<p><a href="http://www.rfc-editor.org/rfc/rfc2518.txt" class="ulink"
target="_top">IETF RFC 2518 regarding WebDAV Specification</a></p></td>
</tr>
</tbody>
</table>

</div>

<div id="davaccountsforwebuser" class="section">

<div class="titlepage">

<div>

<div>

### 19.1.1. DAV User Accounts

</div>

</div>

</div>

Any non-disabled SQL account with the U_DAV_ENABLE column set to
non-zero is a valid DAV account. The administration user interface
provides a check box for enabling DAV access and will make a default
home collection etc. Alternately, regular SQL can be used for setting
the DAV flag on. The DAV API or protocol requests can be used for
creating collections and resources for the user.

Any non-disabled SQL account with the U_DAV_ENABLE column set to
non-zero is a valid DAV account. The administration user interface
provides a check box for enabling DAV access and will make a default
home collection etc. Alternately, regular SQL can be used for setting
the DAV flag on. The DAV API or protocol requests can be used for
creating collections and resources for the user.

There is an automatically created initial DAV enabled account called
"dav". This has general administration privileges over all DAV.

There are four predefined DAV accounts.

|                                                                                                                                                                                                                                                                                                                           |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| User "dav" is the most powerful DAV account.                                                                                                                                                                                                                                                                              |
| DAV group "administrators" usually consists of "dav" only; membership in this group does not give any special privileges but this group is assigned by default to resources that are owned by "dav". Thus group access rights to resources owned by "dav" can be used solely by users that are added to "administrators". |
| User "nobody" is a special account that acts as owner of all resources that have no real owner person or owner application. It is impossible to log on as "nobody" so it's impossible to use owner permissions of the resource.                                                                                           |
| Group account "nogroup" always consists of only one user "nobody"; User "nobody" can not become a member of any other group. It is impossible to add other users to "nogroup" or add "nogroup" to some role.                                                                                                              |

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                      |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                |
|                              | The WebDAV admin user "dav" can be deleted. However, after a server restart the initial setting of this account will be added again. |

</div>

<div class="important" style="margin-left: 0.5in; margin-right: 0.5in;">

|                                        |                                                                                                                                                   |
|:--------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Important\]](images/important.png) | Important                                                                                                                                         |
|                                        | It is strongly recommended that the Virtuoso administrator change the default account password of the DAV administrative user after installation. |

</div>

<div id="davusrsbyhand" class="example">

**Example 19.1. Manipulating WebDAV Users By Hand**

<div class="example-contents">

``` programlisting
USER_CREATE ('user', 'userpassword',
  vector ('SQL_ENABLE', 0, 'DAV_ENABLE', 1, 'PERMISSIONS', '110100000RR', 'DISABLED', 0));
```

This will create a new account named 'user' with password 'upwd',
default permissions for new resources and collections created by the
account will be '110100000RR' (equivalent of UNIX 'rw-r----'
permissions, recursive free-text indexing and metadata extraction) and
the account is enabled and ready to use.

``` programlisting
DAV_ADD_USER ('user', 'userpassword', '110100000RR', 0, '/DAV/home/user/',
  'Full User Name', 'user@example.com', 'dav', 'davpassword');
```

this will do almost the same but it will describe the user in more
details and require no DBA privileges -- only DAV password. In addition,
DAV_ADD_USER () can both create a new user and grant DAV permissions to
an already existing SQL user.

The following statement is used to grant role 'administrators' to the
'user' account.

``` programlisting
      GRANT ADMINISTRATORS TO "user";
```

or

``` programlisting
      USER_GRANT_ROLE ('user', 'administrators');
```

The following will disable the account 'user' until 'DISABLED' option is
returned to zero.

``` programlisting
    USER_SET_OPTION ('user', 'DISABLED', 1);
```

DAV access permissions can be revoked permanently:

``` programlisting
    DAV_DELETE_USER ('user' , 'dav', 'davpassword');
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                              |
|                            | <a href="davsystables.html" class="link"                               
                              title="23.6.8. Web Server &amp; DAV System Tables">WS &amp; DAV System  
                              Tables</a>                                                              |

</div>

</div>

<div id="davauth" class="section">

<div class="titlepage">

<div>

<div>

### 19.1.2. WebDAV Authentication

</div>

</div>

</div>

Virtuoso WebDAV offers two types of authentication dependent on the
connecting clients abilities. These are:

|                                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Basic (Clear Text) Authentication*</span> - sends passwords over the connection in clear text. Clear text passwords can be intercepted and read so should be avoided or used only if you encrypt passwords through SSL. |
| <span class="emphasis">*Digest Authentication*</span> - passwords are always transmitted in an MD5 hash.                                                                                                                                        |

<div id="davbasicauth" class="section">

<div class="titlepage">

<div>

<div>

#### Basic Authentication

</div>

</div>

</div>

Basic Authentication is a widely used, industry-standard method for
collecting user name and password information. The following steps
outline how a client is authenticated using Basic authentication:

<div class="orderedlist">

1.  The client browser displays a dialog box for a user to enter a user
    name and password (his/her credentials).

2.  The client browser then attempts to establish a connection to the
    server using the user's credentials. The clear text password is
    Base64-encoded before it is sent over the network.

3.  If a user's credentials are rejected, the client may re-display the
    authentication dialog box to re-enter the user's credentials.
    Failing to supply correct details will terminate the connection,
    reporting an error to the user.

4.  When Virtuoso verifies that the user name and password are valid, a
    connection is established.

</div>

The advantage of Basic authentication is that most clients support it.
The disadvantage is that it transmits passwords in an unencrypted form.
Simple network monitoring can easily reveal your password. Basic
authentication is not recommended unless you are confident that the
connection between the user and Virtuoso is secure.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                 |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                           |
|                              | Base64 encoding is not encryption. A Base64-encoded password can be easily intercepted by a network sniffer and easily decoded. |

</div>

</div>

<div id="davdigestauth" class="section">

<div class="titlepage">

<div>

<div>

#### Digest Authentication

</div>

</div>

</div>

Digest authentication provides a security improvement over Basic
authentication in how a user's credentials are sent across the network.
Digest authentication transmits credentials across the network as an MD5
hash, or message digest, where the original username and password cannot
be deciphered from the hash. Digest authentication relies on the HTTP
1.1 protocol as defined in RFC 2617, which not all browsers support.

The following steps outline how a client is authenticated using Digest
authentication:

<div class="figure-float">

<div id="figdavdigestauth" class="figure">

**Figure 19.1. Digest Authentication**

<div class="figure-contents">

<div class="mediaobject">

![Digest Authentication](images/digestauth.jpg)

</div>

</div>

</div>

  

</div>

<div class="orderedlist">

1.  The client requests a file or connection from Virtuoso.

2.  Virtuoso challenges the request, informing that client: Digest is in
    use, what the realm name is.

3.  The client prompts the user for credentials. The client creates an
    MD5 hash of the credentials and the realm name and resubmits the
    request, this time supplying the MD5 hash.

4.  If Virtuoso approves the credentials then the resource or connection
    is granted to the client, and the data is returned.

</div>

</div>

</div>

<div id="davsymboliclinks" class="section">

<div class="titlepage">

<div>

<div>

### 19.1.3. WebDAV Symbolic Links

</div>

</div>

</div>

Virtuoso supports a special type of WebDAV resources, a redirect
reference resource, named WebDAV links. This is to extend the WebDAV
service to allow multiple access paths to existing resources.

As with conventional HTTP, the redirect reference simply responds to the
client with an HTTP/1.1 302 (Found) status code, redirecting the client
to a different resource, the target specified in the redirect resource,
using the `Location:` header. This behavior is equivalent to UNIX
symbolic links. A redirect reference makes it possible to access the
target resource indirectly through any URI mapped to the redirect
reference resource. The integrity is not guaranteed for associated
redirect reference resources.

WebDAV links do not provide a way to circumvent WebDAV security or
virtual directories. The target resource must be directly available to
the client being redirected.

WebDAV links are achieved by adding a special WebDAV property,
'`redirectref` ', whose value must contain the reference target URL.

WebDAV link targets are not limited to the WebDAV repository, and may
target any HTTP accessible resource.

The WebDAV links can be made with DAV API function
<a href="fn_dav_api_change.html" class="link"
title="DAV manipulation functions"><code
class="function">DAV_PROP_SET()</code></a> , or can be done via the
<a href="webdavadmin.html#contentmanagement" class="link"
title="Content Management">Content Management</a> interface of the Admin
UI. In the admin UI select WebDAV/WebDAV Services/Content Management and
press on the <span class="emphasis">*Create Link*</span> button to
create a link. In the form choose the target, permissions, owner and
enter the name of the link. Pressing the
<span class="emphasis">*Add*</span> button will create the new link in
the current WebDAV folder.

<div id="ex_create_webdav_link" class="example">

**Example 19.2. WebDAV Links Programmatically**

<div class="example-contents">

Assuming that we are creating the link as the administrator using the
default WebDAV administrator username and password, creating a link from
`/a/b.html` to `/c/d/f.html` could be as follows:

``` programlisting
SQL> select DAV_RES_UPLOAD ('/DAV/a/b.html','','','110100000NN', 'dav', 'nobody', 'dav', 'dav');

SQL> DAV_PROP_SET ('/DAV/a/b.html', 'redirectref', '/c/d/f.html', 'dav', 'dav');
```

The target, '`/c/d/f.html` ' could be any HTTP URL. In this case it will
be a resource on the same HTTP server.

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                           |
|:--------------------------:|:--------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                 |
|                            | <a href="fn_dav_api_add.html" class="link"                                                                                
                              title="DAV add &amp; update functions">DAV Add and Update functions</a> and <a href="fn_dav_api_change.html" class="link"  
                              title="DAV manipulation functions">DAV Manipulation functions</a> .                                                        |

</div>

**WebDAV links behaviour in resource manipulation requests. ** When some
link is moved the target will have the same properties as source, ie. it
will be a link. When a copy operation is made the target will have
content of the reference i.e. it will be a resource, not a link. Delete
operation on link will remove only the redirect reference resource, not
the referenced target itself. Content upload requests will change the
content of the referenced target.

</div>

<div id="accesspermofwebres" class="section">

<div class="titlepage">

<div>

<div>

### 19.1.4. Access Right Permissions of Web Resources

</div>

</div>

</div>

The WebDAV resources have two sorts of access right permissions.
'Classical' UNIX filesystem style permissions let assign different
permissions for owner user, owner group and public access. Access
Control Lists (ACLs) let assign permissions in more flexible Windows
style but they are less convenient for simple tasks. Both set of
permissions can be applied to the same resource or collection. In any
case, each resource or collection (directory/folder) can have defined
Read, Write and Execute permissions. The write permission applies to
operations which perform content or property change or locking as PUT,
PROPPATCH, MOVE, destination URI in COPY, LOCK, UNLOCK, DELETE, MPUT and
MUPDATE. The read permission applies to read operations as GET, POST,
PROPFIND, HEAD, source URI in COPY and MGET; read permission is also
required for any write operation.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                          |
|                            | <a href="http://www.rfc-editor.org/rfc/rfc2518.txt" class="ulink" 
                              target="_top">RFC2518</a> for more details of methods/operations   |

</div>

The execute permission applies only to the active content stored in the
WebDAV domain. If a VSP or VSPX page stored in a WebDAV domain has
execute permissions then retrieval of that page will perform execution
of active content. Note also a special flag to the virtual directory
which can override the execution flags for active pages. (for the
details how this flag can be set see 'options' in VHOST_DEFINE()
function). If such a flag is set to the virtual directory, then all
active pages under that directory (direct and indirect children) will be
treated as execution flag of the resource is set. In almost any case,
user should have both read and execute permissions to access active
content.

Resources with the following extensions are treated as executable
content: .vsp, .vspx, .xml if this has the XML template properties set.
Any other extension is also considered executable if there is a
corresponding WS.WS."\_\_http_handler\_\<extension\>" PL procedure.

The UNIX style permissions can be set for user, group or public access.
ACL consists of records called Access Control Entries (ACEs). Every ACE
allow or deny some sorts of access to an individual user or to a group.
Resource owner or administrator can add an "explicit" ACE to the ACL of
particular resource or "recursively" add "implicit" ACEs to every
resource and subcollection of some collection. The server checks
permissions in the following order:

<div class="orderedlist">

1.  match the user part of UNIX-style permissions to the specific
    operation, if user is the owner of the resource.

2.  match the user group part of UNIX-style permissions to the specific
    operation, if user belongs to a group which owns the resource.

3.  match the public part of UNIX-style permissions to the specific
    operation.

4.  If Access Control List is not empty, scan ACEs from the beginning of
    the list to the end. The loop stops at the first ACE that mentions
    either the user in question or one of the roles granted to it.
    Depending on the type of the ACE, the access is either granted or
    denied and the rest of list has no effect.

5.  If ACL contains no appropriate ACE then the access is denied.

</div>

According to these rules, the order of records in ACL is important. ACEs
are ordered following two rules: "deny" ACEs has higher priority than
"allow" ACEs; "local" rules has higher priority that "global":

<div class="orderedlist">

1.  All explicit ACEs are placed in a group before any inherited ACEs.

2.  Within the group of explicit ACEs, access-denied ACEs are placed
    before access-allowed ACEs.

3.  Inherited ACEs are placed in the order in which they are inherited.
    ACEs inherited from the child object's parent come first, then ACEs
    inherited from the grandparent, and so on up the tree of objects.

4.  For each level of inherited ACEs, access-denied ACEs are placed
    before access-allowed ACEs.

</div>

New resources and collections take their initial permissions from the
user default permissions mask, U_DEFAULT_PERMS of SYS_USERS. (see:
WebDAV Users Administration ). In the case of a resource created as
public or a collection mask of '110110110' (equivalent of UNIX
'rw-rw-rw'), then everybody can read and write it.

<div id="id65502" class="example">

**Example 19.3. WebDAV Permissions**

<div class="example-contents">

Consider a resource with the following permissions:

``` screen
'111110100'
```

This permission string is equivalent to UNIX 'rwxrw-r--'. The resource
can be executed, read and written to by the owner, group members can
read and write to it, and non authenticated (public) users or users not
belonging to the group group can only read it.

</div>

</div>

  

Every resource or collection has two additional flags in permissions,
that instruct the server whether resources should be indexed for
free-text search and whether resources should be parsed to extract
metadata:

Free-text indexing flag can take one of three values: "N", "R" and "T".
If a resource has this flag set to R or T then the resource will be
free-text indexed. If a collection has this flag set to T then resources
directly contained within the collection will be free-text indexed. If a
collection has this flag set to R then resources contained within the
collection will be free-text indexed, and the setting will be applied to
all members and collections underneath recursively. New resources and
collections acquire this setting from their parent collection.

Similarly, metadata extraction flag can take one of three values: "N",
"R" and "M". If a resource has this flag set to R or M then its metadata
are extracted. If a collection has this flag set to T then metadata are
extracted from resources directly contained within the collection. If a
collection has this flag set to R then metadata are extracted from
resources contained within the collection, and the setting will be
applied to all members and collections underneath recursively. New
resources and collections acquire this setting from its parent
collection.

</div>

<div id="davrdfmetadata" class="section">

<div class="titlepage">

<div>

<div>

### 19.1.5. DAV and RDF Metadata

</div>

</div>

</div>

When a Virtuoso server has a URIQA default host setting, it will make
metadata extracted from DAV resources available for querying via SPARQL.
All metadata for public readable DAV resources are stored in a system
graph. The graph IRI is composed from the DAV path of the resource and
the URIQA default host name.

see DefaultHost in the URIQA section of the virtuoso.ini file, described
in the URIQA section of the documentation for details on configuration.

The automatic maintenance of the SPARQL queryable metadata can be
disabled and enable using the function
DB.DBA.DAV_REPLICATE_ALL_TO_RDF_QUAD. An argument of 1 enables this and
a 0 disables this. The setting stays in effect until it is changed with
the same function. For new database, the feature is on by default. Old
databases are by default upgraded to have a SPARQL queryable DAV
metadata graph upon startup if the URIQA default host name is defined.

If the URIQA default host name changes, the RDF graph can be updated by
simply re-enabling the feature. This will adjust the graph and resource
IRI's.

If the URIQA default name of the host is example.com, then, the graph
will be http://example.com/DAV .

The IRI's of DAV resources will be like
http://example.com/DAV/docsrc/XMLDOM.xml , meaning that these are
directly usable from a user agent for accessing the resource.

``` programlisting
SQL> sparql select ?s ?o from <http://example.com/DAV> where {?s <http://www.openlinksw.com/schemas/DAV#ownerUser> ?o};
s                                                                                 o
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://example.com/DAV/docsrc/2pc.xml                                          mailto:somebody@example.domain
http://example.com/DAV/docsrc/Virtdocs.spp                                     mailto:somebody@example.domain

SQL> sparql select ?p ?o from <http://example.com/DAV> where {<http://example.com/DAV/docsrc/2pc.xml> ?p ?o};
p                                                                                 o
VARCHAR                                                                           VARCHAR
_______________________________________________________________________________

http://purl.org/dc/terms/created                                                  2006-05-23 15:10:32
http://purl.org/dc/terms/modified                                                 2006-05-23 15:10:32
http://www.openlinksw.com/schemas/DAV#ownerUser                                   mailto:somebody@example.domain
http://purl.org/dc/terms/extent                                                   7850
```

The examples above show how simple SPARQL queries can be used to
retrieve information about DAV resources.

The properties supported for all public readable resources are:

http://purl.org/dc/terms/created - The creation date as SQL datetime.

http://purl.org/dc/terms/modified - Modification time as SQL datetime.

http://www.openlinksw.com/schemas/DAV#ownerUser - The contents of
u_e_mail in sys_users for the SQL account owning the resource. This has
the protocol prefix mailto:, as in mailto:somebody@example.com.

http://purl.org/dc/terms/extent The size of the resource in bytes as a
SQL integer.

http://www.openlinksw.com/schemas/DAV#tag - There is one triple for each
public tag of the DAV resource. The value is the string of the tag as a
SQL string.

http://www.w3.org/1999/02/22-rdf-syntax-ns#type - The RDF schema for
MIME-type of of the DAV resource. If the resource is not recognized as
one of the below, this predicate will be omitted.

<div id="id65530" class="decimalstyle">

**Table 19.2. RDF Schema by MIME-type**

<div class="decimalstyle-contents">

| MIME- ype                         | RDF Schema                                      |
|:----------------------------------|-------------------------------------------------|
| application/bpel+xml              | http://www.openlinksw.com/schemas/WSDL#         |
| application/doap+rdf              | http://www.openlinksw.com/schemas/doap#         |
| application/foaf+xml              | http://xmlns.com/foaf/0.1/                      |
| application/google-kinds+xml      | http://www.openlinksw.com/schemas/google-kinds# |
| application/license               | http://www.openlinksw.com/schemas/OplLic#       |
| application/mods+xml              | http://www.openlinksw.com/schemas/MODS#         |
| application/msexcel               | http://www.openlinksw.com/schemas/Office#       |
| application/mspowerpoint          | http://www.openlinksw.com/schemas/Office#       |
| application/msproject             | http://www.openlinksw.com/schemas/Office#       |
| application/msword                | http://www.openlinksw.com/schemas/Office#       |
| application/msword+xml            | http://www.openlinksw.com/schemas/Office#       |
| application/opml+xml              | http://www.openlinksw.com/schemas/OPML#         |
| application/pdf                   | http://www.openlinksw.com/schemas/Office#       |
| application/rdf+xml               | http://www.openlinksw.com/schemas/RDF#          |
| application/rss+xml               | http://purl.org/rss/1.0/                        |
| application/wsdl+xml              | http://www.openlinksw.com/schemas/WSDL#         |
| application/x-openlink-image      | http://www.openlinksw.com/schemas/Image#        |
| application/x-openlink-photo      | http://www.openlinksw.com/schemas/Photo#        |
| application/x-openlinksw-vad      | http://www.openlinksw.com/schemas/VAD#          |
| application/x-openlinksw-vsp      | http://www.openlinksw.com/schemas/VSPX#         |
| application/x-openlinksw-vspx+xml | http://www.openlinksw.com/schemas/VSPX#         |
| application/xbel+xml              | http://www.python.org/topics/xml/xbel           |
| application/xbrl+xml              | http://www.openlinksw.com/schemas/xbrl#         |
| application/xddl+xml              | http://www.openlinksw.com/schemas/XDDL#         |
| application/zip                   | http://www.openlinksw.com/schemas/Archive#      |
| text/directory                    | http://www.w3.org/2001/vcard-rdf/3.0#           |
| text/eml                          | http://www.openlinksw.com/schemas/Email#        |
| text/html                         | http://www.openlinksw.com/schemas/XHTML#        |
| text/wiki                         | http://www.openlinksw.com/schemas/Wiki#         |

</div>

</div>

  

Additional predicates may exist as a result of resource type specific
metadata extraction.

</div>

<div id="customattofwebres" class="section">

<div class="titlepage">

<div>

<div>

### 19.1.6. Special Attributes of Web Resources

</div>

</div>

</div>

The Virtuoso WebDAV implementation provides a set of special attributes
(properties) for the resources to manipulate the retrieval of XML
documents. Properties can be set generate dynamic content based on
XML/SQL queries. Special properties can also be applied to WebDAV
folders for storing XML data in a special pre-parsed persistent XML
format.

The following special properties are supported:

<div class="itemizedlist">

- **xml-stylesheet. ** must contain a valid URL to an XSLT style sheet.
  Upon request of an XML document with this property set, the WebDAV
  server will automatically perform the transformation of the XML
  document and will send the result of transformation to the user-agent
  instead of the original XML source. This property is only settable for
  documents having MIME type text/xml.

- **xml-sql. ** must contain a valid XML/SQL query (see also:
  <a href="ch-webandxml.html#forxmlforsql" class="link"
  title="15.1. Rendering SQL Queries as XML (FOR XML Clause)">FOR XML
  statements</a> ). When this property is set the server will execute
  the query and the XML result will be sent to the client. Note that if
  xml-stylesheet is also supplied for this resource the result will be
  transformed and then sent to the client.

- **xml-sql-root. ** specifies the root element name of automatically
  generated XML resources when xml-sql is specified. Otherwise it has no
  effect.

- **xml-sql-dtd. ** can be specified as a string value 'on' or valid
  URL. When the value is 'on' the DTD declaration will be implied in the
  automatically generated XML resource. Otherwise when the URL is
  supplied this URL will be included in the DTD declaration of the
  automatically generated XML resource. If xml-sql is not specified this
  property has no effect.

- **xml-sql-schema. ** specifies the URI for the XML Schema. This schema
  URI will be included in the XML header, to allow client-side schema
  validation. If xml-sql is not specified this property has no effect.

- **xper. ** can be specified for a collection (folder). When this
  property is set on a WebDAV collection, the direct resource members
  will be stored and updated as persistent XML. Note that existing
  resources will not be changed until they are updated. The reversal of
  this property for collections will not change the resources at the
  same time, they will be reverted to the text/xml storage on first
  update operation. Resources already stored as XML persistent documents
  also have the xper property set, but manipulation of this property
  must not be used to revert the storage.

</div>

</div>

</div>

</div>
