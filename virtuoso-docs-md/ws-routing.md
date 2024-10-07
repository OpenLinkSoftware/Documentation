<div id="ws-routing" class="section">

<div class="titlepage">

<div>

<div>

## 17.6. Web Services Routing Protocol (WS-Routing)

</div>

</div>

</div>

The SOAP Routing Protocol (WS-Routing) is a SOAP-based, stateless
protocol for exchanging SOAP messages from an initial sender to an
ultimate receiver, potentially via a set of intermediaries. The
WS-Routing protocol is implemented as a SOAP extension, embedded in a
SOAP Header entry.

The WS-Routing implementation consists of SOAP Header processing. The
header processing handler for the WS-Routing header determines if the
Virtuoso SOAP server can act as an intermediary or a endpoint depending
on the rules in message path.

This implementation supports HTTP only. Message Id's generated are
UUIDs.

<div id="wsrconfig" class="section">

<div class="titlepage">

<div>

<div>

### 17.6.1. Configuration

</div>

</div>

</div>

Setting-up the WS-Routing for a SOAP service requires you to:

<div class="orderedlist">

1.  make a virtual directory bound to the SOAP endpoint processor
    (/SOAP)

2.  add the following SOAP options:

    |                                            |
    |--------------------------------------------|
    | WS-RP=yes;                                 |
    | wsrp-from=\[identification for endpoint\]; |

</div>

</div>

</div>
