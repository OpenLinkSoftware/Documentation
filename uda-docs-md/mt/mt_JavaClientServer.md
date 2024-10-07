<div id="mt_JavaClientServer" class="section">

<div class="titlepage">

<div>

<div>

## 11.5. Java Based Client-Server (2-Tier) Installation

</div>

</div>

</div>

In this scenario the Java Virtual Machine and OpenLink Drivers for JDBC
reside on separate to OpenLink Server server components for JDBC and
Database Connectivity. Thus, you are going to install your OpenLink
Client and Server components for JDBC on separate machines, one acting
as the Client and the other the Server. The Server also hosts the actual
database engine that you will be connecting to via JDBC.

<div id="mt_winclicomp" class="section">

<div class="titlepage">

<div>

<div>

### 11.5.1. Windows 95/98/NT/2000 Client Components Installation Process

</div>

</div>

</div>

<div class="orderedlist">

1.  Download appropriate driver software installation archive using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard. You would have selected "Java
    Virtual Machine" as you client operating system when interacting
    with the OpenLink download Wizard and then have the files
    "megathin.jar" or "megathin2.jar" presented in the download results
    page depending on the version of the Java Virtual Machine selected

2.  Place the "megathin.jar" or "megathin2.jar" file into directory of
    your choice then add the directory and reference to the JAR file to
    your CLASSPATH environment variable. See example below:

    Windows 95/98/NT/2000

    Presuming you place the "megathin.jar" file in the "\program
    files\openlink\jdk11" on your Windows machine, you would add the
    following line to your "autoexec.bat" if you are running Windows
    95/98:

    ``` programlisting
    set CLASSPATH=%CLASSPATH%;"c:\program files\openlink\jdk11\megathin.jar":. 
    ```

    If you are using NT or Windows 2000 " then you need to open the
    "System Environment" properties of the "System" Control Panel applet
    and then add the same entry to the "System Variables" section if you
    want the driver to be accessible to all users, if not place the
    entry in the "User Variables" section.

3.  Reboot your machine

4.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id11388" class="table">

    **Table 11.10. JDBC Driver Version Commands**

    <div class="table-contents">

    | OpenLink Driver for JDBC Type | Verification Command       |
    |:------------------------------|----------------------------|
    | Megathin Driver for JDK 1.1.x | java openlink.jdbc.Driver  |
    | Megathin Driver for JDK 1.2.x | java openlink.jdbc2.Driver |
    | Megathin Driver for JDK 1.3.x | java openlink.jdbc2.Driver |
    | Megathin Driver for JDK 1.4.x | java openlink.jdbc3.Driver |

    </div>

    </div>

      

    If you receive output indicating the relevant OpenLink component
    branding then this indicates that the drivers have been installed
    correctly and are ready for use with you Java environment, anything
    else indicates something is wrong. Typically this would be a
    mismatch between the Java Virtual machine (your default Java
    environment) and the OpenLink Driver for JDBC classes. Correcting
    your PATH or CLASSPATH environment variable entries will typically
    resolve these problems.

</div>

</div>

<div id="mt_linunixclicomp" class="section">

<div class="titlepage">

<div>

<div>

### 11.5.2. Linux or UNIX Client Components Installation

</div>

</div>

</div>

<div class="orderedlist">

1.  Presuming you place the "megathin.jar" file in the
    "/opt/openlink/jdk11" on your Linux or UNIX machine, you would need
    to modify the following line in the file "openlink.sh" so that they
    match what is listed below:

    ``` programlisting
    CLASSPATH=$CLASSPATH:/opt/openlink/jdk1.1.x/megathin.jar
    ```

2.  Run the script "openlink.sh" (you may also want to add a reference
    to this in your ".profile" file) by executing the following command
    from your Linux or UNIX command line prompt:

    ``` programlisting
    . openlink.sh
    ```

3.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a Linux or UNIX command prompt:

    <div id="id11421" class="table">

    **Table 11.11. JDBC Driver Version Commands**

    <div class="table-contents">

    | OpenLink Driver for JDBC Type | Verification Command       |
    |:------------------------------|----------------------------|
    | Megathin Driver for JDK 1.1.x | java openlink.jdbc.Driver  |
    | Megathin Driver for JDK 1.2.x | java openlink.jdbc2.Driver |
    | Megathin Driver for JDK 1.3.x | java openlink.jdbc2.Driver |
    | Megathin Driver for JDK 1.4.x | java openlink.jdbc3.Driver |

    </div>

    </div>

      

    If you receive output indicating the relevant OpenLink component
    branding then this indicates that the drivers have been installed
    correctly and are ready for use with you Java environment, anything
    else indicates something is wrong. Typically this would be a
    mismatch between the Java Virtual machine (your default Java
    environment) and the OpenLink Driver for JDBC classes. Correcting
    your PATH or CLASSPATH environment variable entries will typically
    resolve these problems.

</div>

</div>

<div id="mt_srvcompinst" class="section">

<div class="titlepage">

<div>

<div>

### 11.5.3. Server Components Installation

</div>

</div>

</div>

Only perform these steps if you are connecting to database engines
hosted on your dedicated Database Server using OpenLink's Database
Independent Networking:

Windows 95/98/NT/2000

<div class="orderedlist">

1.  As a separate Windows 95/98/NT/2000 is playing the role of Server
    machine, you would have downloaded a ZIP archive that contains both
    the OpenLink Client & Server components for this platform. Extract
    the contents of this ZIP archive to a temporary installation folder
    on the Windows Server machine and then run the "Setup.exe" program

2.  The archive you have downloaded will contain the entire suite of
    Data Access Drivers for this platform. If you do not require the
    OpenLink ODBC or OLE-DB Drivers simply uncheck these components
    using the installers component list dialog when presented during the
    install process.

3.  Reboot your system

4.  Verify your OpenLink Driver for JDBC server components installation
    by starting a Web Browser session and then entering the following
    URL:

    ``` programlisting
    http://localhost:8000/
    ```

    If you are presented with the Home Page of the OpenLink Admin
    Assistant then this confirms that your OpenLink Server environment
    is also correctly setup.

5.  An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    pro83a_sv --help (this will verify the Progress Database Agent)
    syb11_sv --help  (this will verify the Sybase Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

<div id="mt_linunixsrccompi" class="section">

<div class="titlepage">

<div>

<div>

### 11.5.4. Linux or UNIX Server Components Installation

</div>

</div>

</div>

<div class="orderedlist">

1.  Download appropriate driver software installation archive using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard. Ensure that you hatched a
    checkbox for each Database Engine type that you will be connecting
    to via JDBC.

2.  Move the Request Broker and Database Agent archives into a temporary
    installation folder on your Linux or UNIX machine then run the
    following commands from the command line prompt:

    Linux:

    ``` programlisting
    rpm -ivh openlink-4.0-2.rpm
    ```

    ``` programlisting
    rpm -ivh openlink-agents-4.0-2.i386-glibc2.rpm
    ```

    (for glibc2 based Linux Environments) or

    ``` programlisting
    rpm -ivh openlink-agents-4.0-2.i386-libc5.rpm
    ```

    (for libc5 based Linux Environments)

    Linux (if your Linux system does not have the RPM facility) and
    UNIX:

    ``` programlisting
    sh install.sh
    ```

3.  Follow the instructions presented by the installer for configuring
    your OpenLink Database Agents.

4.  The installer creates an OpenLink environment setup script named
    "openlink.sh" in the openlink installation's base installation
    directory. This files contains the following entries which you can
    modify so as to match the OpenLink Drivers for JDBC to the
    appropriate Java environment on your machine:

    ``` programlisting
    CLASSPATH=$CLASSPATH:/openlink/openlink/jdk1.1.x/megathin.jar
    ```

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                                                                                                    |
    |:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                              |
    |                              | This step is only required because the Linux and UNIX installer archives automatically install all the OpenLink Driver types for JDBC, and also perform the default CLASSPATH entry configuration. |

    </div>

5.  Run the script "openlink.sh" (you may also want to add a reference
    to this in your ".profile" file) by executing the following command
    from your Linux or UNIX command line prompt:

    ``` programlisting
    . openlink.sh
    ```

6.  Verify your OpenLink Driver for JDBC server components installation
    by starting a Web Browser session and then entering the following
    URL:

    ``` programlisting
    http://localhost:8000
    ```

    or

    ``` programlisting
    http://<hostname of current machine>:8000
    ```

    If you are presented with the Home Page of the OpenLink Admin
    Assistant then this confirms that your OpenLink Server environment
    is also correctly setup.

7.  An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ingii_sv --help  (this will verify the Ingres II Database Agent)
    db2_sv --help    (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

</div>
