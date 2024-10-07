<div id="fn_smtp_send" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

smtp_send — send message to SMTP server

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_smtp_send_01" class="funcsynopsis">

|                        |                          |
|------------------------|--------------------------|
| ` `**`smtp_send`**` (` | in `server ` string ,    |
|                        | in `sender ` string ,    |
|                        | in `recipient ` string , |
|                        | in `body ` string `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_smtp_send_01" class="refsect1">

## Description

Virtuoso can act as an SMTP client. This means that Virtuoso is able to
send emails directly to a mail SMTP server. Virtuoso has a simple
function to facilitate this. This can be called from stored procedures,
VSP pages, triggers etc.

The sender and recipient email addresses must be enclosed with \<..\>
and separated by commas i.e. string
'\<support@openlinksw.co.uk\>,\<sales@openlinksw.co.uk\>'

The message Body contains headers such as Subject, From, To, Cc, Bcc and
then continues with the actual message text itself. New lines can be
added using '\r\n'

<div id="examples_smtp_send_02" class="example">

**Example 24.377. Example:**

<div class="example-contents">

``` programlisting
'Subject: subject message\r\nFrom: sender\r\nTo: recipient\r\nCc:
copy\r\nBcc: copy\n\n body of message'
```

Virtuoso will pick up Subject and other headers from the body content.
Note that the RFC insists there should be a NULL line between body
headers and the message body text.

</div>

</div>

  

<div id="examples_smtp_send_03" class="example">

**Example 24.378. Example:**

<div class="example-contents">

``` programlisting
smtp_send(
        'mail.example.com:25',
        '<sender@example.com>',
        '<receiver@example.com>',
        concat(
          'X-Mailer: Virtuoso Universal Server\r\n',
            'Date: ', soap_print_box (now (), '', 1), '\r\n',
            'Message-ID: <', regexp_replace(cast(now() as varchar), '[- :.]', '', 1, null), '#some.vsp@example.com>\r\n',
            'Subject: This is a test mail...\r\n',
            'From: <sender@example.com>\r\n',
            'To: <receiver@example.com>\r\n',
            '\n',
            'Hi Receiver, this is a test message from Virtuoso')
    );
```

A more involved example. It is the responsibility of the developer to
ensure that the message is correctly formed, complete with all necessary
headers. This example shows a complete use of the function.

</div>

</div>

  

</div>

</div>
