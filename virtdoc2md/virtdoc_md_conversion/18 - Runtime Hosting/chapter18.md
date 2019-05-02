# Runtime Hosting

<!--- TOC: Start --->

#### Contents

  * [Runtime Environments](#id1-runtime-environments)
  * [CLR, .Net & ASPX Host](#id2-clr-net-aspx-host)
    * [Environment Setup](#id3-environment-setup)
    * [Testing the Virtuoso .NET Runtime Environment](#id4-testing-the-virtuoso-net-runtime-environment)
  * [CLR & Mono](#id5-clr-mono)
    * [Environment Setup](#id6-environment-setup)
    * [Testing the Virtuoso Mono Runtime Environment](#id7-testing-the-virtuoso-mono-runtime-environment)
  * [Embedded Java VM API](#id8-embedded-java-vm-api)
    * [Correspondence Between Virtuoso & Java VM Threads](#id9-correspondence-between-virtuoso-java-vm-threads)
    * [Virtuoso/PL \<-\> Java VM Type Mapping Schema](#id10-virtuosopl-java-vm-type-mapping-schema)
    * [References to Java VM Class Instances in Virtuoso/PL](#id11-references-to-java-vm-class-instances-in-virtuosopl)
    * [Specifying the Correct Java Type When Passing Values from Virtuoso/PL](#id12-specifying-the-correct-java-type-when-passing-values-from-virtuosopl)
    * [Virtuoso Java PL API VSEs](#id13-virtuoso-java-pl-api-vses)
    * [Java Security](#id14-java-security)
  * [Virtuoso Server Extension Interface (VSEI) (C Interface)](#id15-virtuoso-server-extension-interface-vsei-c-interface)
    * [Virtuoso Server Extension Interface (VSEI)](#id16-virtuoso-server-extension-interface-vsei)
    * [SQL Run Time Objects](#id17-sql-run-time-objects)
    * [Memory Management Rules](#id18-memory-management-rules)
    * [Server Main Function](#id19-server-main-function)
    * [Compiling & Linking](#id20-compiling-linking)
    * [Functions by Category](#id21-functions-by-category)
    * [VSEI Definition](#id22-vsei-definition)
    * [SQL Exceptions](#id23-sql-exceptions)
    * [Executing SQL](#id24-executing-sql)
    * [Adding New Languages And Encodings Into Virtuoso](#id25-adding-new-languages-and-encodings-into-virtuoso)
  * [VSEI Plugins](#id26-vsei-plugins)

<!--- TOC: End --->
<a id="id1-runtime-environments"></a>
# Runtime Environments

The Virtuoso server in its standard build is a single executable. To
allow for external customizations based on VSEs the Virtuoso server
engine becomes a callable library, the main function is re-written to
incorporate other libraries and a new executable is created. For
example, a Virtuoso server that contains PHP support under Windows
consists of:

``` 
 65K virtuoso-odbc-php-t.exe
5.2M libvirtuoso-odbc-t.dll
1.2M php4ts.dll
```

which replaces the usual `7M virtuoso-odbc-t.exe` .
`virtuoso.odbc-php-t.exe` is then executed in the usual way.

The Linux counterpart would be an `8M virtuoso-odbc-php-t` binary.

The Virtuoso executable files provided in the installer are
appropriately named to indicate which customizations are supported. e.g.
one that contains "php" and "clr" in the file name has been built with
PHP and CLR support.

The location of the support libraries (.DLL's) for the various
customizations of Virtuoso on Windows must either be in the %PATH%;
environment variable or be the same directory as the virtuoso .EXE file.
Virtuoso will not be able to start otherwise.

> **Note**
> 
> If Virtuoso is starting as a system service then the SYSTEM PATH must
> be altered as opposed to the USER PATH. The USER PATH is appropriate
> to alter if Virtuoso is being started as that user, usually when in
> debug/foreground mode. This is applicable to any required environment
> variables, not just PATH.

Hosted environments that require SQL access back to the database can
make use of the in-process client mechanism. Hosted Runtimes such as PHP
and ASP .Net would ordinarily use an RPC based (ODBC) connection. To
improve the efficiency of the system, keeping it all in-process, a
special connection can be made with no alteration to the API used in the
code for communication.

> **Tip**
> 
> The [In-Process Client](#inprocess) keeps connections within Virtuoso
> avoiding unnecessary RPCs.

<a id="id2-clr-net-aspx-host"></a>
# CLR, .Net & ASPX Host

The Common Language Runtime (CLR) is the foundation upon which the
Microsoft® .NET strategy is built. The CLR provides an execution
environment that manages running code and provides services that make
software development easier. These services include automatic memory
management, cross-language integration, interoperability with existing
code and systems, simplified deployment, and a fine grained security
system. The .NET platform also brings with it a new programming language
called C\#. It is very similar to Java and allows developers to make
full use of all features available on the .NET runtime.

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

<a id="id3-environment-setup"></a>
## Environment Setup

Follow the steps below to configure the CLR runtime environment with
Virtuoso:

1.  **Install .Net Framework SDK.**
    
    The .Net Framework can be downloaded from the Microsoft web site.

2.  **Install virtclr.dll into the GAC.**
    
    The `virtclr.dll` library supplied with Virtuoso must be installed
    into the .Net 'Global Assembly Cache (GAC)'.
    
    .Net library components can be installed into the GAC using the
    command: `gacutil /i <DLL>` . The gacutil utility is supplied with
    the .Net framework. In this case we would use the command:
    
        gacutil /i virtclr.dll

3.  **Register virtclr with COM.**
    
    The virtclr.dll library must be registered as COM object using the
    'regasm' utility as follows:
    
        regasm virtclr.dll

4.  **Install virt\_http.dll into the GAC.**
    
    The `virt_http.dll` library supplied with Virtuoso must be installed
    into the .Net 'Global Assembly Cache (GAC)'.
    
        gacutil /i virt_http.dll

> **Note**
> 
> The utilities gacutil and regasm are typically found in
> `%WINDIR%\Microsoft.NET\Framework\<version>` e.g.
> `C:\WINDOWS\Microsoft.NET\Framework\v1.0.3705.288` .

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

    <configuration>
        <runtime>
            <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
                <probing privatePath="bin"/>
            </assemblyBinding>
        </runtime>
    </configuration>

Configuration files are called: `<application name>.config` .

<a id="id4-testing-the-virtuoso-net-runtime-environment"></a>
## Testing the Virtuoso .NET Runtime Environment

To test that you have successfully started the Virtuoso server with .NET
CLR runtime support make a simple library, import the contained class
into Virtuoso and call it.

Using an text editor create a C\# source file in the server root
directory called sanity.cs, with the following contents:

    using System;
    
    public class sanity
    {
        public static string test(string  name) {
           return "Hello "+ name + ", from Virtuoso";
        }
    }

This sample needs to be compiled into bytecode assembly before it can be
used. Use a command prompt that is suitable set up to find .NET
utilities in its path, the .NET Framework SDK installation provides a
shortcut in the Start menu to a command prompt that is preconfigured.
From the command prompt change directory to the Virtuoso server root
containing the C\# source file.

    C:\Program Files\OpenLink\Virtuoso 3.0\bin>csc /target:library sanity.cs
    Microsoft (R) Visual C# .NET Compiler version 7.00.9466
    for Microsoft (R) .NET Framework version 1.0.3705
    Copyright (C) Microsoft Corporation 2001. All rights reserved.

Now this library must be introduce to the Virtuoso Server. Using ISQL
use the following commands to test the CLR:

    C:\Program Files\OpenLink\Virtuoso 3.0\bin>isql 1112
    Connected to OpenLink Virtuoso
    Driver: 03.00.2315 OpenLink Virtuoso ODBC Driver
    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL> DB..import_clr (vector ('sanity'), vector ('sanity'));
    
    Done. -- 300 msec.
    SQL> select sanity::test('Rob');
    callret
    VARCHAR
    ______________________________________________
    
    Hello Rob, from Virtuoso
    
    1 Rows. -- 60 msec.

Congratulations, you have proven that your Virtuoso server can run .NET
classes.

> **Tip**
> 
> The Virtuoso Tutorials, which are installed with the Demo Virtuoso
> Server (port 1112), contains numerous samples further demonstrating
> the use of the CLR, .NET and Virtuoso.

> **Tip**
> 
> The [Create Assembly](#createassembly) Syntax
> 
> The External Hosted [Create PROCEDURE](#createassembly) Syntax

<a id="id5-clr-mono"></a>
# CLR & Mono

The Mono Project is an open development initiative sponsored by Ximian
that is working to develop an open source, Unix version of the Microsoft
.NET development and run time platform. Its objective is to enable Unix
developers to build and deploy cross-platform .NET Applications.
Likewise, this expands the capabilities of Windows programmers, this
project opens .NET to non Windows platforms. Mono will implement various
Microsoft technologies that have now been submitted to the ECMA for
standardization.

The Goal is similar to that of Java, implementing a common virtual
machine on multiple operating systems, however you are not restricted to
one language.

Like .NET, Mono contains a Common Language Infrastructure (CLI) virtual,
machine that contains a class loader, Just-in-time compiler, and a
garbage collecting runtime; a class library that can work with any
language which works on the CLR; a compiler for the C\# language.

Windows has compilers that target the virtual machine from a number of
languages: Managed C++, JavaScript, Eiffel, Component Pascal, APL,
Cobol, Perl, Python, Ruby, Scheme, Smalltalk, Standard ML, Haskell,
Mercury and Oberon. A single object system, threading system, class
libraries, and garbage collection system can be shared across all these
languages, the CLR.

The CLR and the Common Type System (CTS) enables applications and
libraries to be written in a collection of different languages that
target the CLR byte code. This means that you could define a class to do
algebraic manipulation written in C\#, that class can be reused from any
other language that supports the CLI. You could create a class in C\#,
subclass it in C++ and instantiate it in an Eiffel program.

> **Tip**
> 
> The [Create Assembly](#createassembly) Syntax
> 
> The External Hosted [Create PROCEDURE](#createassembly) Syntax

<a id="id6-environment-setup"></a>
## Environment Setup

Ximian announced the launch of the Mono project, an effort to create an
open source implementation of the .NET Development Framework.

Follow the steps below to configure the CLR runtime environment with
Virtuoso:

1.  **Install Mono.**
    
    The Mono package is available from the [Mono project home page](#)
    in the form of an RPM for Linux. The source is also available.

2.  **Make mscorlib.dll available to /usr/local/lib.**
    
    The mscorlib.dll is installed by Mono and needs to be symlinked from
    its default location to `/usr/local/lib` .

<a id="id7-testing-the-virtuoso-mono-runtime-environment"></a>
## Testing the Virtuoso Mono Runtime Environment

To test that you have successfully started the Virtuoso server with Mono
CLR runtime support make a simple library, import the contained class
into Virtuoso and call it.

Using an text editor create a C\# source file in the server root
directory called sanity.cs, with the following contents:

    using System;
    
    public class sanity
    {
        public static string test(string  name) {
           return "Hello "+ name + ", from Virtuoso";
        }
    }

This sample needs to be compiled into bytecode assembly before it can be
used. Make sure you environment is configured to use Mono, change
directory to the Virtuoso server root containing the C\# source file.
Run:

    bash$ mcs /target:library sanity.cs
    Compilation succeeded

Now this library must be introduce to the Virtuoso Server. Using ISQL
use the following commands to test the CLR:

    C:\Program Files\OpenLink\Virtuoso 3.0\bin>isql 1112
    Connected to OpenLink Virtuoso
    Driver: 03.00.2315 OpenLink Virtuoso ODBC Driver
    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL> DB..import_clr (vector ('sanity'), vector ('sanity'));
    
    Done. -- 300 msec.
    SQL> select sanity::test('Rob');
    callret
    VARCHAR
    ______________________________________________
    
    Hello Rob, from Virtuoso
    
    1 Rows. -- 60 msec.

Congratulations, you have proven that your Virtuoso server can run .NET
classes via Mono Runtime.

> **Tip**
> 
> The Virtuoso Tutorials, which are installed with the Demo Virtuoso
> Server (port 1112), contains numerous samples further demonstrating
> the use of the CLR, .NET, Mono and Virtuoso.

> **Tip**
> 
> The [Create Assembly](#createassembly) Syntax
> 
> The External Hosted [Create PROCEDURE](#createassembly) Syntax

<a id="id8-embedded-java-vm-api"></a>
# Embedded Java VM API

The Java VM is an embedded system within Virtuoso that allows the
calling of class Java methods and getting class properties. It uses the
JAVA JNI API to interact with the JAVA VM.

<a id="id9-correspondence-between-virtuoso-java-vm-threads"></a>
## Correspondence Between Virtuoso & Java VM Threads

At maximum one Java VM will be started on demand. If a function from the
Java VM API is called and no JVM is running, one will be started, as
required. Since Virtuoso is multithreaded it requires JDK version 1.3 or
above in order to make better use of it's multithreading support. If the
Java VM is already running the API VSEs attaches the current Virtuoso
working thread, if not already attached, as a Java VM thread to the
running VM. The Virtuoso worker thread does not automatically detached
itself from the Java VM after use, therefore, in order to prevent
leaving redundant Virtuoso worker threads being left attached to the
Java VM the [`java_vm_detach()`](#fn_java_vm_detach) VSE should be used.

The following require access to the Java VM:

all Virtuoso JAVA PL API (JVM VSEs)

allocating/deallocating/copying of the Virtuoso/PL Java VM class
reference values.

If no subsequent JVM VSEs are called after calling `java_vm_detach()` ,
the worker thread can still attach to the VM in order to deallocate or
copy Java VM class reference values. In order to ensure that the worker
thread is properly detached it is advisable to set all the variables
that may hold Java VM class reference values to NULL, which deallocates
their current value, before calling the `java_vm_detach()` JVM VSE.

Attaching and detaching Virtuoso worker threads is marked as a debug
level message in the Virtuoso Event log, so that these messages can be
used to debug the process.

<a id="id10-virtuosopl-java-vm-type-mapping-schema"></a>
## Virtuoso/PL \<-\> Java VM Type Mapping Schema

Since the Java language uses a different set of data types than Virtuoso
a type mapping system has been established to allow the passage of data
to and from Java. All Java simple types are mapped to a corresponding
Virtuoso type as follows:

| Java Type/Class  | Virtuoso Internal Type |
| ---------------- | ---------------------- |
| boolean          | smallint               |
| char             | smallint               |
| double           | double precision       |
| float            | real                   |
| int              | integer                |
| short            | integer                |
| long             | integer                |
| boolean          | smallint               |
| java.lang.String | NVARCHAR               |
| java.util.Date   | DATETIME               |

Java - Virtuoso Data Type Mapping

All other Java objects are represented as a special Virtuoso value,
which contains a reference to the Java object in the VM memory space.
When such a value is returned as a Virtuoso/PL return value or as a
result set column, it calls the `java.lang.Object.toString()` method for
the Java VM object it refers to and that result is returned to the
calling client.

Arrays are mapped to a Virtuoso vector of their elements. The array
handling routines are recursive, so each element may be a Java array or
a scalar type.

The above mappings are applied when converting Virtuoso/PL data to Java
data as follows:

method parameter values in java\_call\_method VSE

method parameter values in java\_new\_object VSE

property values in java\_set\_property VSE

the instance parameters in
java\_call\_method/java\_get\_property/java\_set\_property VSEs

The above mappings are applied in the opposite direction (Java Data -\>
Virtuoso/PL data) as follows:

method return values in java\_call\_method VSE

return value of the java\_new\_object VSE

property values returned from java\_get\_property VSE

<a id="id11-references-to-java-vm-class-instances-in-virtuosopl"></a>
## References to Java VM Class Instances in Virtuoso/PL

Java Class instances are represented as a Virtuoso/PL variable values
using a Java VM Global Reference. Each time such a Virtuoso/PL variable
value is created or copied, it adds a Java VM Global Reference. When it
is freed, it removes the Java VM global reference, allowing the Java
Garbage collector (GC) to free it. Each of the API VSEs create a Java VM
local frame upon it's start, and frees it upon exit. This allows for
fast deallocation of the local objects created by mapping Virtuoso/PL
native values to Java objects.

<a id="id12-specifying-the-correct-java-type-when-passing-values-from-virtuosopl"></a>
## Specifying the Correct Java Type When Passing Values from Virtuoso/PL

Each method parameter in the `java_new_object()` /`java_call_method()`
can be either the value itself or a two-element vector. When it is a
two-element vector it's first element is the JNI type signature string,
e.g.: for integer - I, for array of integers - \[I\], for
java.lang.String - Ljava/lang/String. The signature is important because
the Java VM JNI API needs it in order to find the appropriate
constructor/method/property.

<a id="id13-virtuoso-java-pl-api-vses"></a>
## Virtuoso Java PL API VSEs

The API consists of the following VSEs:

java\_call\_method()

java\_set\_property()

java\_get\_property()

java\_load\_class()

java\_new\_object()

java\_vm\_attach()

java\_vm\_detach()

<a id="id14-java-security"></a>
## Java Security

Java classes are hosted in one of two modes:

Restricted

Unrestricted

Java class Permissions are managed by security classes that fall into
categories as follows listed with it managing class:

File - java.io.FilePermission

Socket - java.net.SocketPermission

Net - java.net.NetPermission

Security - java.security.SecurityPermission

Runtime - java.lang.RuntimePermission

Property - java.util.PropertyPermission

AWT - java.awt.AWTPermission

Reflect - java.lang.reflect.ReflectPermission

Serializable - java.io.SerializablePermission

Restricted classes are not allowed any of the above privileges. Virtuoso
returns errors that are returned by the security manager if breaches in
security are attempted by a hosted Java class.

By default all Java classes are imported/created/hosted in restricted
mode. To create Java class based user defined types that are
unrestricted you need to use create type syntax with UNRESTRICTED
keyword. The [`import_jar()`](#fn_import_jar) function can also be used
to import classes, its third optional parameter can be used to define
the security mode.

> **Note**
> 
> New behavior since Virtuoso 3.2 provides these two security modes
> defaulting to restricted. Prior to this Java classes were hosted in
> unrestricted mode.

The class Write\_file, shown below, will attempt to write to a file on
the file system. This class will be used to create a user defined type
first in unrestricted mode and then in restricted mode to demonstrate
how security exceptions are returned.

Source of Write\_file.java:

    import java.io.*;
    
    public class Write_file
    {
      public String write ()
        {
          String myFile = "foo";
          File f = new File(myFile);
          DataOutputStream dos;
    
          try
        {
          dos = new DataOutputStream (new BufferedOutputStream(new FileOutputStream (myFile),128));
          dos.writeBytes("ABC\n");
          dos.flush();
          dos.close();
        }
    
          catch (IOException ioe)
        {
          System.out.println("writeFile: caught i/o exception");
        }
    
          return "OK";
        }
    }

Create the unrestricted type:

    create type "Write_file" language JAVA external name 'Write_file'
      unrestricted METHOD "write" ()
      returns nvarchar external type 'Ljava/lang/String;' external name 'write';

Test calling the method:

    SQL> select new Write_file().write();
    callret
    NVARCHAR
    _________________________________________
    
    OK

Now we want to recreate the type in restricted mode, remembering to drop
it first:

    drop type DB.DBA.write_file;
    
    create type "Write_file" language JAVA external name 'Write_file'
      METHOD "write" ()
      returns nvarchar external type 'Ljava/lang/String;' external name 'write';

Test calling the method:

    SQL> select new Write_file().write();
    
    *** Error 42000: [Virtuoso Driver][Virtuoso Server]JV001: Java exception
    occurred : java.security.AccessControlException : access denied
    (java.io.FilePermission foo write)
    in  __udt_method_call:(BIF),
    <Top Level>
    at line 1 of Top-Level:
    select new Write_file().write()

Another way to import the above class is by use the `import_jar()` such
as:

    import_jar (NULL, 'Write_file', 1) - will import java classes in unrestricted mode.
    import_jar (NULL, 'Write_file') - will import java classes in restricted mode.

<a id="id15-virtuoso-server-extension-interface-vsei-c-interface"></a>
# Virtuoso Server Extension Interface (VSEI) (C Interface)

<a id="id16-virtuoso-server-extension-interface-vsei"></a>
## Virtuoso Server Extension Interface (VSEI)

The Virtuoso Server Extension Interface allows Virtuoso functionality to
be extended by including new functions written in other languages such
as C. These new functions are SQL callable.

These functions share the same C prototype and use Virtuoso internal
APIs to do the following:

Retrieve arguments.

Assign values to output parameters.

Compile and execute SQL/PL statements and fetch results.

Signal SQL errors.

Return values.

A SQL-callable C function is called a Virtuoso Server Extension (VSE).
These are external functions integrated into Virtuoso by linking their
executable produced with a Virtuoso server in library format, rather
than executable. VSEs were formally known as BIFs, which stood for
Built-In Functions. Such functions must be exported using the
`bif_define()` or `bif_define_typed()` C-functions when initializing the
extended Virtuoso server.

These functions will thereafter be invoked on server threads. The
functions should be re-entrant and comply to some simple memory
management conventions outlined below.

These functions may execute arbitrary C code and call arbitrary APIs, to
the extent these are compatible with the host operating system's
threading model.

Virtuoso VSEs can be debugged within the normal C debugger by either
starting Virtuoso under the debugger in foreground mode or by attaching
the debugger to a running process.

Stack consumption should not be excessive: threads normally have 100K of
stack on 32 bit platforms. The stack size may however be increased by
settings in the virtuoso.ini file.

<a id="id17-sql-run-time-objects"></a>
## SQL Run Time Objects

The Virtuoso Server Extension API introduces the following data types:

  - box  
    This is a run-time-typed block of memory which represents any SQL
    data type, e.g. number, string, array etc. Boxes have a type and
    length that are retrievable at run time and can be allocated, freed
    and otherwise manipulated by functions appropriate to each type of
    box. Boxes may form trees through use of heterogeneous arrays but
    should not form graphs.

  - query\_t  
    This is a compiled query, corresponding to a SQL statement or
    procedure compilation. The `query_t` is made from a SQL string and
    can thereafter be executed multiple times. This is a read-only
    object, not affected by execution on any number of threads,
    analogously to machine code not being affected by being executed.

  - query\_instance\_t  
    This is a structure representing a query execution state. These are
    created when executing a `query_t` . This is analogous to a stack
    frame of a C function. It holds all relevant query state, such as
    cursor positions, intermediate results, column values etc. This is
    passed to all VSEs so they can have access to environment
    information such as current transaction, current client etc. The
    query instance references the `query_t` . As a rule, the query
    instance is specific to a thread. A query instance can be relatively
    long lived in the case of a cursor, which may live across multiple
    client-server message exchanges.

  - state\_slot\_t  
    This is a part of `query_t` that specifies or describes a query time
    variable, column, parameter, intermediate result etc. This is
    analogous to an offset in a stack frame, it actually indexes a
    position inside a query instance. Given the state slot and the
    instance, it is possible to read or to set a value in the query
    state. Arguments of VSEs are passed as an array of state. Slots
    combined with the running query instance give the arguments values,
    and can be used to set output parameters.

  - local\_cursor\_t  
    When executing a select statement, the local cursor structure is
    returned for accessing the result set rows. This is always a
    forward-only cursor. This can be advanced, column values may be
    accessed and the cursor may be closed.

<a id="id18-memory-management-rules"></a>
## Memory Management Rules

All state slots in a query have distinct values. With the exception of a
reference parameter, no value is referenced twice. All state slot values
can therefore be recursively freed independently of each other.

If a VSE returns data, this data must always be new, i.e. allocated
inside the VSE and may not be a copy of or include any of the arguments
as a substructure. All return values and arguments must be legitimate
boxes and may not share a structure.

<a id="id19-server-main-function"></a>
## Server Main Function

The server main function for a customized Virtuoso server has the
following format:

    static void (*old_ddl_hook) (client_connection_t *cli) = NULL;
    
    static void
    ddl_hook (client_connection_t *cli)
    {
      if (old_ddl_hook)
        old_ddl_hook (cli);
    
      /* DDL code (depending on the server being fully initialized
        (ex: create table) ) goes here */
    }
    
    static void
    init_func (void)
    {
      old_ddl_hook = set_ddl_init_hook (ddl_hook);
      /* initialization code (prerequisite for server initialization
         (bif_define, unrelated init code) goes here */
    }
    
    int
    main (int argc, char *argv[])
    {
      VirtuosoServerSetInitHook (init_func);
      return VirtuosoServerMain (argc, argv);
    }

There are three phases to custom code initialization:

execution of the

main()

function

execution of the

init\_func()

function

execution of the

ddl\_hook()

function

The `init_func()` function is called before any server initialization
functions are called. This is typically a place for defining new VSEs,
allocation of synchronization objects (since the server does not have
any threads yet), and/or custom code initialization not related to
Virtuoso. Here, the `set_ddl_init_hook()` should be called also, if it
exists, to register the `ddl_hook()` callback function.

> **Note**
> 
> The `old_ddl_hook()` mechanism - this allows queuing of the
> ddl\_hooks.

The `ddl_hook()` function is called during normal startup just before
the roll forward, but after the server's internal structure has been
initialized. This is typically a place to execute SQL statements to
initialize the extension. The variable `client_connection_t *` is passed
to the function to provide the client connection that should be used for
SQL execution.

The `main()` function can call `VirtuosoServerSetInitHook()` if there is
any Virtuoso-related initialization to be performed, and should then
call the `VirtuosoServerMain()` function to start the Virtuoso server.
The `VirtuosoServerMain()` function will return control after the server
has been shut down.

<a id="id20-compiling-linking"></a>
## Compiling & Linking

The files should be compiled for the multi-threaded environment
appropriate to the operating system and should be linked accordingly
e.g. `-lm` , `-ldl` .

The Virtuoso distribution contains the following libraries/object files:

  - **libvirtuoso-\* libraries/object files.**
    
    The Virtuoso engine. The suffix denotes the kind of remote and
    threading support : -iodbc for iODBC, -udbc for UDBC, -t for native
    threads, -f for fiber threads.

  - **c\_javavm object file.**
    
    the Virtuoso Java VM Integration file (no main function). This is
    the file to be linked in if the custom code executable needs to have
    Java VM support. To initialize the Java VM integration the C
    function `void bif_init_func_javavm (void)` should be called from
    the `VirtuosoServerSetInitHook` hook. This file references the
    `libjvm` library from the Java JRE, hence, should also be appended
    to your linker options.

  - **c\_bif\_server\_php object file.**
    
    The Virtuoso PHP integration support library. This is the file to be
    linked in if the custom code executable needs to have the PHP
    support built in. To initialize the PHP engine integration the C++
    function `void init_func_php (void)` should be called from the
    `VirtuosoServerSetInitHook` hook. Note that this file is a C++
    object file and needs to be linked in accordingly. This file
    references the libphp4 library.

  - **basec object file.**
    
    The Virtuoso .NET CLR Integration file. This is the file to be
    linked in if the custom code executable needs to have the .NET CLR
    integration built in. This is a C file.

  - **c\_dotnet object file.**
    
    The Virtuoso .NET CLR Integration file. This is the file to be
    linked in if the custom code executable needs to have the .NET CLR
    integration (and nothing but) built in. This is a C++ file. Binaries
    using this file should initialize the .NET CLR support by calling
    the C++ function `void bif_init_func_clr (void)` (defined in the
    basec object file) from the `VirtuosoServerSetInitHook` hook. In
    order for the .NET CLR support to work correctly the
    `::CoInitialize` Win32 COM API should also be called before the
    `VirtuosoServerMain` call.

  - **sql\_code\_javavm object file.**
    
    This contains the DDL definitions for the Java VM support.
    Executables using that binary should call the `sqls_define_javavm`
    function in their DDL init hook.

  - **sql\_code\_xslt object file.**
    
    This contains the DDL definitions of the XSLT stylesheets used in
    the Java VM & CLI support. Executables using that binary should call
    the `sqls_define_xslt` function in their DDL init hook.

  - **sql\_code\_clr object file.**
    
    This contains the DDL definitions for the .NET CLR integration
    support. Executables using that binary should call the
    `sqls_define_clr` function in their DDL init hook.

<a id="id21-functions-by-category"></a>
## Functions by Category

### General Box Functions

The box, usually marked with the caddr\_t data type is the basic
representation of any SQL data in Virtuoso. All boxes have a run time
data type, with a name beginning with `DV_` . All boxes have a 3 byte
run time length which allows for up to 16 MB of contiguous array size in
SQL data.

The further interpretation of the content of the box is determined by
the type tag. The length is always an exact byte length, although the
actual length is rounded up to the next suitably aligned value. The
length and tag of a box must never be changed while the box is allocated
but the content is freely writable. The tag and length reside
immediately under the pointer of the box, so that a box, with the
appropriate type cast will pass as a C array or string.

Numbers are generally represented as boxes. There is an exception for
small integers, which are always distinguishable from pointers. Thus the
range from -10000 to 10000 are not allocated as boxes holding the value
but can be passed directly. This is hidden however and the programmer
need not be concerned about this except sometimes when debugging.

The byte order in boxes depends on the platform.

The most important types are:

DV\_SHORT\_STRING

\- The box contains a null terminated string of char. The box length is
1 + the count of characters, including the final 0 in the count.

DV\_LONG\_STRING

\- same as DV\_SHORT\_STRING.

DV\_LONG\_INT, TAG\_BOX

\- The box is sizeof (long) long, with the long as element 0, in the
appropriate byte order.

DV\_SINGLE\_FLOAT

\- sizeof (float) bytes, containing the float.

DV\_DOUBLE\_FLOAT

\- sizeof (double) bytes, contains the double.

DV\_NUMERIC

\- opaque, contains a decimal floating point. The

numeric\_t

functions can be used, see appropriate documentation.

DV\_BIN

\- Binary string, no terminating 0 counted in the length.

DV\_DATETIME

\- datetime, opaque, dt\_ functions can be used, see appropriate
documentation.

DV\_BLOB\_HANDLE

\- Blob handle, opaque but convertible to string if short enough.

DV\_ARRAY\_OF\_POINTER

\- Heterogeneous array, sizeof (caddr\_t) \* n\_elements, first all
elements are box pointers. The length is in bytes, so divide by sizeof
(caddr\_t).

DV\_DB\_NULL

\- a box of 0 bytes (header only), represents the SQL NULL value.

### Box Functions

box\_t `dk_alloc_box`uint32 `bytes`int `tag``dk_alloc_box()` allocates a
box of the given size and type. The initial contents are undefined.

int `dk_free_box` box\_t `box`

`dk_free_box()` frees a box allocated by `dk_alloc_box()` . The argument
may not be any other pointer.

int `dk_free_tree` box\_t `box`

`dk_free_tree()` is like `dk_free_box()` but will free recursively,
following through DV\_ARRAY\_OF\_POINTER boxes.

uint32 `box_length` box\_t `box2`

    #define box_tag(box) \
        (*((dtp_t *) &(((unsigned char *)(box))[-1])))

These return the length and the tag of a box.

long

unbox

box\_t

n

box\_t

box\_num

long

n

box\_t

box\_dv\_short\_string

char \*

string

box\_t

box\_double

double

d

box\_t

box\_float

float

f

    #define unbox_num(n) unbox(n)
    #define unbox_float(f) (*((float *)f))
    #define unbox_double(f) (*((double *)f))
    #define unbox_string(s) ((char *)s)

The above functions and macros convert between C data types and boxes.
`box_dv_short_string()` takes a `char *` to any null terminated string
and allocates a string box of appropriate size. This itself looks like a
null terminated string but has the box header with the run time length
and type under the pointer.

box\_t

box\_copy

box\_t

box

`box_copy()` returns an identical size box with the same type and
contents.

box\_t

box\_copy\_tree

box\_t

box

`box_copy_tree()` performs a recursive copy, traversing
`DV_ARRAY_OF_POINTER` references.

int

box\_equal

box\_t

b1

box\_t

b2

Given two arbitrary boxes, returns true if they are recursively equal.

Below is the code for box\_copy\_tree:

    box_t
    box_copy (box_t box)
    {
      dtp_t tag;
      uint32 len;
      box_t copy;
    
      if (!IS_BOX_POINTER (box))
        return box;
    
      tag = box_tag (box);
      if (box_copier[tag])
        return (box_copier[tag] (box));
      len = box_length (box);
      copy = dk_alloc_box (len, tag);
      memcpy (copy, box, (uint32) len);
      return copy;
    }

    box_t
    box_copy_tree (box_t box)
    {
      box_t *copy;
      dtp_t tag;
    
      if (!IS_BOX_POINTER (box))
        return box;
    
      tag = box_tag (box);
      copy = (box_t *) box_copy (box);
      if (tag == DV_ARRAY_OF_POINTER || tag == DV_LIST_OF_POINTER)
        {
          uint32 inx, len = BOX_ELEMENTS (box);
          for (inx = 0; inx < len; inx++)
        copy[inx] = box_copy_tree (((box_t *) box)[inx]);
        }
    
      return (box_t) copy;
    }

> **Note**
> 
> The `IS_BOX_POINTER` check at the start will detect the unboxed,
> 'bare' small integers which are actually not allocated and can be
> returned by value. Only then can box\_tag be used to find the type.
> 
> The DV\_TYPE\_OF macro should be used instead of box\_tag when the
> type is unknown to avoid de-referencing a small integer.
> 
> Also note `BOX_ELEMENTS` , which is box\_length () / sizeof
> (caddr\_t). This is practical for iterating over arrays.

> **Tip**
> 
> The VSEI Functions .

<a id="id22-vsei-definition"></a>
## VSEI Definition

    typedef caddr_t (*bif_t) (caddr_t *qst, caddr_t *error_return, state_slot_t ** arguments);
    void bif_define (char *name, bif_t bif);
    void bif_define_typed (char * name, bif_t bif, bif_type_t *bt);

These functions associate a function pointer to a VSE name. The typed
variant allows associating a value type used when inferring SQL
meta-data if the result is returned to a client. The type can be one of
the following externs:

extern

bif\_type\_t

bt\_varchar;

extern

bif\_type\_t

bt\_any;

extern

bif\_type\_t

bt\_integer;

extern

bif\_type\_t

bt\_double;

extern

bif\_type\_t

bt\_float;

extern

bif\_type\_t

bt\_numeric;

extern

bif\_type\_t

bt\_convert;

extern

bif\_type\_t

bt\_timestamp;

extern

bif\_type\_t

bt\_time;

extern

bif\_type\_t

bt\_date;

extern

bif\_type\_t

bt\_datetime;

extern

bif\_type\_t

bt\_bin;

If a VSE accesses indexes either by its own internal code or by
executing Virtuoso/PL statements, there becomes a potential for
deadlocks. To prevent deadlocks, the Virtuoso/PL compiler must be
informed of potential index usage inside the VSE. Special deadlock-safe
code can be created for its needs. The `bif_set_uses_index()` function
should be used after `bif_define()` or `bif_define_typed()` in such
cases.

The potential for deadlocking is always present if the VSE executes
Virtuoso/PL code or uses XPath/XSLT functions. Other functions of
Virtuoso's C interface are deadlock-safe since they perform no database
access.

<a id="id23-sql-exceptions"></a>
## SQL Exceptions

    caddr_t srv_make_error (char *code, char *msg);
    void sqlr_error (char *code, char *msg,...);
    void sqlr_resignal (caddr_t err);

An error object is a three element array of type `DV_ARRAY_OF_POINTER` ,
consisting of the number 3, the SQL state and the message. The control
flow in case of errors signalled inside VSEs is a longjmp to an outer
context, typically that of the calling stored procedure or top level
query. The condition is there handled or sent to the next level up,
ultimately to the ODBC, JDBC or Web client. Executing a SQL statement
inside a VSE always returns and never exits the VSE by longjmp. Thus the
VSE gets a first look at all SQL errors caused by statements executed by
it.

sqlr\_error is the normal function for signaling a SQL state. It takes a
5 character SQL state, a printf format string and optional arguments, a
la printf.

sqlr\_resignal is used to throw a condition to the next level handler.
This is typically done when executing a query which returns an error and
the error is sent up to the caller of the VSE.

srv\_make\_error makes the error structure. The expression

sqlr\_resignal (srv\_make\_error ("12345", "message")); is equivalent to
sqlr\_error ("12345", "message");

> **Note**
> 
> srv\_make\_error does not take the printf-type arguments.

By convention a NULL pointer indicates no error. sqlr\_resignal (NULL)
is an error.

The macros:

    #define ERR_STATE(err)  (((caddr_t*) err)[1])
    #define ERR_MESSAGE(err)  (((caddr_t*) err)[2])

can be used to read an error returned by a statement.

<a id="id24-executing-sql"></a>
## Executing SQL

    query_t * sql_compile (char *string2, client_connection_t * cli,
                    caddr_t * err, int store_procs);
    void qr_free (query_t * qr);
    
    client_connection_t * qi_client (caddr_t * qi);

These functions allow executing SQL from VSEs. First the SQL statement
needs to be compiled with sql\_compile. The statement may take value
parameters and may be a DDL or DML statement, including select, update,
procedure call, table creation etc.

The query\_t returned can be used multiple times on any number of
simultaneous threads. if an application repeatedly performs the same
queries the text can be compiled once and reused at infinitum.

qr\_free will free a query returned by sql\_compile.

    {
      caddr_t err = NULL;
      query_t * qr  = sql_compile ("select * from SYS_USERS", qi_client (qst), &err, 0);
      ...
      if (err)
      exit (-1);
      qr_free (qr);
    }

    caddr_t qr_rec_exec (query_t * qr, client_connection_t * cli,
        local_cursor_t ** lc_ret, query_instance_t * caller, stmt_options_t * opts,
        long n_pars, ...);

Once a query is compiled it can be executed and fetched. This function
executes a query in the context of a VSE. The execution is on behalf of
the same user and in the same transaction as the VSE. This is only
possible in the context of a VSE, not at top level in the main program,
for example.

The first argument is the compiled query to execute. The second is the
client connection, obtained by qi\_client from the qst argument of the
VSE. The lc\_ret, if non NULL will get a be set to a newly allocated
local\_cursor\_t \* that allows fetching rows from the result set. This
only applies to a select statement. The caller is the qst argument of
the VSE, The opts can be NULL. The n\_args is the count of query
parameters, 0 if no parameters are passed.

The return value is an error, suitable for sqlr\_resignal. A NULL value
means success.

It should be double-checked if the query access or potentially may
access any tables or indexes. If it may do this, the VSE must be
described as deadlock-unsafe by calling bif\_set\_uses\_index() after
bif\_define() or bif\_define\_typed(). If qr\_rec\_exec access any
tables or views, and the call of VSE from Virtuoso/PL code is compiled
as deadlock-safe, the whole server may be halted.

If parameters are passed, a group of 3 actual parameters follows for
each ? in the query being executed. In each such group the first is the
name of the parameter, of the form ":n", where n is the position of the
parameter, starting at 0, so ":0" corresponds to the 1st ? and ":11" to
the 12th. The second in the group of 3 is the value, usually a box
pointer. The third is the type, one of QRP\_INT, QRP\_STRING or
QRP\_RAW.

QRP\_INT means that the value will be converted to a box as by box\_num.
QRP\_STRING means that the value will be converted to a string as by
box\_dv\_short\_string. In either case the value is allocated and freed
as part of the execution. QRP\_RAW means that an arbitrary box is passed
as is. If so, this box will be freed in the process and MUST NOT BE
REFERENCED AGAIN in the VSE. if the statement is a select, lc\_ret
should be specified and should be the address of a local\_cursor\_t \*
variable, where the cursor can be returned.

    long lc_next (local_cursor_t * lc);
    caddr_t lc_nth_col (local_cursor_t * lc, int n);
    void lc_free (local_cursor_t * lc);

These functions allow reading through a result set. The local\_cursor\_t
\* must have come from qr\_rec\_exec.

lc\_next will move the cursor one row forward. The first call after the
exec places the cursor on the first row. A 0 return value indicates that
the cursor is at end. if 0 is returned at the first call, the result set
had zero rows. The data member lc\_error may be set and should be
checked after calls to this function. See examples. The value will be
suitable for sqlr\_resignal if copied (box\_copy\_tree).

The lc\_nth\_col returns the value of the nth column of the current row.
The index is 0 based. The value is an arbitrary box pointer and is READ
ONLY, to be copied (box\_copy\_tree) if the application needs to keep it
around. The value will stay readable until the next lc\_next or
lc\_free. Use DV\_TYPE\_OF et al to determine the type of the value.

lc\_free frees the cursor and any resources associated to it. This has
no effect on the transaction.

The bif\_my\_select function returns an array with one element for each
row of the SYS\_KEYS table. The rows are themselves arrays containing
the column values.

<a id="id25-adding-new-languages-and-encodings-into-virtuoso"></a>
## Adding New Languages And Encodings Into Virtuoso

There are too many languages to be able to support them all by default
so Virtuoso is user extensible in this respect. The built-in 'x-any'
language supports most languages to a degree, but it is not the optimum
solution for some specific languages or if you want to perform a words'
normalization to make text search more effective. To make Virtuoso
extensible, language-specific functions are organized into *language
handlers* , and handlers are organized in hierarchical trees. Every
handler contains pointers to such functions as "count words in given
string", "call given callback once for every word in the string" etc.

XML documents and SQL procedures may identify languages by their names,
for example by value of *xml:lang* attribute, `content_language`
argument of built-in functions, or by `__lang` option etc... Every
language handler defines up to two names of the language it supports,
one matching ISO 639 regulations (e.g. 'en'), and one matching RFC 1766
(e.g. 'en-UK'). When Virtuoso finds a match to the language name
specified, it searches through the an internal hash-table. If the name
is unknown, the 'x-any' handler will be returned as a default.

Custom language handlers should contain a pointer to a more generic
handler, e.g. to the handler, Handler may have NULLs stored instead of
pointers to required functions, these NULLs will be replaced with
pointers to generic handler's functions automatically when the custom
handler will be activated.

> **Tip**
> 
> [lh\_get\_handler](#fn_lh_get_handler)
> 
> [lh\_load\_handler](#fn_lh_load_handler)

There are two trees of language handlers in current version of Virtuoso.
"Main" tree starts from 'x-any' root and contains handlers of languages
used in documents, another tree starts from 'x-ftq-x-any' root contains
handlers of Free Text query ('ftq') languages. The difference is in
handling of wildcard characters: query string 'hello, wo\*ld' consists
of two "words", 'hello' and 'wo\*ld', and 'x-ftq-x-any' will properly
locate them, but 'x-any' handler will report three words -- 'hello',
'wo' and 'ld', because it knows nothing about special meaning of '\*' in
query strings. That is why every handler may contain a pointer to a
handler of its own query language.

In addition to plain language handlers, it's possible to add handlers of
"encoded language" They are useful if you have large number of documents
in some particular encoding and speed of free text indexing is critical
for your applications. While usual handlers deal with Unicode data, and
it requires data to be decoded before processing, functions of "encoded
language" handler may accept buffers of encoded text, eliminating
decoding.

> **Tip**
> 
> [elh\_get\_handler](#fn_elh_get_handler)
> 
> [elh\_load\_handler](#fn_elh_load_handler)

The OpenLink Virtuoso Server distribution contains sources of sample
language handler for 'en-UK' language. The difference between 'x-any'
handler and this one is in handling of abbreviations and numbers.
'en-UK' handler will read phrase '$3.54 per sq.inch.' as the sequence of
words '3.54', 'per' and 'sq.inch', instead of sequence '54', 'per', 'sq'
and 'inch' that 'x-any' will read. The generic 'x-any' handler has no
specific rules for dealing with the "decimal point" because in many
scripts "decimal comma" is used, thus '3.54' will be processed as pair
of words '3' and '54', but '3' will be ignored in many cases as noise
word due to its 1-character length.

In addition to the language extension interface, Virtuoso provides an
*eh\_load\_handler* function to add new encodings, but it should be used
solely for multi-character encodings which cannot be supported through
the usual Virtuoso [International Character
Support](#internationalization) . If an encoding was created by the
[CHARSET\_DEFINE](#fn_charset_define) function, Virtuoso can build
special lookup tables for very fast text translation from Unicode to the
encoding, thus you are not likely to gain in performance by writing your
own C code, but some applications will know nothing about your encoding
because they will check only the SYS\_CHARSETS system table.

<a id="id26-vsei-plugins"></a>
# VSEI Plugins

Virtuoso functionality can be enhanced through external libraries by
loading shared objects or DLLs. The new functions are written in a
language of the developer's choice and compiled to produce a shared
library appropriate to the operating system. The path to the shared
library must be declared in the Virtuoso INI file and the server
restarted before it can be used.

The Virtuoso INI file uses a \[Plugins\] configuration section for
listing shared libraries for the server to load upon startup. The layout
is as follows:

    [Plugins]
    LoadPath = <module path> (example : /home/virtuoso/hosting)
    Load1 = <module type>, <module name> (example : hosting_perl.so)
    Load2 = <module type 2>, <module name 2>
    ..
    LoadN = <module type N>, <module name N>

Virtuoso reads the Load1, Load2, ... LoadN lines from the \[Plugins\]
section and attaches them according to their type.

`<module path>` is the directory containing shared modules for use with
Virtuoso. (e.g. `/home/virtuoso/hosting` )

`<module type>` specifies the type of module that is to be loaded, and
hence how Virtuoso is to use it. So far only the "Hosting" type exists.

`<module name>` is the file name of the modules shared library or
object. (e.g. `hosting_perl.so` )

The "Hosting" type defines entry points for initialization of the
runtime hosting environment, destruction of the user environment and
execution of a file or string containing commands in the hosted
language. It also returns a list of file extensions that it is capable
of processing. Virtuoso dynamically defines memory-resident (no disk
image) HTTP server handlers for each specified type. For example, the
Perl hosting plugin supports 'pl' extension. Hence, upon initialization
of the hosting plugin, Virtuoso defines the `__http_handler_pl(..)`
function according to the API for file type handlers in the Virtuoso
HTTP server. With this handler in place, each hit on a .pl file (file
system or WebDAV) with appropriate execute permissions will cause the
HTTP server to execute the code within it and return the result instead
of simple the file contents.

The handler will call the \_\_hosting\_http\_handler VSE with a special
set of parameters to represent the HTTP environment correctly.

There's a VSE to call each of the hosting modules:

`__hosting_http_handler (
in extension

varchar,
in content

varchar,
[in params

varchar, ]
[in lines

any, ]
[inout filename_head_ret

varchar, ]
[in options

any, ]
[out diag_ret

varchar]) returns varchar`

such that:

  - extension  
    Selects plugin by supported extension handler. e.g. pass 'pl' for
    the perl plugin.

  - content  
    If \<filename\_head\_ret\> is NULL or unspecified this will be the
    name of the file containing the code to execute in the hosted
    environment, otherwise this will be program code to execute as a
    string.

  - params  
    (optional) A string containing the HTTP parameters as encoded in the
    HTTP request body.

  - lines  
    (optional) A vector (array) containing the HTTP request headers, in
    the same format as those passed to VSPs.

  - filename\_head\_ret  
    (optional) On input this is the "name" to put on the command text
    passed in \<content\>. If this is NULL it means that \<content\>
    holds the path and filename containing the commands. On output this
    contains the HTTP headers of the HTTP response generated by the
    plugin, if any and in HTTP mode.

  - options  
    (optional) A vector holding name/value pairs of strings passed as
    options to the plugin. The Perl plugin sets the other options as
    environment variables before calling the perl code.
    
    There is a "`__VIRT_CGI` " = "`0` "/"`1` " option to control whether
    the plugin operates in HTTP mode (`__VIRT_CGI=1` ) i.e. implements
    the CGI interface and treats the output as an HTTP response.

  - diag\_ret  
    (optional) Returns various diagnostics messages returned while the
    code is running if any. The perl plugin sets this to the collected
    STDERR messages.

The function will return a varchar containing the HTTP body if in HTTP
mode (`__VIRT_CGI = 1` ) or the messages printed to STDOUT.

Virtuoso will normally call to memory each plugin as required, and expel
it when finished. This behavior can be controlled by the INI file
parameter:

    [HTTPServer]
    PersistentHostingModules = 1/0 default 0

Setting `PersistentHostingModules` to "1" prevents Virtuoso from
removing the interpreters from the HTTP threads after each request.

Executing Perl code directly:

    select __hosting_http_handler ('pl', 'print "hello world"; ', '', vector (), 'helloworld.pl');

    returns : hello world

Executing a perl script file (perl/test\_print.pl in the Virtuoso
working directory):

    /perl/test_print.pl
    -------------------
    #!/usr/bin/perl
    print "hello world file";

    select __hosting_http_handler ('pl', 'perl/test_print.pl');

    returns : hello world file

> **Note**
> 
> The hosting\_perl hosting module uses the perl `tie()` function to
> "tie" up the STDIN, STDOUT, STDERR, exit() and %ENV perl objects.
> Untying any of these may lead to unpredictable results.
