<div id="moblog" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.25. Mobile Blogging (Moblog)

</div>

</div>

</div>

The Mobile blogging (moblog) is synonym of messages containing images
made via mobile devices (such as mobile telephones etc.) with ability to
record a image and send them via SMTP.

Moblog''ing has become popular as means for users to easily,
automatically and immediately post text and images back to their blog
site what ever their location.

The Virtuoso server can act as mail server (see Storing Email in
Virtuoso chapter, and howto configure mail servers in same chapter).
Thus it''s possible to capture mails sent via mobile devices and expose
in a Blog. But main problem remains: SMTP have no authentication. So
this functionality is achieved via UI which shows all existing mail
messages sent via mobile devices and containing a images, allowing to
the blog owner to decide which image to go to his/her blog. As an
alternative post can be automatic if blogger check this option.

Mobile blogging (Moblog) can be configured via the Virtuoso blog UI by
selecting the Moblog link under the Configuration section as indicated
in the diagram below:

<div id="id45214" class="figure">

**Figure 14.51. Blog page**

<div class="figure-contents">

<div class="mediaobject">

![Blog page](images/moblog.gif)

</div>

</div>

</div>

  

The Moblog configuration page enables the details of the POP3 server
from which messages are to be retrieved from is located as indicated in
the diagram below:

<div id="id45220" class="figure">

**Figure 14.52. Blog page**

<div class="figure-contents">

<div class="mediaobject">

![Blog page](images/moblogconfig.gif)

</div>

</div>

</div>

  

<div class="itemizedlist">

- <span class="emphasis">*Server Address and Port* </span>

  \- Hostname and port number of the POP3 Mail Server.

- <span class="emphasis">*Account Username*</span>

  \- username of POP3 Mail server account.

- <span class="emphasis">*Account Password* </span>

  \- username of POP3 Mail server account.

- <span class="emphasis">*Enable Automatic Moblogging*</span>

  \- enabled automatic posting of messages to Blog site.

- <span class="emphasis">*Allowed MIME types*</span>

  \- mime type of messages to be retrieved form POP3 server, which can
  be of type image, vidoe or audio.

- <span class="emphasis">*Set*</span>

  \- this button sets the POP3 mail server setting entered above.

- <span class="emphasis">*Fetch*</span>

  \- this button retrieves available moblog messages from the POP3 mail
  server.

</div>

Moblog can handle different types of attachments, this depends of list
of MIME type patterns (SQL like syntax), which blogger specifies in
Moblog UI. Further any new incoming message containing attachment
matching any of that list will be exposed in the UI for posting, or it
will be posted automatically if ''Automatic post'' option is checked.

Note: feeding a mail box can also be done via "Mail", "Get Mail with
POP3" Admin UI utility. In this case blogger authenticates in this
utility, and feeds it''s local mailbox from some POP3 server. The
consequential actions to put a message as blog message are same as
described above.

As alternative to feeding via own POP3 account, Moblog message can be
sent to special mail-gateway account. Such account can be set from Web
admin only and can be used from all bloggers to pass Moblog messages to
their blogs. Only requirement in that case is blogger to include
''@@blogId@@=\[blog Id\]'' string as a single line whenever in the
message body. Further mail-gateway processing will detect such rule and
will expose the message in the Moblog UI, or automatic post will be
performed.

</div>
