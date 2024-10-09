<div>

<div>

<div>

<div>

## 18.3. CLR & Mono

</div>

</div>

</div>

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
language which works on the CLR; a compiler for the C# language.

Windows has compilers that target the virtual machine from a number of
languages: Managed C++, JavaScript, Eiffel, Component Pascal, APL,
Cobol, Perl, Python, Ruby, Scheme, Smalltalk, Standard ML, Haskell,
Mercury and Oberon. A single object system, threading system, class
libraries, and garbage collection system can be shared across all these
languages, the CLR.

The CLR and the Common Type System (CTS) enables applications and
libraries to be written in a collection of different languages that
target the CLR byte code. This means that you could define a class to do
algebraic manipulation written in C#, that class can be reused from any
other language that supports the CLI. You could create a class in C#,
subclass it in C++ and instantiate it in an Eiffel program.

<div>

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
<td style="text-align: left;" data-valign="top"><p>The <a
href="createassembly.html" class="link"
title="11.10. CREATE ASSEMBLY Syntax - External Libraries">Create
Assembly</a> Syntax</p>
<p>The External Hosted <a href="createassembly.html" class="link"
title="11.10. CREATE ASSEMBLY Syntax - External Libraries">Create
PROCEDURE</a> Syntax</p></td>
</tr>
</tbody>
</table>

</div>

<div>

<div>

<div>

<div>

### 18.3.1. Environment Setup

</div>

</div>

</div>

Ximian announced the launch of the Mono project, an effort to create an
open source implementation of the .NET Development Framework.

Follow the steps below to configure the CLR runtime environment with
Virtuoso:

<div>

1.  **Install Mono. ** The Mono package is available from the
    <a href="http://www.go-mono.com/" class="ulink" target="_top">Mono
    project home page</a> in the form of an RPM for Linux. The source is
    also available.

2.  **Make mscorlib.dll available to /usr/local/lib. ** The mscorlib.dll
    is installed by Mono and needs to be symlinked from its default
    location to `/usr/local/lib` .

</div>

</div>

</div>
