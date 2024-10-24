<div>

<div>

<div>

<div>

### 14.7.8. Atom API

</div>

</div>

</div>

The Atom API is a protocol for publishing and editing a blog entries
using the common HTTP verbs:

|                                                              |
|--------------------------------------------------------------|
| GET - used to retrieve a blog post or perform query          |
| PUT - used to update an existing blog post                   |
| POST - used to create a new post or perform an update action |
| DELETE - used to remove a post                               |

**Authentication. ** The Atom API implementation accepts both HTTP basic
and digest authentication. All requests for post content modification
require an authorization. Furthermore, the account used for
authentication is checked to be the blog owner or have granted
privileges on that particular blog. The retrieval operations; which no
post modification is possible are not required to ask for
authentication.

**Introspection. ** When editing the content of a blog, the first thing
is to find out the servers capabilities. So the 'introspection' file
lists all the functions that a given site supports.

<div>

**Example 14.54. Intropsection**

<div>

Request:

``` programlisting
GET /Atom/Http/intro?b=128 HTTP/1.1
Host: example.com
```

Response:

``` programlisting
HTTP/1.1 200 OK
Server: Virtuoso
Connection: Keep-Alive
Date: Mon, 10 Nov 2003 10:21:55 GMT
Content-Type: text/xml; charset="ISO-8859-1"
Content-Length: 417

<?xml version="1.0" encoding="ISO-8859-1"?>
<introspection xmlns="http://example.com/newformat#" >
  <create-entry>http://example.com/Atom/Http/entry?b=128</create-entry>
  <user-prefs>http://example.com/Atom/Http/prefs?b=128</user-prefs>
  <search-entries>http://example.com/Atom/Http/search?b=128</search-entries>
  <categories>http://example.com/Atom/Http/categories?b=128</categories>
</introspection>
```

</div>

</div>

  

**Posting a new entry. ** To post a new entry, the HTTP POST must be
performed with MIME type '`application/x.atom+xml` ' for the request
content. If server accepts the request a `Location:` HTTP header will be
returned to the client containing the URL to the newly created post.

<div>

**Example 14.55. Posting an Entry**

<div>

``` programlisting
POST /Atom/Http/entry?b=128 HTTP/1.1
Content-Type: application/x.atom+xml
Content-Length: nnn
Authorization: ...

<?xml version="1.0" encoding="iso-8859-1"?>
<entry xmlns="http://example.com/newformat#">
  <title>My Entry</title>
  <author>
    <name>Blog Author</name>
  </author>
  <issued>2003-11-04T17:29:29</issued>
  <content type="application/xhtml+xml" xml:lang="en-us">
    <p xmlns="">Hello world!</p>
  </content>
</entry>
```

The response from server would be:

``` programlisting
HTTP/1.1 201 Created
Location: http://host:port/Atom/Http/entry?b=128&id=nn
```

</div>

</div>

  

**Editing an Existing Entry. ** An entry can be edited via the HTTP PUT
method. The URL used for PUT must be one returned by the `Location:`
header of the POST response or those returned from entry-search. The
content of PUT request is same as for posting a new entry.

<div>

**Example 14.56. Editing a weblog entry**

<div>

``` programlisting
POST /Atom/Http/entry?b=128&id=nn HTTP/1.1
Content-Type: application/x.atom+xml
Content-Length: nnn
Authorization: ...

<?xml version="1.0" encoding="iso-8859-1"?>
<entry xmlns="http://example.com/newformat#">
  <title>My Entry</title>
  <author>
    <name>Blog Author</name>
  </author>
  <issued>2003-11-04T17:29:29</issued>
  <content type="application/xhtml+xml" xml:lang="en-us">
    <p xmlns="">Hello world! (edit test)</p>
  </content>
</entry>
```

The server response is:

``` programlisting
HTTP/1.1 205 Reset Content
```

</div>

</div>

  

**Retrieving an Entry. ** Retrieval of an existing entry is the simple,
usual HTTP GET request with URL to the entry.

<div>

**Example 14.57. Retrieving an Entry**

<div>

``` programlisting
GET /Atom/Http/entry?b=128&id=nn HTTP/1.1
Accept: application/x.atom+xml
```

Server will respond with

``` programlisting
HTTP/1.1 200 OK
Content-Type: application/x.atom+xml
Content-Length: nnn

<?xml version="1.0" encoding="iso-8859-1"?>
<entry xmlns="http://example.com/newformat#">
  <title>My Entry</title>
  <author>
    <name>Blog Author</name>
  </author>
  <issued>2003-11-04T17:29:29</issued>
  <content type="application/xhtml+xml" xml:lang="en-us">
    <p xmlns="">Hello world! (edit test)</p>
  </content>
</entry>
```

</div>

</div>

  

**Deleting an Entry. ** To remove permanently an existing entry an HTTP
DELETE method is used with URL to the entry.

<div>

**Example 14.58. Deleting an Entry**

<div>

``` programlisting
DELETE /Atom/Http/entry?b=128&id=nn HTTP/1.1
```

Response:

``` programlisting
HTTP/1.1 200 OK
```

</div>

</div>

  

**Searching Entries. ** To retrieve a subset of messages based some
criteria a search should be performed. The current implementation
supports two variants: range and last_N.

<div>

**Example 14.59. Searching**

<div>

``` programlisting
GET /Atom/Http/search?b=128?last=7 HTTP/1.1
Accept: application/x.atom+xml
Host: example.com
Authorization: ...
```

or

``` programlisting
GET /Atom/Http/search?b=128&start-range=2&end-range=27 HTTP/1.1
Accept: application/x.atom+xml
Host: example.com
Authorization: ...
```

Response from server will look like:

``` programlisting
<search-results xmlns="http://example.com/newformat#">
<match title="Classic ASP Framework. Make your Classic...">http://example.com/Atom/Http?b=128&amp;id=6</match>
<match title="DB Navigator - an open source .NET control">http://example.com/Atom/Http?b=128&amp;id=4</match>
<match title="Sort an Array with Non-Comparable Items">http://example.com/Atom/Http?b=128&amp;id=5</match>
<match title="SignedXML Licensing Sample">http://example.com/Atom/Http?b=128&amp;id=7</match>
<match title="TicTacToe">http://example.com/Atom/Http?b=128&amp;id=1</match>
<match title="Check your eMails in Hotmail using HTTPMail">http://example.com/Atom/Http?b=128&amp;id=2</match>
<match title="Slashdot.org RSS Feed Reader">http://example.com/Atom/Http?b=128&amp;id=3</match>
</search-results>
```

Each sub element of the search result contains the title of the post and
its URL. These URLs can be used retrieved using the GET method, or
modified via PUT/DELETE methods.

</div>

</div>

  

<div>

<div>

<div>

<div>

#### Atom Client API

</div>

</div>

</div>

The Atom Client API is a mirror of the blogger API functionality, but
uses the Atom protocol instead of XML-RPC. Before the Atom API can be
put to use, the introspection file must be retrieved in order to know
the URLs for the requests.

<div>

- `atom.new_Post (in uri varchar, in req "blogRequest", ) `

  This is to post a new entry to the blog identified by 'uri'. The 'req'
  must be initialized with authentication and entry data. This function
  returns the URL to the new entry. This could be used with sequential
  GET/PUT or DELETE requests for it.

- `atom.edit_Post (in uri varchar, in req "blogRequest", ) `

  This is to modify an existing entry identified by 'uri'. The 'req'
  must be initialized with authentication and entry data. The function
  returns true on success or will signal an error.

- `atom.delete_Post (in uri varchar, in req "blogRequest", ) `

  This is to delete an existing entry identified by 'uri'. The 'req'
  must be initialized with authentication data. The function returns
  true on success or will signal an error.

- `atom.get_Post (in uri varchar, in req "blogRequest", ) `

  This is to retrieve an existing post entry identified by 'uri'. The
  'req' must be initialized with authentication data. This function will
  return on success an MTWeblogPost UDT, filled with post entry data.

- `atom.get_RecentPosts (in uri varchar, in req "blogRequest", in num int, ) `

  This is to retrieve last-N post entries identified by blog search
  URL - 'uri'. The 'req' must be initialized with authentication data.
  'num' is number of entries to return.

  This function returns an array of arrays containing the title and URL
  of the matching blog posts.

- `atom.get_Intro (in uri varchar, ) `

  This is used to return Introspection information for a blog identified
  by introspection file - 'uri'.

</div>

<div>

**Example 14.60. Using the Atom Client API**

<div>

Getting the introspection info about a blog

``` programlisting
declare x any;
x := atom.get_Intro ('http://example.com/Atom/Http/intro?b=128');
-- x will contain
-- (("create-entry" "http://example.com/Atom/Http/entry?b=128" )
--  ("user-prefs"
-- "http://example.com/Atom/Http/prefs?b=128" ) ("search-entries"
-- "http://example.com/Atom/Http/search?b=128" ) ("categories"
-- "http://example.com/Atom/Http/categories?b=128" ) )
```

make a new entry

``` programlisting
declare resp any;
declare req "blogRequest";
declare stru "MTWeblogPost";

req := new "blogRequest" ('', '', '', 'dav', 'dav');
stru := new "MTWeblogPost" ();
stru.title := 'My title'
stru.description := '<p>hello</p>';
req.struct := stru;
resp := atom.new_Post ('http://example.com/Atom/Http/entry?b=128', req);
```

The response, resp, would contain:
`http://example.com/Atom/Http/entry?b=128&id=1`

edit an entry:

``` programlisting
declare resp any;
declare req "blogRequest";
declare stru "MTWeblogPost";

req := new "blogRequest" ('', '', '', 'dav', 'dav');
stru := new "MTWeblogPost" ();
stru.title := 'test'
stru.description := '<p>hello from me</p>';
req.struct := stru;
atom.edit_Post ('http://example.com/Atom/Http/entry?b=128&id=1', req);
```

delete it:

``` programlisting
atom.delete_Post ('http://example.com/Atom/Http/entry?b=128&id=1', req);
```

</div>

</div>

  

<div>

|                            |                                                                       |
|:--------------------------:|:----------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                             |
|                            | <a href="https://tools.ietf.org/html/rfc5023" class="ulink"           
                              target="_top" shape="rect">RFC 5023: The Atom Publishing Protocol</a>  |

</div>

</div>

</div>
