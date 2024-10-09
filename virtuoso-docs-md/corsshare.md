<div>

<div>

<div>

<div>

### 19.8.5. Setting up server-side Cross-Origin Resource Sharing (CORS) with Virtuoso

</div>

</div>

</div>

User agents (e.g., Web browsers) have traditionally restricted scripts
within web pages by a Same Origin Policy, which allowed scripts to make
requests only to resources within the same domain from which the scripts
themselves originated. This restriction is meant to protect the user and
their computer from "Trojan horse websites" which may appear to be safe,
but which then make unsafe HTTP requests to other, invisible sites. This
restriction also protects the second website from potential "Denial of
Service" and other attacks, whether accidental or intentional.

This policy has the unfortunate side-effect of also preventing
client-side Web applications served from one website ("Origin") from
retrieving data from another website ("Origin").

<a href="http://www.w3.org/TR/cors/" class="ulink"
target="_top">Cross-Origin Resource Sharing (CORS)</a> is a mechanism
intended to enable safer client-side cross-origin requests, primarily
focused on data.

<div>

<div>

<div>

<div>

#### How does CORS work?

</div>

</div>

</div>

Authentication and session-management information methods are extended
in several ways:

<div>

- Enforcement by User Agent

  <div>

  - A server providing a resource can include an

    <span class="emphasis">*Access-Control-Allow-Origin*</span>

    HTTP response header, with a value of the request's triggering
    script's site of origin (that is, the site which provided the script
    which made the request for the resource), to indicate whether access
    to the resource's contents may be allowed. The user agent validates
    that the value in this header matches the actual origin of the
    script which made the request.

  - User agents can use a "pre-flight request" to discover whether a
    cross-origin resource is prepared to accept requests from a given
    script origin, using a complex method (which we will not detail
    here). Again, the response is validated by the user agent.

  </div>

- Enforcement by Server-side Application

  <div>

  - Server-side applications can refer to the

    <span class="emphasis">*Origin*</span>

    HTTP request header to discover whether the user agent deemed it a
    cross-origin request. Here, the server-side application enforces
    limitations (e.g., returning nothing, partial results, or full
    results) on the cross-origin requests that they are willing to
    service at all.

  </div>

</div>

</div>

<div>

<div>

<div>

<div>

#### CORS Setup for Virtuoso servers

</div>

</div>

</div>

With Virtuoso 6 and later (specific earliest versions as noted below),
CORS support may be configured at the server-level or enabled through
application logic (scripting, PL, etc.).

When working with older versions of Virtuoso, CORS support cannot be
configured at the server-level, but it may be enabled within application
logic (scripting, PL, etc.).

<div>

<div>

<div>

<div>

##### Application-level CORS Setup

</div>

</div>

</div>

Any Virtuoso PL (VSP)-based application can implement CORS checking
through well-known HTTP functions
<a href="fn_http_request_header.html" class="link"
title="http_request_header"><code
class="function">http_request_header()</code></a> and
<a href="fn_http_header.html" class="link" title="http_header"><code
class="function">http_header()</code></a> . This method will work with
any version of Virtuoso. For instance:

``` programlisting
<?vsp 
    IF (http_request_header (lines, 'Origin', NULL) = 'http://host.org')
      {
          http_header ('Access-Control-Allow-Origin: http://host.org\r\n');
      }
   ELSE 
      {
         RETURN;
      }
-- Additional code here ---

?>
```

Applications running in other hosted environments (Perl, Python, PHP,
ASP.NET, etc.) may also use their specific scripting options to add
and/or check relevent headers.

</div>

<div>

<div>

<div>

<div>

##### Server-level CORS Setup

</div>

</div>

</div>

Note: These instance/server-level configuration instructions require
<a href="http://edit-wiki.usnet.private/dataspace/dav/wiki/VOS/VOSNews"
class="ulink" target="_top">Virtuoso Open Source (VOS) 6.1.3 or
later</a> , or
<a href="http://download.openlinksw.com/virtwiz/" class="ulink"
target="_top">Virtuoso Commercial Edition 6.2.3129 or later</a> .

<div>

1.  In the Virtuoso Conductor, go to

    <span class="emphasis">*Web Application Server -\> Virtual
    Directories & Directories*</span>

    .

    <div>

    <div>

    **Figure 19.3. Server-side Cross-Origin Resource Sharing (CORS)
    Example Setup**

    <div>

    <div>

    ![Server-side Cross-Origin Resource Sharing (CORS) Example
    Setup](images/ui/oc1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Expand the

    <span class="emphasis">*Interface*</span>

    store.

    <div>

    <div>

    **Figure 19.4. Server-side Cross-Origin Resource Sharing (CORS)
    Example Setup**

    <div>

    <div>

    ![Server-side Cross-Origin Resource Sharing (CORS) Example
    Setup](images/ui/oc2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click

    <span class="emphasis">*New Directory*</span>

    .

4.  Specify the desired

    <span class="emphasis">*Virtual Directory Type*</span>

    , or choose an existing virtual directory to use as a template.

    <div>

    <div>

    **Figure 19.5. Server-side Cross-Origin Resource Sharing (CORS)
    Example Setup**

    <div>

    <div>

    ![Server-side Cross-Origin Resource Sharing (CORS) Example
    Setup](images/ui/oc3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click

    <span class="emphasis">*Next*</span>

    .

6.  Specify the

    <span class="emphasis">*Directory Path*</span>

    value.

    <div>

    <div>

    **Figure 19.6. Server-side Cross-Origin Resource Sharing (CORS)
    Example Setup**

    <div>

    <div>

    ![Server-side Cross-Origin Resource Sharing (CORS) Example
    Setup](images/ui/oc4.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Set the

    <span class="emphasis">*CORS*</span>

    options.

    <div>

    <div>

    **Figure 19.7. Server-side Cross-Origin Resource Sharing (CORS)
    Example Setup**

    <div>

    <div>

    ![Server-side Cross-Origin Resource Sharing (CORS) Example
    Setup](images/ui/oc5.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    - <span class="emphasis">*Cross-Origin Resource Sharing*</span>

      : Contains a single wildcard asterisk, i.e., "

      <span class="emphasis">*\**</span>

      ", or a space-delimited list of HTTP server URIs, e.g., "

      <span class="emphasis">*http://example.com:8080
      http://blah.example.com http://foo.example.com*</span>

      ". Scripts originating on the listed HTTP servers are authorized
      to retrieve the specified resource(s); the wildcard means scripts
      from any HTTP server will be authorized. For this example, enter
      the following single URI:

      ``` programlisting
      http://demo.openlinksw.com  
      ```

    - <span class="emphasis">*Reject Unintended CORs* </span>

      checkbox: When ticked (and the application does not overwrite
      headers), unmatched Origins will be rejected by sending an empty
      response. For this example, tick this box.

    </div>

8.  Click Save changes.

</div>

</div>

<div>

<div>

<div>

<div>

##### Example Usage with cURL

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Example 1

</div>

</div>

</div>

<div>

1.  Suppose the example setup above is performed, and
    http://demo.openlinksw.com/ is in the CORS list.

2.  In this case, the request below will return an empty response:

    ``` programlisting
    $ curl -i  http://demo.openlinksw.com/mytest/test.vsp
    HTTP/1.1 200 OK
    Server: Virtuoso/06.02.3128 (Win32) i686-generic-win-32  VDB
    Connection: Keep-Alive
    Content-Type: text/html; charset=ISO-8859-1
    Date: Thu, 28 Oct 2010 09:27:54 GMT
    Accept-Ranges: bytes
    Content-Length: 0
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Example 2

</div>

</div>

</div>

<div>

1.  Suppose the example Setup above is performed, and
    http://demo.openlinksw.com/ is in the CORS list.

2.  Also, suppose the curl command includes a proper Origin value, e.g.:

    ``` programlisting
    -H "Origin: http://demo.openlinksw.com"
    ```

3.  In this case, the request below will return a response including the
    retrieved content, etc.

    ``` programlisting
    $ curl -i -H "Origin: http://demo.openlinksw.com"  http://demo.openlinksw.com/mytest/test.vsp
    HTTP/1.1 200 OK
    Server: Virtuoso/06.02.3128 (Win32) i686-generic-win-32  VDB
    Connection: Keep-Alive
    Content-Type: text/html; charset=ISO-8859-1
    Date: Thu, 28 Oct 2010 09:40:21 GMT
    Access-Control-Allow-Origin: http://demo.openlinksw.com
    Accept-Ranges: bytes
    Content-Length: 7
    ```

</div>

</div>

<div>

<div>

<div>

<div>

###### Example 3

</div>

</div>

</div>

<div>

1.  Suppose the Example Setup above is performed, but reject is off
    (i.e., "Reject Unintended CORs" check-box is not ticked).

2.  In this case, the request below will return a response that lacks
    Access-Control-Allow-Origin:

    ``` programlisting
    $ curl -i  http://demo.openlinksw.com/mytest/test.vsp
    HTTP/1.1 200 OK
    Server: Virtuoso/06.02.3128 (Win32) i686-generic-win-32  VDB
    Connection: Keep-Alive
    Content-Type: text/html; charset=ISO-8859-1
    Date: Thu, 28 Oct 2010 09:45:01 GMT
    Accept-Ranges: bytes
    Content-Length: 7
    ```

</div>

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
href="https://wiki.mozilla.org/Security/Origin" class="ulink"
target="_top">Origin header proposal for CSRF and click-jacking
mitigation</a></p>
<p><a href="http://arunranga.com/examples/access-control/" class="ulink"
target="_top">CORS In Action</a></p>
<p><a
href="http://www.nczonline.net/blog/2010/05/25/cross-domain-ajax-with-cross-origin-resource-sharing/"
class="ulink" target="_top">Cross-domain Ajax with Cross-Origin Resource
Sharing</a></p>
<p><a
href="http://code.google.com/p/html5security/wiki/CrossOriginRequestSecurity"
class="ulink" target="_top">Guide to Secure Implementation of Cross
Origin Requests in HTML5</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

</div>

</div>
