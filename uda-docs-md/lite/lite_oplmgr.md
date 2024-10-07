<div id="lite_oplmgr" class="section">

<div class="titlepage">

<div>

<div>

## 4.1. OpenLink License Manager Usage Notes

</div>

</div>

</div>

<div id="lite_oplmgrbckgrnd" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.1. Background

</div>

</div>

</div>

As of UDA release 6.0 and above, OpenLink have moved the handling of
licenses from individual products into a specific License Manager
process. This takes the form of an executable, (\`oplmgr'), from which
all OpenLink commercial products request licenses via network
connections.

</div>

<div id="lite_oplmgrst" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.2. Single-Tier

</div>

</div>

</div>

OpenLink UDA Single-Tier is a single driver installed on the client
only.

For releases 6.0, the oplmgr process was started automatically by the
driver on first connection. As of release 6.1, this behaviour has
changed; in order to facilitate use of License Manager process for
administering licenses of all OpenLink products simultaneously on the
same machine, the license-manager must be started explicitly started in
advance of services that will use it. The release 6.1 installers now
check if a License Manager (oplmgr) process is already running and if
not start their own local instance.

</div>

<div id="lite_oplmgrmt" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.3. Multi-Tier

</div>

</div>

</div>

OpenLink UDA Multi-Tier drivers comprise at least 3 components: a
generic client installed on client machines, all of which contact a
central request broker which spawns an RDBMS-specific database agent to
connect to the specific database requested. The request-broker asks the
license-manager for licenses for every connection requested.

For UDA release 6.0, the oplmgr process was started automatically by the
request-broker (oplrqb). As of release 6.1, this behaviour has changed.
In order that you should only need one license-manager per server,
handling licenses for a variety of products (particularly combinations
of Multi-Tier and OpenLink Virtuoso Universal Server), the
license-manager must now be explicitly started before other services
requiring it. The release 6.1 installers now check if a License Manager
(oplmgr) process is already running and if not start their own local
instance.

</div>

<div id="lite_oplmgrhowto" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.4. How to stop/start the OpenLink License Manager

</div>

</div>

</div>

The license manager takes the following commandline options:

``` programlisting
      bash$ oplmgr --help
      OpenLink License Manager
      Version 1.2.2 as of Thu Feb 15 2007 (Release 6.0 cvsid 00084).
      Compiled for Linux 2.4.20-46.9.legacysmp
(i686-generic-linux-glibc23-32)
      Copyright (C) OpenLink Software.
      Usage:
      oplmgr [-shrutp] [+start] [+stop] [+reload] [+user arg] [+chroot arg]
      [+pidfile arg]
      +start     start the license manager
      +stop      stop the license manager
      +reload    force a configuration reload
      +user      run as the specified user
      +chroot    perform a chroot to the specified directory
      +pidfile   pid file to use for server operation
    
```

We recommend that you create an /etc/init.d/ script that runs \`oplmgr
+start' on boot-up.

</div>

<div id="lite_oplmgrenvvar" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.5. Environment Variables

</div>

</div>

</div>

The OpenLink License Manager will search through directories in the
OPL_LICENSE_DIR variable or failing that, the PATH environment variable,
for files matching \*.lic.

OpenLink recommends you use /etc/oplmgr/ to store your licenses; each
product installation will include a copy of the oplmgr executable in its
respective 'bin' directory, such that if this is the only OpenLink
product on the system, it can be manually started and used for
processing licenses with an appropriate OPL_LICENSE_DIR value. A generic
system startup script is also being developed for Unix systems to enable
the License Manager process to be automatically started on machine boot.
If found, product installers will automatically append this to your
OPL_LICENSE_DIR variable.

</div>

<div id="lite_oplmgrnetwork" class="section">

<div class="titlepage">

<div>

<div>

### 4.1.6. OpenLink License Manager Networking Considerations

</div>

</div>

</div>

The OpenLink License Manager sends and receives using the multicast IP
address 224.0.0.24 on port 60001/udp to communicate between components
and other license-managers that might be on your network. In the event
that it cannot establish this multicast communication, it may cease
allocating licenses, so in the event of license allocation-related
errors, please check your firewall configuration permits this traffic.

</div>

</div>
