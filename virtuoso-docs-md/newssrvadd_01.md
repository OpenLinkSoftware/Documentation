<div id="newssrvadd_01" class="section">

<div class="titlepage">

<div>

<div>

### 19.5.3. Add Groups to NNTP Server

</div>

</div>

</div>

To add a new newsgroup you must insert a row into the table
DB.DBA.NEWS_GROUPS. Below is an example of an insert statement that you
could use to do this:

``` programlisting
insert into DB.DBA.NEWS_GROUPS (NG_NAME, NG_DESC, NG_UP_INT, NG_CLEAR_INT,
    NG_POST, NG_UP_TIME, NG_OUT_GROUP, NG_NUM, NG_FIRST, NG_LAST,
    NG_SERVER, NG_SERV_PORT, NG_CREAT, NG_UP_MESS, NG_PASS)
values ('openlink.public.virtuoso', 'virtuoso news group' ,
    update interval, clear interval, 1, now(), 'openlink.public.virtuoso',
    0, 0, 0, 'news.openlinksw.com', 110, now(), 0, 0);
```

If the group you want to add is local, change

``` screen
news.openlinksw.com
```

to

``` screen
localhost
```

, change the port to 0, and the

``` screen
external name
```

to

``` screen
''
```

(that is, two single quotes).

See also the <a href="newssrvadm.html#newsgrpsadm" class="link"
title="Conductor Newsgroups Administration">Newsgroups
Administration</a> section of the Visual Server Administration
Interface.

</div>
