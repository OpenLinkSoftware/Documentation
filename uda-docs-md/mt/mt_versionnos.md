<div id="mt_versionnos" class="section">

<div class="titlepage">

<div>

<div>

## 6.8. Obtaining Component Details From The Command Line

</div>

</div>

</div>

This approach provides you with information about the actual executable
file, it includes:

Version Number - this is a component identifier that indicates the
version number specific of a specific OpenLink Component

Release Number - this is an identifier for a collection of OpenLink
Components, numerous components with different version numbers make up
an OpenLink Data Access Drivers commercial release.

Compilation Date - indicates the date component was compiled.

CVSID - this is a source code archive identifier that relates to the
actual source code archive from which a particular component has been
assembled.

Binary Platform - indicates what platform the component has been built
to run on.

To obtain the information referred to above for any OpenLink Component
simply type in the program name at your command prompt with the --help
switch.

Examples of the output produced by the OpenLink Request Broker and the
OpenLink Web Service Agent are depicted below:

<div id="mt_oplrqb" class="section">

<div class="titlepage">

<div>

<div>

### 6.8.1. OpenLink Request Broker:

</div>

</div>

</div>

``` programlisting
[person@linuxbox bin]$ ./oplrqb --help
OpenLink Request Broker
Version 2.22 (Release 4.2) as of Mon Apr 08 2002 (cvsid 00060).
Compiled for Linux 2.4.18-xfs (i686-pc-linux-gnu)
Copyright (C) OpenLink Software.
Usage:
  oplrqb [-flLdcv] [+foreground] [+loglevel num] [+logfile arg] [+debug]
         [+configfile arg] [+version]
  +foreground   run in the foreground
  +loglevel     log level
  +logfile      log file
  +debug        debug mode
  +configfile   use alternate configuration file
  +version      show version number
```

</div>

<div id="mt_webage" class="section">

<div class="titlepage">

<div>

<div>

### 6.8.2. Web Service Agent:

</div>

</div>

</div>

``` programlisting
[person@linuxbox w3config]$ www_sv --help
OpenLink Web Service Agent
Version 1.5 (Release 4.2) as of Mon Apr 08 2002 (cvsid 00060).
Compiled for Linux 2.4.18-xfs (i686-pc-linux-gnu)
Copyright (C) OpenLink Software.
Usage:
  www_sv [-clLd] [+config arg] [+loglevel num] [+logfile arg] [+debug]
  +config     config file
  +loglevel   log level
  +logfile    log file
  +debug      debug mode
Copyright (c) 1987-1994 The Regents of the University of California.
Copyright (c) 1994-1996 Sun Microsystems, Inc.
Copyright (c) 1995 The Apache Group.  All rights reserved.
 This product includes software developed by the Apache Group
 for use in the Apache HTTP server project (http://www.apache.org/).
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                      |
|                            | Using the Admin Assistant section for obtaining <a href="mt_rqbsessparams.html#mt_adinfoadmasist" class="link" 
                              title="7.2.1. General Information">General Information</a> using the web interface.                             |

</div>

</div>

</div>
