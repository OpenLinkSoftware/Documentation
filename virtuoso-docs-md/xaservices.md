<div id="xaservices" class="section">

<div class="titlepage">

<div>

<div>

## 22.3. Services

</div>

</div>

</div>

<div id="xaservicesabstract" class="section">

<div class="titlepage">

<div>

<div>

### 22.3.1. Introduction

</div>

</div>

</div>

The services (in the Tuxedo's term) are special programs which implement
business logic. The services could be in the context of a global XA
transaction, in this case 2PC control will be set in motion. Each
service which uses Virtuoso as resource manager has hdbc connection to
the Virtuoso server. This connection is automatically opened when
service activated. The connection string (OPENINFO) to the Virtuoso
server is the connection string of the group of the service (see GROUPS
section in the sample config file). The OPENINFO has the following
format: "Virtuoso:user:password@NODENAME:port". The user,password and
port are optional.

</div>

</div>
