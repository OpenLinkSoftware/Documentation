<div id="mt_zeroconfintro" class="section">

<div class="titlepage">

<div>

<div>

## 10.1. Introduction

</div>

</div>

</div>

**What is it? ** Zero Configuration Networking, also known as ZeroConf,
is networking that needs nothing to be pre-configured and no
administration to operate. Zero Configuration Networking uses industry
standard IP protocols to allow devices to automatically find each other
without the need to enter IP addresses or configure DNS servers.

**Why is it Important? ** ZeroConf enables services on a network built
with this support to be automatically discovered, thereby requiring no
knowledge on the part of the end user attempting to use this service
about the specifics of its configuration, just that it is available for
use if selected.

Using ZeroConfig for installation rollouts or for site maintenance can
significantly reduce administration overhead. Because the client ODBC
Driver is bound to a service name only, should the details of that
service change the client will automatically re-acquire the new details
(this does not include changes to the name of the service). For example,
200 client installations configured to use the service "SalesDB1",
moving the "Sales" database to another server, perhaps even a different
database does not required any further client configuration, they will
automatically connect to the new server.

ZeroConf configuration on the server is kept to a minimum. The host and
port number of the Request Broker are automatically supplied to the
ZeroConf service descriptions on the server when they are broadcast over
the network. Furthermore, ZeroConf service descriptions can be based
directly on a Server Type that maps to a Database Agent. If we consider
the above example again, moving the "Sales" database to another machine
will not need any ZeroConf adjustment on the server either, the new host
and port and automatically discovered and broadcast with no
administrator intervention other than to start the new Broker and
Database.

</div>
