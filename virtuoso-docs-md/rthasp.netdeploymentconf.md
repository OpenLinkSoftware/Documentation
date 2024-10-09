<div>

<div>

<div>

<div>

### 14.5.2. ASP.Net Deployment & Configuration

</div>

</div>

</div>

ASP.Net allows multiple Web applications to run on the same machine
independently of each other. Web applications have their own directory
for components (the ".\bin" directory) and its own XML-based
configuration file (the ".config" file). This allows us to develop
robust applications using custom configurations and components (or
different versions of components) for each one.

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                                                               |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                                                         |
|                              | The ASP.Net machine-wide configuration is held in machine.config found in the `(C:\Winnt\Microsoft.NET\)Framework\[version number]\CONFIG directory` depending on your installation. Applications hosting or making use of .Net may have an application configuration \[App Name\].config. Web applications store their individual configurations in Web.config stored in the Web application root directory. |

</div>

Each ASP.Net application uses a local assembly cache to hold application
specific logic (assemblies, contained in compiled DLLs). The \bin
directory located in the application root is the local assembly cache
for Web applications. This directory is denied access directly from
browsers. This prevents users from downloading or executing any DLLs
contained within.

When a Web application is started the .Net Framework constructs a new
instance of the `System.AppDomain` class. When the instance is
constructed it creates in-memory shadow copies of the DLLs in the \bin
directory. The .Net Framework keeps an in-memory cache (shadow) of all
assemblies used so that the actual files (.DLLs) are not locked. The
.Net Framework will monitor the original DLL for changes. When changes
occur the in-memory cache is updated. Applications already loaded and
running with calls in-progress to the old library will continue using
the old version so there is no interruption. All new calls to library
will be effected, and use the new library. This means that you are free
to replace the DLL with new versions as required. Previously with ASP
you were required to stop IIS, register the DLL with RegServ32.exe and
restart the Web server.

When new libraries are added to the .Net Framework for use in any
application system wide, such as the Virtuoso Data Provider, these need
to be added to the Global Assembly Cache (GAC). This is achieved using
the `gacutil.exe` utility found in the `Framework\[version number]`
directory. The `gacutil.exe` tool registers the DLL along with its
version. One of .Net's strengths is its ability to maintain multiple
versions of DLLs for multiple applications. This prevents "DLL-hell";
new DLLs breaking old applications. Applications can also maintain their
own local versions of DLLs in their \bin directory.

``` programlisting
gacutil.exe /i <full path and file name>.dll
```

Registers assemblies with the Global Assembly Cache.

``` programlisting
gacutil.exe /l
```

Can be used to list registered assemblies.

After registering assemblies using the `gacutil.exe` tool you must add
an `<add assembly="..." />` entry into the
`<configuration><system.web><compilation><assemblies> ` section of the
machine.config.

The application given in the previous section can be deployed to
Virtuoso in the WebDAV repository or directly on file system under the
VSPRoot directory. You should copy the directory structure as defined,
applications in the root of the new directory and DLLs in a bin
subdirectory. A virtual directory must be configured with execute
permissions enabled. The application can be tested with a Web browser.

</div>
