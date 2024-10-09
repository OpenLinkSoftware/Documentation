<div>

<div>

<div>

<div>

# Chapter 22. Using Virtuoso with Tuxedo

</div>

<div>

<div>

**Abstract**

BEA Tuxedo provides the framework, or middleware, for building scalable
multi-tier client/server applications in heterogeneous (dissimilar),
distributed environments that extend from the Web to the Enterprise.
Using BEA Tuxedo, users can develop, manage, and deploy distributed
applications independently of the underlying hardware, operating system,
network, and database environment.

The current document covers linkage between Virtuoso server and Tuxedo
by ATMI (Application-to-Transaction Monitor Interface) only.

In contrast to classic 2-tier client/server configuration of SQL
servers, the Tuxedo brings 3-tier paradigm (clients, services, resource
managers).

At the foundation of BEA Tuxedo ATMI is a proven, reliable transaction
processor, also known as a transaction processing (TP) monitor. A
transaction processor is an example of a 3-tier client/server
architecture, where the transaction processor supports the application
logic (represented by "services" between the GUI front-end and the
back-end resource managers. Examples of resource managers are SQL
databases, message queues, legacy applications, and other back-end
services.

This document explains how to build support binaries for Tuxedo and
Virtuoso and how to write services which use the Virtuoso as resource
manager.

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">22.1. [Building the Transaction Manager
Server](ch-xa.html#xabuildtms)</span>

<span class="section">22.2. [Configuration](xaubbconf.html)</span>

<span class="section">22.3. [Services](xaservices.html)</span>

<span class="section">22.3.1.
[Introduction](xaservices.html#xaservicesabstract)</span>

<span class="section">22.3.2. [VQL functions](xaservicesvql.html)</span>

<span class="section">22.3.3. [Services concept](xaservcon.html)</span>

<span class="section">22.3.4. [OPENINFO](xaservopeninfo.html)</span>

<span class="section">22.4. [Clients](xaclients.html)</span>

<span class="section">22.5. [Service example](xaservexample.html)</span>

</div>

<div>

<div>

<div>

<div>

## 22.1. Building the Transaction Manager Server

</div>

</div>

</div>

First of all, the administrator needs to build Virtuoso Transaction
Manager Server application in order to use Virtuoso server as Resource
Manager of global transactions operated by Tuxedo.

Then, the following line needs to be put in the \$TUXDIR/udataobj/RM
file:

``` programlisting
            Virtuoso:virt_xa_switch: libvirtxa.a -L${HOME}/lib  -lwic -ldk1t -lthrp -lutil2 -L${SSLDIR}/lib -lssl -lcrypto
        
```

The libvirtxa.a library could be found in tuxedo/lib directory.

This allows to build TP monitor with Virtuoso support (VirtTMS) and
services which could use Virtuoso as resource manager. libvirtxa.a and
other libraries must be accessible by the compiler. The following
command builds the VirtTMS:

``` programlisting
            buildtms -o ${TUXDIR}/bin/VirtTMS -r Virtuoso
        
```

</div>

</div>
