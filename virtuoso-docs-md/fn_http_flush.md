<div>

<div>

</div>

<div>

## Name

http_flush — Flush internal HTTP stream and disconnect client; Flush
HTTP stream and try sending data in chunked mode.

</div>

<div>

## Synopsis

<div>

|                         |                             |
|-------------------------|-----------------------------|
| ` `**`http_flush`**` (` | in `try_what ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This flushes the internal buffer where output of a VSP page is stored
pending the execution of the page's code. This sends the content of the
page output buffer along with headers and disconnects the client. The
status is 200 OK by default, unless overridden by http_status. The
purpose of this function is to allow a page to send output before
terminating , thus the page can continue processing for an indefinite
time without requiring the client to wait. This is useful for starting
long running background tasks from HTTP clients.

VSP pages that use this function must be sure to supply appropriate
content (or response headers) if needed before calling this function.

Virtuoso supports HTTP 1.1 Chunking Encoding which allows Virtuoso to
send the user agent chunks of output as the page is still processing.
Chunking is enabled by calling `http_flush(1)` within the VSP page. By
default chunks are sent for every 4k worth of output generated, but in
some cases the output needs to consist of smaller chunks, for example
when run-time status needs to be shown in a status page. So to achieve
this the http_flush (try_what=1) could be invoked in places where chunk
must be flushed to the User agent.

Chunked mode requires the following conditions:

|                                                                     |
|---------------------------------------------------------------------|
| no "Content-Length" header sent to the client using http_header()   |
| no "Content-Encoding" header sent to the client using http_header() |
| use http_xslt() is not permitted                                    |
| The client supports HTTP 1.1                                        |

Failing these conditions, `http_flush(1) ` will be a No-Operation.

If the function has actually switched to chunked mode it will return a
non-zero integer. Otherwise and integer 0 will be returned.

Chunked mode is not supported for static content.

</div>

<div>

## Parameters

<div>

### try_what

This optional parameter can be supplied the value one (1) to instruct
Virtuoso to try sending the output of the VSP page in chunked mode.

</div>

</div>

<div>

## Examples

<div>

**Example 24.160. Using http_flush()**

<div>

``` programlisting
  <?vsp
    http ('<p>Hit <a href="status.vsp">there</a> to go on status page</p>');
    http_flush ();
    long_task_procedure ();
  ?>
```

</div>

</div>

  

<div>

**Example 24.161. Using http_flush() small chunks**

<div>

The following example will render in browser at every loop iteration
'state=N'; so this will be visible at 'run-time' not when loop finished
which may take a long.

``` programlisting
<?vsp
  ....
  http_flush (1);

  while (i<1000)
    {
      process_some_item (); -- some procedure that takes a long time usually
      http ('state='||cast (i as varchar)||'<br>');
      http_flush (1);
      i := i + 1;
    }
?>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> .

</div>

</div>
