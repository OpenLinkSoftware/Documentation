<div id="fn_mime_body" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

mime_body — used to compose multipart/mixed MIME message body

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_mime_body" class="funcsynopsis">

|                               |                           |
|-------------------------------|---------------------------|
| `varchar `**`mime_body`**` (` | in `mime_parts ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_mime_body" class="refsect1">

## Description

The `mime_body() ` procedure is used to compose a multipart/mixed MIME
body. it takes only one parameter, mime_parts, an array of `mime_part`
elements such as those produced by the `mime_part() ` function.

</div>

<div id="params_mime_body" class="refsect1">

## Parameters

<div id="id96504" class="refsect2">

### mime_parts

Array of mime parts such as those produced by the `mime_part() `
function.

</div>

</div>

<div id="ret_mime_body" class="refsect1">

## Return Types

The function returns a multipart mixed MIME body as text.

</div>

<div id="examples_mime_body" class="refsect1">

## Examples

<div id="ex_mime_body" class="example">

**Example 24.217. Creating a MIME message body**

<div class="example-contents">

This example will show the output in ISQL of producing a two part MIME
message using the mime_body() and mime_part() functions.

``` screen
SQL> select MIME_BODY (vector (MIME_PART (null,null,null,'this is a first'),
MIME_PART (null,null,'base64','this is a second')));
callret
VARCHAR
_______________________________________________________________________________

Date: Tue, 25 Jun 2002 11:13:05 GMT
Content-Type: multipart/mixed; boundary="----43c7f8b88e14a87dc3f2d840db93c731"
Mime-Version: 1.0
X-Mailer: Virtuoso

This is a multi-part message in MIME format.

------43c7f8b88e14a87dc3f2d840db93c731
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

this is a first
------43c7f8b88e14a87dc3f2d840db93c731
Content-Type: text/plain
Content-Transfer-Encoding: base64

dGhpcyBpcyBhIHNlY29uZA==
------43c7f8b88e14a87dc3f2d840db93c731--

1 Rows. -- 21 msec.
```

</div>

</div>

  

</div>

<div id="seealso_mime_body" class="refsect1">

## See Also

<a href="fn_mime_part.html" class="link" title="mime_part"><code
class="function">mime_part() </code></a>

<a href="fn_mime_body.html" class="link" title="mime_body"><code
class="function">mime_body() </code></a>

</div>

</div>
