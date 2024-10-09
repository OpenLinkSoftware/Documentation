<div>

<div>

<div>

<div>

## 19.6. MIME & Internet Messages

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 19.6.1. About Simple Internet (RFC 822) Messages

</div>

</div>

</div>

RFC 822 messages have two major parts:

<div>

- **Message envelope. ** The message envelope contains all the
  information needed to accomplish transmission and delivery of the
  message. This information includes the e-mail address of the message's
  creator — also known as the originator. This string matches the
  information in the Sender: header, if this header is present. The
  envelope is created by a user agent (such as MS Outlook) and is
  meaningful only to the message transfer agents (MTAs) that move the
  message on the path to its destination.

- **Message contents. ** The contents make up the object to be delivered
  to the recipient. Message contents consist of lines of ASCII text.
  This text is arranged in the classic "memo" format, in which the
  message contains one or more introductory headers and a body.

</div>

This structure can be seen in the following illustration:

<div>

<div>

**Figure 19.2. The structure of an Internet mail**

<div>

<div>

![The structure of an Internet mail](images/internetmailmsg.jpg)

</div>

</div>

</div>

  

</div>

<div>

**Example 19.7. Simple Internet Mail Message**

<div>

As you can see in the following sample of a message's contents, the
format described in RFC 822 produces messages readable with little
difficulty by humans.

The first few lines, from the first instance of "Received" to
"Precedence", are headers. These lines define the recipients, the
sender, the date, and other information involved with message
transmission.

Following the headers is a blank line. This is marked by the consecutive
occurrence of the four characters: CR, LF, CR, LF. After this blank line
starts the body of the message. In the following example, only the final
few lines make up the message body.

``` programlisting
Received: from techsupp@openlinksw.co.uk
Message-Id: <v1214040cad6a13935723@>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 4 Jun 1998 09:43:14 -0800
To: customer.services@openlinksw.co.uk
From: OpenLink Technical Support <techsupp@openlinksw.co.uk>
Subject: Happy Reading
Precedence: bulk

Hope you are enjoying this chapter,
Technical Support
```

</div>

</div>

  

<div>

|                            |                                                                  |
|:--------------------------:|:-----------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                        |
|                            | <a href="http://www.rfc-editor.org/rfc/rfc822.txt" class="ulink" 
                              target="_top">RFC 822 at www.rfc-editor.org</a>                   |

</div>

</div>

</div>
