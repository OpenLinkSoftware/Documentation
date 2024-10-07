<div id="eeoverview" class="sect1">

<div class="titlepage">

<div>

<div>

## 1.1. Overview

</div>

</div>

</div>

The OpenLink Express Edition driver is a client-only installation and
goes some way to ensure the job for developers, administrators and
end-users is simplified. Part of this process means installing the
software in one location as opposed to numerous locations. By discarding
the server-side setup, there is no server-side administration so the
user has only a single entry-point for installation and administration.
In the majority of cases, knowing the database by name is all that is
required.

To the developer writing an application, there is no requirement to know
on which server it resides: you can write your application for any
environment, regardless of where it will end. There are also performance
benefits gained by employing this single solution, which in some cases
exceeds that provided by the database vendor's drivers. Being able to
integrate your solution simply into your organization with its plethora
of internal and disparate systems means your RoI increases
significantly.

<div id="eearch" class="sect2">

<div class="titlepage">

<div>

<div>

### 1.1.1. Driver Architecture

</div>

</div>

</div>

These drivers are built by implementing the ODBC data-access interface
specifications directly connecting to the database. There are no
limiting factors as with traditional Single-Tier solutions.

The Express Edition drivers are Type-B- or -C-based remote procedure
calls (RPC) interface to the wire-protocol of the underlying database.
This is a client-only interface that communicates directly with the
remote database server. These interfaces typically are unavailable to
third-party developers. To date the Open Source projects such as
FreeTDS, MySQL, PostgreSQL and Interbase are the only publicly
accessible and freely available versions of such interfaces.

The ODBC Express Edition drivers offer developers an opportunity to
develop generic solutions across platforms without prior knowledge of
the operating system hosting the Database server.

</div>

<div id="eesysreq" class="sect2">

<div class="titlepage">

<div>

<div>

### 1.1.2. System Requirements

</div>

</div>

</div>

<div id="eesoftreq" class="sect3">

<div class="titlepage">

<div>

<div>

#### Software Requirements

</div>

</div>

</div>

You must have the following software to use OpenLink Express Edition
ODBC Drivers:

<div class="itemizedlist">

- One or more ODBC-compliant application(s).

- A supported database server.

- The OpenLink Express Edition ODBC Driver for the target database
  server

- A valid license file for each required OpenLink Express Edition ODBC
  Driver.

</div>

</div>

<div id="eehardreq" class="sect3">

<div class="titlepage">

<div>

<div>

#### Hardware Requirements

</div>

</div>

</div>

You must have the following hardware to use OpenLink Single-Tier Drivers
for ODBC:

<div class="itemizedlist">

- A TCP/IP network connection to the database server from the client
  machine the Express Edition driver is installed on.

- An ODBC Application Host running an operating system that is supported
  by OpenLink Express Edition ODBC Drivers. The currently supported
  operating systems are Mac OS X 10.3 (PPC), Mac OS X 10.4 (PPC &
  Intel). Please check the OpenLink website
  <a href="http://www.openlinksw.com/" class="ulink"
  target="_top">http://www.openlinksw.com/</a> to verify availability of
  support for an operating system.

</div>

The ODBC client applications you want to use may have their own hardware
or software requirements, which must also be satisfied.

</div>

</div>

<div id="eeinstallconf" class="sect2">

<div class="titlepage">

<div>

<div>

### 1.1.3.  Installation and Configuration Guide

</div>

</div>

</div>

This section provides a step-by-step guide for the installation and
configuration of the OpenLink Express Edition drivers.

</div>

<div id="eeinstallconfmacosx" class="sect2">

<div class="titlepage">

<div>

<div>

### 1.1.4. OpenLink Express Edition Drivers Installation and Configuration on Mac OS X

</div>

</div>

</div>

</div>

</div>
