<div id="commandsandexamples" class="section">

<div class="titlepage">

<div>

<div>

### 19.4.2. Commands and Examples

</div>

</div>

</div>

If the requested messages don't exist, `nttp_get()` returns NULL.

Get a list of all groups from the server 'news.openlinksw.com', port
119:

<div id="id65961" class="example">

**Example 19.6. nntp_get()**

<div class="example-contents">

``` programlisting
nntp_get ('news.openlinksw.com:119', 'list');
```

This call returns an array of the form Array ((\<group 1\> varchar,
\<last message\> integer, \<first message\> integer, \<posting allowed\>
varchar ) (\<group 2\> . . . . ) . . . )

ARTICLE, HEAD, BODY, STAT To get the bodies of all messages in the group
'openlink.public.virtuoso':

``` programlisting
nntp_get ('news.openlinksw.com:119', 'body', 'openlink.public.virtuoso');
```

This call returns an array of the form Array ((\<message number\>
integer, \<body of message\> blob) . . . )

To get the article (head + body) of messages numbered from 5 to 10 in
the group 'openlink.public.virtuoso':

``` programlisting
nntp_get ('news.openlinksw.com:119', 'article', 'openlink.public.virtuoso', 5, 10);
```

This call returns an array of the form Array ((\<message number\>
integer, \<body of message\> blob) . . . )

To get the headers of messages numbered from 7 to the end of the
'openlink.public.virtuoso' group:

``` programlisting
nntp_get ('news.openlinksw.com:119', 'head', 'openlink.public.virtuoso', 7);
```

To get the status of all messages in the group
'openlink.public.virtuoso':

``` programlisting
nntp_get ('news.openlinksw.com:119', 'stat', 'openlink.public.virtuoso',);
```

This call returns an array of the form Array ((\<message number\>
integer, \<message ID\> varchar) . . . )

To get the status of the 'openlink.public.virtuoso' group:

``` programlisting
nntp_get ('news.openlinksw.com:119', 'group', 'openlink.public.virtuoso');
```

This call returns an array of the form Array (\<number of messages\>
integer, \<first message\> integer, \<last message\> integer)

</div>

</div>

  

</div>
