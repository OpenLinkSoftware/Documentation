<div>

<div>

<div>

<div>

### 2.2.5. Starting Your Virtuoso Server

</div>

</div>

</div>

Due to subtle differences between the Windows 95 family (including
Windows 98 and Windows ME) and the Windows NT family (including Windows
2000, Windows XP, Vista, Windows 7, Windows 2000 Server, Windows Server
2003, and Windows Server 2008), specific instructions for starting and
stopping your Virtuoso server are supplied for each Windows family.

<div>

<div>

<div>

<div>

#### Windows NT family

</div>

</div>

</div>

You can start your Virtuoso server in one of two ways, automatically or
manually, the default mode configured by your installer is Automatic.

<div>

<div>

<div>

<div>

##### Automatic Startup

</div>

</div>

</div>

Your Virtuoso servers (default and demonstration databases) are
configured at installation time as "Automatic Startup" services. Thus,
rebooting your machine after installation is all that is required in
order for your Virtuoso servers to be ready to start receiving
connections from client applications. The service is actually started
during the installation, however some files may be locked, so a reboot
is required to complete the install.

</div>

<div>

<div>

<div>

<div>

##### Manual Startup

</div>

</div>

</div>

You can manually start your Virtuoso server in one of two ways, either
via the "services" control panel applet or from within a DOS shell. When
doing this via the "Services" control panel Applet you need to simply
open up your control panel and click on the "services" applet. This will
present you with a screen similar to the one below:

<div>

<div>

**Figure 2.13. Services Applet**

<div>

<div>

![Services Applet](images/virtinst12.gif)

</div>

</div>

</div>

  

</div>

Click the "Start" or "Stop" button in order to start or stop a
highlighted Virtuoso Server.

To start your Virtuoso servers manually using DOS command prompts, start
a DOS shell and then enter the following command:

``` programlisting
virtuoso-odbc-f +service start
```

</div>

</div>

<div>

<div>

<div>

<div>

#### Windows 95 family

</div>

</div>

</div>

You can start your Virtuoso server under Windows 95/98 in one of two
ways, automatically or manually, the default mode configured by your
installer is Automatic.

<div>

<div>

<div>

<div>

##### Automatic Startup

</div>

</div>

</div>

Your Virtuoso servers (default and demonstration databases) are
configured at installation time as "Automatic Startup" services. Thus,
rebooting your machine after installation is all that is required in
order for your Virtuoso servers to be ready to start receiving
connections from client applications.

If Virtuoso does not start automatically on Windows 95/98 after
installation you will need to add the following line to the system's
"autoexec.bat" file (assuming you have installed Virtuoso using the
installers default installation folder):

``` programlisting
C:\Program Files\OpenLink\Virtuoso\bin\virtuoso-odbc-f +service start
```

</div>

<div>

<div>

<div>

<div>

##### Manual Startup

</div>

</div>

</div>

You can start your Virtuoso servers manually by entering the following
commands at the DOS command line prompt:

``` programlisting
virtuoso-odbc-f +service start
virtuoso-odbc-f +instance demo +service start
```

<div>

|                              |                                                                                                                                                              |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                        |
|                              | If you encounter a "Program Not Found" error this is because your Virtuoso installation's "bin" sub-directory is not part of your PATH environment variable. |

</div>

</div>

</div>

</div>
