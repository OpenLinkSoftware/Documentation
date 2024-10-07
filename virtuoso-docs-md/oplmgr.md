<div id="oplmgr" class="section">

<div class="titlepage">

<div>

<div>

## 2.5. OpenLink License Management

</div>

</div>

</div>

<div id="oplmngrlf" class="section">

<div class="titlepage">

<div>

<div>

### 2.5.1. License Files

</div>

</div>

</div>

<div id="oplmngrlfla" class="section">

<div class="titlepage">

<div>

<div>

#### License Activation

</div>

</div>

</div>

<div id="oplmngrlfla_01" class="section">

<div class="titlepage">

<div>

<div>

##### Mac OS X

</div>

</div>

</div>

<div class="orderedlist">

1.  Launch `Terminal.app (/Applications/Utilities/)`

2.  Execute the command
    `cd "/Library/Application Support/openlink/bin/"`

3.  Execute the command `oplmgr +stop`

4.  Retrieve your new Virtuoso license file from an email or
    <a href="oplmgr.html#oplmngrlflb" class="link"
    title="Retrieve OpenLink Licenses from Your ODS Briefcase">ODS
    Briefcase</a> .

5.  Replace the old license file with the new license file. (You may
    delete the old file, or safely retain it in this location by
    changing the `.lic` file extension to `.lic-old` .)

6.  Execute the command `oplmgr +start`

</div>

</div>

<div id="oplmngrlfla_02" class="section">

<div class="titlepage">

<div>

<div>

##### Windows

</div>

</div>

</div>

<div class="orderedlist">

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

4.  Retrieve your new Virtuoso license file from an email or
    <a href="oplmgr.html#oplmngrlflb" class="link"
    title="Retrieve OpenLink Licenses from Your ODS Briefcase">ODS
    Briefcase</a> .

5.  Replace the old license file with the new license file. (You may
    delete the old file, or safely retain it in this location by
    changing the `.lic` file extension to `.lic-old` .)

6.  Go back to the

    <span class="emphasis">*Services*</span>

    Control Panel.

7.  Locate and select the

    <span class="emphasis">*OpenLink License Manager*</span>

    service.

8.  Click the

    <span class="emphasis">*Start*</span>

    icon.

</div>

</div>

<div id="oplmngrlfla_03" class="section">

<div class="titlepage">

<div>

<div>

##### Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

<div class="orderedlist">

1.  Open a Unix terminal.

2.  `cd` into the root of your Virtuoso installation.

3.  Use one of the following commands to set Virtuoso-related
    environment variables. (Note that they do, and must, begin with
    dot-space-dot-slash.)

    <div class="itemizedlist">

    - `. ./virtuoso-enterprise.sh ` - bash, bsh, ksh, and related shells

    - `. ./virtuoso-enterprise.csh ` - csh, tcsh, and related shells

    </div>

4.  Execute the command: oplmgr +stop

5.  Retrieve your new Virtuoso license file from an email or
    <a href="oplmgr.html#oplmngrlflb" class="link"
    title="Retrieve OpenLink Licenses from Your ODS Briefcase">ODS
    Briefcase</a> . Use binary-mode ftp to transfer the new license to
    the Unix box, if required.

6.  Place the new license in the bin sub-directory of the Virtuoso
    installation.

7.  Set and export an `OPL_LICENSE_DIR` environment variable that passes
    the path to the directory that contains your Virtuoso license file,
    e.g

    <div class="itemizedlist">

    - `export OPL_LICENSE_DIR="/opt/virtuoso/bin/" `

    - `OPL_LICENSE_DIR="/opt/virtuoso/bin/" ; export OPL_LICENSE_DIR `

    </div>

8.  Execute the command: `oplmgr +start`

</div>

</div>

<div id="oplmngrlflb" class="section">

<div class="titlepage">

<div>

<div>

##### Retrieve OpenLink Licenses from Your <a href="oplmgr.html#oplmngrlflb" class="link"
title="Retrieve OpenLink Licenses from Your ODS Briefcase">ODS
Briefcase</a>

</div>

</div>

</div>

OpenLink's registered users receive an automatic OpenLink Data Spaces
(ODS) account on the My OpenLink home page. This account allows
registered users to experience and explore OpenLink's Virtuoso Universal
Cilent applications.It also provides a convenient storage mechanism for
OpenLink commercial and evaluation license keys.

This page shows you how to access licenses that reside in your
<a href="oplmgr.html#oplmngrlflb" class="link"
title="Retrieve OpenLink Licenses from Your ODS Briefcase">ODS
Briefcase</a> . A second 15 Day evaluation license is automatically
copied to the Briefcase, when you download our software and receive your
first 15 Day key. You may access the Briefcase by clicking on the link
that appears in the email that contains the first license.
Alternatively, you may identify the ODS url by logging into the OpenLink
site.

The following instructions will allow you to access your
<a href="oplmgr.html#oplmngrlflb" class="link"
title="Retrieve OpenLink Licenses from Your ODS Briefcase">ODS
Briefcase</a> via the OpenLink Web site.

<div class="orderedlist">

1.  Click the Login link that appears on the OpenLink Web page.

    <div class="figure-float">

    <div id="rdfinsertwebdav1" class="figure">

    **Figure 2.67. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODSA.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Click the "Login Here" button that appears in the Registered Users
    box.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_01" class="figure">

    **Figure 2.68. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODSB.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Click the "Check my profile" link that appears in the Welcome box.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_02" class="figure">

    **Figure 2.69. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODSC.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click the ODS Service URL that appears in the lower right hand
    corner of the My Details dialog.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_03" class="figure">

    **Figure 2.70. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODS3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Allow the My OpenLink Web page to load in a Web browser.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_04" class="figure">

    **Figure 2.71. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODS4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Login to your OpenLink Data Space using your OpenLink login.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_05" class="figure">

    **Figure 2.72. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODS5.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click the Briefcase link that appears in the ODS menu bar at the top
    of the page.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_06" class="figure">

    **Figure 2.73. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODS6.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Your license will appear as a Resource Item under the Briefcase
    Summary.

    <div class="figure-float">

    <div id="rdfinsertwebdav1_07" class="figure">

    **Figure 2.74. ODS Briefcase**

    <div class="figure-contents">

    <div class="mediaobject">

    ![ODS Briefcase](images/ui/ODS7.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

Click the license link to download your license. Provide your OpenLink
username and password if prompted for a DAV login.

</div>

</div>

<div id="oplmngrlflp" class="section">

<div class="titlepage">

<div>

<div>

#### License Preservation

</div>

</div>

</div>

Users may choose to preserve the existing license file when applying a
new license file. This facilitates a rollback to the original file, if
the replacement file is problematic.

<div id="oplmngrlflp_01" class="section">

<div class="titlepage">

<div>

<div>

##### Mac OS X

</div>

</div>

</div>

<div class="itemizedlist">

- Use StuffIt or a similar utility to store the file in a compressed
  archive.

- Rename the file, e.g., from `virtuoso.lic` to `virtuoso.lic-old`

</div>

</div>

<div id="oplmngrlflp_02" class="section">

<div class="titlepage">

<div>

<div>

##### Windows

</div>

</div>

</div>

Use WinZip or a similar utility to copy your license file to a .zip
archive.

</div>

<div id="oplmngrlflp_03" class="section">

<div class="titlepage">

<div>

<div>

##### Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

Use tar or gzip to copy your license file into an archive. For example:
`tar cvzf virtuoso-lic.tgz virtuoso.lic`

</div>

</div>

<div id="oplmngrlflr" class="section">

<div class="titlepage">

<div>

<div>

#### License Removal

</div>

</div>

</div>

Users may choose to remove expired or deprecated license files
altogether to ensure the uptake of a new license file.

<div id="oplmngrlflr_01" class="section">

<div class="titlepage">

<div>

<div>

##### Mac OS X

</div>

</div>

</div>

<div class="orderedlist">

1.  Shutdown your OpenLink License Manager

2.  Click the Search icon.

3.  Type your license name into the search box. For example:
    virtuoso.lic

4.  Drag the license from the search results onto the trash icon.

5.  Expand the Finder menu.

6.  Click Empty Trash.

</div>

</div>

<div id="oplmngrlflr_02" class="section">

<div class="titlepage">

<div>

<div>

##### Windows

</div>

</div>

</div>

<div class="orderedlist">

1.  Launch the

    <span class="emphasis">*Services*</span>

    Control Panel (may be in the

    <span class="emphasis">*Administrative Tools*</span>

    sub-folder).

2.  Locate and select the

    <span class="emphasis">*OpenLink Virtuoso*</span>

    service.

3.  Click the

    <span class="emphasis">*Stop*</span>

    icon.

4.  Locate and select the

    <span class="emphasis">*OpenLink License Manager*</span>

    service.

5.  Click the

    <span class="emphasis">*Stop*</span>

    icon.

6.  Launch the Windows Search utility, from the Start menu.

7.  Search for all files with the name `virtuoso.lic.`.

8.  Drag all found licenses to the Recycle Bin.

9.  Empty the Recycle Bin

</div>

</div>

<div id="oplmngrlflr_03" class="section">

<div class="titlepage">

<div>

<div>

##### Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

<div class="orderedlist">

1.  Login to the Unix or Linux operating system.

2.  Use the find command to locate relevant license files, and check
    their permissions and ownership.

    ``` programlisting
    bash-2.03$ find / -name virtuoso.lic -exec ls -l {} \;
    -rw-r--r--   1 virtuoso other        645 Mar 11 08:06 /usr/virtuoso/bin/virtuoso.lic
    bash-2.03$
    ```

3.  Use the rm command to remove the license file(s).

    ``` programlisting
    bash-2.03$ rm /usr/virtuoso/bin/virtuoso.lic
    ```

4.  If the file permissions and ownership require, you can use sudo -

    ``` programlisting
    bash-2.03$ sudo rm /usr/virtuoso/bin/virtuoso.lic
    Password:
    bash-2.03$ ls /usr/virtuoso/bin/virtuoso.lic
    bash-2.03$
    ```

    \- or su to the appropriate user or group -

    ``` programlisting
    bash-2.03$ su virtuoso
    Password:
    bash-2.03$ rm /usr/virtuoso/bin/virtuoso.lic
    bash-2.03$ ls /usr/virtuoso/bin/virtuoso.lic
    bash-2.03$
    ```

</div>

</div>

</div>

</div>

</div>
