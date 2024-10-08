<div>

<div>

<div>

<div>

### 14.3.5. Beyond Basics

</div>

</div>

</div>

All output from VSP page procedures is buffered into a local string
stream before being sent out. This is done so as to support the HTTP/1.1
required content length and to allow recovery from errors.

<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="code">http_rewrite ( in </code><em><code>stream</code></em><code
class="code"> any);</code></a>

This clears any previous output to the stream. If the stream is omitted
or 0 the stream is the HTTP client stream of the calling procedure.

<a href="fn_http_file.html" class="link" title="http_file"><code
class="code">http_file ( in </code><em><code>path</code></em><code
class="code"> varchar);</code></a>

This function sends a file to the HTTP client as a response to the
current request. Any other output that may have been generated by the
calling procedure will be discarded and the contents of the file will be
the exclusive response to the current HTTP request together with
appropriate headers. The file will only be sent after the procedure
handling the current HTTP request has returned. The file name is thus
not validated until the calling procedure has returned.

<a href="fn_http_get.html" class="link" title="http_get"><code
class="code">http_get( in </code><em><code>uri</code></em><code
class="code"> varchar, out </code><em><code>headers</code></em><code
class="code"> varchar);</code></a>

This function retrieves the document specified by the URI by HTTP and
returns the data of the response. The header output parameter is set to
be an array with an element for each line of the response's HTTP header.
Each line is a varchar object in the containing array. The header
parameter is optional.

The URI is of the form `host[:port]<path>` , e.g
'`www.openlinksw.com:80/index.html` '. The port, if omitted, defaults to
80. The data following the headers is not processed in any way. No
content transfer encodings are decoded but an eventual content transfer
encoding header can be found in the header array.

<a href="fn_http_flush.html" class="link" title="http_flush"><code
class="function">http_flush();</code></a>

This function generates a response header, flushes a stream and
disconnects the client, however, the server will continue with the
execution of the PL code in VSP page. The final result will never be
sent to the client. This is useful when a page makes a long transaction
and we do not wish the client to wait until its end, which may result in
a time-out. Suppose we have the retrieval of news from many targets,
each a thousand messages. We start from a VSP page process, inside it we
put into the internal stream (using http, http_value etc.) redirect code
and call http_flush. The client can read the response and go to a status
page that can display number of messages retrieved, which may need
refreshing a few times.

<a href="fn_http_proxy.html" class="link" title="http_proxy"><code
class="code">http_proxy (in </code><em><code>host_and_port</code></em><code
class="code"> varchar, in </code><em><code>header_lines</code></em><code
class="code"> any, in </code><em><code>post_parameters</code></em><code
class="code"> any)</code></a>

The function http_proxy() is used to send request in header_lines and
post_parameters to the host_and_port, read the response and send it back
to the client. The http_proxy() function can be used inside a VSP page
to send a request to an external web server and automatically route the
reply sent by this remote server to the client of the VSP page calling
http_proxy(). The output which can generated (with http functions, etc.)
before and after http_proxy is called will be discarded before sending
the result of link retrieval to the user-agent.

<div>

**Example 14.10. Virtuoso Proxy**

<div>

``` programlisting
...
<?vsp
  http ('this never be displayed');
  http_proxy ('www.foo.com', vector ('GET / HTTP/1.0'), NULL);
  http ('and this also');
?>
...
```

</div>

</div>

  

<div>

<div>

<div>

<div>

#### Virtuoso HTTP Server Character Set Settings

</div>

</div>

</div>

When the HTTP server returns the HTTP header to the client it appends
charset=xxxx to the Content-Type: HTTP header fields. This informs the
client user agent, the web browser, as to the character set of the
content to be displayed correctly. It uses the Web server charset to
correctly format values resulting from the `http_value()` function or
the VSP equivalent \<?= ...\>. Wide values and XML entities, resulting
from any XML processing functions like xpath_contains, get represented
using the "HTML/XML transformation".

The default web server charset is governed by the
<span class="emphasis">*Charset*</span> setting defined in the
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">Virtuoso INI file</a> . If no
default charset is specified then Virtuoso will use ISO-8859-1.

The HTTP character set can be changed during an HTTP session using:
<span class="emphasis">*set http_charset='charset_name';*</span> .

The XSLT output encoding can also be specified to over ride the server
default setting.

</div>

<div>

<div>

<div>

<div>

#### Session Management and State Variables

</div>

</div>

</div>

The Virtuoso HTTP session management consists of functions for session
variables manipulation and hooks for saving and restoring session
variables.

Session management must be enable by setting the flag for persistent
session variables in the virtual directory mapping. Virtual directory
mappings use the
<span class="emphasis">*persistent_session_variables*</span> flag, which
when specified, session variables can be used in a post-process function
to determine if the session variables content must be stored on to the
session table or not.

The post-processing function hook can be any user-defined Virtuoso/PL
procedure, it will be executed every time after processing of the active
page.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_connection_get.html" class="link" title="connection_get"><code
class="function">connection_get()</code></a></p>
<p><a href="fn_connection_set.html" class="link"
title="connection_set"><code
class="function">connection_set()</code></a></p>
<p><a href="fn_connection_vars.html" class="link"
title="connection_vars"><code
class="function">connection_vars()</code></a></p>
<p><a href="fn_connection_vars_set.html" class="link"
title="connection_vars_set"><code
class="function">connection_vars_set()</code></a></p>
<p><a href="fn_connection_is_dirty.html" class="link"
title="connection_is_dirty"><code
class="function">connection_is_dirty()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
