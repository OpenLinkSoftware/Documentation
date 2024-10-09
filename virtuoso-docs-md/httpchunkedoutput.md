<div>

<div>

<div>

<div>

### 14.3.7. Using chunked encoding in HTTP 1.1

</div>

</div>

</div>

It is sometimes desirable to use the HTTP 1.1 chunked encoding to send
data to HTTP clients. Examples of such include status pages or streaming
applications. Note that the possibility of using chunked encoding
depends on external factors such as whether the client browser supports
chunked encoding. So a server page can request turning on the chunked
encoding, but should handle the case should it not be available.

Note that in order to successfully turn on the chunked encoding the page
should not be using the `http_xslt()` . Also all reply headers set by
the `http_header()` are silently ignored after the mode is set.

The `http_flush()` (with 1 as a value for it"s optional argument) is
used to request turning on the chunked encoding. If the client"s user
agent supports the encoding, then the data accumulated so far in the
server"s output buffer are sent to the client as the first chunk, the
request is put in special "chunked mode" and the `http_flush()` returns
a non-zero integer. When in that mode a new chunk is sent to the client
either when the internal 4k buffer is filled up or when the client calls
`http_flush()` again to flush the buffer and send it as a chunk. The
client disconnection is handled as usual .

</div>
