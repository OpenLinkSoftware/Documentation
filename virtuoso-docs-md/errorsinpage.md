<div id="errorsinpage" class="section">

<div class="titlepage">

<div>

<div>

### 14.3.3. Errors in Page Procedures

</div>

</div>

</div>

VSP pages can declare handlers for errors using the normal handler
declaration or whenever ... goto construct. Any unhandled error causes
the procedure to be terminated and the error message to be sent to the
HTTP client instead of the output. Because terminating the page output
at an arbitrary point would probably result in not well formed output
all the output up to the point of the error is discarded.

If the SQL state signalled with the error is VSPRT the output generated
up to the point where the error was signalled is sent as such to the
user agent. This special SQL state is useful together with the
http_rewrite function for things like sending a redirect based on a
condition detected in the middle of page processing. The http_rewrite
function will clear all output buffered so far and signaling VSPRT will
make sure that whatever output is generated after http_rewrite goes
unmodified to the user agent.

</div>
