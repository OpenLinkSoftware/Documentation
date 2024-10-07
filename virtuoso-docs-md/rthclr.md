<div id="rthclr" class="section">

<div class="titlepage">

<div>

<div>

## 18.2. CLR, .Net & ASPX Host

</div>

</div>

</div>

The Common Language Runtime (CLR) is the foundation upon which the
Microsoft® .NET strategy is built. The CLR provides an execution
environment that manages running code and provides services that make
software development easier. These services include automatic memory
management, cross-language integration, interoperability with existing
code and systems, simplified deployment, and a fine grained security
system. The .NET platform also brings with it a new programming language
called C#. It is very similar to Java and allows developers to make full
use of all features available on the .NET runtime.

The CLR can run a variety of different types of applications, such as:
console applications, Web server scripts, traditional Win32-based
applications, and more.

The CLR provides a language specification for compilers to generate
classes and code that can interoperate with other programming languages
(The Common Language Specification: CLS) . Any API that is written using
a CLS provider language can be used by any language that is a CLS
consumer. Compilers generate code in a format called Common Intermediate
Language (CIL) which is an intermediate representation of a compiled
program and is easy to compile to native code or be compiled using
Just-in-Time (JIT) engines. The restrictions placed by the runtime on
the CIL byte codes ensures good potential for code optimization by the
JIT compiler. The runtime environment provides garbage collection,
threading and a comprehensive class library. All these things make code
development easier and more appealing by allowing a mixture of languages
to be collaborating to produce results, all contained within a managed
sandbox to prevent bugs from breaking other running programs.

Windows has compilers that target the virtual machine from a number of
languages: Managed C++, JavaScript, Eiffel, Component Pascal, APL,
Cobol, Perl, Python, Ruby, Scheme, Smalltalk, Standard ML, Haskell,
Mercury and Oberon.

Virtuoso is a CLR host. It is responsible for initializing the runtime,
defining the application domain (its runtime boundaries, security
settings, etc), and executing user code within such domains. Windows can
be used as the development platform, a very developer friendly
environment with a rich set of tools, but you will not be restricted to
Windows, .NET and IIS to run the assemblies produced. Where .NET is not
readily available or desired Virtuoso contains Mono, an open source
re-implementation of Microsoft .NET, a vehicle making .NET
cross-platform.

The CLR run time is a part of the Virtuoso process. The Mono run time
may be run either as in-process or as out-of-process. Hosted
applications can make use of the regular Virtuoso .net data provider to
access Virtuoso SQL data and procedures. Microsoft ASPX files can also
be run directly from Virtuoso either from the filesystem or WebDAV. Each
of these capabilities releases you from the Microsoft platforms without
compromising your development platform.

<div id="rthclrenvsetdotnet" class="section">

<div class="titlepage">

<div>

<div>

### 18.2.1. Environment Setup

</div>

</div>

</div>

Follow the steps below to configure the CLR runtime environment with
Virtuoso:

<div class="orderedlist">

1.  **Install .Net Framework SDK. ** The .Net Framework can be
    downloaded from the Microsoft web site.

2.  **Install virtclr.dll into the GAC. ** The `virtclr.dll` library
    supplied with Virtuoso must be installed into the .Net 'Global
    Assembly Cache (GAC)'.

    .Net library components can be installed into the GAC using the
    command: `gacutil /i <DLL>` . The gacutil utility is supplied with
    the .Net framework. In this case we would use the command:

    ``` programlisting
    gacutil /i virtclr.dll
    ```

3.  **Register virtclr with COM. ** The virtclr.dll library must be
    registered as COM object using the 'regasm' utility as follows:

    ``` programlisting
    regasm virtclr.dll
    ```

4.  **Install virt_http.dll into the GAC. ** The `virt_http.dll` library
    supplied with Virtuoso must be installed into the .Net 'Global
    Assembly Cache (GAC)'.

    ``` programlisting
    gacutil /i virt_http.dll
    ```

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                          |
|                              | The utilities gacutil and regasm are typically found in `%WINDIR%\Microsoft.NET\Framework\<version>` e.g. `C:\WINDOWS\Microsoft.NET\Framework\v1.0.3705.288` . |

</div>

Failure to register the components successfully as described will
generate "Virtuoso failed to initialize" messages. The Virtuoso
installer, however, should automatically register the components for
you.

Private assemblies must be deployed within the directory of the
containing application and are found during runtime through a process
called probing - a mapping from an assembly's identity to a file on disk
that contains the manifest.

By default, probing for private assemblies is done from the root
directory (application base) of the calling application (Virtuoso in
this case) and the subdirectories that follow naming conventions based
on assembly name and culture. You can customize this behavior by
specifying a privatePath in your application's configuration file. The
privatePath is a semi-colon delimited list of directories that the
common language runtime will search for private assemblies. These
directory names are relative to the application base - they cannot point
outside the application base. The directories in the privatePath will be
searched after the application base itself. The following configuration
file adds a bin directory to the assembly search path:

``` programlisting
<configuration>
    <runtime>
        <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
            <probing privatePath="bin"/>
        </assemblyBinding>
    </runtime>
</configuration>
```

Configuration files are called: `<application name>.config` .

</div>

</div>
