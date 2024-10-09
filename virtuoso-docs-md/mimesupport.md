<div>

<div>

<div>

<div>

### 19.6.2. MIME Messages - Extension to Simple Internet Messages

</div>

</div>

</div>

MIME (Multipurpose Internet Mail Extensions) grew out of a need to
encapsulate messages within messages. It includes multipart messages
comprising a variety of file types such as images, audio, and video.
MIME does all this while following all the standard SMTP and RFC 822
mail rules. MIME messages can be constructed to transport mail over any
mail transport system that is compliant with SMTP. MIME is able to
transmit objects with varying ranges of complexity in a way that allows
any MIME-compliant user agent (UA) to faithfully process them and hand
them off to an appropriate application. The multiple parts are arranged
so that the parts requiring the least sophisticated UA are at the
beginning of the message. In fact, most MIME UAs include courtesy text
when constructing messages to give users of non-MIME UAs an indication
of the message content. This courtesy text is inserted ahead of any MIME
parts.

MIME is consistent with Internet mail protocols using headers and
bodies. It allows for transmission of 7-bit printable US-ASCII
characters and maximum 1000-character lines in message bodies over all
Internet mail transports. It has become the most widely used extension
to the simple e-mail standard. It is also used as a transport mechanism
in Web pages.

Each content body part is made up of header fields and content. The
headers convey specific information about the content for the message
recipient. The content can be essentially any serialized stream of
bytes, such as binary data or HTML. When necessary, the content is
encoded so that the entire body complies with RFC 822. If the content is
encoded, MIME defines the header Content-Transfer-Encoding to specify
the mechanism. Other details are sometimes included, such as the
Content-Disposition, which indicates to the recipient whether the
content is to be treated simply as an attachment, or whether it is to be
rendered inline with other content in other body parts.

<div>

**Example 19.8. A simple MIME message sample**

<div>

Mime message including a picture stored as a file GIF format. Because
.gif files use 8-bit bytes, and the RFC 822 format requires messages to
contain only US-ASCII text, the picture data must be encoded. For the
recipient to correctly decode and display the picture, it needs
information about which encoding mechanism was used. The following
example shows part of a MIME header that identifies that the content is
a .gif file, that it is encoded using the standard base64 algorithm, and
that it is to be treated by the e-mail client as an attachment.

``` programlisting
Content-Type: image/gif;
     name="picture.gif"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
     filename="picture.gif"

[encoded content here]
...
```

</div>

</div>

  

MIME accomplishes this simplifying and rebuilding of complex files by
encoding a file and transporting it as a message body, or a series of
messages with component parts of the file. A MIME-compliant user agent
(UA) on the receiving end can decode the message, presenting it to the
reader or providing it to another application as a file. A UA that is
not MIME-compliant will be able to process a MIME-encoded mail message,
but may not be able to decode the message.

MIME defines a message format that allows for:

|                                                                   |
|-------------------------------------------------------------------|
| Textual message bodies in character sets other than US-ASCII.     |
| Non-textual message bodies.                                       |
| Multipart message bodies.                                         |
| Textual header information in character sets other than US-ASCII. |

<div>

**Example 19.9. Sample MIME Message**

<div>

MIME uses headers and separators to tell a UA what processing is
required to re-create the message. An example with no encoded body parts
is:

``` programlisting
From: OpenLink Support <techsupp@openlinksw.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="XXXXboundary text"

This is a multipart message in MIME format.

--XXXXboundary text
Content-Type: text/plain

here is the body text

--XXXXboundary text
Content-Type: text/plain;
Content-Disposition: attachment;
        filename="test.txt"

this is the attachment text

--XXXXboundary text--
```

This example shows the use of a MIME message to send a text message and
an attached text file. Both are body parts of this message.

The "MIME-Version:" header tells the receiving UA to treat this as a
MIME message.

The "Content-Type:" header specifies "multipart/mixed". This tells the
receiving UA that this message has parts separated by the string
argument defined in "boundary=". A MIME-compliant UA will only display
or otherwise process content following the specified "boundary=" text
strings. The actual boundaries are constructed using the "boundary="
string, prepended by "--". The final body part is followed by the
"boundary=" string with the "--" both prepended and appended.

In the preceding example, the courtesy message "This is a multipart
message in MIME format." will not be displayed or otherwise processed by
the MIME UA since it does not follow a "boundary=" string. A UA that
does not support MIME will display it, and at least this part of the
message will be readable no matter what features the reader supports. If
our example had encoded parts, they would make no sense to the human
reader using a non-MIME-compliant UA, but at least the courtesy message
would give the user a hint as to why.

There are two message body parts in our example. Each body part has
headers of its own, in addition to the overall message headers. Each
body-part begins with the boundary string. If there were no headers in
the body parts, then the blank line that must follow headers in RFC 822
messages would follow the boundary string. The first body part is a
plain text message. It is the message the sender might have typed into a
UA. Its single "Content-Type:" header identifies it as "text/plain",
meaning US-ASCII characters are used exclusively and any UA should be
able to display this body part. Text/plain is the default content type.

The second body part in this example contains the file attachment. Since
the file attachment is an ASCII text file, it is sent with no encoding
and its content-type is given as text/plain. The "Content-Disposition:
attachment" header has an attribute, "filename=", which specifies a
suggested name for the file. This header specifies that this body part
is to be treated as a file rather than being displayed to the user and
is to be saved on local storage under the suggested file name.

</div>

</div>

  

<div>

<div>

<div>

<div>

#### MIME Headers

</div>

</div>

</div>

MIME headers appear at the beginning of a MIME message as well as within
the separate body parts. Some MIME headers can be used both as message
headers and in MIME body parts. Some additional headers are defined for
use only in body parts.

The following headers are defined in MIME:

<div>

- **MIME-Version. ** Required header indicating that this message is to
  use the rules of MIME. "MIME-Version: 1.0" is the only currently
  defined MIME-Version header allowed. The MIME-Version header is a
  top-level header only and does not appear in body parts unless the
  body part is an encapsulated, fully formed message of content-type
  message/rfc822, which might have its own MIME-Version header.

- **Content-Type. ** Content-Type headers are used to specify the media
  type and subtype of data in the body of a message and to fully specify
  the native representation of such data. This header embodies much of
  the power of MIME. The IETF can add new official content types.
  Additionally, private content-type values can be defined by anyone.
  Such private content types have values of "x-something" or
  "X-something", where "something" can take on any value.

- **Content-Transfer-Encoding. ** Content-Transfer-Encoding headers can
  have two different meanings. If the value is "base64" or
  "quoted-printable", then the header indicates the encoding used for
  this body part. If the value is "7bit", "8bit", or "binary", then the
  header indicates that there is no encoding and that this value
  indicates only the type of content this body part contains. The
  default is "7bit". It should be noted that "8bit" and "binary" are not
  guaranteed to be properly handled by all Internet (SMTP) MTAs valid in
  Internet mail. Eight bit content is not valid in Internet mail
  headers. Provision is made for private Content-Transfer-Encoding
  headers. These have values that begin with "x-" or "X-". These are for
  specialized cases where the users have the tools to decode or
  otherwise process a specific "x-" encoding.

- **Content-ID. ** Content-ID headers are world-unique values that
  identify body parts, individually or as groups. They are necessary at
  times to distinguish body parts and allow cross-referencing between
  body parts.

- **Content-Description. ** Content-Description headers are optional and
  are often used to add descriptive text to non-textual body parts.

- **Content-Disposition. ** Content-Disposition headers provide
  information about how to present a message or a body part. When a body
  part is to be treated as an attached file, the Content-Disposition
  header will include a file name attribute.

</div>

There are additional headers that are applied in specialized situations,
such as Content-Base and Content-Location. All of the "Content-xxx"
headers have defined sub-headers, fields, and/or attributes. Headers
that begin with "Content-" are the only headers that have defined
meaning in body parts. All other body part headers can be ignored and
might actually be removed by message transfer agents (MTAs).

</div>

<div>

<div>

<div>

<div>

#### MIME_TREE - MIME parser

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### mime_tree_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="fn_mime_tree.html" class="link" title="mime_tree">mime_tree</a>
in the <a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

</div>

<div>

<div>

<div>

<div>

#### Processing HTTP PUT of type "multipart/form-data"

</div>

</div>

</div>

When the Virtuoso server receives a PUT request of type
"multipart/form-data" from the client agent, then it passes the HTTP
text to the MIME_TREE function internally and adds any MIME subpart as
an element pair ("name", "value") of the "params" parameter of the vsp
page being specified in the URI. It also adds an additional "params"
pair for each HTTP request MIME part named "attr-name" and whose value
is an array of all MIME header fields of that part.

<div>

**Example 19.10. Example:**

<div>

Consider the following HTTP request:

``` programlisting
PUT handler.vsp
Content-Type: "multipart/form-data"; boundary="--end_part"

----end_part
Content-Type: image/gif
Content-Disposition: form-data; name=upload_control; filename="some image.gif"

GIF...
----end_part
Content-Type: text/plain
Content-Disposition: form-data; name=textarea

The description
----end_part--
```

Virtuoso parses that and produces the following params content when
calling handler.vsp:

``` programlisting
( "upload_control", "GIF....",
  "attr-upload_control", ( "Content-Type", "image/gif",
        "Content-Disposition", "form-data", "name",
        "upload_control", "filename", "some image.gif"),
  "textarea", "The description",
  "attr-textarea", ("Content-Type", "text/plain",
        "Content-Disposition", "form-data", "name",
        "textarea")
)
```

</div>

</div>

  

This allows for vsp's to handle uniformly "x-www-form/url-encoded" and
"multipart/form-data" PUTS and to have full access to the MIME headers
if needed.

</div>

</div>
