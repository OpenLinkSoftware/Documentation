<div>

<div>

</div>

<div>

## Name

mime_tree — parses MIME messages into an array structure

</div>

<div>

## Synopsis

<div>

|                             |                             |
|-----------------------------|-----------------------------|
| `array `**`mime_tree`**` (` | in `message_text ` string , |
|                             | in `flag ` integer `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function is intended to parse MIME (RFC2045) messages (coming from
a RFC822 or HTTP sources). It parses the text and produces an array
structure representing the structure of the MIME message. It copies into
the structure MIME headers, but for the MIME bodies it only stores start
and end offsets, thus optimizing space usage.

The parameters to mime_tree are:

|                                                                                           |
|-------------------------------------------------------------------------------------------|
| message_text (string, required) - contains the text of the message to be parsed.          |
| flag (integer, optional) - a flag describing the format of the "root" object in the text. |

If flag is 1, the "root" message follows RFC822. This means mime_tree
will unfold the attributes, will scan for MIME registered header fields
and will take their attributes. Alternately this can be a MIME message
which needs no unfolding and has attributes separated with semicolon.

If flag is 2, the "root" message follows RFC2045. This means mime_tree
will scan for MIME attributes.

In either cases mime_tree will look for the Content-Type header field
and will parse the "message/rfc822" and "multipart/digest" MIME bodies
as nested messages.

mime_tree will return an array of 3 elements (message descriptor) with
the following structure:

|                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| index 0: an array of attributes, parameters and their values, which can be passed to get_keyword or get_keyword_ucase functions.                                                                                                                                                                                                                                                                                                          |
| index 1: an array of four elements: (0 - starting index of the body into the source_message text (for aref), 1 - ending index of the body, 2 - an message descriptor if the body is recognized to contain a valid RFC822 message; 0 otherwise, 3 - an array of two elements with starting and ending offset if the body is recognized as a valid RFC822 multipart message and has some things after the last MIME boundary, 0 otherwise). |
| index 2: an array of subpart message descriptors, if the MIME message is recognized as multipart MIME message, 0 otherwise.                                                                                                                                                                                                                                                                                                               |

</div>

<div>

## Examples

consider the following message text

``` programlisting
Form: Somebody <someuser@somehost>
Mime-Version: 1.0
Content-Type: "multipart/mixed";
    boundary="--the boundary"
To: self@localhost

This is a multipart MIME message
----the boundary
Content-Type: image/gif; filename="the_big_picture.gif"

GIF........
----the boundary
Content-Type: message/rfc822

From: Ford@Perfect
To: vogon
Mime-Version: 1.0
Content-Type: multipart/alternate; boundary="--sub-boundary"

This is some Message
----sub-boundary
Content-Type: text/plain

Hi
----sub-boundary
Content-Type: text/html

<P>Hi</P>
----sub-boundary--
Some garbage
----the boundary
Content-Type: text/plain

Some additional text
----the boundary--
Some additional garbage
```

MIME_TREE(the_text, 1) will produce:

``` programlisting
--- the main message start
(
 ("From", "Somebody <someuser@somehost>",
      "Mime-Version", "1.0", "Content-Type",
      "multipart/mixed",
      "boundary", "--the boundary",
      "To", "self@localhost"),      --- main attributes
 (n1, n2, 0, (mg1, mg2)),       --- main message body
                        ("This is a multipart MIME message")
 (                  --- Sub-parts array start
  (                     --- Sub-Part 1
   ("Content-Type", "image/gif",
        "filename",
        "the_big_picture.gif"),     --- Attributes
   (s2, e2, 0, 0),          --- body
   0                    --- no sub parts of the GIF
  ),
  (                 --- Sub-Part 2
   ("Content-Type", "message/rfc822"),  --- Attributes
   (s3, e3,                 --- the body offsets
    (                   --- the body is recognized as a message,
                        so parse it
     ("From", "Ford@Perfect", "To", "vogon",
          "Mime-Version",
          "multipart/alternate",
          "boundary",
          "--sub-boundary"),        --- The body's Attributes
     (ss1, se1, 0, (g2, ge2)),      --- the body's body ("This is some message").
                        The message has the text
                        "Some additional garbage"
                        marked by g2, ge2 offsets
     (                  --- body's parts
      (                 --- body's SubPart 1
       ("Content-Type", "text/plain"),  --- attributes
       (ss2, se2, 0, 0),        --- the text "Hi"
       0                --- no subparts
      ),
      (                 --- body's SubPart 2
       ("Content-Type", "text/html"),   --- attributes
       (ss3, se3, 0, 0),        --- the HTML paragraph "Hi"
       0                --- no subparts
      )
     )
    ),                  --- end of the body's structure
    0                   --- no trailers
   ),
   0                    --- no subparts
  ),
  (                 --- SubPart 3
   ("Content-Type", "text/plain"),  --- attributes
   (s4, e4, 0, (g1, ge1)),      --- the text "Some additional text"
                        and "Some additional garbage"
   0                    --- no subparts
  )
 )                  --- end of subparts array of the main message
)
```

where the n1, n2, mg1, mg2, s2, e2, s3, e3, ss1, se1, g2, ge2, ss2, se2,
ss3, se3, s4, e4, g1, ge1 are offsets, denoting starts and ends of the
appropriate pieces within the source message, which can be used by the
subseq function:

``` programlisting
subseq (the_text, g1, ge1) returns the string "Some additional garbage"
```

</div>

</div>
