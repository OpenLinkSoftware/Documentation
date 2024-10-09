<div>

<div>

<div>

<div>

### 13.3.3. Publisher Transactional Replication Functions

</div>

</div>

</div>

The most generic form of the replication element is a stored procedure
call. This associates a procedure name and set of parameters to a
publication inside a transaction. When the transaction commits, all the
publication entries are appended to the publication, forming a
replication entry with its unique number.

These functions are available to the publishing Virtuoso server:

<div>

- <a href="fn_repl_publish.html" class="link" title="REPL_PUBLISH"><code
  class="function">repl_publish()</code></a>

- <a href="fn_repl_unpublish.html" class="link"
  title="REPL_UNPUBLISH"><code
  class="function">repl_unpublish()</code></a>

- <a href="fn_repl_pub_add.html" class="link" title="REPL_PUB_ADD"><code
  class="function">repl_pub_add()</code></a>

- <a href="fn_repl_pub_remove.html" class="link"
  title="REPL_PUB_REMOVE"><code
  class="function">repl_pub_remove()</code></a>

- <a href="fn_repl_pub_init_image.html" class="link"
  title="REPL_PUB_INIT_IMAGE"><code
  class="function">repl_pub_init_image()</code></a>

- <a href="fn_repl_new_log.html" class="link" title="repl_new_log"><code
  class="function">repl_new_log()</code></a>

- <a href="fn_repl_text.html" class="link" title="repl_text"><code
  class="function">repl_text()</code></a>

- <a href="fn_repl_grant.html" class="link" title="REPL_GRANT"><code
  class="function">repl_grant()</code></a>

- <a href="fn_repl_revoke.html" class="link" title="REPL_REVOKE"><code
  class="function">repl_revoke()</code></a>

</div>

</div>
