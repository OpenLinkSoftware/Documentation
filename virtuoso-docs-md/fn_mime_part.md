<div>

<div>

</div>

<div>

## Name

mime_part — used to compose a MIME message body part.

</div>

<div>

## Synopsis

<div>

|                           |                                     |
|---------------------------|-------------------------------------|
| `any `**`mime_part`**` (` | in `content_type ` varchar ,        |
|                           | in `content_disposition ` varchar , |
|                           | in `transfer_encoding ` varchar ,   |
|                           | in `data ` varchar `)`;             |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is used to make a MIME part that can be used with the
`mime_body() ` function.

</div>

<div>

## Parameters

<div>

### content_type

This parameter is used to specify the media type and subtype of data in
the body of a message and to fully specify the native representation of
such data. This header embodies much of the power of MIME. The IETF can
add new official content types. Additionally, private content-type
values can be defined by anyone. Such private content types have values
of "x-something" or "X-something", where "something" can take on any
value.

</div>

<div>

### content_disposition

This parameter provides information about how to present a body part.
When a body part is to be treated as an attached file, the
Content-Disposition header should include a file name parameter.

</div>

<div>

### transfer_encoding

The encoding method to use, such as base64.

</div>

<div>

### data

The content of the message.

</div>

</div>

<div>

## Return Types

The function returns a MIME part for use with the `mime_body() `
function.

</div>

<div>

## Examples

<div>

**Example 24.218. Creating a MIME message body**

<div>

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

<div>

## See Also

<a href="fn_mime_part.html" class="link" title="mime_part"><code
class="function">mime_part() </code></a>

<a href="fn_mime_body.html" class="link" title="mime_body"><code
class="function">mime_body() </code></a>

</div>

</div>
