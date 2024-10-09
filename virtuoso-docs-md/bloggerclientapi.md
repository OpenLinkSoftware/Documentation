<div>

<div>

<div>

<div>

### 14.7.11. Blogger Client API

</div>

</div>

</div>

<div>

|                                     |                                                                    |
|-------------------------------------|--------------------------------------------------------------------|
| `varchar `**`blogger.new_Post`**`(` | in `uri` varchar, in `req` "blogRequest", in `content` varchar`)`; |

<div>

 

</div>

</div>

<div>

|                                         |                                                 |
|-----------------------------------------|-------------------------------------------------|
| `boolean `**`blogger.delete_Post`**` (` | (in `uri` varchar, in `req` "blogRequest") `)`; |

<div>

 

</div>

</div>

<div>

|                                      |                                                                       |
|--------------------------------------|-----------------------------------------------------------------------|
| `boolean `**`blogger.edit_Post`**`(` | (in `uri` varchar, in `req` "blogRequest", in `content` varchar) `)`; |

<div>

 

</div>

</div>

<div>

|                                      |                                                 |
|--------------------------------------|-------------------------------------------------|
| `blogPost `**`blogger.get_Post`**`(` | (in `uri` varchar, in `req` "blogRequest") `)`; |

<div>

 

</div>

</div>

<div>

|                                             |                                                               |
|---------------------------------------------|---------------------------------------------------------------|
| `vector `**`blogger.get_Recent_Posts`**` (` | (in `uri` varchar, in `req` "blogRequest", in `lim` int) `)`; |

<div>

 

</div>

</div>

<div>

**Example 14.62. The Blogging Client**

<div>

Create a new message.

``` programlisting
SQL> select blogger.new_Post ('http://example.com/RPC2',
    blogRequest ('0123456789', 'home', '', 'dav', 'dav'),'test');
callret
VARCHAR
_______________________________________________________________________________

6

1 Rows. -- 267 msec.
```

Edit a message created with previous step:

``` programlisting
SQL> select blogger.edit_Post ('http://example.com/RPC2',
    blogRequest ('0123456789', 'home', '6', 'dav', 'dav'), 'test edited');
callret
VARCHAR
_______________________________________________________________________________

1

1 Rows. -- 194 msec.
```

Get the message, result will be in a blogPost UDT:

``` programlisting
SQL>  dbg_obj_print (blogger.get_Post ('http://example.com/RPC2',
      blogRequest ('0123456789', 'home', '6', 'dav', 'dav')));

Done. -- 120 msec.
```

``` programlisting
---- server console ----
{
        REF:[ref:0xa0deb00 obj:0xa1ed168 DB.DBA.blogPost]
        content=N"test edited"
        dateCreated={ts 2003-04-08 15:34:13.000000}
        postid=N"6"
        userid=2
}
------------------------
```

get list of messages, in our case the result will be a vector with one
element of blogPost UDT.

``` programlisting
SQL> dbg_obj_print (blogger.get_Recent_Posts ('http://example.com/RPC2', blogRequest ('0123456789', 'home', '', 'dav', 'dav'), 10));

Done. -- 124 msec.

---- server console ----
({
        REF:[ref:0xa2426a8 obj:0xa20af40 DB.DBA.blogPost]
        content=N"test edited"
        dateCreated={ts 2003-04-08 15:34:13.000000}
        postid=N"6"
        userid=2
}
 )
------------------------

<programlisting><![CDATA[
SQL> select blogger.delete_Post ('http://example.com/RPC2',
    blogRequest ('0123456789', 'home', '6', 'dav', 'dav'));
callret
VARCHAR
_______________________________________________________________________________

1

1 Rows. -- 337 msec.
```

</div>

</div>

  

There are more examples on using the API in the tutorials.

</div>
