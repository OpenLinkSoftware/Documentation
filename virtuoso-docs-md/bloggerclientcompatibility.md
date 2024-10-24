<div>

<div>

<div>

<div>

### 14.7.2. Blogger Clients Compatibility

</div>

</div>

</div>

The Virtuoso Blog server implementation has been tested against the
following blog client applications:

|                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------|
| <a href="http://radio.userland.com/download" class="ulink" target="_top"                                           
 shape="rect">Radio Userland</a> (Manila Blogger Bridge tool and Upstreaming), available for MS Windows and MacOS X  |
| <a href="http://www.newzcrawler.com/downloads.shtml" class="ulink"                                                 
 target="_top" shape="rect">NewzCrawler</a> , available for MS Windows                                               |
| <a href="http://wbloggar.com/download/" class="ulink" target="_top"                                                
 shape="rect">w.bloggar</a> , available for MS Windows                                                               |
| <a href="http://blogbuddy.sourceforge.net/" class="ulink" target="_top"                                            
 shape="rect">blogBuddy</a> , available for MS Windows                                                               |
| <a href="http://www.zempt.com/download/" class="ulink" target="_top"                                               
 shape="rect">Zempt</a> , available for MS Windows                                                                   |
| <a href="http://www.farook.org/BlogMan.htm" class="ulink" target="_top"                                            
 shape="rect">BlogMan</a> , available for MS Windows                                                                 |
| <a href="http://www.myelin.co.nz/thinblog/" class="ulink" target="_top"                                            
 shape="rect">thinblog</a> , Java based client                                                                       |

The steps required to allow third-party clients to operate with Virtuoso
are:

<div>

1.  Create a WebDAV account using the Server Administration Interface
    making sure that the home directory is created as /DAV/\<username\>/

2.  Enable the XML-RPC bridge on a SOAP endpoint (see "XML-RPC endpoint
    configuration" section above)

3.  Most client tools accept a username and password, enter the
    credentials and URI for XML-RPC endpoint.

4.  Allow the client tool time to refresh the Blog data.

5.  Post a simple message, verify its creating using the Server
    Administration Interface's Weblog link.

</div>

**Interoperability Notes. ** The "Zempt" application will report an
error upon startup saying that "mt.supportedTextFilters" are not
supported, however it it will continue to work with the Virtuoso's
blogging server.

</div>
