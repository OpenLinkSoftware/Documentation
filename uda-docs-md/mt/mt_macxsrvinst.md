<div id="mt_macxsrvinst" class="section">

<div class="titlepage">

<div>

<div>

## 6.5. Mac OS X

</div>

</div>

</div>

OpenLink Software's server components are fully supported on Mac OS X.
Users of Mac OS X 10.2.x ("Jaguar") and later may use the fully migrated
GUI components; users of Mac OS X 10.1.5 and earlier must use the
Darwin-based components (installation covered in the UNIX and Linux
section, below).

As shipped from Apple, Mac OS X did not include any ODBC support until
Jaguar. The ODBC Driver Manager, Data Source Administrator, etc. - all
had to be delivered with the Drivers.

When Apple introduced Darwin, an Open-Source project meant to form the
kernel of Mac OS X, OpenLink determined to port its open-source iODBC
Driver Manager to the new platform. With the introduction of the Preview
Release of Mac OS X, the traditional set of dynamic libraries was
broadened to include a system of Frameworks to encourage the development
of fully ODBC compliant, native Mac OS X drivers and client
applications.

That set of Frameworks, along with the OpenLink ODBC Administrator (then
known as the iODBC Administrator), has been included with all OpenLink
installations for Mac OS X since 10.0. The OpenLink ODBC Administrator
supports all core features of ODBC, and presents driver-specific DSN
configuration panels, as defined by the Driver developer, through the
use of Setup Libraries.

Jaguar's release marked Apple's recognition that Data Access was an
important part of an Enterprise Operating System. Already part of the
standard distribution of Darwin, the basic iODBC dynamic libraries are
now a part of the standard installation of Mac OS X 10.2. Apple also
included their own version of an ODBC Administrator, as a
proof-of-concept. Apple's Administrator permits Driver Registration,
Tracing, and all other core features of ODBC; however, among other hard
edges, all DSN configuration must be done by manually entering
Keyword-Value pairs. Further, the user must know what Keywords to use,
along with their acceptable Values.

Each OpenLink Generic Multi-Tier Driver for ODBC for Mac OS X is
distributed in a single disk image (.dmg) file, which contains a
Macintosh Installer mpkg. You may download an installer for a single
back-end DBMS, or a "kitchen-sink" installer containing components for
all OpenLink supported DBMS.

The OpenLink ODBC Server Components for Mac OS X comprise the following:

<div id="id6313" class="table">

**Table 6.1. OpenLink ODBC Server Components for Mac OS X**

<div class="table-contents">

| Component                                 |
|-------------------------------------------|
| Request Broker                            |
| Session Rules                             |
| OpenLink Database Agents                  |
| Broker and Database Agent license files   |
| OpenLink HTTP and Tcl Engine              |
| HTTP and Tcl Engine configuration file    |
| HTTP and Tcl Engine configuration program |
| OpenLink ODBC Client Components           |

</div>

</div>

  

<div id="mt_macxsrvinstinstallation" class="section">

<div class="titlepage">

<div>

<div>

### 6.5.1. Installation

</div>

</div>

</div>

Double-click the mpkg to start the installation process.

<div class="figure-float">

<div id="mt_macosxsrvinst01" class="figure">

**Figure 6.5. OpenLinkUDA-5.0.dmg**

<div class="figure-contents">

<div class="mediaobject">

![OpenLinkUDA-5.0.dmg](images/mac10/MacOSXs01.png)

</div>

</div>

</div>

  

</div>

You must have an Administration username and password to install the
OpenLink Generic Multi-Tier Driver for ODBC. The Jaguar Installer will
immediately prompt you to enter your Mac OS X Username and Password.

<div class="figure-float">

<div id="mt_macosxsrvinst02" class="figure">

**Figure 6.6. Authentication**

<div class="figure-contents">

<div class="mediaobject">

![Authentication](images/mac10/MacOSXs02.png)

</div>

</div>

</div>

  

</div>

The installer will display a "Welcome" message. Click "Continue".

<div class="figure-float">

<div id="mt_macosxsrvinst03" class="figure">

**Figure 6.7. Welcome**

<div class="figure-contents">

<div class="mediaobject">

![Welcome](images/mac10/MacOSXs03.png)

</div>

</div>

</div>

  

</div>

The next screen will display the Read-Me file, including any last-minute
updates to these documents. Please read carefully, and click "Continue"
when finished.

<div class="figure-float">

<div id="mt_macosxsrvinst04" class="figure">

**Figure 6.8. Read Me**

<div class="figure-contents">

<div class="mediaobject">

![Read Me](images/mac10/MacOSXs04.png)

</div>

</div>

</div>

  

</div>

The next screen will display the License Agreement for the OpenLink
Single-Tier Driver for ODBC. Please read, and click "Continue".

<div class="figure-float">

<div id="mt_macosxsrvinst05" class="figure">

**Figure 6.9. Software License Agreement**

<div class="figure-contents">

<div class="mediaobject">

![Software License Agreement](images/mac10/MacOSXs05.png)

</div>

</div>

</div>

  

</div>

You will be prompted to "Agree" to continue the installation, or
"Disagree" to abort.

<div class="figure-float">

<div id="mt_macosxsrvinst06" class="figure">

**Figure 6.10. Agree or Disagree to Licensing**

<div class="figure-contents">

<div class="mediaobject">

![Agree or Disagree to Licensing](images/mac10/MacOSXs06.png)

</div>

</div>

</div>

  

</div>

You will be asked to select a Destination Volume. Generally, this should
be your Mac OS X boot volume. Click on the desired disk icon, and then
click "Continue".

<div class="figure-float">

<div id="mt_macosxsrvinst07" class="figure">

**Figure 6.11. Choose Destination**

<div class="figure-contents">

<div class="mediaobject">

![Choose Destination](images/mac10/MacOSXs07.png)

</div>

</div>

</div>

  

</div>

You may now choose the Easy Install, or if you are an experienced user,
you may Customize which components are installed. OpenLink generally
recommends the Easy Install.

If you have installed OpenLink or iODBC components in the past, click
"Upgrade" to continue; otherwise, click "Install".

<div class="figure-float">

<div id="mt_macosxsrvinst08" class="figure">

**Figure 6.12. Easy Install**

<div class="figure-contents">

<div class="mediaobject">

![Easy Install](images/mac10/MacOSXs08.png)

</div>

</div>

</div>

  

</div>

In a custom installation, you may choose which Client, Documentation,
and Server components are installed. OpenLink recommends that all
Servers be equipped with all Client components, and that you install at
least the HTML documentation, which will then be available through the
Admin Assistant. The iODBC Runtime is necessary for all Client
connections, but you may choose not to install it, if you have already
installed a later revision.

<div class="figure-float">

<div id="mt_macosxsrvinst09" class="figure">

**Figure 6.13. Custom Install**

<div class="figure-contents">

<div class="mediaobject">

![Custom Install](images/mac10/MacOSXs09.png)

</div>

</div>

</div>

  

</div>

You will be shown a graphical progress bar as Installation progresses,
followed by System Optimization.

<div class="figure-float">

<div id="mt_macosxsrvinst10" class="figure">

**Figure 6.14. Installation Progress**

<div class="figure-contents">

<div class="mediaobject">

![Installation Progress](images/mac10/MacOSXs10.png)

</div>

</div>

</div>

  

</div>

During the installation process, the Installer will prompt for some
parameters. Only an Administrator may configure the Server components,
and this authentication is independent of the Installer itself.

<div class="figure-float">

<div id="mt_macosxsrvinst11" class="figure">

**Figure 6.15. Configuration Authentication**

<div class="figure-contents">

<div class="mediaobject">

![Configuration Authentication](images/mac10/MacOSXs11.png)

</div>

</div>

</div>

  

</div>

First, the Installer will configure the Request Broker \`Listener\`
port. By default, this is 5000, but you may set it to anything
appropriate to your environment. Note that all Client DSNs must target
the port specified herein.

If you check off the box labeled Automatically launch the request broker
during system startup, a StartupItem will be installed and enabled, to
automatically start the Broker at system boot. If you do not check this
box, the Broker must be manually launched to permit data access.

<div class="figure-float">

<div id="mt_macosxsrvinst12" class="figure">

**Figure 6.16. Initial configuration, Request Broker tab**

<div class="figure-contents">

<div class="mediaobject">

![Initial configuration, Request Broker tab](images/mac10/MacOSXs12.png)

</div>

</div>

</div>

  

</div>

The next pane is to configure the HTTP-based OpenLink Administrator. By
default, this service will listen at port 8000, but you may set it to
any port appropriate to your environment. This port will be specified in
Web browsers, to access the Admin Assistant, as in the URL,
\<http://localhost:8000/\>.

<div class="figure-float">

<div id="mt_macosxsrvinst13" class="figure">

**Figure 6.17. Initial configuration, Web Administrator tab**

<div class="figure-contents">

<div class="mediaobject">

![Initial configuration, Web Administrator
tab](images/mac10/MacOSXs13.png)

</div>

</div>

</div>

  

</div>

When the process is complete, you will be told that the software was
successfully installed. Click "Close" and wait a few moments, while the
Request Broker is launched in the background.

<div class="figure-float">

<div id="mt_macosxsrvinst14" class="figure">

**Figure 6.18. Installation Completes**

<div class="figure-contents">

<div class="mediaobject">

![Installation Completes](images/mac10/MacOSXs14.png)

</div>

</div>

</div>

  

</div>

Installation is complete, and your Broker is available for use, when a
new Web browser window is opened, connecting to the newly installed
Broker's Admin Assistant.

<div class="figure-float">

<div id="mt_macosxsrvinst15" class="figure">

**Figure 6.19. Admin Assistant Browser Window**

<div class="figure-contents">

<div class="mediaobject">

![Admin Assistant Browser Window](images/mac10/MacOSXs15.png)

</div>

</div>

</div>

  

</div>

A new Finder window will also be opened, containing launch icons for the
documentation you've installed (HTML and/or PDF), as well as manual
Start and Stop scripts for the Request Broker.

<div class="figure-float">

<div id="mt_macosxsrvinst16" class="figure">

**Figure 6.20. Finder Window**

<div class="figure-contents">

<div class="mediaobject">

![Finder Window](images/mac10/MacOSXs16.png)

</div>

</div>

</div>

  

</div>

Proceed to the next chapter, to learn how to configure your new
software.

</div>

</div>
