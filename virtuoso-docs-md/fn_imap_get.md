<div id="fn_imap_get" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

imap_get — get messages from a IMAP4 mail server.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_imap_get" class="funcsynopsis">

|                            |                            |
|----------------------------|----------------------------|
| `array `**`imap_get`**` (` | in `host ` varchar ,       |
|                            | in `user ` varchar ,       |
|                            | in `password ` varchar ,   |
|                            | in `command ` varchar ,    |
|                            | in `folder_id ` varchar ,  |
|                            | in `list ` vector ,        |
|                            | in `use_ssl ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_imap_get" class="refsect1">

## Description

`imap_get ` is used used to work with mail server running the IMAP4
version 4rev1 as defined in rfc3501.

</div>

<div id="params_imap_get" class="refsect1">

## Parameters

<div id="id99111" class="refsect2">

### host

The host to connect with. IP address or hostname:port. There is no
default for port, so to connect to the standard port for IMAP, use
\<hostname/IP address\>:143

</div>

<div id="id99114" class="refsect2">

### user

<span class="type">string </span> user id in remote host.

</div>

<div id="id99118" class="refsect2">

### password

<span class="type">string </span> password in remote host.

</div>

<div id="id99122" class="refsect2">

### command

Command <span class="type">string </span> . Valid values are '
<span class="emphasis">*list* </span> ',
'<span class="emphasis">*delete*</span> ',
'<span class="emphasis">*create*</span> ',
'<span class="emphasis">*select*</span> ',
'<span class="emphasis">*expunge*</span> ',
'<span class="emphasis">*rename*</span> ',
'<span class="emphasis">*fetch*</span> ', '
<span class="emphasis">*message_delete* </span> ', '
<span class="emphasis">*message_copy* </span> '.

</div>

<div id="id99135" class="refsect2">

### folder_id

IMAP4 mail box ID (e.g. 'INBOX', 'Draft' and etc) to work with.

</div>

<div id="id99138" class="refsect2">

### list

A list of items to work with, depends on the command.

</div>

<div id="id99141" class="refsect2">

### use_ssl

Use SSL connection, 1 - use, 0 - do not use.

</div>

</div>

<div id="ret_07" class="refsect1">

## Return Types

Depends on the command value:

<div class="itemizedlist">

- <span class="emphasis">*list* </span> : - list of mail boxes in
  selected mail box (needs folder_id, if folder_id = '' work with root
  of mail account). list - empty vector.

  Returns: A vector of strings containing name attributes, hierarchy
  delimiter, name of mailbox or empty vector.

  <a href="http://tools.ietf.org/html/rfc3501#page-40" class="ulink"
  target="_top">See more specification details</a> .

  <span class="emphasis">*Example* </span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','list','INBOX', vector (), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector(0x00491f08)

  1 Rows. -- 2090 msec.

  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','list','INBOX', vector (), 1)[0];
  aref
  VARCHAR
  _______________________________________________________________________________

  (\HasNoChildren) "/" "INBOX"

  1 Rows. -- 1997 msec.
  ```

- <span class="emphasis">*delete* </span> : deletes the selected mail
  box (needs folder_id). list - empty vector.

  Returns: Empty vector.

  <a href="http://tools.ietf.org/html/rfc3501#page-35" class="ulink"
  target="_top">See more specification details</a> .

  <span class="emphasis">*Example* </span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','delete','SomeBox', vector (), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector()

  1 Rows. -- 2090 msec.
  ```

- <span class="emphasis">*create* </span> : creates a new mail box in
  the selected mail box (needs folder_id). list - empty vector.

  Returns: Empty vector.

  <a href="http://tools.ietf.org/html/rfc3501#page-34" class="ulink"
  target="_top">See more specification details</a> .

  <span class="emphasis">*Example* </span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','create','INBOX/SomeBox', vector (), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector()

  1 Rows. -- 2090 msec.
  ```

- <span class="emphasis">*select* </span> : lists all messages in the
  selected mail box (needs folder_id). list - empty vector.

  This command gets the header fields of messages:

  ``` programlisting
  UID FLAGS INTERNALDATE RFC822.SIZE BODY.PEEK[HEADER.FIELDS (DATE FROM SUBJECT TO CC MESSAGE-ID REFERENCES CONTENT-TYPE CONTENT-DESCRIPTION IN-REPLY-TO REPLY-TO LINES LIST-POST X-LABEL)]
  ```

  Returns: A vector of vectors containing: UID, header fields and data
  separated by ' ', Data of BODY.PEEK information (the last requested
  parameter - BODY.PEEK\[HEADER.FIELDS (DATE FROM SUBJECT TO CC
  MESSAGE-ID REFERENCES CONTENT-TYPE CONTENT-DESCRIPTION IN-REPLY-TO
  REPLY-TO LINES LIST-POST X-LABEL)\]).

  <span class="emphasis">*Example* </span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','select', 'INBOX', vector (), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector(0x004435a0)

  1 Rows. -- 2293 msec.
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','select', 'INBOX', vector (), 1)[0];
  aref
  VARCHAR
  _______________________________________________________________________________

  vector(139,0x00443d50,0x00494758)

  1 Rows. -- 2293 msec.
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','select', 'INBOX', vector (), 1)[0][1];
  aref
  VARCHAR
  _______________________________________________________________________________

  RFC822.SIZE 89126 INTERNALDATE "09-Nov-2011 22:47:59 +0000" FLAGS (NonJunk \Seen) BODY[HEADER.FIELDS (DATE FROM SUBJECT TO CC MESSAGE-ID REFERENCES CONTENT-TYPE CONTENT-DESCRIPTION IN-REPLY-TO REPLY-TO LINES LIST-POST X-LABEL)] {368}

  1 Rows. -- 2230 msec.
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','select', 'INBOX', vector (), 1)[0][2];
  aref
  VARCHAR
  _______________________________________________________________________________

  Message-ID: <4EBB0319.1050200@openlinksw.com>
  Date: Wed, 09 Nov 2011 23:47:53 +0100
  From: demo <demo@openlinksw.com>
  To: "ods.check@gmail.com" <ods.check@gmail.com>
  Subject: test from OL account with attached image
  Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms000205010302050500060406"

  1 Rows. -- 2200 msec.
  ```

- <span class="emphasis">*expunge* </span> : expunges (deletes messages
  marked for deletion) the selected mail box (needs folder_id). list -
  empty vector.

  Returns: An empty vector.

  <span class="emphasis">*Example*</span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','expunge', 'INBOX', vector (), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector()

  1 Rows. -- 3541 msec.
  ```

- <span class="emphasis">*rename*</span> : renames selected mail box.
  folder_id is not used, folder_id = ''. list - vector of 2 names: old
  and new.

  Returns: Empty vector.

  <a href="http://tools.ietf.org/html/rfc3501#page-37" class="ulink"
  target="_top">See more specification details</a> .

  <span class="emphasis">*Example* </span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','rename', '', vector ('Travel', 'New Travel'), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector()

  1 Rows. -- 2013 msec.
  ```

- <span class="emphasis">*fetch* </span> : fetches messages from the
  selected mail box (needs folder_id). folder_id is id of selected mail
  box, list - vector of UIDs of messages.

  Returns: A vector of vectors containing: UID and data of BODY.PEEK\[\]
  information (full message data).

  <span class="emphasis">*Example* </span> Get the list and UIDs of
  messages:

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','select', 'INBOX', vector (), 1)[0];
  aref
  VARCHAR
  _______________________________________________________________________________

  vector(139,0x00443d50,0x00494758)

  1 Rows. -- 2215 msec.
  ```

  Then get full data of message by its mail box id and UID:

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','fetch', 'INBOX', vector (139), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector(0x00442410)

  1 Rows. -- 3807 msec.

  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','fetch', 'INBOX', vector (139), 1) [0][1];
  aref
  VARCHAR
  _______________________________________________________________________________

  Warning 01004: [OpenLink][Virtuoso ODBC Driver]CL077: Data truncated in column 1 of the result-setr(aref, type 242)
  at line 1 of Top-Level: select imap_get ('imap.gmail.com:993','ods.check','openlink','fetch', 'INBOX', vector (139), 1)[0][1]
  Delivered-To: ods.check@gmail.com
  Received: by 43.18.75.3 with SMTP id um9cs133471icb; Wed, 9 Nov 2011 14:48:00 -0800 (PST)
  Received: by 101.43.13.258 with SMTP id d19mr8062565vdh.48.1320878879524; Wed, 09 Nov 2011 14:47:59 -0800 (PST)
  Return-Path: <demo@openlinksw.com>
  Received: from mail.openlinksw.com (mail.openlinksw.com. [25.138.12.16])by mx.google.com with ESMTPS id pm6si1474987vcb.111.2013.04.12.81.63.84 (version=TLSv1/SSLv3 cipher=OTHER); Wed, 09 Nov 2011 14:47:59 -0800 (PST)
  Received-SPF: pass (google.com: best guess record for domain of demo@openlinksw.com designates 81.134.67.27 as permitted sender) client-ip=25.138.12.16;
  Authentication-Results: mx.google.com; spf=pass (google.com: best guess record for domain of demo@openlinksw.com designates 25.138.12.16 as permitted sender) smtp.mail=demo@openlinksw.com
  Received: from example.com ([152.114.12.11] helo=[152.114.12.146]) by mail.openlinksw.com with esmtp (Exim 4.74) (envelope-from <demo@openlinksw.com>) id 1ROGw0-0004Oj-5a for ods.check@gmail.com; Wed, 09 Nov 2011 17:47:58 -0500
  Message-ID: <4EBB0319.1050200@openlinksw.com>
  Date: Wed, 09 Nov 2011 23:47:53 +0100
  From: demo <demo@openlinksw.com>
  User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
  MIME-Version: 1.0
  To: "ods.check@gmail.com" <ods.check@gmail.com>
  Subject: test from OL account with attached image
  Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms000205010302050500060406"

  This is a cryptographically signed message in MIME format.

  --------------ms000205010302050500060406
  Content-Type: multipart/mixed; boundary="------------080604090408010101040005"

  This is a multi-part message in MIME format.
  --------------080604090408010101040005
  Content-Type: multipart/alternative; boundary="------------060001020305030405060601"

  --------------060001020305030405060601
  Content-Type: text/plain; charset=ISO-8859-1; format=flowed
  Content-Transfer-Encoding: quoted-printable

  *simple test*

  --------------060001020305030405060601
  Content-Type: text/html; charset=ISO-8859-1
  Content-Transfer-Encoding: quoted-printable

  <html>
    <head>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DISO=-8859-1">
    </head>
    <body bgcolor=3D"#FFFFFF" text=3D"#000000">
      <b>simple test</b><br>
    </body>
  </html>

  --------------060001020305030405060601--

  --------------080604090408010101040005
  Content-Type: image/png; name="a1.png"
  Content-Transfer-Encoding: base64
  Content-Disposition: attachment; filename="a1.png"

  iVBORw0KGgoAAAANSUhEUgAAAyAAAAFNCAIAAAB355ySAAAACXBIWXMAAAsTAAALEwEAmpwY
  AAAgAElEQVR4nOydeYBOVR/Hf+ecuz7bbBhj7PtOlBBCJEqpJJIslWiP9k2ifZeS0qp6W942
  9Zbe9nqVSqUQIesw+/Isdz/L+8edmYaeEaUMnk9o5j7nufec3/mec3/3d8+COOcAgBACAADg
  nGOM80vjn/ywOa84lpUWCKhyWdwK6cqg7i2aZqf5CYQQAGB79KPvNv24sfCMgR1bN84CIRBC
  QgjLoW9/uX5HaWzMwE659SIAAmMMKVKkSJEiRYoUhwfId5UAwPe0dvOELMdjHg+F1JoHq30s
  3y3jjGOCq8+AEKp211KkSJEiRYoUKQ5DfnOwfHwnSQhgQigSqT7uUkYQxggJ4Bjjah9LCI4x
  2e2kQggQQmCEBQBCfuJ/oDApUqRIkSJFihR1gd0dLB/fJfKdLQBAlX9BiN9CXLulqfa6qo/U
  PPh3FiFFihQpUqRIkaJukdzBSpEiRYoUKVKkSPGnScWWUqRIkSJFihQp9jMpBytFihQpUqRI
  kWI/I/3vx43dm2dbrnegc5IiRYoUKVKkSHEoIEmSFDdtgjEGpMiSIku4Tq2wgJBHOYAAAJmk
  gm21wgEY4wCAEZBDZkpBZe0DAi6R3WeqHlJUlRRApHR+EHDAlZkSzO9ByKOMMyY4JXXpJvYP
  gBCmAmFCEEJ1SA8IeYy7HnU9engO9aaUSQCAEIQjgX99/O3W/JI65WARIgk7PvGEPk9/sgo4
  O9DZqbtIstI26GQ07/T596sPGQdLVlQ9vmPEyac8/+4XUt3pNf4GJEnm8ZLJpw19/N1vDrd7
  w8HIAVcmkSRhlE8+edATS1fglGAAAECSZREruuCsUUs3Gsqh3FskARMpXrTthM4NF/53JYa6
  4spIsgLxwnEjhoZCoZprCxxWoHe/XDWocwtJlSVFOdCZSYIZK4/HYtmNmx3ojNR1PnjvnaHD
  TzrQudjPHJKFSsr2zRtyGuZIeuhAZyTFXnHAlVm8c7seCITSsw5gHuoaG9eubt6i5foKoR3S
  8e7fQ2Rly6+/dG2cnpHd+EDnZRc2rF0VCGXpwRBjh2l8RAIAAcAY37KzJGHZdSqCJSlK4Y7t
  rRukrdpWxKlXh3JWx9CD4bhhx6jYuGWHdKg80gbCkR0lFQDw3YbtdSju/TegaPqGjTuCkYzt
  BQkkDtOe6CAiEIrsPKDKVFRt88btR7Zt/mtFIeL0n89AHUTVA2s378ht0jxuURfXlSjOP4Mk
  I8vhlLKfthYBqyvDqTU98PPW/J

  1 Rows. -- 3338 msec.
  ```

- <span class="emphasis">*message_delete* </span> : deletes messages
  from mail box (needs folder_id). folder_id is id of selected mail box,
  list - vector of UIDs of messages.

  Returns: empty vector.

  <span class="emphasis">*Example*</span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','message_delete', 'INBOX', vector(139), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector()

  1 Rows. -- 2262 msec.
  ```

- <span class="emphasis">*message_copy* </span> : copies messages from
  select mail box to another. folder_id is id of selected mail box,
  list - vector of: first vector item is an id of target mail box, and
  UIDs of messages.

  Returns: empty vector.

  <span class="emphasis">*Example*</span>

  ``` programlisting
  SQL> select imap_get ('imap.gmail.com:993','ods.check','openlink','message_copy', 'INBOX', vector('Travel', 139), 1);
  imap_get
  VARCHAR
  _______________________________________________________________________________

  vector()

  1 Rows. -- 2262 msec.
  ```

</div>

</div>

<div id="errors_imap_get" class="refsect1">

## Errors

<div id="id99225" class="table">

**Table 24.63. Errors signalled by all commands**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                                                       | Description |
|---------------------------------|---------------------------------------|------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM001 </span> | <span class="errortext">Cannot resolve host in imap_get </span>                                                  |             |
| <span class="errorcode"></span> | <span class="errorcode">IM002 </span> | <span class="errortext">Cannot connect in imap_get </span>                                                       |             |
| <span class="errorcode"></span> | <span class="errorcode">IM003 </span> | <span class="errortext">No response from remote IMAP server </span>                                              |             |
| <span class="errorcode"></span> | <span class="errorcode">IM004 </span> | <span class="errortext">Could not login to remote IMAP server. Please check user or password parameters. </span> |             |
| <span class="errorcode"></span> | <span class="errorcode">IM005 </span> | <span class="errortext">CAPABILITY command to remote IMAP server failed </span>                                  |             |
| <span class="errorcode"></span> | <span class="errorcode">IM010 </span> | <span class="errortext">Failed reading output of LIST command on remote IMAP server </span>                      |             |
| <span class="errorcode"></span> | <span class="errorcode">IM007 </span> | <span class="errortext">Cannot resolve host in imap_get </span>                                                  |             |
| <span class="errorcode"></span> | <span class="errorcode">IM008 </span> | <span class="errortext">Cannot resolve host in imap_get </span>                                                  |             |

</div>

</div>

  

<div id="id99299" class="table">

**Table 24.64. Errors signalled by command "delete":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                         | Description |
|---------------------------------|---------------------------------------|------------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM011 </span> | <span class="errortext">There must be folder name to delete (5th argument) </span> |             |
| <span class="errorcode"></span> | <span class="errorcode">IM012 </span> | <span class="errortext">DELETE command to remote IMAP server failed </span>        |             |

</div>

</div>

  

<div id="id99325" class="table">

**Table 24.65. Errors signalled by command "create":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                         | Description |
|---------------------------------|---------------------------------------|------------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM015 </span> | <span class="errortext">There must be folder name to create (5th argument) </span> |             |
| <span class="errorcode"></span> | <span class="errorcode">IM016 </span> | <span class="errortext">CREATE command to remote IMAP server failed </span>        |             |

</div>

</div>

  

<div id="id99351" class="table">

**Table 24.66. Errors signalled by command "select":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                                   | Description |
|---------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM019 </span> | <span class="errortext">SELECT command to remote IMAP server failed </span>                  |             |
| <span class="errorcode"></span> | <span class="errorcode">IM027 </span> | <span class="errortext">Failed reading output of FETCH command on remote IMAP server </span> |             |

</div>

</div>

  

<div id="id99377" class="table">

**Table 24.67. Errors signalled by command "expunge":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                   | Description |
|---------------------------------|---------------------------------------|------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM020 </span> | <span class="errortext">EXPUNGE command to remote IMAP server failed </span> |             |

</div>

</div>

  

<div id="id99395" class="table">

**Table 24.68. Errors signalled by command "rename":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                                                                      | Description |
|---------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM028 </span> | <span class="errortext">There must be 2 string items in vector of argument 6 (old folder name to rename and a new name) </span> |             |
| <span class="errorcode"></span> | <span class="errorcode">IM029 </span> | <span class="errortext">There must be 2 string items in vector of argument 6 (old folder name to rename and a new name) </span> |             |
| <span class="errorcode"></span> | <span class="errorcode">IM030 </span> | <span class="errortext">command to remote IMAP server failed </span>                                                            |             |

</div>

</div>

  

<div id="id99429" class="table">

**Table 24.69. Errors signalled by command "fetch":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                          | Description |
|---------------------------------|---------------------------------------|-------------------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM032 </span> | <span class="errortext">SELECT command to remote IMAP server failed </span>         |             |
| <span class="errorcode"></span> | <span class="errorcode">IM033 </span> | <span class="errortext">No messages in list </span>                                 |             |
| <span class="errorcode"></span> | <span class="errorcode">IM034 </span> | <span class="errortext">There must be integer items in vector of argument 6 </span> |             |

</div>

</div>

  

<div id="id99463" class="table">

**Table 24.70. Errors signalled by command "delete":**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                      | Description |
|---------------------------------|---------------------------------------|-----------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM035 </span> | <span class="errortext">Error in IMAP command UID STORE </span> |             |

</div>

</div>

  

<div id="id99481" class="table">

**Table 24.71. Errors signalled by incorrect command value:**

<div class="table-contents">

| SQLState                        | Error Code                            | Error Text                                                                  | Description |
|---------------------------------|---------------------------------------|-----------------------------------------------------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode">IM042 </span> | <span class="errortext">No such command (5th parameter) in protocol </span> |             |

</div>

</div>

  

</div>

<div id="seealso_01_01" class="refsect1">

## See Also

<a href="fn_pop3_get.html" class="link" title="pop3_get"><code
class="function">pop3_get </code></a>

<a href="http://www.ietf.org/rfc/rfc3501" class="ulink"
target="_top">RFC3501</a>

</div>

</div>
