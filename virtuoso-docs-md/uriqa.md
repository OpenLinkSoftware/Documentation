<div>

<div>

<div>

<div>

## 19.2. URIQA Semantic Web Enabler

</div>

</div>

</div>

Virtuoso supports the URIQA (URI Query Agent) extension of HTTP WebDAV
protocol. URIQA adds three new methods to HTTP in order to retrieve, add
and remove RDF metadata about a given subject. The subject is identified
by its URI. If the subject is a DAV resource then URIQA will usually
reuse the DAV URI of the resource. If the subject is not a resource but
something else (physical entity, imaginary thing or vocabulary item)
then URIQA can be used to process metadata about the subject even if the
subject itself can not be accessed via HTTP.

URIQA-specific HTTP methods are called MGET (to retrieve existing
metadata), MPUT (to add or update RDF triples) and MDELETE (to remove
some or all triples). A single URIQA request usually deals with a single
subject that is specified by request URI. The MGET response, however,
can return metadata about more than one RDF subject, e.g., the request
about a book can return both data about the book itself plus some data
about persons who are known as authors of the book.

In addition to URIQA-specific HTTP methods, Virtuoso implements a
semantic web service interface that allows plain HTTP clients to access
metadata using traditional GET or POST HTTP methods.

The Virtuoso URIQA implementation allows flexible configuration using an
ordered list of request handlers. Every handler has a pattern for URIs;
if the URI in the request does not match the pattern then the handler is
ignored, otherwise a callback function of the handler is called to
process the request. The default configuration of Virtuoso server will
try three sorts of actions.

|                                                                                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| If the URI points to a resource located at the server then the first handler returns DAV metadata of the resource.                                                                                                                                                                   |
| If the URI points to a resource that is outside the server, and URI is of sort 'http://...' then Virtuoso will send a URIQA web service request to the remote server specified in URI in hope that it will return at least something, the response is passed to the client unchange. |
| Any other URI results in an error.                                                                                                                                                                                                                                                   |

<div>

|                              |                                                                                                                                                                                                                                                                                                           |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                     |
|                              | URIQA is not yet a stable standard. Virtuoso implements draft of URIQA proposal from Nokia, dated 2004. As URIQA will evolve, future versions of Virtuoso will implement updated versions of the specification. There is no warranty that future implementations will be compatible with the current one. |

</div>

<div>

|                            |                                                              |
|:--------------------------:|:-------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: External References                                |
|                            | <a href="http://sw.nokia.com/uriqa/URIQA.html" class="ulink" 
                              target="_top">The Nokia URI Query Agent Model</a>             |

</div>

<div>

<div>

<div>

<div>

### 19.2.1. URIQA HTTP Methods

</div>

</div>

</div>

All three methods have a set of HTTP header parameters to specify the
precise URI of the subject. HTTP does not require that every resource is
accessible via a single valid URI, so many equivalent URLs can point to
same resource and the result of typical HTTP request does not change if
one of equivalent URLs is replaces with some other. Unlike HTTP GET,
HTTP PUT etc., metadata methods may return different results for
different URLs even if these URLs are equivalent for other methods.
URIQA rules are very simple.

|                                                                                                                                                                                                                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| If the URIQA request header contains 'URIQA-uri' parameter line then the value of this parameter is used and any other URI data are ignored.                                                                                                                                                                          |
| If the URIQA request header contains 'Host' parameter line then the URL from the first line of the request is patched to contain host name specified by 'Host' parameter, no matter whether the original URL contains host or what host name or network interface or port is user by client to connect to the server. |
| If the URIQA request header does not contain 'URIQA-uri' or 'Host' line then the URL from the first line of the request is used 'as is', extended by host name from 'DefaultHost' URIQA configuration parameter if needed.                                                                                            |

<div>

**Example 19.4. Examples of MGET Requests**

<div>

The following requests are all equivalent:

Request 1. 'URIQA-uri' is used, the rest does not matter.

``` programlisting
MGET /foo HTTP/1.1
Host: example.com
URIQA-uri: http://example.com/foo
```

Request 2. 'URIQA-uri' is missing, 'Host' is used, the host name
www.example.com is ignored.

``` programlisting
MGET http://www.example.com/foo HTTP/1.1
Host: example.com
```

Request 3. The URI from the first line is used verbatim. This is unsafe,
because proxy servers can alter the URI, e.g. by adding port number.

``` programlisting
MGET http://example.com/foo HTTP/1.1
```

Request 4. The URI from the first line is used, but host name is
retrieved from 'DefaultHost' URIQA configuration parameter. If the
parameter is set to example.com then the request is equivalent to
previous.

``` programlisting
MGET /foo HTTP/1.1
```

</div>

</div>

  

<div>

<div>

<div>

<div>

#### MGET Method

</div>

</div>

</div>

MGET request contains a subject URI and the response consists of RDF/XML
representation of an RDF graph with metadata about the subject. In many
cases, the returned graph is a Concise Bounded Description of the
resource or something similar, but it can be of any sort.

There are no integrity rules. E.g., if a response for request about
subject A contains some data about B then the request about B may return
same or different data, or even report that B does not exists. If URI
refers to non-existing resource or even to a non-existing server or
protocol then the response can be an 'not found' error or an empty graph
or even a non-empty graph, depending on the handler that processed the
request.

Usually MGET request consists of only subject URI specification, but it
can contain any other parameters such as an authentication or even the
HTTP request body with extra data for some particular handler. For
Virtuoso DAV resources, MGET will need read permission on the subject
resource, because the resulting RDF is retrieved from
'http://local.virt/DAV-RDF' property of the resource.

</div>

<div>

<div>

<div>

<div>

#### MPUT Method

</div>

</div>

</div>

MPUT request contains an HTTP header that describe a subject URI and
contains Content-Length, and the body must be an RDF/XML that consist of
triples that should be added. The server will try to add new RDF triples
from the body to the description of the subject. In some cases, the
server will replace obsolete triples with triples from the body, e.g.,
if some RDF Schema is in use that states for a predicate that it can not
have more than one value for any given subject.

There are no integrity rules. If MPUT request with subject A submits
data about resource B then the updated data may become visible via MGET
request with subject A and stay unchanged if retrieved directly by MGET
with subject B. For instance, the default request handler for DAV will
update only 'http://local.virt/DAV-RDF' DAV property of the subject
resource not touching any DAV properties of resources named in the
request.

A client application can not use MPUT with subject URI that refers to a
non-DAV Virtuoso resource, because disk-resident resources do not have
DAV properties, including DAV metadata properties. MPUT can refer to
nonexisting Virtuoso DAV resource only if the name of this resource has
been already locked for uploading of the resource. The most reliable
way, however, is to upload the resource first and update metadata only
after the uploading. There are two reasons to do operations in this
sequence. First of all, Virtuoso can automatically extract some metadata
from the content of uploaded resource and if MPUT happens after the
upload then MPUT data can properly overwrite automatically extracted
values. An additional reason is that resource uploading will set the
MIME-type of the resource and may associate some RDF Schemas with the
resource; hence MPUT can properly update some triples instead of storing
multiple values for some predicate that should have only one value
according to RDF Schema.

For Virtuoso DAV resources, MPUT will need both read and write
permissions on the subject resource, because 'http://local.virt/DAV-RDF'
property of the resource is first retrieved and then updated.

</div>

<div>

<div>

<div>

<div>

#### MDELETE Method

</div>

</div>

</div>

MDELETE request contains an HTTP header that describe a subject URI and
may contain the body. If present then the body must be an RDF/XML that
consist of triples that should be deleted. If the body is totally
missing then MDELETE removes all metadata associated with the subject
URI.

There are no integrity rules. If MDELETE request with subject A removes
triples about resource B then these triples may stay visible if
retrieved directly by MGET with subject B. For instance, the default
request handler for DAV will update only 'http://local.virt/DAV-RDF' DAV
property of the subject resource not touching any DAV properties of
resources named in the request.

For Virtuoso DAV resources, MPUT will need both read and write
permissions on the subject resource, because 'http://local.virt/DAV-RDF'
property of the resource is first retrieved and then updated.

</div>

</div>

</div>
