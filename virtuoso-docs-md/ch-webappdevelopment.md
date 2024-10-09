<div>

<div>

<div>

<div>

# Chapter 14. Web Application Development

</div>

<div>

<div>

**Abstract**

This chapter deals with the Virtuoso HTTP Server, its Dynamic Page
generation and components used to configure it. The HTTP Servers
features include:

|                                                                                                                                                                                                                                                        |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Web server configuration and access control.                                                                                                                                                                                                           |
| Multihosting, Virtual Hosting and Virtual Directories - A single Virtuoso server can map requests into multiple spaces of web pages based on the interface to which the requests come (multihosting) or on the Host HTTP/1.1 header (virtual hosting). |
| HTTP/1.0 and HTTP/1.1 support, keep alive connections and pipelining.                                                                                                                                                                                  |
| Proxying - Virtuoso can automatically redirect requests to certain resources or directories to another web server.                                                                                                                                     |
| Authentication and security - Specific directories can be made to require authentication (basic or digest) or may be restricted to SSL only. Authentication can also be totally user defined.                                                          |
| SOAP - given directories can be defined as containing SOAP services, which can be accessed by SOAP clients, invoking Virtuoso stored procedures.                                                                                                       |
| Dynamic content - Given paths can be executable, allowing defining VSP, and VSPX pages that generate HTML or XML using embedded Virtuoso/PL.                                                                                                           |
| WebDAV - Paths can be mapped into DAV collections maintained inside the database. Virtuoso WebDav is a Unix file system-like mechanism allows specifying access rights and ownership of DAV resources.                                                 |
| WebDAV resources may optionally be indexed in a free text index.                                                                                                                                                                                       |
| A web robot allows copying external web resources into Virtuoso WebDAV.                                                                                                                                                                                |

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">14.1. [The HTTP
Server](ch-webappdevelopment.html#webserver)</span>

<span class="section">14.1.1. [HTTP Server Base
Configuration](ch-webappdevelopment.html#vspconf)</span>

<span class="section">14.1.2. [Virtual
Directories](ch-webappdevelopment.html#virtdir)</span>

<span class="section">14.1.3.
[Authentication](ch-webappdevelopment.html#wsauth)</span>

<span class="section">14.1.4. [Session
Management](ch-webappdevelopment.html#wssessman)</span>

<span class="section">14.1.5. [Writing Your Own Authentication and
Session Handling](ch-webappdevelopment.html#customauthsess)</span>

<span class="section">14.1.6. [Cancellation of Web
Requests](ch-webappdevelopment.html#cancelwebreq)</span>

<span class="section">14.1.7. [Virtuoso WebRobot
API](ch-webappdevelopment.html#virtwebrobot)</span>

<span class="section">14.1.8. [HTTP Server
Extensions](ch-webappdevelopment.html#server_http_ext)</span>

<span class="section">14.1.9. [Chunked Transfer
Encoding](ch-webappdevelopment.html#webserverchunking)</span>

<span class="section">14.1.10. [Using Virtuoso Server capabilities via
Apache Web Server](ch-webappdevelopment.html#webserverviaapache)</span>

<span class="section">14.1.11. [Setting Up the Virtuoso HTTPS
Listener](ch-webappdevelopment.html#webserverhttpslistenerset)</span>

<span class="section">14.2. [Web Services ACL (Access Control
List)](wsacl.html)</span>

<span class="section">14.2.1. [General purpose
ACLs](wsacl.html#wsaclgenpurpacl)</span>

<span class="section">14.2.2. [ACL
Definition/Removal](wsacldefrem.html)</span>

<span class="section">14.2.3. [Using ACL's Within Application
Logic](wsaclusing.html)</span>

<span class="section">14.2.4. [Predefined
ACLs](wsaclpredefined.html)</span>

<span class="section">14.3. [Virtuoso Server Pages
(VSP)](vsp1.html)</span>

<span class="section">14.3.1. [VSP Markup & Basic
Functions](vsp1.html#vspmarkup)</span>

<span class="section">14.3.2. [Access Request
Information](accessrequestinfo.html)</span>

<span class="section">14.3.3. [Errors in Page
Procedures](errorsinpage.html)</span>

<span class="section">14.3.4. [/INLINEFILE HTTP Server
Pseudo-Directory](inlinefile.html)</span>

<span class="section">14.3.5. [Beyond Basics](furthervsp.html)</span>

<span class="section">14.3.6. [Long HTTP
Transactions](longhttptrans.html)</span>

<span class="section">14.3.7. [Using chunked encoding in HTTP
1.1](httpchunkedoutput.html)</span>

<span class="section">14.3.8. [Making Simple Dynamic Web
Pages](mksimpledynapages.html)</span>

<span class="section">14.3.9. [Generation of non-HTML
output](xmlthtmloutmd.html)</span>

<span class="section">14.3.10. [Post VSP XSLT Transformation
Mode](xmlthtmloutmd_01.html)</span>

<span class="section">14.3.11. [XML & XSLT Generated VSP
Pages](xmlforproducingvsp.html)</span>

<span class="section">14.4. [Virtuoso Server Pages for XML
(VSPX)](vspx.html)</span>

<span class="section">14.4.1. [Processing
Model](vspx.html#vspxprocmodel)</span>

<span class="section">14.4.2. [Object
Model](vspxobjectmodel.html)</span>

<span class="section">14.4.3. [Keeping Page and Session
State](vspxpageandsessionstate.html)</span>

<span class="section">14.4.4. [Application
Code](vspxappcode.html)</span>

<span class="section">14.4.5. [A Simple
Example](vspxexamples.html)</span>

<span class="section">14.4.6. [VSPX Event Handler
Parameters](vspxeventpars.html)</span>

<span class="section">14.4.7. [Registering a VSPX Event
Callbacks](vspxeventhandlers.html)</span>

<span class="section">14.4.8. [Commonly Used Types of Attributes of VSPX
Controls](vspx_attr_types.html)</span>

<span class="section">14.4.9. [VSPX Controls](vspx_controls.html)</span>

<span class="section">14.4.10. [XForms
rendering](vspxxforms.html)</span>

<span class="section">14.4.11. [XMLSchema for VSPX
page](vspxschema.html)</span>

<span class="section">14.5. [Deploying ASP.Net Web
Applications](rthwritaspxapps.html)</span>

<span class="section">14.5.1. [Programming
Concepts](rthwritaspxapps.html#rthprogramming)</span>

<span class="section">14.5.2. [ASP.Net Deployment &
Configuration](rthasp.netdeploymentconf.html)</span>

<span class="section">14.5.3. [The Mono
Project](rthaspvsmono.html)</span>

<span class="section">14.5.4. [Migrating ASP.Net Applications to
Virtuoso](rthaspxwalk.html)</span>

<span class="section">14.6. [ASMX Web Service
Hosting](asmxhosting.html)</span>

<span class="section">14.7. [Blogging & Weblogs](blogger.html)</span>

<span class="section">14.7.1. [The Virtuoso Blogging
Application](blogger.html#blogvirtblogapp)</span>

<span class="section">14.7.2. [Blogger Clients
Compatibility](bloggerclientcompatibility.html)</span>

<span class="section">14.7.3. [Blogs Management User
Interface](bloggermanagementui.html)</span>

<span class="section">14.7.4. [Community Blog
Site](blogcommunityblog.html)</span>

<span class="section">14.7.5. [Blogger API](bloggerapi.html)</span>

<span class="section">14.7.6. [MetaWeblog
API](bloggermetaweblog.html)</span>

<span class="section">14.7.7. [Movable Type
API](bloggermovabletype.html)</span>

<span class="section">14.7.8. [Atom API](blogatomapi.html)</span>

<span class="section">14.7.9. [XML-RPC Endpoint
Configuration](bloggerendpointconf.html)</span>

<span class="section">14.7.10. [Blog Hooks - Customizing the Blog
Server](bloggerhooks.html)</span>

<span class="section">14.7.11. [Blogger Client
API](bloggerclientapi.html)</span>

<span class="section">14.7.12. [xmlStorageSystem
API](xmlstoragesystem.html)</span>

<span class="section">14.7.13. [User's Blog
quota](xmlstoragesystem_01.html)</span>

<span class="section">14.7.14. [Posting a message in to the
Blog](xmlstoragesystem_02.html)</span>

<span class="section">14.7.15. [Multi-author
blogging](xmlstoragesystem_03.html)</span>

<span class="section">14.7.16. [Posting a
comments](xmlstoragesystem_04.html)</span>

<span class="section">14.7.17. [Blog Post Upstreaming
(bridging)](xmlstoragesystem_05.html)</span>

<span class="section">14.7.18. [Weblogs
API](xmlstoragesystem_06.html)</span>

<span class="section">14.7.19.
[Subscriptions](xmlstoragesystem_07.html)</span>

<span class="section">14.7.20. [Trackback
API](xmlstoragesystem_08.html)</span>

<span class="section">14.7.21. [Pingback
API](xmlstoragesystem_09.html)</span>

<span class="section">14.7.22. [E-mail
Notifications](xmlstoragesystem_10.html)</span>

<span class="section">14.7.23. [Comments tracking
options](blognotifcomments.html)</span>

<span class="section">14.7.24. [Subscription Harmonizer
API](xmlstoragesystem_11.html)</span>

<span class="section">14.7.25. [Mobile Blogging
(Moblog)](moblog.html)</span>

<span class="section">14.7.26. [Posting a dynamic
content](blogxmltemplate.html)</span>

<span class="section">14.7.27. [Notification
Services](blognotifservices.html)</span>

<span class="section">14.7.28. [Rendering the RSS feed in WML
format](blogwaprender.html)</span>

<span class="section">14.8. [Deploying PHP
Applications](servphpext.html)</span>

<span class="section">14.8.1. [Building the Virtuoso Server With PHP
Extension](servphpext.html#serverphpbuild)</span>

<span class="section">14.8.2. [PHP Extension
Functions](serverphpinc.html)</span>

<span class="section">14.8.3. [PHP
Examples](serverphpexamples.html)</span>

<span class="section">14.9. [Deploying JSP
Applications](rthjsp.html)</span>

<span class="section">14.9.1. [Environment Setup &
Verification](rthjsp.html#rthjspprelim)</span>

<span class="section">14.10. [Perl Hosting](perlhosting.html)</span>

<span class="section">14.11. [Python Hosting](pythonhosting.html)</span>

<span class="section">14.12. [Ruby Hosting](rubyhosting.html)</span>

</div>

Virtuoso provides a full function web server with dynamic web page
generation capability using SQL procedures embedded in HTML or XML via
VSP or VSPX. Runtime hosting allows Virtuoso to generate dynamic web
pages from other sources also, such as ASP.Net, PHP or JSP.

Out-of-the-box Virtuoso listens for HTTP requests on the port defined in
the HTTP Server section of the Virtuoso INI file. The Visual Server
Administration Interface is available at this port and can be used to
further configure the web server.

Web resources can be based on the file system, reside in the database or
in WebDAV or any combination of all of them. WebDAV space can be
specified at the path level, by default, paths beginning with /DAV are
mapped to the WebDAV root collection (directory) and all other paths are
assumed to be file system based. By default / is mapped to the directory
specified as ServerRoot in the HTTP Server section of the virtuoso.ini
file.

Virtual Directories provide a way to make mappings from paths to other
resources such as specific file system or WebDAV locations, other HTTP
Servers acting as a proxy or to alter specific processing or
authentication rules for a directory.

<div>

<div>

<div>

<div>

## 14.1. The HTTP Server

</div>

</div>

</div>

When a request comes in to one of the network interfaces where Virtuoso
is listening for HTTP requests, it is matched against a set of virtual
directory path mappings. A path mapping has the following attributes:

|                                                                                                                                                                   |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Interface*</span> - interface coming from HTTP request                                                                                    |
| <span class="emphasis">*Virtual Host*</span> - matched virtual host name                                                                                          |
| <span class="emphasis">*Logical Path*</span> - logical path                                                                                                       |
| <span class="emphasis">*Mapped Path*</span> - physical location of the resource                                                                                   |
| <span class="emphasis">*Is in DAV*</span> - If the resource is placed in WebDAV domain                                                                            |
| <span class="emphasis">*Default page*</span> - the name of the page to be returned if none is supplied                                                            |
| <span class="emphasis">*Browseable*</span> - allows for returning the list of files in a directory if no specific file is requested                               |
| <span class="emphasis">*Security*</span> - security restrictions to the resource                                                                                  |
| <span class="emphasis">*Authentication Function*</span> - Virtuoso/PL procedure name, which performs authentication                                               |
| <span class="emphasis">*Realm*</span> - an string applied to Authentication function                                                                              |
| <span class="emphasis">*Request Post-processing Function*</span> - Virtuoso/PL procedure name, which performs post-processing action, before sending the response |
| <span class="emphasis">*Database User Account*</span> - User account name, on behalf of which active content will be executed                                     |

<div>

<div>

**Figure 14.1. HTTP Server Conceptual Diagram**

<div>

<div>

![HTTP Server Conceptual Diagram](images/httpconcept.jpg)

</div>

</div>

</div>

  

</div>

Incoming requests are also checked against the HTTP access control
lists. These lists rely on the following attributes of the connection to
determine whether the request should be answered:

|                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Client Host or IP Address*</span> - the incoming requestor is pattern matched to specify a range.              |
| <span class="emphasis">*Destination Host or IP Address*</span> - Destination IP/Host match, also applicable to the proxy capabilities. |

The Virtuoso HTTP server is HTTP/1.1 compliant. It can accept persistent
connections from HTTP/1.1 clients. The HTTP/1.0 requests are processed
as normal without the persistent connections feature.

Persistent HTTP connections offer several advantages, such as:

|                                                                                                                                                                                                                                                  |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Reduced CPU usages by opening and closing fewer connections.                                                                                                                                                                                     |
| HTTP requests and responses can be pipelined on a connection. Pipelining allows a client to make multiple requests without waiting for each response, allowing a single TCP connection to be used much more efficiently with lower elapsed time. |
| Network traffic is reduced.                                                                                                                                                                                                                      |
| Latency on subsequent requests is reduced.                                                                                                                                                                                                       |

<div>

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="http://www.rfc-editor.org/rfc/rfc2616.txt" class="ulink" 
                              target="_top">RFC2616</a> for more details                         |

</div>

<div>

<div>

<div>

<div>

### 14.1.1. HTTP Server Base Configuration

</div>

</div>

</div>

The `[HTTPServer]` section of the Virtuoso INI file contains parameters
that directly affect the HTTP server upon server startup. After the
server has been started further configuration can be performed using the
Visual Server Administration Interface. Here is an example of the
section in the INI file:

``` programlisting
[HTTPServer]
  ServerPort = 8890
  ServerRoot = ../vsp
  ServerThreads = 2
  MaxKeepAlives = 10
  KeepAliveTimeout = 10
  DavRoot = DAV
```

The meanings of these parameters are briefly explained here as a quick
reference for the most frequently used parameters:

<div>

- **ServerPort. ** This specifies the HTTP listen port for the VSP
  server.

- **ServerThreads. ** This specifies the number of concurrently serviced
  HTTP requests. If there are more concurrent requests, accepting the
  connections will be deferred until there is a thread ready to serve
  each.

- **ServerRoot = ../vsp. ** This is the file system path of the root
  directory of files served by the Virtuoso web server. The index.html
  in that directory will be served for the / URI. If relative, the path
  is interpreted relative to the server's working directory.

- **MaxKeepAlives = 10. ** Connections by HTTP 1.1 clients can remain
  open after the initial response has been sent. This parameters sets a
  cap on how many socket descriptors will at most be taken by keep alive
  connections. Such connections will be dropped by the server ahead of
  timeout if this number would be exceeded. Thus the maximum number of
  open sockets for the Virtuoso HTTP server is this number plus the
  number of threads. A keep alive connection is by definition not
  associated to any pending processing on any thread.

- **KeepAliveTimeout = 10. ** This is a timeout in seconds before
  Virtuoso closes an idle HTTP 1.1 connection.

- **DavRoot = DAV. ** This specifies the root path of DAV resources. If
  DAV specific HTTP methods are used on Virtuoso, these should only
  reference resources with paths starting with this. This is the top
  level DAV collection. This is matched against URI's after the
  translation from external to internal URI's through the virtual
  directory table. See Virtual Directories below.

</div>

<div>

|                            |                                                                                                                                                                         |
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                                               |
|                            | The Server Administration chapter contains a complete list of the Virtuoso INI file parameters. In particular, the <a href="ch-server.html#ini_httpserver" class="link" 
                              title="[HTTPServer]">[HTTPServer] section</a> .                                                                                                                          |

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.2. Virtual Directories

</div>

</div>

</div>

A Virtuoso virtual directory maps logical paths to physical resource
locations accompanied by rules and/or parameters that govern how the
mappings respond to user-agent (e.g. Web browser) requests. This
mechanism allows physical locations to be obscured or simply
reorganized. Some resource types require authentication challenges, such
as the Visual Server Administration Interface, and/or special headers
such as SOAP, which is another HTTP endpoint.

Virtual directories are useful when one server has to provide access to
several Web sites. Redirects are not a universal solution to this, it is
far better to define virtual directories that point to the other sites.
Suppose that we have two companies, "a" and "b", that are to share a
Virtuoso server but want to represented on the Web by `www.a.com` and
`www.b.com` respectively. Their pages could be stored in directories
"/a" and "/b" on the server, whilst virtual directories map requests
appropriately:

``` programlisting
  http://www.a.com/  -->

 /a
  http://www.b.com/  -->

 /b
```

Hence, user-agent requests for `www.a.com` receive pages from /a, and
likewise for "b". Requests under these domains are mapped back to their
physical location such as the request for the URI
`http://www.a.com/images/picture.jpg` retrieves the file
`/a/images/picture.jpg` .

Virtual directory definitions are held within the system table
DB.DBA.HTTP_PATH. Virtual directories can be administered in three basic
ways:

|                                                              |
|--------------------------------------------------------------|
| Using the Visual Administration Interface via a Web browser. |
| Using the functions `vhost_define()` and `vhost_remove()` .  |
| Updating the system table directory using SQL statements.    |

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
href="admui.internetdomains.html#httpvirtualdirs" class="link"
title="HTTP Virtual Directories">Virtual Directory Administration
UI</a></p>
<p><a href="fn_vhost_define.html" class="link"
title="VHOST_DEFINE">vhost_define()</a> , <a href="fn_vhost_remove.html"
class="link" title="VHOST_REMOVE">vhost_remove()</a></p>
<p><a href="davsystables.html#davhttppath" class="link"
title="HTTP Virtual Directory Mappings">HTTP_PATH system
table</a></p></td>
</tr>
</tbody>
</table>

</div>

Virtuoso matches user-agent requests against a logical path using the
longest entry that matches the path extracted from the URI. Suppose we
have two entries '`/a/b` ' and '`/a` ' and a request is made of:
'`http://foo.bar/a/b/c.html` ', will match the entry for '`/a/b` '.

First, Virtuoso will attempt to locate the physical path that has been
mapped to a virtual host, interface and logical path. The virtual host
corresponds to the 'Host' header field value from HTTP/1.1 requests. If
the first step does not succeed then the server will try resolving the
interface and logical path. Failing that, the default step will attempt
to resolve the path directly to a physical location.

<div>

<div>

**Figure 14.2. HTTP Virtual Directory Matching**

<div>

<div>

![HTTP Virtual Directory Matching](images/virtualdirectories.jpg)

</div>

</div>

</div>

  

</div>

<div>

|                              |                                                                                                                                                                                 |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                           |
|                              | HTTP 1.0 does not use the HOST header. Virtuoso will have little choice but to send HTTP 1.0 user-agents the contents of the default virtual host definition for the interface. |

</div>

Thus if the following mappings are in effect:

``` programlisting
/   ->  /DAV
/doc    ->  http://docs.biz.com:/
/admin  ->  /admin
```

The following translations would be made:

``` programlisting
/doc/howto/intro.html      -> http://docs.biz.com:/howto/intro.html
/admin/help.vsp        -> /admin/help.vsp
/gizmo/doc.xml         -> /DAV/gizmo/doc.xml
```

Thus, the longest match is selected and the matching substring is
replaced by the right hand side of the mapping. Note that this is also
how automatic proxying takes place, since a physical path beginning with
http:// will be passed forward to a remote server.

<div>

<div>

<div>

<div>

#### Default Pages And Directory Browsing

</div>

</div>

</div>

For each virtual host or logical path pair we can define a list of
default pages. If the requested URL path is a directory then the server
checks the default page definition for that virtual directory, if a
default page exists then the path will be internally expanded to include
its name, ands its contents returned.

<div>

**Example 14.1. Default Page**

<div>

if we have a mapping for the host:

``` programlisting
www.a.com
```

with the logical path mapping of:

``` programlisting
'/' mapped to '/a'
```

with default page 'index.htm', then if the URL

``` programlisting
http://www.a.com/
```

is requested the server will try to send the content of '/a/index.htm'.

</div>

</div>

  

The same mechanism is used to determine whether a directory listing is
to be returned. If a mapping is defined to have 'Browseable' set to a
number greater than zero then the server, if a default page does not
exist or is not defined, a directory listing will be returned to the
calling client.

</div>

<div>

<div>

<div>

<div>

#### Virtual Hosting and Multi Hosting

</div>

</div>

</div>

The term Virtual Host refers to the practice of maintaining more than
one server on one machine, differentiated by their apparent host name.
It is often desirable for companies sharing a web server to have their
own domains, with web servers accessible as www.company1.com and
www.company2.com, without requiring the user to know any extra path
information. The Virtual host can be IP-based or non-IP. The IP-based
(Multi Hosting) refers to practice of having one machine listen for
incoming requests on different network interfaces and respond with
different pages. The non-IP-based (Virtual Hosting) refers to the
practice of one machine having many DNS aliases, and requests from
client to a specific alias returning a different response regarding
content of 'Host' HTTP header field. Virtuoso supports IP-based, virtual
IP-based, and name-based virtual hosts.

For distinct IP-based, hosts are used to determine on which interfaces
Virtuoso will listen and accept HTTP requests.

</div>

<div>

<div>

<div>

<div>

#### Managing Host Metadata

</div>

</div>

</div>

To add metadata in /.well-known/host-meta, execute:

``` programlisting
WS.WS.host_meta_add ([app-name], [xrd-xml-fragment])
```

For example:

``` programlisting
WS.WS.host_meta_add
  (
    'dbpedia.page-descriptor',
    '<Link rel="http://dbpedia.org/resource-descriptor" template="http://dbpedia.org/page/{uri}"/>'
  )
  ;
```

</div>

<div>

<div>

<div>

<div>

#### Virtuoso As A Proxy

</div>

</div>

</div>

The Virtuoso HTTP server can act as a proxy server on the same port as
the HTTP port. You can put the host and port that the Virtuoso HTTP
server is listening on, into your browser proxy settings and all
requests will be processed by it. Also this can be used to retrieve a
page inside VSP.

The physical path setting of a virtual directory definition can be URL
to another HTTP server. In which case Virtuoso will act as a proxy to
that site when the logical path for it is requested.

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
href="furthervsp.html" class="link"
title="14.3.5. Beyond Basics">Virtuoso also provides VSP functions for
proxying.</a></p>
<p><a href="fn_http_proxy.html" class="link" title="http_proxy"><code
class="function">http_proxy()</code></a> .</p></td>
</tr>
</tbody>
</table>

</div>

The nature of Virtuoso's Web Proxying ability makes it easy and seamless
to bind multiple websites under one roof. Existing sites do not have to
move or change to be integrated under the Virtuoso Proxy. Simply map
them under a logical path name. They can be mapped multiple times or
from multiple ports.

If you already have pages written and working from other servers via ASP
or PHP, then you will be able to run these servers concurrently with
Virtuoso so they can share form data and give dynamic content from
various sources, consistent with our value proposition of maximum
incorporation of new technologies with minimum disruption to existing
infrastructure. Whether these servers were hosted on various machines or
the same machine there is no need to expose their running ports and
services. This makes the end user experience cleaner, and helps maintain
some server security and/or anonymity.

<div>

|                              |                                                                                                                                                                                   |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                             |
|                              | Virtuoso provides runtime hosting capabilities and PHP support, therefore ASP.Net and PHP and other applications can be run and hosted directly within the file system or WebDAV. |

</div>

Suppose that you have two machines running existing web servers that
serve various parts of your intranet. One web server may have been
constructed for or by your sales department while the other server may
have been a built by the support department. These servers could be
resolved by http://sales.mycompany.com/ and
http://support.mycompany.com/ respectively.

You can place Virtuoso on another server and start integrating your
existing sites under this installation. You may use the Visual Server
Administration Interface or choose to use the following commands via the
isql interface:

``` programlisting
DB.DBA.VHOST_DEFINE(lpath=>'/sales', ppath=>'http://sales.mycompany.com/');
DB.DBA.VHOST_DEFINE(lpath=>'/support', ppath=>'http://support.mycompany.com/');
```

This way your old servers will exist under /sales/ and /support/ of your
new server. Now you can start adding virtuoso .vsp pages to your new
Virtuoso server and they operate interleaved with your existing pages to
add new life and functionality as required.

You may decide that you want to install Virtuoso onto a server where a
web server already exists. If you plan to use Virtuoso as your default
web server and the proxy to your existing server then you will need to
make sure that the servers run on different ports. The default port is
80, you will have to configure Virtuoso to use this port from the
virtuoso.ini file and then move your existing web server port to another
number. Afterwards the procedure is similar:

``` programlisting
DB.DBA.VHOST_DEFINE(lpath=>'/apache', ppath=>'http://example.com:90/');
```

<div>

<div>

<div>

<div>

##### Proxying Virtuoso via Apache

</div>

</div>

</div>

You may also achieve the same goal as above but in reverse, using
another web server as a proxy in front of Virtuoso. If you have an
existing Apache server that you want to keep as you default web server
then you can set up a proxy within Apache to Virtuoso.

Firstly you will need to make sure that Apache can make use of the
mod_proxy module available from most Apache distribution sites. You then
have to make sure that it is referenced in your httpd.conf (or
apache.conf) file. You should have something like:

``` screen
...
LoadModule proxy_module       modules/libproxy.so
...
AddModule mod_proxy.c
...
```

<div>

<div>

<div>

<div>

###### Configuration steps

</div>

</div>

</div>

Below we will use the \<Location\> directive to simplify the
configuration:

``` programlisting
<Location /virtuoso/>
   ProxyPass               http://example.com:8890/
   ProxyPassReverse        /
</Location>
```

<div>

1.  Set the ProxyPass directive:

    The ProxyPass directive makes Apache to change all incoming URLs and
    map it to the internal http endpoint.

    So when the browser makes a request for:

    ``` programlisting
    http://example.com/virtuoso/conductor/login.vsp
    ```

    it is rewritten to use:

    ``` programlisting
    http://example.com:8890/conductor/login.vsp
    ```

    before sending the request over to the Virtuoso server.

2.  Set the ProxyPassReverse directive:

    The ProxyPassReverse directive rewrites the HTTP Headers that come
    back from Virtuoso to map back to the external URL. This is needed
    for e.g. 303 Location redirects where Virtuoso will use:

    ``` programlisting
    Location: http://example.com:8890/conductor/pageXXX.vsp
    ```

    which Apache needs to rewrite to:

    ``` programlisting
    Location: http://example.com/virtuoso/conductor/pageXXX.vsp
    ```

    before sending the reply back to the browser.

3.  If the mapping is / ---\> / instead of /virtuoso/ ---\> / then the
    settings should be done, since ProxyPass and ProxyPassReverse only
    deal with rewriting urls and http headers.

    When however there is a path mapping, there is a third step to take:

    Pages can contain clickable links like:

    ``` programlisting
    <a href="/conductor/mypage.vsp">Click Here</a>
    ```

    If you click on this link in your browser, it would use:

    ``` programlisting
    http://example.com/conductor/mypage.vsp
    ```

    which does not map back to your /virtuoso/ vpath in apache.

    As phpBB3 has been written from outset to cater for this situation,
    it will always need to recalculate fully qualified host/path names
    everywhere in its pages, which is not always very practical.

    Thus Apache needs to be configured to do page rewriting as well as
    in:

    ``` programlisting
         ProxyHTMLEnable         On
         ProxyHTMLURLMap         / /virtuoso/
         ProxyHTMLURLMap         http://example.com:8890/ /virtuoso/
    ```

    This will rewrite the content of every page to make sure that links
    inside the page are rewritten to use the external mapping of this
    instance.

    If you have set Virtuoso to use `EnabledGzipContent=1` , then you
    need to tell apache it may need to gunzip the content before doing
    this rewrite with the following line:

    ``` programlisting
         SetOutputFilter         INFLATE;DEFLATE
    ```

    Although this takes a bit extra CPU power etc, it is still practical
    to setup a virtual path on user's own system that points to some
    external system.

    For example, add this to your httpd.conf to get a mapping to
    dbpedia-live instance:

    ``` programlisting
    <Location /dbp/>
         ProxyPass               http://dbpedia-live.openlinksw.com/
         ProxyPassReverse        /
         ProxyHTMLURLMap         / /dbp/
         ProxyHTMLURLMap         http://dbpedia-live.openlinksw.com/ /dbp/
         SetOutputFilter         INFLATE;DEFLATE
    </Location>
    ```

    Now you should be able to use for ex.:

    ``` programlisting
    http://example.com/dbp/page/London
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Usage Example

</div>

</div>

</div>

``` programlisting
NameVirtualHost 82.191.21.32

<VirtualHost 82.191.21.32>
ServerName www.mysite.net <http://www.mysite.net>
...

     #  Disable global proxy
     ProxyRequests       Off

     #  Pass original host to Virtuoso
     ProxyPreserveHost   On

     #  Timeout waiting for Virtuoso
     ProxyTimeout        300

     #  Set permission
     <Proxy *>
         Order deny,allow
         Allow from all
     </Proxy>

     #
     #  Map /virtuoso/ to a local Virtuoso instance.
     #
     #  Since ProxyPass and ProxyPassReverse only fix the Headers
     #  of the request, we need to use ProxyHTMLURLMap to rewrite
     #  content.
     #
     <Location /virtuoso/>
         ProxyPass               http://example.com:8890/
         ProxyPassReverse        /

         #  Enable rewrite rules
         ProxyHTMLEnable         On
         ProxyHTMLURLMap         / /virtuoso/
         ProxyHTMLURLMap         http://example.com:8890/ /virtuoso/

# Uncomment this when EnabledGzipContent=1 in virtuoso.ini
         #SetOutputFilter         INFLATE;DEFLATE
     </Location>
</VirtualHost>
```

If we map the virtual host straight through to Virtuoso, we only need
header rewriting and save the time/cpu power to rewrite the content:

``` programlisting
     #
     #  Map / to a local Virtuoso instance
     #
     #  Since paths are mapped straight through, we do not have to
     #  rewrite the content.
     #
     <Location />
         ProxyPass               http://example.com:8890/
         ProxyPassReverse        /
     </Location>
```

<div>

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                |
|                            | <a href="http://www.apache.org/docs/" class="ulink" target="_top">Apache 
                              Online Documentation</a>                                                  |

</div>

</div>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.3. Authentication

</div>

</div>

</div>

If a Virtuoso/PL procedure is specified to perform authentication for
this mapping then it will be executed. The procedure can take one
(varchar) parameter, the 'Realm' value. The result from the procedure
must be 1 if authentication successful otherwise must be zero (0). If
the procedure returns 0 this causes the processing to terminate and
whatever output the hook generated to be sent to the client. Typically
this will be an authentication challenge.

</div>

<div>

<div>

<div>

<div>

### 14.1.4. Session Management

</div>

</div>

</div>

The Virtuoso HTTP session management consists of functions for session
variables manipulation and an ability to define a pre- and
post-processing function. The pre and post-processing functions are used
to save and restore session data between HTTP posts, usually to and from
a session table.

Session management must be enable by settings the flag for persistent
session variables in virtual directory mapping. Virtual directory
mappings use the
<span class="emphasis">*persistent_session_variables*</span> flag, which
when specified, session variables can be used in a post-process function
to determine if the session variables content must be stored on to the
session table or not.

The post-processing function hook can be any user-defined Virtuoso/PL
procedure, it will be executed every time after processing of the active
page.

<div>

|                            |                                                                       |
|:--------------------------:|:----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                             |
|                            | <a href="furthervsp.html#sesmanvars" class="link"                     
                              title="Session Management and State Variables">VSP Session Management  
                              and Session Variables</a>                                              |

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.5. Writing Your Own Authentication and Session Handling

</div>

</div>

</div>

We will explain the following precompiled procedures in Virtuoso used to
authenticate three branches of users.

|                                                                                              |
|----------------------------------------------------------------------------------------------|
| <span class="emphasis">*HP_AUTH_SQL_USER*</span> - VSP authentication based on DB users      |
| <span class="emphasis">*HP_AUTH_DAV_ADMIN*</span> - VSP authentication based on WebDAV users |
| <span class="emphasis">*HP_AUTH_DAV_PROTOCOL*</span> - WebDAV repository authentication      |

``` programlisting
-- Authenticate against names and passwords in SYS_USERS, using HP_SECURITY for level

create procedure
DB.DBA.HP_AUTH_SQL_USER (in realm varchar)
{
  declare _u_name, _u_password varchar;
  declare _u_group, _u_id, allow_basic integer;

  declare auth, sec, lev varchar;
  declare _user varchar;
  declare ses_dta, lines any;

  lines := http_request_header ();         -- got a request header lines
  sec := http_map_get ('security_level');  -- got a security level from http mapping
  if (isstring (sec))
    sec := ucase (sec);
  if (sec = 'DIGEST')
    allow_basic := 0;   -- if security is only digest then allow basic is false
  else
    allow_basic := 1;

  auth :=
    DB.DBA.vsp_auth_vec (lines);    -- parse request header to got authentication credentials
  if (0 <> auth)          -- and if client sent any authentication information try it
    {

     lev := get_keyword ('authtype', auth, ''); -- check if client tried basic but
                        -- domain restricted to digest only
     if (allow_basic = 0 and 'basic' = lev)
    goto nf;
      _user := get_keyword ('username', auth, '');

      if ('' = _user) -- if no user name then 'bye'
    return 0;

      whenever not found goto nf;  -- if no such user in table - 'bye'

      -- got the password from users table

      select U_NAME, PWD_MAGIC_CALC (U_NAME, U_PASSWORD, 1), U_GROUP, U_ID
    into _u_name, _u_password, _u_group, _u_id from DB.DBA.SYS_USERS
    where u_name = _user;

      -- check credential against user name and password

      if (0 = _u_group and 1 = DB.DBA.vsp_auth_verify_pass (auth, _u_name,
                           get_keyword ('realm', auth, ''),
                           get_keyword ('uri', auth, ''),
                           get_keyword ('nonce', auth, ''),
                           get_keyword ('nc', auth, ''),
                           get_keyword ('cnonce', auth, ''),
                           get_keyword ('qop', auth, ''),
                           _u_password))
    {
      if (http_map_get ('persist_ses_vars'))
        {           -- if all is ok check for persistent variables storage
          declare vars any;
          declare sid varchar;
            vars := null;
            sid := http_param ('sid');
            -- got from session table stored variables
            vars := coalesce ((select deserialize (ASES_VARS)
              from DB.DBA.ADMIN_SESSION where ASES_ID = sid), null);
            if (sid is not null and vars is null or isarray (vars))
        connection_vars_set (vars);
          if (sid is not null and connection_get ('sid') is null)
        {
          connection_set ('sid', sid);
        }
        }
      return 1; -- return authenticated
    }
    }
 nf:    -- all errors go there, we compose authentication header
    -- and send 401 unauthorized to the client
  DB.DBA.vsp_auth_get (realm, http_path (),
        md5 (datestring (now ())),
        md5 ('eEsSlLAaf'),
        'false', lines, allow_basic);
  return 0; -- return not authenticated
}
;
```

``` programlisting
-- Authenticate against SYS_DAV_USER, using HP_SECURITY for level,
-- in the context of DAV administration pages accessed through regular HTTP
-- The logic is the same but in difference of password retrieval.

create procedure
DB.DBA.HP_AUTH_DAV_ADMIN (in realm varchar)
{
  declare _u_name, _u_pwd varchar;
  declare _u_group, _u_id, allow_basic integer;

  declare auth, sec, lev varchar;
  declare _user varchar;
  declare ses_dta, lines any;

  lines := http_request_header ();
  sec := http_map_get ('security_level');
  if (isstring (sec))
    sec := ucase (sec);
  if (sec = 'DIGEST')
    allow_basic := 0;
  else
    allow_basic := 1;
  auth := DB.DBA.vsp_auth_vec (lines);

  if (0 <> auth)
    {

      lev := get_keyword ('authtype', auth, '');
      if (allow_basic = 0 and 'basic' = lev)
    goto nf;
      _user := get_keyword ('username', auth, '');

      if ('' = _user)
    return 0;

      whenever not found goto nf;

      -- we tried to find out password for enabled valid WebDAV user
      select U_NAME, U_PWD, U_GROUP, U_ID
    into _u_name, _u_pwd, _u_group, _u_id from WS.WS.SYS_DAV_USER
    where u_name = _user and U_ACCOUNT_DISABLED = 0;

      if (DB.DBA.vsp_auth_verify_pass (auth, _u_name,
                get_keyword ('realm', auth, ''),
                get_keyword ('uri', auth, ''),
                get_keyword ('nonce', auth, ''),
                get_keyword ('nc', auth, ''),
                get_keyword ('cnonce', auth, ''),
                get_keyword ('qop', auth, ''),
                _u_pwd))
    {
      if (http_map_get ('persist_ses_vars'))
        {
          declare vars any;
          declare sid varchar;
            vars := null;
            sid := http_param ('sid');
            vars := coalesce ((select deserialize (ASES_VARS)
              from DB.DBA.ADMIN_SESSION where ASES_ID = sid), null);
            if (vars is null or isarray (vars))
          connection_vars_set (vars);
          if (connection_get ('sid') is null)
        {
          connection_set ('sid', sid);
        }
        }
      return (_u_id);
    }
    }
 nf:
  DB.DBA.vsp_auth_get (realm, '/admin/admin_dav',
        md5 (datestring (now ())),
        md5 ('vVAadAnIimMDdaNnimda'),
        'false', lines, allow_basic);
  return 0;
}
;
```

``` programlisting
-- The same as for DAV admin pages but in the context of DAV protocol requests.
create procedure
DB.DBA.HP_AUTH_DAV_PROTOCOL (in realm varchar)
{
  declare _u_name, _u_password, _perms varchar;
  declare _u_id, _u_group, req_user, req_group, what integer;
  declare auth varchar;
  declare _user varchar;
  declare our_auth_vec, lines, sec, path, req_perms, req_meth, cmp_perms, def_page varchar;
  declare _method, lev, allow_basic, authenticated integer;

  declare c cursor for select 1, COL_OWNER, COL_GROUP, COL_PERMS
      from WS.WS.SYS_DAV_COL where WS.WS.COL_PATH (COL_ID) = path;
  declare r cursor for select 2, RES_OWNER, RES_GROUP, RES_PERMS
      from WS.WS.SYS_DAV_RES where RES_FULL_PATH = path;

  authenticated := 0;

  lines := http_request_header ();
  path := http_physical_path ();

  if (isarray (lines))
    {
      req_meth := aref (lines, 0);
      if (strchr (req_meth, ' ') is not null)
        req_meth := lower (substring (req_meth, 1, strchr (req_meth, ' ')));
    }

  -- there we compose mask for permissions compared against
  -- resource or collection permission
  if (req_meth = 'get' or
      req_meth = 'post' or
      req_meth = 'options' or
      req_meth = 'propfind' or
      req_meth = 'head' or
      req_meth = 'trace' or
      req_meth = 'copy')
    cmp_perms := '1__'; -- in this case only read access needed
  else if (req_meth = 'mkcol' or req_meth = 'put')
    {
      if (length (path) > 1
          and strrchr (substring (path, 1, length(path) - 1), '/') is not null)
        path := substring (path, 1,
      strrchr (substring (path, 1, length(path) - 1), '/') + 1);
      cmp_perms := '11_';
    }
  else
    cmp_perms := '11_'; -- but in this we needs a read/write access

  what := 0;
  whenever not found goto fr;
  open c (prefetch 1);
  fetch c into what, req_user, req_group, req_perms;
        -- get from collections owner , owner group and permissions

  def_page := http_map_get ('default_page');
  if (isstring (def_page))
    {
      path := concat (path, def_page);
      what := 0;
    }
fr:
  close c;

  if (not what)
    {
      whenever not found goto fe;
      open r (prefetch 1);
      fetch r into what, req_user, req_group, req_perms; -- if not a collection try a resource
fe:
      close r;
    }

  sec := http_map_get ('security_level'); -- see DB user authentication
  if (isstring (sec))
    sec := ucase (sec);
  if (sec = 'DIGEST')
    allow_basic := 0;
  else
    allow_basic := 1;

  auth := DB.DBA.vsp_auth_vec (lines);

  if (0 <> auth)
    {
      lev := get_keyword ('authtype', auth, '');
      if (allow_basic = 0 and 'basic' = lev)
    goto nf;

      _user := get_keyword ('username', auth);

      if (_user = '' or isnull (_user))
    {
      goto nf;
    }

      whenever not found goto nf;

      select U_NAME, U_PWD, U_GROUP, U_ID, U_METHODS, U_DEF_PERMS
    into _u_name, _u_password, _u_group, _u_id, _method, _perms from WS.WS.SYS_DAV_USER
    where U_NAME = _user and U_ACCOUNT_DISABLED = 0;
      if (_u_password is null)
    goto nf;
      if (DB.DBA.vsp_auth_verify_pass (auth, _u_name,
                coalesce(get_keyword ('realm', auth), ''),
                coalesce(get_keyword ('uri', auth), ''),
                coalesce(get_keyword ('nonce', auth), ''),
                coalesce(get_keyword ('nc', auth),''),
                coalesce(get_keyword ('cnonce', auth), ''),
                coalesce(get_keyword ('qop', auth), ''),
                _u_password))
    {
      update WS.WS.SYS_DAV_USER set U_LOGIN_TIME = now () where U_NAME = _user;
      if (http_map_get ('persist_ses_vars'))
      {
        declare vars any;
        declare sid varchar;
        vars := null;
        sid := http_param ('sid');
        vars := coalesce ((select deserialize (ASES_VARS)
            from DB.DBA.ADMIN_SESSION where ASES_ID = sid), null);
          if (vars is null or isarray (vars))
        connection_vars_set (vars);
        if (connection_get ('sid') is null)
        {
        connection_set ('sid', sid);
        }
      }
      if (connection_get ('DAVUserID') <> _u_id)
        connection_set ('DAVUserID', _u_id);
          authenticated := 1;
    }
    }

-- Check permissions
  if (authenticated and _u_id = 1) -- If user is DAV admin all rights granted
    return 1;
  else if (not authenticated and req_perms like concat ('______', cmp_perms, '%'))
    return -1;  -- if not authenticated and resource
            -- does have public access return authenticated
  else if (authenticated and
          ((_u_id = req_user and req_perms like concat (cmp_perms, '%')) or
       (req_group = _u_group and req_perms like concat ('___', cmp_perms, '%')) or
       (req_perms like concat ('______', cmp_perms, '%'))))
    return (_u_id);     -- if user is owner or belongs to group
                -- ownership return authenticated
  else if (authenticated)   -- if authenticated but does not access
                    -- return false but set 403 forbidden
    {
      http_request_status ('HTTP/1.1 403 Forbidden');
      http ( concat ('<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">',
             '<HTML><HEAD>',
             '<TITLE>403 Forbidden</TITLE>',
             '</HEAD><BODY><H1>Forbidden</H1>',
             'Access to the resource is forbidden.</BODY></HTML>'));
      return 0;
    }
-- End check permissions

nf:     -- all error cases go there, we send authentication credentials
    -- and turn status 401 Unauthorized, and return false
  DB.DBA.vsp_auth_get (realm, '/DAV',
      md5 (datestring(now())),
      md5 ('opaakki'),
      'false', lines, allow_basic);
  return 0;
}
;
```

``` programlisting
-- Post-processing function, this will executed after processing
-- the request but before sending result to the client.
create procedure
DB.DBA.HP_SES_VARS_STORE ()
{
  declare vars any;
  declare sid varchar;
  if (http_map_get ('persist_ses_vars') and connection_is_dirty ())
    -- if connection variables changed in request and persistent variables stored
    {
      vars := connection_vars (); -- get all variables
      connection_vars_set (null); -- set immediately to empty vector (prevent changing)
      sid := get_keyword ('sid', vars, null); -- got the session ID
      -- store the variables in session table
      if (sid is not null)
    update DB.DBA.ADMIN_SESSION set ASES_VARS = serialize (vars) where ASES_ID = sid;
    }
}
;
```

These functions are implemented as part of Virtuoso server by default.
The user can freely define their own procedures based on this logic to
use for special authentication (different users information table etc.)
and session management.

</div>

<div>

<div>

<div>

<div>

### 14.1.6. Cancellation of Web Requests

</div>

</div>

</div>

If there are many long-running tasks processing on Virtuoso it is
possible to have denial of service. To prevent this we can use status
and stop functions. We can retrieve the URL, client IP-address, and
process status code for all currently running VSP requests, then use
this information to isolated and eliminate a process.

<a href="fn_http_pending_req.html" class="link"
title="http_pending_req"><code
class="function">http_pending_req()</code></a>

<div>

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="longhttptrans.html" class="link"                         
                              title="14.3.6. Long HTTP Transactions">Long HTTP Transactions</a>  |

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.7. Virtuoso WebRobot API

</div>

</div>

</div>

The Virtuoso WebRobot (WebCopy) is useful for retrieving Internet web
sites and storing them on to a local WebDAV repository. Once retrieved,
the local copy in the WebDAV repository can be exported to the local
filesystem or another WebDAV enabled server. The common features and
usages are demonstrated in the WebCopy User Interface in the Visual
Server Administration Interface. This document provides the actual API's
and techniques useful for some other implementations.

<div>

<div>

<div>

<div>

#### Creating A New Target

</div>

</div>

</div>

A new web server target is created by inserting a row in to the
WS.WS.VFS_SITE table and then a row in to the WS.WS.VFS_QUEUE table.

<div>

|                            |                                                                                           |
|:--------------------------:|:------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                 |
|                            | <a href="robotsystables.html" class="link"                                                
                              title="23.6.7. Web Robot System Tables">Web Robot System Tables</a> for table definitions  |

</div>

<div>

**Example 14.2. Creating a new target**

<div>

This example creates a new target pointing to the site
http://www.foo.com/help/, with instructions to walk across foreign
links, delete a local page if it is detected that it has been removed
from the remote, retrieve images, walk on entire site using HTTP GET
method. The content will be stored in /DAV/sites/www_foo_com collection
in the local WebDAV repository.

<div>

1.  Create target for http://www.foo.com/help/

    ``` programlisting
    insert into WS.WS.VFS_SITE
        (VS_DESCR,VS_HOST,VS_URL,VS_OWN,VS_ROOT,VS_NEWER,VS_DEL,
          VS_FOLLOW,VS_NFOLLOW,VS_SRC,VS_OPTIONS,VS_METHOD,VS_OTHER)
      values
        ('My first test', 'www.foo.com', '/help/', 1, 'sites/www_foo_com', '1990-01-01',
          'checked', '/%;', '', 'checked', null, null, 'checked');
    ```

2.  Create start queue entry

    ``` programlisting
    insert into WS.WS.VFS_QUEUE
        (VQ_HOST,VQ_TS,VQ_URL,VQ_ROOT,VQ_STAT,VQ_OTHER)
      values ('www.foo.com', now(), '/help/', 'sites/www_foo_com', 'waiting', null);
    ```

</div>

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

#### Creating A Custom Queue Hook

</div>

</div>

</div>

The custom queue hook can be used to extract the next entry from the
robot's queue following a custom algorithm. The following example
extracts the oldest entry comparing to the my_data array (this array
consists of non-desirable sites) and returns if some are found.

<div>

**Example 14.3. Creating A Custom Robot Queue Hook**

<div>

``` programlisting
create procedure
  DB.DBA.my_hook (
    in host varchar, in collection varchar, out url varchar, in my_data any
  )
{
  declare next_url varchar;
  whenever not found goto done;

  -- we trying to extract the oldest entry
  declare cr cursor for select VQ_URL from WS.WS.VFS_QUEUE
      where VQ_HOST = host and VQ_ROOT = collection and VQ_STAT = 'waiting'
      order by VQ_HOST, VQ_ROOT, VQ_TS for update;

  open cr;
  while (1)
  {
    fetch cr into next_url;
    if (get_keyword (host, my_data, null) is not null) -- process if host not in black-list
    {
      update WS.WS.VFS_QUEUE set VQ_STAT = 'pending'
      where VQ_HOST = host and VQ_ROOT = collection and VQ_URL = next_url;
      url := next_url;
      close cr;
      return 1;
    }
    else -- otherwise continue finding
    update WS.WS.VFS_QUEUE set VQ_STAT = 'retrieved'
      where VQ_HOST = host and VQ_ROOT = collection and VQ_URL = next_url;
    }
done:
  -- if we arrive at the bottom of the queue return false to stop processing
  close cr;
  return 0;
}
;
```

</div>

</div>

  

<div>

|                              |                                                                                                                                                                                                |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                          |
|                              | The default function will return the oldest entry from queue without any restriction. The follow/not-follow restrictions are applied to the path on target before inserting a new queue entry. |

</div>

</div>

<div>

<div>

<div>

<div>

#### Starting The Site's Retrieval/Update

</div>

</div>

</div>

The site retrieval can be performed with the WS.WS.SERV_QUEUE_TOP PL
function integrated in to the Virtuoso server.

<a href="fn_serv_queue_top.html" class="link"
title="SERV_QUEUE_TOP"><code
class="function">serv_queue_top()</code></a>

</div>

<div>

<div>

<div>

<div>

#### Exporting Local Content To Filesystem Or Other Webdav Enabled Server

</div>

</div>

</div>

<a href="fn_lfs_exp.html" class="link" title="LFS_EXP"><code
class="function">lfs_exp</code></a>

<a href="fn_dav_exp.html" class="link" title="DAV_EXP"><code
class="function">dav_exp</code></a>

<div>

|                            |                                                                     |
|:--------------------------:|:--------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                            |
|                            | <a href="robotsystables.html" class="link"                          
                              title="23.6.7. Web Robot System Tables">Web Robot System tables</a>  |

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.8. HTTP Server Extensions

</div>

</div>

</div>

The Virtuoso shared object library enables you to create your own custom
extensions to the Virtuoso HTTP server and create custom VSEs. Support
for PHP page execution was implemented using this functionality.
Virtuoso can automatically switch processing mode from VSP to PHP or
some other custom extension based on the extension of the files being
requested from the HTTP server. To enable Virtuoso to process files of a
different extension you have to write a VSE handler where part of the
name contains the extension:
<span class="emphasis">*\_\_http_handler\_\[extension\]*</span> . The
VSEs for HTTP handling must have the following parameters:

<div>

|                                         |                             |
|-----------------------------------------|-----------------------------|
| ` `**`__http_handler_<extension>`**` (` | in `resource` varchar,      |
|                                         | in `parameters` vector,     |
|                                         | in `request_header` vector, |
|                                         | inout `type_flag` any`)`;   |

<div>

 

</div>

</div>

<div>

- <span class="emphasis">*resource*</span> is either the path to a file
  or the content of a resource in the WebDAV store. The interpretation
  of this parameter by the server is dependent of the type_flag
  parameter.

- <span class="emphasis">*parameters*</span> for execution, the server
  will pass to this parameter a string session containing the entity
  body of the POST method request.

- <span class="emphasis">*request_header*</span> is the HTTP request
  header lines as an array of strings. This parameter will accept the
  original header as a vector. The vector will contain the complete HTTP
  request header.

- <span class="emphasis">*type_flag*</span> is an in/out parameter which
  is a flag for indicating the type of the first parameter. If the
  resource parameter is a file path in the file system this flag should
  be NULL, if the resource is located in the WebDAV store this flag
  should be set to URI of the WebDAV resource, something like:
  virt://WS.WS.SYS_DAV_RES.RES_FULL_PATH.RES_CONTENT:/DAV/dir1/subdir/myfile.php.
  Virtuoso will return in this parameter an array of two strings set to
  the http response status line and the header after execution.

</div>

<div>

|                            |                                                                                 |
|:--------------------------:|:--------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                       |
|                            | <a href="cinterface.html" class="link"                                          
                              title="18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)">Virtuoso  
                              Server Extensions Interface</a>                                                  |

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.9. Chunked Transfer Encoding

</div>

</div>

</div>

Virtuoso supports HTTP 1.1 Chunking Encoding which allows Virtuoso to
send the user agent chunks of output as the page is still processing.
Chunking is enabled by calling `http_flush(1)` within the VSP page.
Chunks are sent for every 4k worth of output generated. Chunked mode
requires the following conditions:

|                                                                     |
|---------------------------------------------------------------------|
| no "Content-Length" header sent to the client using http_header()   |
| no "Content-Encoding" header sent to the client using http_header() |
| use http_xslt() is not permitted                                    |
| The client supports HTTP 1.1                                        |

Failing these conditions, `http_flush(1)` will be a No-Operation.

Chunked mode is not supported for static content.

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
href="fn_http_flush.html" class="link" title="http_flush"><code
class="function">http_flush()</code></a></p>
<p><a href="http://www.rfc-editor.org/rfc/rfc2616.txt" class="ulink"
target="_top">RFC-2616</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

<div>

<div>

<div>

<div>

### 14.1.10. Using Virtuoso Server capabilities via Apache Web Server

</div>

</div>

</div>

In some situations Virtuoso services like WebDAV, JSP, PHP etc. may need
to be accessed via an Apache Web Server. All this can be done through
apache's mod_proxy to Virtuoso HTTP server and the Virtuoso HTTP server
can be configured to take requests coming only from localhost.

The following configuration makes : The Virtuoso server to listen for
HTTP requests coming ONLY from localhost. Apache proxies the outside
requests to Virtuoso HTTP server.

``` programlisting
    line added to the /etc/httpd/conf/httpd.conf
    (999.999.999.999, must be changed with actual IP address of external interface):
    ----------------------------------
    Listen 8080
    <VirtualHost 999.999.999.999:8080 127.0.0.1:8080>
           ServerAdmin webmaster@host.example.domain
           ProxyPass  / http://example.com/
    </VirtualHost>
    ----------------------------------
    
```

``` programlisting
    Then changes in the virtuoso.ini

    [HTTPServer] section)
        ...
    ServerPort = 127.0.0.1:6666
    ...
    
```

</div>

<div>

<div>

<div>

<div>

### 14.1.11. Setting Up the Virtuoso HTTPS Listener

</div>

</div>

</div>

The Setting up of the Virtuoso HTTPS Listener can be done by using the
file system or using the Virtuoso conductor.

Note that when you want to change from Virtuoso hosted Cert and Public
Key to File System and vice versa, first should be stopped the listener
for either setup.

<div>

<div>

<div>

<div>

#### Setting Up the Virtuoso HTTPS Listener to host Certificate and Public Key using File System

</div>

</div>

</div>

<div>

1.  X.509 certificate Generation

    The WebID Protocol consumer needs an x509 certificate with v3
    extension "Subject Alternate Name". This attribute is used for the
    owner's Web ID. For testing purposes we used OpenSSL demo CA to
    generate such certificates. If you are not using the OpenSSL demo
    CA, you must first setup a self-signed CA; read OpenSSL documents on
    how to do this.

    <div>

    1.  Add the following line to the `[usr_cert]` section of the
        `openssl.cnf` file:

        ``` programlisting
        subjectAltName=$ENV::ALTNAME
        ```

    2.  Set the environment variable `ALTNAME` to the owner's Web ID,
        e.g.,

        ``` programlisting
        export ALTNAME=URI:http://example.com/dataspace/person/myname#this
        ```

    3.  Make a self-signed certificate, e.g.,

        ``` programlisting
        $ CA.pl -newreq (follow the dialog)
        $ CA.pl -sign
        ```

    4.  When asked to commit the certificate, make sure you see several
        lines above, like

        ``` programlisting
        X509v3 Subject Alternative Name:
            URI:http://example.com/dataspace/person/myname#this
        ```

    5.  If your browser wants a `PKCS#12` bundle, you must make one

        ``` programlisting
        $ openssl pkcs12 -export -in newcert.pem -inkey newkey.pem -out mycert.p12
        ```

    6.  Rename `newcert.pem` and `newkey.pem` , to `mycert.pem` and
        `mykey.pem` for example.

    </div>

2.  Move `newcert.pem` , `newkey.pem` , and `cacert.pem` into the
    server's working directory. In our test case, we put the keys in a '
    `keys` ' sub-directory, and added the following lines to the
    `[HTTPServer]` section of the Virtuoso INI file, `virtuoso.ini` :

    ``` programlisting
    SSLPort                     = 4443
    SSLCertificate              = ./keys/localhost.cert.pem
    SSLPrivateKey               = ./keys/localhost.key.pem
    X509ClientVerifyCAFile      = ./keys/localhost.ca.pem
    X509ClientVerify            = 1
    X509ClientVerifyDepth       = 15
    ```

3.  Also in the Virtuoso INI file, in the `[URIQA]` section,
    `DefaultHost` ( `example.com:8890` below) must be edited to
    correspond to the DNS-resolvable host name ("CNAME") of the Virtuoso
    host, combined with the `ServerPort` as set in the `[HTTPServer]`
    section of the same INI file.

    ``` programlisting
    [URIQA]
    DynamicLocal = 1
    DefaultHost  = example.com:8890
    ```

    For example, if the CNAME of the host is `virtuoso.example.com` ,
    and the `ServerPort` is `4321` , the `DefaultHost` should be set to
    `virtuoso.example.com:4321`

    ``` programlisting
    [URIQA]
    DynamicLocal = 1
    DefaultHost  = virtuoso.example.com:4321
    ```

4.  Start the Virtuoso server, and look at the log file. Once HTTPS is
    up, you should see something like:

    ``` programlisting
    HTTPS Using X509 Client CA ....
    HTTPS/X509 server online at 4443
    ```

5.  Setting Up Firefox:

    <div>

    1.  In the Preferences dialog, open the Advanced tab, and click the
        "View certificates" button.

        <div>

        <div>

        **Figure 14.3. HTTPS Listener**

        <div>

        <div>

        ![HTTPS Listener](images/ui/htps1.png)

        </div>

        </div>

        </div>

          

        </div>

    2.  Click the "Add exception" button ,and enter the address of the
        HTTPS server you've just configured, i.e.
        https://virtuoso.example.com:4443/

    3.  Click OK, and confirm the exception.

        <div>

        <div>

        **Figure 14.4. HTTPS Listener**

        <div>

        <div>

        ![HTTPS Listener](images/ui/htps2.png)

        </div>

        </div>

        </div>

          

        </div>

    4.  Click to the "Your Certificates" tab, and import `mycert.p12` .

    </div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Setting Up the Virtuoso HTTPS Listener to host Certificate and Public Key using Virtuoso Conductor

</div>

</div>

</div>

<div>

1.  Go to the `http://cname:port/conductor` URL, enter the DBA user
    credentials.

    <div>

    <div>

    **Figure 14.5. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps3.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Go to System Admin-\>Security

    <div>

    <div>

    **Figure 14.6. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps4.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Enter the Issuer details:

    <div>

    <div>

    **Figure 14.7. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps5.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click Generate

    <div>

    <div>

    **Figure 14.8. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps6.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click Configure HTTPS Listeners

    <div>

    <div>

    **Figure 14.9. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps7.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Edit the new listener, and click "Generate New" key.

    <div>

    <div>

    **Figure 14.10. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps8.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click Save

    <div>

    <div>

    **Figure 14.11. HTTPS Listener**

    <div>

    <div>

    ![HTTPS Listener](images/ui/htps9.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Setting Up Firefox:

    <div>

    1.  In the Preferences dialog, open the Advanced tab, and click the
        "View certificates" button.

    2.  Click the "Add exception" button and enter the address of the
        HTTPS server you've just configured, i.e.
        https://virtuoso.example.com:443/

    3.  Click OK, and confirm the exception.

        <div>

        <div>

        **Figure 14.12. HTTPS Listener**

        <div>

        <div>

        ![HTTPS Listener](images/ui/htps10.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

</div>

</div>

</div>

</div>

</div>
