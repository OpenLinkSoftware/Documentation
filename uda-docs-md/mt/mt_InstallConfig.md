<div id="mt_InstallConfig" class="section">

<div class="titlepage">

<div>

<div>

## 11.3. OpenLink Drivers for JDBC Installation & Configuration

</div>

</div>

</div>

Once you have downloaded your OpenLink drivers for JDBC using the
instructions provided above, the next step in the process is the actual
configuration of these drivers for use within your operating
environment.

Java is operating system independent by virtue of its core philosophy,
but JDBC Drivers may or may not be operating system independent as this
is JDBC Driver format and implementation specific. The sections that
follow walk your through the OpenLink Driver for JDBC installation and
configuration process.

<div id="mt_WIN32LocalClientServer" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.1. Windows 95/98/NT/2000 Based Local Client-Server Environment

</div>

</div>

</div>

In this scenario your Windows machine is acting as the host machine for
both your OpenLink client and server components, implying that you are
going to install your OpenLink Client and Server components for JDBC on
the same machine.

Installation Process

<div class="orderedlist">

1.  Download appropriate driver software installation archive using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard.

2.  As Windows 95/98/NT/2000 is playing the dual role of both Client and
    Server machine for your OpenLink components, you would have
    downloaded a ZIP archive that contains both the OpenLink Client &
    Server components for this platform. Extract the contents of this
    ZIP archive to a temporary installation folder and then run the
    "Setup.exe" program

3.  The archive you have downloaded will contain the entire suite of
    Data Access Drivers for this platform. If you do not require the
    OpenLink ODBC or OLE-DB Drivers simply uncheck these components
    using the installers component list dialog when presented during the
    install process.

4.  The installer will automatically determine what version of the Java
    Virtual Machine is installed on your machine and then automatically
    checks which OpenLink Drivers for JDBC java classes should be
    checked for installation by default. You can override this settings
    during the installation process so as to match your specific
    requirements should they differ from those derived by the installer.

5.  The installer will also add the OpenLink Driver for JDBC class files
    that you have selected in step 3 to the CLASSPATH environment
    variable on your system

6.  Reboot your system.

7.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id10787" class="decimalstyle">

    **Table 11.2. JDBC Driver Version Commands**

    <div class="decimalstyle-contents">

    | OpenLink Driver for JDBC Type         | Verification Command       |
    |:--------------------------------------|----------------------------|
    | Generic Driver for JDBC 1.1.x         | java openlink.jdbc.Driver  |
    | Generic Driver for JDBC 1.2.x or 2.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDBC 1.3.x         | java openlink.jdbc2.Driver |
    | Megathin Driver for JDBC 1.1.x        | java openlink.jdbc.Driver  |
    | Megathin Driver for JDBC 1.2.x or 2.x | java openlink.jdbc2.Driver |
    | Megathin Driver for JDBC 1.3.x        | java openlink.jdbc2.Driver |

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

8.  Verify your OpenLink Driver for JDBC server components installation
    by starting a Web Browser session and then entering the following
    URL:

    http://localhost:8000/

    If you are presented with the Home Page of the OpenLink Admin
    Assistant then this confirms that your OpenLink Server environment
    is also correctly setup.

9.  An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ingii_sv --help   (this will verify the Ingres II Database Agent)
    db2_sv --help     (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

<div id="mt_WIN32ClientServer" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.2. Windows 95/98/NT/2000 Based Client-Server (2-Tier Configuration) Environment

</div>

</div>

</div>

In this scenario one or more Windows machines act as the host machine
for your OpenLink client components, while a separate Windows server
machine hosts your OpenLink server components. This Windows server
machine also hosts the database engine that you will be connecting to
via JDBC, this machine is typically referred to as your Database Server
machine.

<div id="mt_clicomponent" class="section">

<div class="titlepage">

<div>

<div>

#### Client Components Installation

</div>

</div>

</div>

<div class="orderedlist">

1.  Download appropriate driver software using the instructions provided
    in the section that covers interaction with the OpenLink Software
    Download Wizard on to your designated client machine

2.  As Windows 95/98/NT/2000 is playing the single role of Client
    machine for your OpenLink Drivers for JDBC, you would have
    downloaded a ZIP archive that contains only the OpenLink Client
    components. Extract the contents of this ZIP archive to a temporary
    installation folder and then run the "Setup.exe" program

3.  The archive you have downloaded will contain the entire suite of
    Data Access Drivers for this platform. If you do not require the
    OpenLink ODBC or OLE-DB Drivers simply uncheck these components
    using the installers component list dialog when presented during the
    install process

4.  The installer will automatically determine what version of the Java
    Virtual Machine is installed on your machine and then automatically
    checks which OpenLink Drivers for JDBC java classes should be
    checked for installation by default. You can override this settings
    during the installation process so as to match your specific
    requirements should they differ from those derived by the installer

5.  The installer will also add the OpenLink Driver for JDBC class files
    that you have selected in step 3 to the CLASSPATH environment
    variable on your system

6.  Reboot your system

7.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id10843" class="decimalstyle">

    **Table 11.3. JDBC Driver Version Commands**

    <div class="decimalstyle-contents">

    | OpenLink Driver for JDBC Type         | Verification Command       |
    |:--------------------------------------|----------------------------|
    | Generic Driver for JDBC 1.1.x         | java openlink.jdbc.Driver  |
    | Generic Driver for JDBC 1.2.x or 2.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDBC 1.3.x         | java openlink.jdbc2.Driver |
    | Megathin Driver for JDBC 1.1.x        | java openlink.jdbc.Driver  |
    | Megathin Driver for JDBC 1.2.x or 2.x | java openlink.jdbc2.Driver |
    | Megathin Driver for JDBC 1.3.x        | java openlink.jdbc2.Driver |

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

<div id="mt_srvcomponent" class="section">

<div class="titlepage">

<div>

<div>

#### Server Components Installation

</div>

</div>

</div>

<div class="orderedlist">

1.  Download appropriate server components software using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard on to your designated server
    machine

2.  As Windows 95/98/NT/2000 is playing the single role of Server
    machine for your OpenLink Drivers for JDBC, you would have
    downloaded a ZIP archive that contains only the OpenLink Server
    components. Extract the contents of this ZIP archive to a temporary
    installation folder and then run the "Setup.exe" program

3.  The archive you have downloaded will contain both OpenLink client
    and Server components for this platform. Since you are setting up a
    Server machine simply uncheck the OpenLink Client components (ODBC,
    JDBC, OLE-DB) using the installers component list dialog when
    presented during the install process, this ensures that you only
    install OpenLink Server components on your Server machine(s)

4.  If you are an existing OpenLink user please ensure that you do not
    have an OpenLink Request Broker process running (check your services
    control panel item), if there is a Request Broker process running
    please shut it down at this point

5.  Run the "setup.exe" program

6.  Start the OpenLink Request Broker, you this by either going into
    your "Services" control panel (for Windows NT) or to the "OpenLink
    Data Access Drivers" Windows Start Menu, and then click on the
    "Broker Startup" menu item

7.  Verify your OpenLink Driver for JDBC server components installation
    by starting a Web Browser session from either your OpenLink Client
    or Server machine and then enter one of the following URLs:

    From Client Machine:

    ``` programlisting
    http://<server name or IP address>:8000
    ```

    From Server Machine:

    ``` programlisting
    http://localhost:8000
    ```

    If you are presented with the Home Page of the OpenLink Admin
    Assistant then this confirms that your OpenLink Server environment
    is also correctly setup.

8.  An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ingii_sv --help   (this will verify the Ingres II Database Agent)
    db2_sv --help     (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

</div>

<div id="mt_WIN32AppServer" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.3. Windows 95/98/NT/2000 Based Application-Server (3-Tier Configuration) Environment

</div>

</div>

</div>

In this scenario your OpenLink Client and Server components for JDBC are
installed on an Application Server, as this is where your JDBC based
application will be hosted and developed (if you are building a JDBC
based 3-Tier solution). Thus, the installation process is broken down
into two parts, Application Server, and Database Server components
installation. You will not need to install any software on the client
machines being used by your JDBC solutions end-users. Application Server
Components Installation

<div class="orderedlist">

1.  Download appropriate server components software using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard on to your designated server
    machine

2.  As this machine needs to host both Client and Server components (by
    virtue of this machine playing the role of Application Server), you
    would have downloaded a ZIP archive that contains both the OpenLink
    Client & Server components for this platform. Extract the contents
    of this ZIP archive to a temporary installation folder and then run
    the "Setup.exe" program

3.  The archive you have downloaded will contain the entire suite of
    Data Access Drivers for this platform. If you do not require the
    OpenLink ODBC or OLE-DB Drivers simply uncheck these components
    using the installers component list dialog when presented during the
    install process.

4.  If you choose to use OpenLink's Database Independent Networking to
    connect to remote database engines hosted on one or more dedicated
    Database Server machine, then ensure that an OpenLink Database Agent
    checkbox for each Database Engine type is checked from the component
    list presented by the installer. If on the other hand you choose to
    use Database Specific Networking provided by your database vendor(s)
    when connecting to your remote Database Engine(s) hosted on your
    dedicated Database Server machines, then simply leave all the
    OpenLink Database Agent checkboxes unchecked.

    SQL\*Net, Open Client, Progress Client. I-Connect, Ingres Net, and
    Netlib are database specific networking products for Oracle, Sybase,
    Progress, Informix, Ingres, and Microsoft SQL Server respectively.

5.  The installer will automatically determine what version of the Java
    Virtual Machine is installed on your machine and then automatically
    checks which OpenLink Drivers for JDBC java classes should be
    checked for installation by default. You can override this settings
    during the installation process so as to match your specific
    requirements should they differ from those derived by the installer

6.  The installer will also add the OpenLink Driver for JDBC class files
    that you have selected in step 3 to the CLASSPATH environment
    variable on your system

7.  Reboot your system

8.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id10918" class="decimalstyle">

    **Table 11.4. JDBC Driver Version Commands**

    <div class="decimalstyle-contents">

    | OpenLink Driver for JDBC Type | Verification Command       |
    |:------------------------------|----------------------------|
    | Generic Driver for JDK 1.1.x  | java openlink.jdbc.Driver  |
    | Generic Driver for JDK 1.2.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.3.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.4.x  | java openlink.jdbc3.Driver |
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

9.  Verify your OpenLink Driver for JDBC server components installation
    by starting a Web Browser session from either your OpenLink Client
    or Server machine and then enter one of the following URLs:

    From Client Machine:

    ``` programlisting
    http://<server name or IP address>:8000
    ```

    From Server Machine:

    ``` programlisting
    http://localhost:8000
    ```

    If you are presented with the Home Page of the "OpenLink Admin
    Assistant" then this confirms that your OpenLink Server environment
    is also correctly setup.

10. If you are going to be connecting to your remote database servers
    using database specific networking provided by one or more database
    vendors then you need to perform an additional check to ensure that
    your database agents have been installed properly. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ingii_sv --help   (this will verify the Ingres II Database Agent)
    db2_sv --help     (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

<div id="mt_dbsrvcomponent" class="section">

<div class="titlepage">

<div>

<div>

#### Database Server Components Installation

</div>

</div>

</div>

This step is only required if your are connecting your Application
Server components installed in the prior section to a remote database
engine hosted on a dedicated Database Server machine using OpenLink's
Database Independent Networking.

<div class="orderedlist">

1.  Download appropriate server components software using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard on to your designated server
    machine

2.  As Windows 95/98/NT/2000 is playing the single role of a dedicated
    Database Server machine for your OpenLink Application Server
    components for JDBC, you would have downloaded a ZIP archive that
    contains only the OpenLink Server components. Extract the contents
    of this ZIP archive to a temporary installation folder and then run
    the "Setup.exe" program

3.  The archive you have downloaded will contain both OpenLink client
    and Server components for this platform. Since you are setting up a
    Server machine simply uncheck the OpenLink Client components (ODBC,
    JDBC, OLE-DB) using the installers component list dialog when
    presented during the install process, this ensures that you only
    install OpenLink Server components on your Server machine(s)

4.  Ensure that an OpenLink Database Agent checkbox for each Database
    Engine type is checked from the component list presented by the
    installer. Uncheck all JDBC component related checkboxes unless you
    anticipate using this dedicated Database Server as an Application
    Server at a later date.

5.  If you are an existing OpenLink user please ensure that you do not
    have an OpenLink Request Broker process running (check your services
    control panel item), if there is a Request Broker process running
    please shut it down at this point

6.  Run the "setup.exe" program

7.  Start the OpenLink Request Broker, you do this by either going into
    your "Services" control panel (for Windows NT) or to the "OpenLink
    Data Access Drivers" Windows Start Menu, and then click on the
    "Broker Startup" menu item

8.  Verify your OpenLink Database server components installation by
    starting a Web Browser session from either your OpenLink Client,
    Application or Server machine and then enter one of the following
    URLs:

    From Client or Application Server Machine:

    ``` programlisting
    http://<server name or IP address>:8000
    ```

    From Database Server Machine:

    ``` programlisting
    http://localhost:8000
    ```

    If you are presented with the Home Page of the "OpenLink Admin
    Assistant" then this confirms that your OpenLink Server environment
    is also correctly setup.

    An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ora8_sv --help    (this will verify the Oracle Database Agent)
    db2_sv --help     (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

<div id="mt_UNIXLocalClientServer" class="section">

<div class="titlepage">

<div>

<div>

#### Linux or UNIX Based Local Client-Server Configuration

</div>

</div>

</div>

In this scenario your Linux or UNIX machine is acting as the host
machine for both your OpenLink client and server components, implying
that you are going to install your OpenLink Client and Server components
for JDBC on the same machine.

Installation Process

<div class="orderedlist">

1.  Download appropriate driver software installation archive using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard. Ensure that you hatched a
    checkbox for each Database Engine type that you will be connecting
    to via JDBC.

2.  Move the Request Broker and Database Agent archives into a temporary
    installation folder on your Linux or UNIX machine then run the
    following command from the command line prompt:

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
    CLASSPATH=$CLASSPATH:/dbs/openlink/v40/openlink/jdk1.1.x/opljdbc.jar
    #CLASSPATH=$CLASSPATH:/dbs/openlink/v40/openlink/jdk1.2.x/opljdbc2.zip
    ```

5.  Run the script "openlink.sh" (you may also want to add a reference
    to this in your .profile file) by executing the following command
    from your Linux or UNIX command line prompt:

    ``` programlisting
    . openlink.sh
    ```

6.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id11011" class="decimalstyle">

    **Table 11.5. JDBC Driver Version Commands**

    <div class="decimalstyle-contents">

    | OpenLink Driver for JDBC Type | Verification Command       |
    |:------------------------------|----------------------------|
    | Generic Driver for JDK 1.1.x  | java openlink.jdbc.Driver  |
    | Generic Driver for JDK 1.2.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.3.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.4.x  | java openlink.jdbc3.Driver |
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

7.  Verify your OpenLink Driver for JDBC server components installation
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

8.  An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ora8_sv --help   (this will verify the Oracle Database Agent)
    db2_sv --help    (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

<div id="mt_UNIXClientServer" class="section">

<div class="titlepage">

<div>

<div>

#### Linux or UNIX Based Client-Server (2-Tier Configuration) Installation

</div>

</div>

</div>

In this scenario one or more Linux or UNIX machines act as the host
machine for your OpenLink client components, while a separate Linux or
UNIX server machine hosts your OpenLink server components. This Linux or
UNIX server machine also hosts the database engine that you will be
connecting to via JDBC, this machine is typically referred to as your
Database Server machine.

Client Components Installation

<div class="orderedlist">

1.  Download appropriate driver software installation archive using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard

2.  Although Linux or UNIX is only playing role of both Client machine
    for your OpenLink components, you still need to download a
    compressed TAR archive containing the OpenLink Request Broker (the
    download page clearly identifies this archive), this contains both
    the OpenLink Request Broker and the OpenLink Driver for JDBC
    components. Move this archive to a temporary installation folder and
    then run the following installation program:

    ``` programlisting
    sh install.sh
    ```

3.  The installer creates an OpenLink environment setup script named
    "openlink.sh" in the openlink installation base installation
    directory. This files contains the following entry which you can
    modify so as to match the OpenLink Drivers for JDBC to the
    appropriate Java environment on your machine:

    ``` programlisting
    CLASSPATH=$CLASSPATH:/dbs/openlink/v40/openlink/jdk1.1.x/opljdbc.jar
    #CLASSPATH=$CLASSPATH:/dbs/openlink/v40/openlink/jdk1.2.x/opljdbc2.zip
    ```

4.  Run the script "openlink.sh" (you may also want to add a reference
    to this in your .profile file) by executing the following command
    from your Linux or UNIX command line prompt:

    ``` programlisting
    . openlink.sh
    ```

5.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id11073" class="decimalstyle">

    **Table 11.6. JDBC Driver Version Commands**

    <div class="decimalstyle-contents">

    | OpenLink Driver for JDBC Type | Verification Command       |
    |:------------------------------|----------------------------|
    | Generic Driver for JDK 1.1.x  | java openlink.jdbc.Driver  |
    | Generic Driver for JDK 1.2.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.3.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.4.x  | java openlink.jdbc3.Driver |
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
    ora80_sv --help  (this will verify the Oracle Database Agent)
    db2_sv --help    (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

Database Server Components Installation

Only perform these steps if you are connecting to database engines
hosted on your dedicated Database Server using OpenLink's Database
Independent Networking:

<div class="orderedlist">

1.  Download appropriate server components installation archive using
    the instructions provided in the section that covers interaction
    with the OpenLink Software Download Wizard. Ensure that you hatched
    a checkbox for each Database Engine type that you will be connecting
    to via JDBC.

2.  Move the Request Broker and Database Agent archives into a temporary
    installation folder on your Database Server machine then run the
    following command from the command line prompt:

    ``` programlisting
    sh install.sh
    ```

3.  Follow the instructions presented by the installer for configuring
    your OpenLink Database Agents

4.  An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ora80_sv --help  (this will verify the Oracle Database Agent)
    db2_sv --help    (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

<div id="mt_UNIXAppServer" class="section">

<div class="titlepage">

<div>

<div>

#### Linux or UNIXBased Application-Server (3-Tier Configuration) Installation

</div>

</div>

</div>

In this scenario your OpenLink Client machine plays the role of an
Application Server, as this is where your JDBC based application will be
hosted and developed (if you are building a 3-Tier JDBC solution). Thus,
the installation process is broken down into two parts, Application
Server, and Database Server components installation. You will not need
to install any software on the machines being used by your JDBC
solution's end-users.

Application Server Components Installation

<div class="orderedlist">

1.  Download appropriate driver software installation archive using the
    instructions provided in the section that covers interaction with
    the OpenLink Software Download Wizard. Ensure that you hatched a
    checkbox for each Database Engine type that you will be connecting
    to via JDBC.

2.  Although Linux or UNIX is only playing role of Client machine for
    your OpenLink components, you still need to download Linux RPMs or a
    UNIX compressed TAR archives containing the OpenLink Request Broker
    and the Database Agents for each database engine that you will be
    connecting to via JDBC (the download page clearly identifies these
    archives).

3.  Move the Request Broker and this archive to a temporary installation
    folder, if you choose to use OpenLink's Database Independent
    Networking to connect to remote database engines hosted on one or
    more dedicated Database Server machines, do not move the Database
    Agent archives into the temporary installation directory on the
    Application Server. Run the following installation programs from the
    temporary installation directory on your Application Server machine:

    Linux:

    ``` programlisting
    rpm -ivh openlink-4.0-2.rpm
    ```

    Linux (if your Linux system does not have the RPM facility) and
    UNIX:

    ``` programlisting
    sh install.sh
    ```

    Linux:

    ``` programlisting
            rpm -ivh openlink-4.0-2.rpm
    ```

    Linux (if your Linux system does not have the RPM facility) and
    UNIX:

    ``` programlisting
    sh install.sh
    ```

    \* Ignore the Database Agent configuration menu when presented to
    you by the installer. \*

    If on the other hand you choose to use Database Specific Networking
    provided by your database vendor(s) when connecting to your remote
    Database Engine(s) hosted on your dedicated Database Server
    machines, then then move each Database Agent archive into a
    temporary installation directory alongside the Request Broker
    archive and then run the following installation programs:

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

4.  The installer creates an OpenLink environment setup script named
    "openlink.sh" in the openlink installation base installation
    directory. This files contains the following entry which you can
    modify so as to match the OpenLink Drivers for JDBC to the
    appropriate Java environment on your machine:

    ``` programlisting
    CLASSPATH=$CLASSPATH:/dbs/openlink/v40/openlink/jdk1.1.x/opljdbc.jar
    #CLASSPATH=$CLASSPATH:/dbs/openlink/v40/openlink/jdk1.2.x/opljdbc2.zip
    ```

5.  Run the script "openlink.sh" (you may also want to add a reference
    to this in your .profile file) by executing the following command
    from your Linux or UNIX command line prompt:

    ``` programlisting
            . openlink.sh
    ```

6.  Verify your OpenLink Driver for JDBC client components installation
    by running one of the following commands (depending on your choice
    of driver for JDBC) from a DOS Window's command prompt:

    <div id="id11168" class="decimalstyle">

    **Table 11.7. JDBC Driver Version Commands**

    <div class="decimalstyle-contents">

    | OpenLink Driver for JDBC Type | Verification Command       |
    |:------------------------------|----------------------------|
    | Generic Driver for JDK 1.1.x  | java openlink.jdbc.Driver  |
    | Generic Driver for JDK 1.2.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.3.x  | java openlink.jdbc2.Driver |
    | Generic Driver for JDK 1.4.x  | java openlink.jdbc3.Driver |
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

7.  Verify your OpenLink Driver for JDBC server components installation
    by starting a Web Browser session and then entering the following
    URL:

    ``` programlisting
            http://localhost:8000 or http://<hostname of current machine>:8000
    ```

    If you are presented with the Home Page of the OpenLink Admin
    Assistant then this confirms that your OpenLink Server environment
    is also correctly setup.

8.  Verify your OpenLink Database server components installation by
    starting a Web Browser session from either your OpenLink Client,
    Application or Server machine and then enter one of the following
    URLs:

    From Client Machine:

    ``` programlisting
    http://<server name or IP address>:8000
    ```

    From Database Server Machine:

    ``` programlisting
    http://localhost:8000
    ```

    If you are presented with the Home Page of the "OpenLink Admin
    Assistant" then this confirms that your OpenLink Server environment
    is also correctly setup.

    An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ora80_sv --help  (this will verify the Oracle Database Agent)
    db2_sv --help    (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

<div id="mt_dbsrvcompinst" class="section">

<div class="titlepage">

<div>

<div>

#### Database Server Components Installation

</div>

</div>

</div>

Only perform these steps if you are connecting to database engines
hosted on your dedicated Database Server using OpenLink's Database
Independent Networking:

<div class="orderedlist">

1.  Download appropriate server components installation archive using
    the instructions provided in the section that covers interaction
    with the OpenLink
    <a href="#Downloading%20and%20Installing%20the%20Software" class="ulink"
    target="_top">Software Download Wizard</a>. Ensure that you hatched
    a checkbox for each Database Engine type that you will be connecting
    to via JDBC.

2.  Move the Request Broker and Database Agent archives into a temporary
    installation folder on your Database Server machine then run the
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
    your OpenLink Database Agents

4.  The installer creates an OpenLink environment setup script named
    "openlink.sh" in the openlink installation's base installation
    directory.

5.  Run the script "openlink.sh" (you may also want to add a reference
    to this in your .profile file) by executing the following command
    from your Linux or UNIX command line prompt:

    ``` programlisting
    . openlink.sh
    ```

6.  Verify your OpenLink Database server components installation by
    starting a Web Browser session from either your OpenLink Client,
    Application or Server machine and then enter one of the following
    URLs:

    From Client or Application Server Machine:

    ``` programlisting
    http://<server name or IP address>:8000
    ```

    From Database Server Machine:

    ``` programlisting
    http://localhost:8000
    ```

    If you are presented with the Home Page of the "OpenLink Admin
    Assistant" then this confirms that your OpenLink Server environment
    is also correctly setup.

    An additional but non compulsory check that you may perform is to
    actually verify the existence and state of the OpenLink Database
    server components called the OpenLink Database agents. Do this by
    changing into the "bin" sub-directory of the OpenLink base
    directory. Then run an agent with the --help parameter. For example:

    ``` programlisting
    ora80_sv --help  (this will verify the Oracle Database Agent)
    db2_sv --help    (this will verify the IBM DB2 Database Agent)
    ```

    See the detailed section about OpenLink Database Agents for
    additional information.

</div>

</div>

</div>

</div>
