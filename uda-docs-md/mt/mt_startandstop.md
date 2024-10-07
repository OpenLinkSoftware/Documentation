<div id="mt_startandstop" class="section">

<div class="titlepage">

<div>

<div>

## 7.1. Request Broker Startup & Shutdown

</div>

</div>

</div>

<div id="mt_startup" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.1. Startup Options

</div>

</div>

</div>

The Request Broker can be started in a number of ways using various
command line options. A single instance is described here. For multiple
instances, see a subsequent section.

``` programlisting
Usage: 
  oplrqb [-flLdcv] [+foreground] [+loglevel num] [+logfile arg]
    [+debug][+configfile arg] [+version]
  +foreground   run Broker in the foreground mode
  +loglevel     log level where Broker session log details decrease in verbosity from 7 down to 1
  +logfile      full path and file name into which Broker session log output is to be written
  +debug        starts Broker in debug mode
  +configfile   use alternate configuration file
  +version      show version number
```

<div id="mt_commandlineexamples" class="section">

<div class="titlepage">

<div>

<div>

#### Command Line Examples:

</div>

</div>

</div>

``` programlisting
oplrqb 
```

Starts the Broker in background mode.

``` programlisting
oplrqb -v
```

Starts the Broker in background mode and displays version information as
part of startup process.

``` programlisting
oplrqb -dv
```

Starts the Broker in foreground debug mode using default log level 7
(most amount of session log information). This occupies your terminal
session in the foreground, and echoes the output of all OpenLink Data
Access Clients to the terminal window.

``` programlisting
oplrqb -dvl 1
```

Starts the Broker in foreground debug mode using default log level 1
(lowest amount of session log information). This occupies your terminal
session in the foreground, and echoes the output of all OpenLink Data
Access Clients to the terminal window.

``` programlisting
oplrqb -dvL /tmp/openlink.log
```

Starts the Broker in foreground debug mode using default log level 7
(most amount of session log information). This occupies your terminal
session in the foreground, and echoes the output of all OpenLink Data
Access Clients to the file "/tmp/openlink.log" .

</div>

</div>

<div id="mt_shutdownopts" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.2. Shutdown Options

</div>

</div>

</div>

The OpenLink Request Broker can be shut down in various ways, using the
available command line options.

``` programlisting
Usage:
  oplshut [-hcskryfpP] [+hostname arg] [+configfile arg] [+show] [+kill]
          [+reinit] [+yes] [+force] [+protocol arg] [+port num] [pid ..]
  +hostname     contact oplrqb on given host
  +configfile   use alternate configuration file
  +show         show database agent connections
  +kill         kill a database agent
  +reinit       oplrqb must reread the rulebook
  +yes          don't ask for confirmation
  +force        force immediate shutdown (kill all)
  +protocol     specify protocol to use
  +port         specify port to use
Examples:
  oplshut            Shutdown broker on local machine (when idle)
  oplshut -f         Shutdown broker without waiting for clients to terminate
  oplshut -fy        Same as -f, but without asking for confirmation
  oplshut -s         Show the current active connections
  oplshut -k 81 93   Try to terminate the database agents with svpid 81 and 93
```

<div id="mt_cmdlineegs" class="section">

<div class="titlepage">

<div>

<div>

#### Command Line Examples:

</div>

</div>

</div>

``` programlisting
oplshut 
```

Shuts down the Request Broker on the local machine. When a connection is
still active, and the user calls oplshut without additional arguments,
the broker will enter a gracefull shutdown state which means that it
will not accept any new connections, but remains active until all active
connections are terminated.

The shutdown state will be reported on the foreground screen or broker
log:

``` screen
oplrqb: shutdown mode initiated by openlink@127.0.0.1
```

Any client that tries to connect to the broker will get the following
error message:

``` screen
odbctest DSN=ora8i
OpenLink ODBC Demonstration program
This program shows an interactive SQL processor
[OpenLink][ODBC]the broker is being shut down, SQLSTATE=08004
[OpenLink][ODBC]Connection rejected by data source, SQLSTATE=08004
```

``` programlisting
oplshut -f 
```

Shuts down the Request Broker on the local machine without waiting for
clients to terminate.

If you use the -f (or force) flag, the broker will kill all active
connections regardless what the client application is doing, which can
lead to problems if the applications are not written to handle such
events. Depending on the database, open transactions will be rolled back
etc.

Many databases like Oracle and Progress implement the same concept where
the gracefull shutdown option is the default, but a shutdown can be
forced in case of a big calamity, or when a connection remains
lingering.

``` programlisting
oplshut -fy 
```

Same functionality as prior command, but without asking for
confirmation.

``` programlisting
oplshut +port 16000
```

Shuts down the Request Broker running on the TCP Listen port of "16000".
Note that the default Request Broker Listen port is 5000, thus this
option is not necessary unless you specified a different Listen port at
install-time.

``` programlisting
oplshut -s 
```

Shows the current active OpenLink Data Access Client connections.

``` programlisting
oplshut -k 81 93 
```

Try to terminate the database agent sessions with process IDs 81 and 93.

``` programlisting
oplshut -h 12.34.56.78
```

Shuts down the Request Broker on remote machine with IP address
"12.34.56.78".

</div>

</div>

<div id="mt_securityutil" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.3. Security

</div>

</div>

</div>

Due to the Unix security model certain kernel calls can only be used
when the process is run by root or under the permission of root. One of
these function calls is needed for the PingWatchDog protocol, thereby
forcing you to run the request broker as root. This can be accomplished
in two ways:

<div class="orderedlist">

1.  The user logs in as root and then fires up the request broker.

2.  The request broker is flagged to run under root privileges and the
    user can start it up from other accounts.

</div>

The consequences of 1 are that the user(s) who need to startup the
broker need to have knowledge of the root password, which is not
advisable for system managers to give to ordinary users.

Therefore we have built a solution whereby the broker can be flagged as
running under root privileges without the user(s) needing to know the
root password. The system manager executing the following commands
accomplishes this:

``` programlisting
cd openlink/bin
 ./security -s 
```

This will place the broker into a special security state that has the
following impact:

<div class="orderedlist">

1.  The permissions of the oplrqb program are changed so it takes on the
    identity of "root" when started up.

2.  The broker now knows the position of the oplrqb.ini file and will
    not accept certain startup flags so it cannot be tricked to read in
    another oplrqb.ini file from the command line.

3.  The oplrqb.ini file can now only be written to by the "root"
    account, other accounts will only be able to read this file.

</div>

If a user now starts the broker the StartupBy clause within the
\[Security\] section of the broker is checked to see whether the user is
allowed to startup the broker (same for shutdown).

This accomplishes the wish of many system administrators that the broker
process can be started up as root, without widespread knowledge of the
root password.

As stated in item 3 above the "oplrqb.ini" file can now only be written
to by the "root" account. This means that ordinary users cannot modify
this file, which often seems like an unpleasant side effect. To overcome
this some system administrators are temped to modify the mode of the
oplrqb.ini file, thereby opening up to security risks. This should be
avoided, the <span class="emphasis">*IncludeRuleBook*</span> parameter
inside the <span class="emphasis">*Security*</span> sections should be
used instead to divide the rulebook in to parts for others to manage for
themselves. The system administrator can split up the rulebook into
different files which than can be included from the master oplrqb.ini
file. This makes specific sections available to normal users, but
allowing the system administrator to decide which sections can/cannot be
overruled by normal users. The included rulebooks cannot overrule any
section within the oplrqb.ini file. This is a very powerful way of
dealing with high security installations within large companies.

</div>

<div id="mt_multibroker" class="section">

<div class="titlepage">

<div>

<div>

### 7.1.4. Multiple Request Brokers

</div>

</div>

</div>

There are now three different behaviors for running the broker under
Windows that are affected by the type of Windows operating system, and
the +foreground and +debug flags.

<div id="mt_multimeth1" class="section">

<div class="titlepage">

<div>

<div>

#### METHOD 1 - As a service

</div>

</div>

</div>

When:

<div class="itemizedlist">

- Under NT/XP/2000, when no +foreground or +debug has been specified.
  The oplrqb service will start, but only if it has been registered.
  When no +instance is specified, it will use the default instance. If
  this fails, it will run as method 2 or 3.

- Under NT/2000, with a +service start \[+instance identifier\] If this
  fails, it will exit with an error.

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                     |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note 1:                                                                                                                                             |
|                              | When starting oplrqb without options, it will attempt to auto start an existing service. if that fails, it will attempt methods 2 and 3 (see below) |

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                |
|:----------------------------:|:-------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note 2:                                                                        |
|                              | You'll need to do +service create first, the broker doesn't do this by itself. |

</div>

</div>

<div id="mt_multimeth2" class="section">

<div class="titlepage">

<div>

<div>

#### METHOD 2 - With debugging console

</div>

</div>

</div>

When:

<div class="itemizedlist">

- with +foreground or +debug, started from explorer/dos box

- without +foreground or +debug option, started from a dos box.

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>Start up mode is
different when launched from a dos box. If there are no command line
options specified, the broker will now default to +debug when started in
a dos box.</p>
<p>the +foreground and +debug options take precedence over method 1
(starting the service)</p></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="mt_multimeth3" class="section">

<div class="titlepage">

<div>

<div>

#### METHOD 3 - User Specific Service (characterized by a Services Tray Icon)

</div>

</div>

</div>

When:

<div class="itemizedlist">

- started from explorer, without +foreground/+debug

  (NT/XP/2000: Method 1 is tried first)

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                        |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                  |
|                              | It will attempt to locate oplrqb.ini in the current directory, unless +config file has been specified. |

</div>

</div>

<div id="mt_multisummary" class="section">

<div class="titlepage">

<div>

<div>

#### Startup Mode Summary

</div>

</div>

</div>

To summarize, here is some pseudo code:

``` programlisting
if OS = NT or OS = Win2000 or OS = XP then
  if no +foreground or +debug options then
    if there is a service installed then
      silently attempt to start the service
      if this succeeds then exit
    endif
endif
if +foreground or +debug options then
  allocate a debugging console
  run in the foreground
else if started from a dos box then
  set +foreground and +debug
  allocate a debugging console
  run in the foreground
else
  create the splash window and assume tray behavior
endif
Note: it is possible to make the oplrqb service allocate a debugging
console. To do this, specify +debug while creating the service
(example: oplrqb +service create +debug)
```

</div>

<div id="mt_multisrvi" class="section">

<div class="titlepage">

<div>

<div>

#### Multiple Service Instances

</div>

</div>

</div>

Multiple instances of the broker work only for NT/XP/2000 when running
as a service.

There is one default instance (unnamed) which is used when no +instance
command line flag has been specified.

examples:

``` programlisting
oplrqb +service create
```

Registers the default service instance. This service will use the
oplrqb.ini rulebook in the current directory

``` programlisting
oplrqb +service create +instance 1 +config f:\openlink
```

Registers the oplrqb_1 service instance This service will use the
oplrqb.ini rulebook in f:\openlink

``` programlisting
oplrqb +service create +config f:\openlink\test\debug.ini +debug
```

Registers the default service instance. This service will use the
debug.ini rulebook in f:\openlink\test This service will produce debug
output in a console. This service will not auto start, use oplrqb
+service start

Other service commands:

``` programlisting
  +service auto [+instance id]    Set start up type to Automatic
  +service manual [+instance id]  Set start up type to Manual
  +service start [+instance id]   Start up the service
  +service stop [+instance id]    Stops up the service
  +service delete [+instance id]  Unregisters up the service
```

+service list has been extended to show the rulebook that the instance
uses as well as other status information.

To configure another Broker instance manually:

<div class="itemizedlist">

- create a new directory

- create a new rulebook in this directory

- set BinaryDirectory in this new rulebook to the installation directory
  of oplrqb.exe (need to share binaries & licensing)

- Specify a different Listen port

- Either disable www_sv in the rulebook or create a new www_sv.ini with
  'HttpPort' key value set to a unique value other than the default
  8000.

- create another entry using +instance \<id\> +config
  \<the_new_rulebook_ini\>

</div>

</div>

</div>

</div>
