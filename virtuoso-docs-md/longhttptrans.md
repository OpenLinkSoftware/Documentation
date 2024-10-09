<div>

<div>

<div>

<div>

### 14.3.6. Long HTTP Transactions

</div>

</div>

</div>

Long running tasks may be invoked by web clients. In such a case, the
server should return a page for the user agent much before the tasks's
completion in order to provide feedback and avoid timeouts. Also the
long running task should not be interrupted by the user agent
disconnecting. The `http_flush()` function will send the reply
accumulated thus far to the user agent and then disconnect it. In
effect, this is a generic mechanism for starting an asynchronous thread.

Starting long running tasks may lead to denial of service. To prevent
this we can use status and stop functions to check processes and kill
them if necessary.

We can retrieve the URL, client IP-address, and process status code for
all currently running VSP requests, then use this information to isolate
and eliminate a process.

<a href="fn_http_pending_req.html" class="link"
title="http_pending_req"><code
class="function">http_pending_req()</code></a> Lists the processes.

<a href="fn_http_kill.html" class="link"
title="http_kill">http_kill()</a> can be used to kill them.

</div>
