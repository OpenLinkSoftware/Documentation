<div id="mt_unixsrvcompinst" class="section">

<div class="titlepage">

<div>

<div>

## 6.6. UNIX & Linux Install

</div>

</div>

</div>

<div class="orderedlist">

1.  Ensure you have downloaded all of the relevant OpenLink Server
    Components from the page created by the OpenLink Software Download
    wizard, this must include the OpenLink Server Components
    Installation shell script file "install.sh" in addition to the
    compressed "tar" archives for the OpenLink Request Broker and
    relevant Database Agent Components.

2.  From the OpenLink email that is delivered at the time of download,
    save the attached license file to the same location as the
    install.sh.

3.  Log on to your Database or Application server machine using the
    userid and password combination that you normally use when
    connecting to the database in non ODBC/JDBC/UDBC mode.

4.  Determine your operating system group membership by typing in the
    command:

    ``` programlisting
    id
    ```

    The "gid" value indicates your current operating system group
    membership (remember this for use later on during the installation
    process).

5.  Create an OpenLink installation directory on the server (e.g.,
    /usr/openlink) and transfer to it all the server component files you
    downloaded (including compressed TAZ archives and the installation
    shell script "install.sh").

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    <table data-border="0" data-summary="Note: Notes:">
    <colgroup>
    <col style="width: 50%" />
    <col style="width: 50%" />
    </colgroup>
    <tbody>
    <tr class="odd">
    <td rowspan="2" style="text-align: center;" data-valign="top"
    width="25"><img src="images/note.png" alt="[Note]" /></td>
    <td style="text-align: left;">Notes:</td>
    </tr>
    <tr class="even">
    <td style="text-align: left;" data-valign="top"><p>Do not uncompress or
    unzip the compressed .taz archives after download; the installation
    script will take care of this for you.</p>
    <p>If using FTP, be sure to transfer the compressed .taz archives in
    BINARY mode, and the installation shell script in TEXT mode.</p></td>
    </tr>
    </tbody>
    </table>

    </div>

    You set your FTP program in TEXT or ASCII transfer mode by typing
    the following command at your FTP command prompt:

    ``` programlisting
    ftp> ascii
    ```

    You set your FTP program in BINARY transfer mode by typing the
    following command at your FTP command prompt:

    ``` programlisting
    ftp> bin
    ```

6.  The file "install.sh" is an "sh" shell script. It must be executed
    in the appropriate shell to avoid unexpected behaviour. Run the
    "install.sh" script on the server by typing the command:

    ``` programlisting
    sh ./install.sh
    ```

7.  The install script will extract the files from the ".taz" files and
    then create all of the relevant OpenLink server component
    sub-directories. The install script will also place the OpenLink
    server components into their appropriate sub-directories

8.  Once the files have been extracted and placed in the relevant
    sub-directories, the install script will proceed to install and
    configure the OpenLink Admin Assistant. This program enables remote
    configuration for all OpenLink Server Components (Rule Book, Service
    and Database Agents) from any Web Browser.

    The dialogue below illustrates the interactions encountered during
    the server components installation process, accepting all the script
    defaults:

    ``` programlisting
    bash$ sh install.sh
    $ sh install.sh
    *
    * Temporarily saving your original Session Rules Book
    * (the file oplrqb.ini) to oplrqb.ini.save
    *
    * Temporarily saving your original ODBC DSN settings
    * (the file odbc.ini) to odbc.ini.save
    *
    * Temporarily saving your original ODBC Installation settings
    * (the file odbcinst.ini) to odbcinst.ini.save
    *
    * Temporarily saving your original UDBC DSN settings
    * (the file udbc.ini) to udbc.ini.save
    *
    Extracting (dqadp91b.taz) ...
    Extracting (dqbrzzzz.taz) ...
    * Restoring your original Session Rules Book
    * (the file oplrqb.ini) and creating a new oplrqb.ini.sample
    *
    * Restoring your original ODBC DSN settings
    * (the file odbc.ini) and creating a new odbc.ini.sample
    *
    * Restoring your original ODBC Installation settings
    * (the file odbcinst.ini) and creating a new odbcinst.ini.sample
    *
    * Restoring your original UDBC DSN settings
    * (the file udbc.ini) and creating a new udbc.ini.sample
    *
    Setting up CLASSPATH for Java connectivity.
    You can choose between the following Java JDK versions:
     1)     JDK 1.1.x
     2)     JDK 1.2.x
     3)     JDK 1.3.x
    Please enter your choice [ENTER=2] :
    Creating scripts ...
    Entering default values in oplrqb.ini ...
    Using Informix 7.3 Multi Threaded Agent (inf73_mv) ...
    Using Ingres II Multi Threaded Agent (ingii_mv) ...
    Using ODBC Multi Threaded Agent (odbc_mv) ...
    Using Oracle 8.1.x Multi Threaded Agent (ora81_mv) ...
    Using Virtuoso Multi Threaded Agent (virt_mv) ...
    Modifying bin/odbc.ini ...
    Modifying bin/odbcinst.ini ...
    Creating link for ODBC ...
    Enter the port number the broker will listen on for
    client connections [ENTER=Default]  :
    Welcome to the OpenLink Admin Assistant Setup.
    This program will install the HTTP based OpenLink Admin Assistant, thereby
    enabling remote configuration for all OpenLink Server Components (Rule Book,
    Service and Database Agents) from any Web Browser.
    TCP/IP Port to use? [ENTER=8000] :
    Log File? [ENTER=www_sv.log] :
    Log all requests (y/n)? [ENTER=n] :
    Administrator account? [ENTER=admin] :
    Administrator's password? [ENTER=admin] :
    The OpenLink Admin Assistant is now ready for use.
    Please (re)start the OpenLink Request Broker (using the command 'oplrqb -v')
    and then point your Web Browser to the URL below:
    http://digitalunix5.mydomain.com:8000
    Enter the name of the user that will own the
    programs [ENTER=Use Current User Settings]  :
    Enter the name of the group that will own the
    programs [ENTER=Use Current Group Settings] :
    Changing ownership ...
    End of installation
    ```

9.  Run the OpenLink environment shell script as follows:

    ``` programlisting
    . openlink.sh
    ```

    Users in tcsh or csh must use the command:

    ``` programlisting
    source openlink.csh
    ```

    This will set all the required environment variables (e.g.,
    \$ODBCINI, \$ODBCINSTINI, \$PATH) which enable alternate directory
    executable launching, and proper use of the HTTP-based Admin
    Assistant.

    You may wish to place the startup command in your shell startup
    script (.profile, .login, .bashrc etc) in order for it to take
    effect on login.

10. Start your OpenLink Request Broker in debug mode by executing the
    OpenLink Request Broker startup command:

    ``` programlisting
    oplrqb -dv
    ```

    Should you receive an "oplrqb: unable to create listener (Address
    already in use)" error, this most likely indicates that the Broker
    is already started. It can be shut down by running the command:

    ``` programlisting
    oplshut -f
    ```

    or

    ``` programlisting
    oplshut +port <alternate port number>
    ```

    Where \<alternate port number\>\> is a different port number you
    specified as the Broker's TCP listen port at install-time. (If you
    used the default port, then use the former command.)

    If you continue to receive the error above, the port (either 5000,
    or the one you specified as the Listen port) is already occupied by
    another TCP process. Contact your systems administrator for
    assistance, or reinstall the OpenLink Request Broker, specifying a
    different TCP Listen port.

11. Start your Web Browser and then enter the following URL:

    ``` programlisting
    http://host:port
    ```

    Where <span class="emphasis">*host*</span> is the network alias or
    IP address of machine where Server Components are installed. The
    <span class="emphasis">*port*</span> is the number you provided when
    prompted by OpenLink installer.

    For example, if your machine has a network alias of "opllinux", and
    you accept the default port number at installation time, then the
    required URL would be constructed as follows:

    ``` programlisting
    http://opllinux:8000
    ```

12. Follow the instructions provided in the "Client Components
    Installation" section of this guide, in order to verify connectivity
    to your server using the OpenLink Multi-Tier Data Access Drivers.

13. If the previous step is successful, shut down the Request Broker
    using the command:

    ``` programlisting
    oplshut -f
    ```

    or

    ``` programlisting
    oplshut -fy
    ```

    This will kill off any remaining connections to the database, if
    they have been established. Next restart in normal mode using the
    command:

    ``` programlisting
    oplrqb -v
    ```

    Running your Request Broker in debug mode will log a significant
    amount of information to the bin/oplrqb.log file, so normal mode is
    recommended unless you are experiencing problems which you need to
    report to Technical Support.

    For more information about other available options when starting and
    stopping the Request Broker, see the "Request Broker Startup &
    Shutdown" topic in the <a href="mt_startandstop.html" class="link"
    title="7.1. Request Broker Startup &amp; Shutdown">Server Components
    Administration section</a> of this guide.

</div>

</div>
