<div id="ch-runtimehosting" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 18. Runtime Hosting

</div>

<div>

<div class="abstract">

**Abstract**

Virtuoso can be extended by in-process hosting of a number of different
run time environments. This includes: Microsoft's .NET CLR (CLR), the
Mono ECMA-CLI (Mono), and the Java Virtual Machine (JVM). Thus, you can
create persistent stored modules, SQL functions, and user defined data
types using any Microsoft .NET or Mono bound language, Java, and
traditional languages such as 'C'/C++.

Objects provided by hosted run times, such as Java and CLR can be
directly and transparently accessed from SQL. This also means that
application logic in any hosted language can be exposed as a web
service. By offering a choice of hosted run times in a cross platform
setting, Virtuoso adds a new degree of freedom for the application
designer. Applications can now be developed and deployed on either
Windows, Linux or Unix, can be written in Java or any .net CLR bound
language and can talk to any database via Virtuoso's virtual databasing
capabilities.

The Virtuoso Server Extension Interface (VSEI) provides C interfaces and
hooks that enable developers to write external functionality that can be
bolted on the side of Virtuoso and called as SQL functions.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">18.1. [Runtime
Environments](ch-runtimehosting.html#rthactivation)</span>

<span class="section">18.2. [CLR, .Net & ASPX Host](rthclr.html)</span>

<span class="section">18.2.1. [Environment
Setup](rthclr.html#rthclrenvsetdotnet)</span>

<span class="section">18.2.2. [Testing the Virtuoso .NET Runtime
Environment](rthclrdotnettest.html)</span>

<span class="section">18.3. [CLR & Mono](rthclrmono.html)</span>

<span class="section">18.3.1. [Environment
Setup](rthclrmono.html#rthclrenvsetmono)</span>

<span class="section">18.3.2. [Testing the Virtuoso Mono Runtime
Environment](rthclrmonotest.html)</span>

<span class="section">18.4. [Embedded Java VM
API](javaextvm.html)</span>

<span class="section">18.4.1. [Correspondence Between Virtuoso & Java VM
Threads](javaextvm.html#virtvsjvmthreads)</span>

<span class="section">18.4.2. [Virtuoso/PL \<-\> Java VM Type Mapping
Schema](virtpljvmtypemapp.html)</span>

<span class="section">18.4.3. [References to Java VM Class Instances in
Virtuoso/PL](referencestojvminvpl.html)</span>

<span class="section">18.4.4. [Specifying the Correct Java Type When
Passing Values from Virtuoso/PL](correctjavatype.html)</span>

<span class="section">18.4.5. [Virtuoso Java PL API
VSEs](virtjavabifs.html)</span>

<span class="section">18.4.6. [Java
Security](jvmapisecurity.html)</span>

<span class="section">18.5. [Virtuoso Server Extension Interface (VSEI)
(C Interface)](cinterface.html)</span>

<span class="section">18.5.1. [Virtuoso Server Extension Interface
(VSEI)](cinterface.html#writingsqlcallablecfuncs)</span>

<span class="section">18.5.2. [SQL Run Time
Objects](sqlruntimeobjects.html)</span>

<span class="section">18.5.3. [Memory Management
Rules](memmanrules.html)</span>

<span class="section">18.5.4. [Server Main
Function](servermainfunction.html)</span>

<span class="section">18.5.5. [Compiling &
Linking](compilingandlinking.html)</span>

<span class="section">18.5.6. [Functions by
Category](funcsbycat.html)</span>

<span class="section">18.5.7. [VSEI Definition](bifdefs.html)</span>

<span class="section">18.5.8. [SQL Exceptions](sqlexception.html)</span>

<span class="section">18.5.9. [Executing SQL](execingsql.html)</span>

<span class="section">18.5.10. [Adding New Languages And Encodings Into
Virtuoso](langfuncapi.html)</span>

<span class="section">18.6. [VSEI Plugins](vseplugins.html)</span>

</div>

<div id="rthactivation" class="section">

<div class="titlepage">

<div>

<div>

## 18.1. Runtime Environments

</div>

</div>

</div>

The Virtuoso server in its standard build is a single executable. To
allow for external customizations based on VSEs the Virtuoso server
engine becomes a callable library, the main function is re-written to
incorporate other libraries and a new executable is created. For
example, a Virtuoso server that contains PHP support under Windows
consists of:

``` programlisting
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

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                          |
|                              | If Virtuoso is starting as a system service then the SYSTEM PATH must be altered as opposed to the USER PATH. The USER PATH is appropriate to alter if Virtuoso is being started as that user, usually when in debug/foreground mode. This is applicable to any required environment variables, not just PATH. |

</div>

Hosted environments that require SQL access back to the database can
make use of the in-process client mechanism. Hosted Runtimes such as PHP
and ASP .Net would ordinarily use an RPC based (ODBC) connection. To
improve the efficiency of the system, keeping it all in-process, a
special connection can be made with no alteration to the API used in the
code for communication.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                            |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                  |
|                            | The <a href="inprocess.html" class="link"                                                                                  
                              title="7.6. Virtuoso In-Process Client">In-Process Client</a> keeps connections within Virtuoso avoiding unnecessary RPCs.  |

</div>

</div>

</div>
