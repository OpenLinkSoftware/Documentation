<div>

<div>

<div>

<div>

### 2.5.2. License Manager

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Monitor License Consumption

</div>

</div>

</div>

OpenLink's License Manager technology provides a sophisticated and easy
to use License statistics and monitoring facility. This page introduces
you to that facility and provides alternative techniques for versions of
the software that do not contain it.

<div>

1.  Launch the Virtuoso Web interface.

2.  Click the

    <span class="emphasis">*Conductor*</span>

    link.

3.  Login with your Virtuoso dba account.

4.  Click the

    <span class="emphasis">*System Admin*</span>

    tab.

5.  Locate the

    <span class="emphasis">*License*</span>

    section to review the terms of your Virtuoso license.

6.  Locate the

    <span class="emphasis">*Clients*</span>

    section to review open connections that consume Virtuoso license
    points.

</div>

</div>

<div>

<div>

<div>

<div>

#### Start the License Manager Process

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Mac OS X

</div>

</div>

</div>

<div>

1.  Launch ` Terminal.app (/Applications/Utilities/) `

2.  Execute the command
    `cd "/Library/Application Support/openlink/bin/"`

3.  Execute the command `oplmgr +start`

</div>

</div>

<div>

<div>

<div>

<div>

##### Windows

</div>

</div>

</div>

<div>

1.  Launch the

    <span class="emphasis">*Services*</span>

    Control Panel (may be in the

    <span class="emphasis">*Administrative Tools*</span>

    sub-folder).

2.  Locate and select the

    <span class="emphasis">*OpenLink Virtuoso*</span>

    service.

3.  Click the

    <span class="emphasis">*Start*</span>

    icon.

</div>

</div>

<div>

<div>

<div>

<div>

##### Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

<div>

1.  Open a Unix terminal.

2.  `cd` into the root of your Virtuoso installation.

3.  Use one of the following commands to set Virtuoso-related
    environment variables. (Note that they do, and must, begin with
    dot-space-dot-slash.)

    <div>

    - `. ./virtuoso-enterprise.sh ` \> - bash, bsh, ksh, and related
      shells

    - `. ./virtuoso-enterprise.csh ` - csh, tcsh, and related shells

    </div>

4.  Execute the command: `oplmgr +start`

</div>

<span class="emphasis">*Note*</span> : OpenLink recommends that you
create an `/etc/init.d/` script that sets the environment and runs
`oplmgr +start` at boot time.

</div>

</div>

<div>

<div>

<div>

<div>

#### Stop the License Manager Process

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Mac OS X

</div>

</div>

</div>

<div>

1.  Launch ` Terminal.app (/Applications/Utilities/) `

2.  Execute the command
    `cd "/Library/Application Support/openlink/bin/"`

3.  Execute the command `oplmgr +stop`

</div>

</div>

<div>

<div>

<div>

<div>

##### Windows

</div>

</div>

</div>

<div>

1.  Launch the

    <span class="emphasis">*Services*</span>

    Control Panel (may be in the

    <span class="emphasis">*Administrative Tools*</span>

    sub-folder).

2.  Locate and select the

    <span class="emphasis">*OpenLink License Manager service*</span>

    .

3.  Click the

    <span class="emphasis">*Stop*</span>

    icon.

</div>

</div>

<div>

<div>

<div>

<div>

##### Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

<div>

1.  Open a Unix terminal.

2.  `cd` into the root of your Virtuoso installation.

3.  Use one of the following commands to set Virtuoso-related
    environment variables. (Note that they do, and must, begin with
    dot-space-dot-slash.)

    <div>

    - `. ./virtuoso-enterprise.sh ` - bash, bsh, ksh, and related shells

    - `. ./virtuoso-enterprise.csh ` - csh, tcsh, and related shells

    </div>

4.  Execute the command: oplmgr +stop

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Reinitialize the License Manager Process

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Mac OS X

</div>

</div>

</div>

<div>

1.  Launch ` Terminal.app (/Applications/Utilities/) `

2.  Execute the command
    `cd "/Library/Application Support/openlink/bin/"`

3.  Execute the command `oplmgr +reload`

</div>

</div>

<div>

<div>

<div>

<div>

##### Windows

</div>

</div>

</div>

<div>

1.  Launch the

    <span class="emphasis">*Services*</span>

    Control Panel (may be in the

    <span class="emphasis">*Administrative Tools*</span>

    sub-folder).

2.  Locate and select the

    <span class="emphasis">*OpenLink License Manager service*</span>

    .

3.  Click the

    <span class="emphasis">*Restart*</span>

    icon.

</div>

</div>

<div>

<div>

<div>

<div>

##### Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

<div>

1.  Open a Unix terminal.

2.  `cd` into the root of your Virtuoso installation.

3.  Use one of the following commands to set Virtuoso-related
    environment variables. (Note that they do, and must, begin with
    dot-space-dot-slash.)

    <div>

    - `. ./virtuoso-enterprise.sh ` - bash, bsh, ksh, and related shells

    - `. ./virtuoso-enterprise.csh ` - csh, tcsh, and related shells

    </div>

4.  Execute the command: oplmgr +reload

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Additional Usage Notes

</div>

</div>

</div>

The license manager takes several command-line arguments, as revealed by
its "usage" output (produced by any unrecognized argument) --

``` programlisting

      bash$ oplmgr --help
      OpenLink License Manager
      Version 1.2.2 as of Thu Feb 15 2007 (Release 6.0 cvsid 00084).
      Compiled for Linux 2.4.20-46.9.legacysmp (i686-generic-linux-glibc23-32)
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

</div>

</div>
