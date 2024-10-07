<div id="rthaspvsmono" class="section">

<div class="titlepage">

<div>

<div>

### 14.5.3. The Mono Project

</div>

</div>

</div>

The Mono Project is an open source version of the Microsoft.NET
development platform. Incorporating key .NET compliant components,
including a C# compiler, a Common Language Runtime just-in-time
compiler, and a full suite of class libraries, the Mono Project will
enable developers to create .NET applications and run them on Windows or
any Mono-supported platform. Besides greatly improving the efficiency of
development in the open source world, the Mono Project will allow the
creation of operating-system-independent programs. Although primarily
developed on Linux, Mono is being ported to as many operating systems as
possible.

Microsoft.NET development tools, which include the C# compiler and
Common Language Infrastructure (CLI), let programs written in C# and
other languages run on non-Windows operating systems. The Mono Project
development platform provides open source developers with a true "build
once, deploy anywhere" tool-set taking advantage of the myriad of
services enabled by Microsoft.NET.

The Mono Project will provide three key elements in a development
framework designed to allow developers to quickly create, deploy and run
.NET compatible applications on non-Windows platform. A C# compiler
extending the GNOME development platform will allow Linux developers to
create .NET compatible applications. These developers will also be able
to build upon a complete implementation of class libraries compatible
with the Microsoft CLI, enabling developers to create end-user
applications as well as powerful web services using the database
functionality available on open source systems. Portation of Mono yields
versions of the Microsoft Common Language Run-Time (CLR) just-in-time
(JIT) run-time engine will allow non-Windows systems to run .NET
applications built on Windows, Linux or UNIX platforms.

The example in the previous section can be run using the CLR hosting
ability of Virtuoso, but only with the precompiled assembly which has to
be deployed into the Mono/lib directory of the Mono installation.

The Virtuoso installer on non-Windows platforms for which there is a
port of Mono available installs the latest Mono CLR. This is required
for the Virtuoso server to host .Net applications on non-Windows
platforms.

Only a compiler for C#. Inline ASPX code using C# is a safe way to write
and experience ASPX hosted from Virtuoso. Although this goes completely
against the programming practice guidelines for .Net

The only permissible Application Domain is the Mono application. ASP.Net
applications should have their own self containable Application Domain -
the ./bin directory. Mono does not support this as of yet. The work
around is to place all assemblies into the Mono domain.

</div>
