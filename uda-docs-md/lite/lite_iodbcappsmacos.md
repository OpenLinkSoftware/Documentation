<div id="lite_iodbcappsmacos" class="section">

<div class="titlepage">

<div>

<div>

## 11.3. Linking iODBC and ODBC Applications on Mac OS

</div>

</div>

</div>

<div id="lite_iodbcmacclassic" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.1. Mac OS Classic

</div>

</div>

</div>

The package provided for this platform is a compressed Macintosh format
(.sit.hqx). After uncompressing it on your hard drive, you will find
below the tree of the iODBC SDK as installed on Mac OS Classic :

<div class="figure-float">

<div id="lite_iodbcmac001" class="figure">

**Figure 11.3. iODBC SDK Tree for Mac OS Classic**

<div class="figure-contents">

<div class="mediaobject">

![iODBC SDK Tree for Mac OS Classic](images/iodbcfilelist001.jpg)

</div>

</div>

</div>

  

</div>

iODBC is cut down in three parts, and each one has its proper set of
include files and libraries.

|                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------|
| The iODBC Driver Manager is the core of the ODBC driver manager. Its main task is to load run the right function with the right ODBC driver.   |
| The iODBC Configuration Manager is the ODBC configuration manager. Its main task is to access and manage the DSN configuration files.          |
| The iODBC GUI Manager is the GUI manager. Its main task is to give to the user the ability to access all the ODBC functionality through a GUI. |

Under the include directory, you will find all the iODBC header files
that can be used in your source. The following are the main header
files: `isql.h, isqlext.h, isqltypes.h, iodbcadm.h, iodbcinst.h`

These are generally only a proxy for the other header files provided in
the same directory: `sql.h, sqlext.h, sqltypes.h, odbcinst.h`

To access all these include files, simply add to your compiler an
include path that points to `iODBC/include`. This is compiler dependent,
so you may have to look into your compiler's documentation. For Code
Warrior, you can do this via the Project Preferences panel.

Under the lib directory, you will find all the iODBC libraries needed to
link against your application. All the parts explained before, are
shipped through three different forms: CFM shared library, static object
file, and static object file with debugging information.

<div class="figure-float">

<div id="lite_iodbcmac002" class="figure">

**Figure 11.4. iODBC SDK libraries on Mac**

<div class="figure-contents">

<div class="mediaobject">

![iODBC SDK libraries on Mac](images/iodbcfilelist002.jpg)

</div>

</div>

</div>

  

</div>

You will have to link your application with only one set of libraries.
If you choose the CFM shared library set, ensure that at runtime these
files are in the System-Extensions folder of your Mac Classic system.

To access the right set of library files, add a library path that points
to `iODBC/lib`. This is compiler dependent, consult your compiler
documentation. For Code Warrior, you can do this through the Project
Preferences panel.

</div>

<div id="lite_iodbcmacosx" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.2. Mac OS X

</div>

</div>

</div>

The package provided for this platform is a Macintosh Installer package
(.mpkg) inside a disk-image (.dmg) file. After mounting the disk-image
by double clicking on it, you will have to launch the Macintosh
Installer package (.mpkg). You will be guided through the installation
via the Macintosh Installer application.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                        |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                              |
|                            | iODBC follows the Programmer and System guidelines defined by Apple, this document can be found at: <a 
                              href="http://developer.apple.com/techpubs/macosx/SystemOverview/SystemOverview/SystemOverview.pdf"      
                              class="ulink" target="_top">developer.apple.com</a>                                                     |

</div>

You will find the iODBC SDK installation in the following directory tree
structure as installed on Mac OS X:

<div class="figure-float">

<div id="lite_iodbcmac003" class="figure">

**Figure 11.5. iODBC SDK tree on Mac OS X**

<div class="figure-contents">

<div class="mediaobject">

![iODBC SDK tree on Mac OS X](images/iodbcfilelist003.jpg)

</div>

</div>

</div>

  

</div>

In Mac OS X, "frameworks" are the central components of all SDKs. They
provide everything needed by developers from include files to shared
libraries with which you need to link your application. All frameworks
support is well managed with Project Builder, shipped by Apple. Simply
drag and drop via the provided GUI the corresponding framework you want
use. If you want to use a framework through the command line compiler,
see below.

The framework is basically a directory, structured as below:

<div class="figure-float">

<div id="lite_iodbcmac004" class="figure">

**Figure 11.6. iODBC SDK Frameworks on Mac OS X**

<div class="figure-contents">

<div class="mediaobject">

![iODBC SDK Frameworks on Mac OS X](images/iodbcfilelist004.jpg)

</div>

</div>

</div>

  

</div>

When you need to include one of the framework header files, you have to
prepend your header file name with the framework name as below :

``` programlisting
#include <samples/my_sample_header.h>
```

iODBC is broken down into three frameworks, each having its own proper
set of includes files and libraries.

|                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------|
| The iODBC.framework is the core of the ODBC driver manager. Its main task is to load run the right function with the right ODBC driver.         |
| The iODBCinst.framework is the ODBC configuration manager. Its main task is to access and manage the DSN files.                                 |
| The iODBCadm.framework is the GUI manager. Its main task is to give to the user the ability to access all the ODBC functionality through a GUI. |

First of all, you have to be sure that the compiler and linker you are
using can manage frameworks correctly.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                        |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                  |
|                              | The iODBC SDK is shipped with the `odbctest` sample application including sources and project file, which is intended as an example of an application utilizing iODBC. |

</div>

Under Project Builder, you have to put all the frameworks that your
application will use into your project. Implicitly, all these frameworks
will be used. Also, you have to be sure that the machine where the
application will be running includes all the frameworks with which you
are linking. In certain cases, iODBC can be shipped with your
application and all the frameworks.

This is the most straightforward way, but you can also directly use the
compiler and command line linker shipped with Project Builder. In such
case, you will have to add certain options to let the compiler and
linker know that you want to use a specific framework. However, the
sources do not require any changes. During the compilation phase, you
will have to use the "`–F`" option to add a path to let the compiler
search for frameworks under the designated path. The correct syntax is
"`–Fdir`", where `dir` is the path you want to add. You have to put one
path, and there is no limit on the number of `–F` options to pass on the
command line. For iODBC, you have to add only the following two
directories:

``` programlisting
/Library/Frameworks
/System/Library/Frameworks
```

A complete cc compilation command line may look like:

``` programlisting
cc c "F/Library/Frameworks" "F/System/Library/Frameworks" mysources.c
```

During the linkage phase, you will have to use the same option as above,
as well as specifying at the end of the command line all the frameworks
with which you are linking, preceded by the option `–framework`.

A complete `cc` linkage command line may look like:

``` programlisting
cc o "myapplication" "F/Library/Frameworks" "F/System/Library/Frameworks"  \
      framework "iODBC" framework "iODBCinst" framework "iODBCadm"
```

</div>

<div id="lite_iodbcsdkrefs" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.3. References

</div>

</div>

</div>

<a href="http://www.iodbc.org/" class="ulink" target="_top">iODBC web
site</a>

<a href="http://www.openlinksw.com/" class="ulink"
target="_top">OpenLink Software web site</a>

<a href="http://www.microsoft.com/data/odbc/" class="ulink"
target="_top">ODBC web site</a>

<a href="http://developer.apple.com/" class="ulink"
target="_top">Apple's Developer web site</a>

</div>

<div id="lite_iodbcportappmac" class="section">

<div class="titlepage">

<div>

<div>

### 11.3.4. Porting Mac OS Classic ODBC applications to Mac OS X

</div>

</div>

</div>

Carbon is a framework included with Apple's Mac OS X operating system
that is derived from the original Macintosh Toolbox programming
interface. Carbon on Mac OS X is an entirely new implementation, with a
superset of the original Toolbox functionality, and many changes and
additions to run under the Mac OS X operating system.

A subset of Carbon is also available on previous versions of the Mac OS,
all the way back to Mac OS 8.1 or Mac OS 8.6 depending on the
functionality required. This enables developers to create applications
from one set of source code that will run on both the original Macintosh
operating system as well as Mac OS X. Carbon applications can even take
advantage of special Mac OS X features when running on Mac OS X, and
continue to run as they have otherwise on earlier versions of the Mac
OS.

Cocoa is a rich set of object-oriented frameworks that allow for the
most rapid development of applications on Mac OS X. Using Cocoa,
developers can create full-featured applications in a fraction of the
time they would need for procedural languages. Applications from UNIX
and other OS platforms can also be brought to Mac OS X quickly by using
Cocoa to build state-of-the-art Aqua user interfaces while retaining
most existing core code.

The Cocoa application environment is designed specifically for Mac OS
X-only native applications. It is comprised of a set of object-oriented
frameworks that support rapid development and high productivity. The
Cocoa frameworks include a full featured set of classes designed to
create robust and powerful Mac OS X applications. The object-oriented
design simplifies application development and debugging.

<div class="figure-float">

<div id="lite_iodbcmac004_01" class="figure">

**Figure 11.7. iODBC SDK on Mac**

<div class="figure-contents">

<div class="mediaobject">

![iODBC SDK on Mac](images/mac10/macodbc1.jpg)

</div>

</div>

</div>

  

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="http://developer.apple.com/cocoa/" class="ulink"
target="_top">Cocoa</a></p>
<p><a href="http://developer.apple.com/cabon/" class="ulink"
target="_top">Carbon</a></p></td>
</tr>
</tbody>
</table>

</div>

<div id="lite_iodbcportmaccarbon" class="section">

<div class="titlepage">

<div>

<div>

#### Migration of iODBC applications to Carbon

</div>

</div>

</div>

The iODBC CFM Bridge is the library that Carbon applications must be
linked against. This bridge is responsible for redirecting the ODBC API
calls to the right iODBC version applicable to platform that the
application is running on, beit Mac OS Classic or Mac OS X.

The iODBC CFM Bridge must be used exclusively. If you link against the
iODBC CFM Bridge, ensure that no others iODBC libraries are linked in
your project. The iODBC CFM Bridge linked applications require a valid
iODBC installation on the target platform in order run successfully.

Any CFM libraries used must be included in your System-Extensions folder
of your Mac Classic system in order to successfully support carbon
applications at runtime.

</div>

<div id="lite_iodbcportmaccocoa" class="section">

<div class="titlepage">

<div>

<div>

#### Migration of iODBC applications to Cocoa

</div>

</div>

</div>

Under Project Builder, you have to put all the frameworks that your
application will use in your project. Implicitly, all these frameworks
will be used. Also, you have to be sure that the machine where you will
run the application include all the frameworks you link with. In such
cases, iODBC can be shipped with your application including all the
frameworks.

This is the most straight forward way, but you can also directly use the
compiler and linker command line shipped with Project Builder. In a such
case, you will have to add some options to inform the compiler and
linker that you want to use a specific framework. The sources sources do
not have to change.

During the compilation phase, use the `-Fdir` option on the compiler
command line to add a search path to the framework path, where dir is
the path you want to add. You may only specify one path per `-F` option,
but you not limited to the number of `-F` options used. iODBC
compilations only require `-F/Library/Frameworks` and
`-F/System/Library/Frameworks` options. Hence, complete `cc`=
compilation command line may look like:

``` programlisting
cc -c "-F/Library/Frameworks" "-F/System/Library/Frameworks" ... mysources.c
```

During the linkage phase, you will have to use the same option as above,
and to specify at the end of the command line all the framework you want
to link with, preceded with the option -framework . A complete cc
linkage command line may look like:

``` programlisting
cc -o "myapplication" "-F/Library/Frameworks" "-F/System/Library/Frameworks" ... \
  -framework "iODBC" -framework "iODBCinst" -framework "iODBCadm" 
```

</div>

</div>

</div>
