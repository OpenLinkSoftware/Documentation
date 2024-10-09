<div>

<div>

<div>

<div>

## 7.7. Unix Domain Socket Connections

</div>

</div>

</div>

Client connections to Virtuoso servers running on the same Unix or Linux
server host can benefit from faster connections utilizing Unix Domain
Sockets. This does not apply to Windows platforms.

By default Virtuoso will open a Unix Domain listen socket in addition to
the TCP listen socket. The name of the UD socket will be:

``` programlisting
/tmp/virt-<tcp-listen-port>
```

When a client attempts to connect to the Virtuoso server using the
specific address `localhost` it will first try connecting to the UD
socket, failing that it will silently revert to the TCP socket.

Unix Domain Socket connections only work if `localhost` is explicitly
specified or the host is unspecified which defaults to a localhost
connection. UD socket connections will
<span class="emphasis">*not*</span> work to any other address such as:

``` programlisting
virt.mydomain.com:1111
127.0.0.1:1111
```

regardless of whether that is the localhost or not.

Unix Domain sockets can be disabled using the `DisableUnixSocket`
parameter in the Parameters section of the Virtuoso INI file.

The `sys_connected_server_address()` function can be used to check the
connection type. It will return

``` programlisting
/tmp/virt-<tcp-listen-port>
```

for connections using UD sockets.

</div>
