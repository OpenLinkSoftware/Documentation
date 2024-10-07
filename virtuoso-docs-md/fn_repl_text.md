<div id="fn_repl_text" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

repl_text — adds a SQL statement to the log of the replication

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_repl_text" class="funcsynopsis">

|                        |                             |
|------------------------|-----------------------------|
| ` `**`repl_text`**` (` | in `publication ` varchar , |
|                        | in `sqltext ` varchar ,     |
|                        | in `a-1 ` any ,             |
|                        | `... ` `)`;                 |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_repl_text" class="refsect1">

## Description

This SQL function adds the SQL statement to the log of the publication.
The statement will typically be a procedure call but can be any SQL
statement. There can be a parameters, which are bound to ?'s in the
statement's text from left to right. There is no restriction on the
number of parameters.

</div>

<div id="params_repl_text" class="refsect1">

## Parameters

<div id="id106803" class="refsect2">

### publication

The name of the target publication

</div>

<div id="id106806" class="refsect2">

### sqltext

sql expression with unnamed parameters if needed.

</div>

<div id="id106809" class="refsect2">

### a-1 ... a-n

parameter value, in order as in sqltext parameter.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                   |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                             |
|                              | The parameters are input only since the actual call will take place on a remote server at an unknown future time. |

</div>

</div>

</div>

<div id="examples_repl_text" class="refsect1">

## Example

<div id="ex_repl_text_1" class="example">

**Example 24.336. Logging a SQL statement into a publication**

<div class="example-contents">

Suppose on subscriber side we have a table 'foo' with two columns
(integer and varchar). This statement will send a replication message to
the subscribers to insert a row into the table 'foo'.

``` screen
SQL> repl_text ('demo-publication', 'insert into foo values (?, ?)', 1, 'this is a test');
```

</div>

</div>

  

</div>

<div id="seealso_repl_text" class="refsect1">

## See Also

<a href="fn_sub_schedule.html" class="link" title="sub_schedule"><code
class="function">sub_schedule() </code></a>

<a href="fn_repl_disconnect.html" class="link"
title="repl_disconnect"><code
class="function">repl_disconnect() </code></a>

<a href="fn_repl_grant.html" class="link" title="REPL_GRANT"><code
class="function">repl_grant() </code></a>

<a href="fn_repl_init_copy.html" class="link"
title="REPL_INIT_COPY"><code
class="function">repl_init_copy() </code></a>

<a href="fn_repl_new_log.html" class="link" title="repl_new_log"><code
class="function">repl_new_log() </code></a>

<a href="fn_repl_pub_add.html" class="link" title="REPL_PUB_ADD"><code
class="function">repl_pub_add() </code></a>

<a href="fn_repl_pub_init_image.html" class="link"
title="REPL_PUB_INIT_IMAGE"><code
class="function">repl_pub_init_image() </code></a>

<a href="fn_repl_pub_remove.html" class="link"
title="REPL_PUB_REMOVE"><code
class="function">repl_pub_remove() </code></a>

<a href="fn_repl_publish.html" class="link" title="REPL_PUBLISH"><code
class="function">repl_publish() </code></a>

<a href="fn_repl_revoke.html" class="link" title="REPL_REVOKE"><code
class="function">repl_revoke() </code></a>

<a href="fn_repl_sched_init.html" class="link"
title="REPL_SCHED_INIT"><code
class="function">repl_sched_init() </code></a>

<a href="fn_repl_server.html" class="link" title="REPL_SERVER"><code
class="function">repl_server() </code></a>

<a href="fn_repl_server_rename.html" class="link"
title="repl_server_rename"><code
class="function">repl_server_rename() </code></a>

<a href="fn_repl_stat.html" class="link" title="REPL_STAT"><code
class="function">repl_stat() </code></a>

<a href="fn_repl_status.html" class="link" title="repl_status"><code
class="function">repl_status() </code></a>

<a href="fn_repl_subscribe.html" class="link"
title="REPL_SUBSCRIBE"><code
class="function">repl_subscribe() </code></a>

<a href="fn_repl_sync.html" class="link" title="repl_sync"><code
class="function">repl_sync() </code></a>

<a href="fn_repl_sync_all.html" class="link" title="repl_sync_all"><code
class="function">repl_sync_all() </code></a>

<a href="fn_repl_this_server.html" class="link"
title="repl_this_server"><code
class="function">repl_this_server() </code></a>

<a href="fn_repl_unpublish.html" class="link"
title="REPL_UNPUBLISH"><code
class="function">repl_unpublish() </code></a>

<a href="fn_repl_unsubscribe.html" class="link"
title="REPL_UNSUBSCRIBE"><code
class="function">repl_unsubscribe() </code></a>

</div>

</div>
