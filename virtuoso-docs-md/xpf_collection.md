<div id="xpf_collection" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

fn:collection — Returns parsed documents contained in given collections.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_collection" class="funcsynopsis">

|                                   |                           |
|-----------------------------------|---------------------------|
| `node()* `**`fn:collection`**` (` | `uri ` anyURI ,           |
|                                   | `base_uri ` string ,      |
|                                   | `recursive_mode ` int ,   |
|                                   | `parser_mode ` int ,      |
|                                   | `encoding ` string ,      |
|                                   | `language ` string ,      |
|                                   | `dtd_config ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_collection" class="refsect1">

## Description

This function takes one or more collection URI's and returns the parsed
documents contained in these collections as a sequence.

If no uri is specified, the function returns the sequence of the nodes
in the default collection in the dynamic context. The default collection
is a home DAV collection. If user does not have default DAV collection,
an error is signalled.

<div id="xpf_collection_types" class="refsect2">

### Local DAV collections

Local DAV collections can be accessed either by providing
"http://local.virt/DAV/" or "http://localhost:PORT/" URI. The
"http://local.virt/DAV/" can be used even if the local http server is
not enabled. The "http://localhost:PORT" URI is less efficient and takes
the data over HTTP, so "http://local.virt/DAV/" is preferred.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                             |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                       |
|                              | When using http://local.virt/DAV/ URI the effective account calling fn:collection must have read access to the resources in question as defined by DAV permissions. For the http mode of access, the server may request authentication, which the function will supply from the dynamic context, see below. |

</div>

</div>

<div id="xpf_collection_types_01" class="refsect2">

### Table Collections

fn:collection specially recognizes URI's which beginning with "virt://".
Such a URI relates to a local table, the content of a specified column
is returned as the collection (table collection). The URI contains three
parts: table name, id column name, xml content column name. For
instance, if the table definition is:

``` screen
create table XML_EXAMPLE (
    XE_ID int primary key,
    XE_ENTITY any
)
;
```

then the URI for accessing all documents stored in XE_ENTITY column and
referenced by XE_ID is:

``` screen
virt://DB.DBA.XML_EXAMPLE.XE_ID.XE_ENTITY
```

</div>

<div id="xpf_collection_types2" class="refsect2">

### Home path in local DAV collections

fn:collection also supports UNIX style home paths. If URI begins with ~
the next term will treated as user name and is will be substituted by
path to home DAV collection. For instance, ~john/test/test2/ can be
parsed as http://local.virt/DAV/home/john/test/test2 URI.

</div>

<div id="xpf_collection_types3" class="refsect2">

### Remote DAV collections, WEB collections

Any other URI which begins with "http://" refers to remote DAV
collections. The function uses the PROPFIND DAV method to get the list
of documents contained in the collection. If the remote server does not
support this method the function tries to do a HTML GET with the uri and
returns all documents referenced from the result (WEB collection). In
this case the function makes two http requests.

</div>

<div id="xpf_collection_impl1" class="refsect2">

### 

When a web page is scanned for document reference by fn:collection it
searches \<a href=...\> tags and returns downloaded and parsed documents
referenced in href. If href contains relative reference it is resolved
using web page address as base uri.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                               |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                         |
|                              | There is no way to narrow set of resolved references on HTML web page. So, fn:collection call over remote server which does not support PROPFIND method can be very expensive. The engine tries to download all documents referenced on the page, even it does not relates to the collection. |

</div>

</div>

<div id="xpf_collection_impl2" class="refsect2">

### 

In this release fn:collection does not support any collections except
DAV collections, WEB collections, table collections.

The collection function returns parsed documents. If the collection in
question contains non xml documents the function will fail. In order to
skip such documents html mode can be set by parser_mode argument.

The recursive_mode arguments sets the mode for processing
sub-collection. If recursive_mode is set to 0 all sub-collections are
ignored. fn:collection collects documents recursively if the argument is
set to 1. The recursive mode is the default.

Recursive collecting is not supported for WEB collections and table
collections.

Rest of optional arguments (encoding, language, dtd_config) are passed
to internal XML parser. They are equal to optional argument of
xtree_doc() .

</div>

<div id="xpf_collection_auth" class="refsect2">

### Authentication

Remote DAV and WEB collections may need authentication information.
fn:collection supports two ways of providing authentication information.
First one is to provide user name and password by setting appropriate
connection variables:

``` screen
connection_set ('HTTP_CLI_UID', 'loginhere');
connection_set ('HTTP_CLI_PWD', 'passwordhere');
```

it can be used if fn:collection collects documents from source which
demands only one username and password.

If the remote collection references documents from different sources
which need different authentication information then instead of
providing single username/password pair the authentication callback
function can be used. The engine gets (if HTTP_CLI_UID is not set to
NULL) name of the callback function from HTTPAuthManager connection
variable. The function must take URI of the resource as argument and
return array of username and password for the resource. For instance,
here is an example of authentication function which allows to get needed
credentials for two home DAV collections:

``` screen
create procedure DB.DBA.AUTHINFO (in _uri varchar)
{
  if (_uri like 'http://localhost%/DAV/home/john/%')
    return vector ('john', 'cat!filt_NY');
  else if (_uri like 'http://localhost%/DAV/home/sam/%')
    return vector ('sam', 'doggy1913');
  return vector (null, null);
}
;

connection_set ('HTTPAuthManager', 'DB.DBA.AUTHINFO');
select xquery_eval ('
  <result> John's test cases:
    {
      for \044a in collection ("http://example.com/DAV/home/john/test-cases/", ., 1, 2)
    return <res> { document-uri (\044a) }</res>
    }
   </result>', xtree_doc ('<a/>'));
select xquery_eval ('
  <result> All test cases:
    {
      for \044a in collection ("http://example.com/DAV/home/", ., 1, 2)
        return <res> { document-uri (\044a) }</res>
    }
  </result>', xtree_doc ('<a/>'));
      
```

</div>

</div>

<div id="xpf_params_collection" class="refsect1">

## Parameters

<div id="id126276" class="refsect2">

### uri

collection URI. If the *`uri `* is a relative xs:anyURI, it is resolved
against the value of the base-URI property from the static context or
from *`base_uri `* .

</div>

<div id="id126281" class="refsect2">

### base_uri

If *`uri `* is an relative URI string, not an absolute one then
*`base_uri `* is used to make it absolute.

</div>

<div id="id126286" class="refsect2">

### parser_mode

Sets the mode for parsing documents in collection (0 - XML parser mode,
1 - HTML parser mode, 2 - 'dirty HTML' mode (with quiet recovery after
any syntax error).

</div>

<div id="id126289" class="refsect2">

### encoding

string with content encoding type of \<document\>; valid are 'ASCII',
'ISO', 'UTF8', 'ISO8859-1', 'LATIN-1' etc., defaults are 'UTF-8' for XML
mode and 'LATIN-1' for HTML mode.

</div>

<div id="id126292" class="refsect2">

### language

string with language tag of content of \<document\>; valid names are
listed in IETF RFC 1766, default is 'x-any' (it means 'mix of words from
various human languages')

</div>

<div id="id126295" class="refsect2">

### dtd_config

configuration string for DTD validator, default is empty string meaning
that DTD validator should be fully disabled. See
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> for details.

</div>

</div>

<div id="xpf_ret_collection" class="refsect1">

## Return Types

node\*

</div>

<div id="xpf_examples_collection" class="refsect1">

## Examples

<div id="xpf_ex1_collection" class="example">

**Example 24.568. Example of using remote DAV collection:**

<div class="example-contents">

``` screen
<result>
  { for $a in fn:collection ( "http://www.somdavservice.com:8081/DAV/test1/" )
        return
            <res>{ $a/value/text() }</res>
  }
</result>
```

</div>

</div>

  

<div id="xpf_ex2_collection" class="example">

**Example 24.569. Example of using relative URI:**

<div class="example-contents">

``` screen
xquery_eval('
 <pre>
    { for \044n in fn:collection("/docs", ., 2)
          return (document-get-uri(\044n), " - ", name (\044n/*[1]), "\n")
    }
 </pre> ', xtree_doc ('<stub/>', 0, 'http://www.somdavservice.com:8081/') );
      
```

</div>

</div>

  

<div id="xpf_ex3_collection" class="example">

**Example 24.570. Example of using default collection:**

<div class="example-contents">

``` screen
xquery_eval('
 <div>
    { for \044anchor in fn:collection()//a
          return <b> { \044anchor } </b>
    }
 </div> ', xtree_doc ('<stub/>') );
```

</div>

</div>

  

</div>

<div id="xpf_seealso_doc" class="refsect1">

## See Also

<a href="xpf_document.html" class="link" title="document">document()</a>

<a href="xpf_doc.html" class="link" title="doc">doc()</a>

<a href="fn_xtree_doc.html" class="link"
title="xtree_doc">xtree_doc()</a>

<a href="fn_xml_uri_get.html" class="link"
title="xml_uri_get">xml_uri_get()</a>

</div>

</div>
