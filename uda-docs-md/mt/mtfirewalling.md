<div id="mtfirewalling" class="section">

<div class="titlepage">

<div>

<div>

## 6.9. Configuring a Firewall for use with UDA Multi-Tier

</div>

</div>

</div>

A multi-tier installation requires the following firewall
considerations:

On the server on which the Request Broker runs, you must allow your
clients to connect to port 5000/tcp (or the value of the "Listen"
directive in oplrqb.ini).

On the server, you must allow clients to connect to ports 5001/tcp et
seq (the values between the "PortLow" and "PortHigh" directives in
oplrqb.ini).

On the client, you must be able to make new outgoing connections to the
server to contact the request broker (the same 5000/tcp or the value of
the "Listen" directive), and to agents listening on successively
higher-numbered ports (in the range between "PortLow" and "PortHigh").

If the agent makes a network connection to the database server, the
respective port should also be opened on the database server (e.g.
5432/tcp for postgres, 1433 and 1434 udp and tcp for SQL Server, etc).

If you have a stateful firewall, the return packets from request-broker
and database agents to the clients should be taken care of
automatically. If not, you will have to cater for your OS' selection of
ephemeral client-side ports as well.

</div>
