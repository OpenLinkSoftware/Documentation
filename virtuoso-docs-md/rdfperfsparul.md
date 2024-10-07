<div id="rdfperfsparul" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.13. Using SPARUL

</div>

</div>

</div>

Since SPARUL updates are generally not meant to be transactional, it is
best to run these in
<a href="fn_log_enable.html" class="link" title="log_enable"><code
class="function">log_enable (2)</code></a> mode, which commits every
operation as it is done. This prevents one from running out of rollback
space. Also for bulk updates, transaction logging can be turned off. If
so, one should do a manual checkpoint after the operation to ensure
persistence across server restart since there is no roll forward log.

To have a roll forward log and row by row autocommit, one may use
<a href="fn_log_enable.html" class="link" title="log_enable"><code
class="function">log_enable (3)</code></a> . This will write constantly
into the log which takes extra time. Having no logging and doing a
checkpoint when the whole work is finished is faster.

Many SPARUL operations can be run in parallel in this way. If they are
independent with respect to their input and output, they can run in
parallel and row by row autocommit will ensure they do not end up
waiting for each others' locks.

</div>
