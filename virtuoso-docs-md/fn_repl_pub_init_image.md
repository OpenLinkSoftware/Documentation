<div>

<div>

</div>

<div>

## Name

REPL_PUB_INIT_IMAGE — create initial image of publication on publisher

</div>

<div>

## Synopsis

<div>

|                                  |                                   |
|----------------------------------|-----------------------------------|
| ` `**`REPL_PUB_INIT_IMAGE`**` (` | in `publication ` varchar ,       |
|                                  | in `image_file_path ` varchar ,   |
|                                  | in `bytes_per_file ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The image creation process forces checkpoint and runs in atomic mode.

If <span class="emphasis">*image_file_path*</span> does not contain path
components (slashes or backslashes), image slices are stored in one of
backup directories defined in virtuoso.ini using round-robin strategy.

This function is used to create image of publication to be replayed on a
subscribed upon initial setup. This can be used when publication data is
so large to be copied via repl_init_copy() which uses VDB operations.
The image file(s) created by this function must be loaded on subscriber
with replay() function in order of their creation (if image is split on
to a several files).

</div>

<div>

## Parameters

<div>

### publication

publication account name.

</div>

<div>

### image_file_path

full path to the image file where to store the initial image of
publication.

</div>

<div>

### bytes_per_file

at which bytes count to split file into next slice.

</div>

</div>

<div>

## Example

<div>

**Example 24.325. Creating and loading of the initial image**

<div>

This shows creating a image with inital data of the published items and
store in the 'tbl_pub.log' file.

``` screen
SQL> DB.DBA.REPL_PUB_INIT_IMAGE ('table_publication', 'tbl_pub.log', 1000000);
      
```

Furthermore the image can be loaded on a subscriber. Note that this
command MUST be issued on the subscriber side. Note that
REPL_PUB_INIT_IMAGE() will make more files when size of the initial file
is greater than 1Mb, so in that case the additional files will be named
tbl_pub.log.N where N is a sequence beginning from 1 and they also need
to be loaded.

``` screen
SQL> replay 'tbl_pub.log';
... if there a more than one image file load sequentially ...
SQL> replay 'tbl_pub.log.1';
...
```

</div>

</div>

  

</div>

<div>

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

<a href="fn_repl_text.html" class="link" title="repl_text"><code
class="function">repl_text() </code></a>

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
