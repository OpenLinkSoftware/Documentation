<div id="fn_import_clr" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

import_clr — This function automatically creates the SQL Type wrappers
based on the CLR Reflection API.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_import_clr" class="funcsynopsis">

|                            |                                  |
|----------------------------|----------------------------------|
| `any `**`import_clr`**` (` | in `assemblies_vector ` any ,    |
|                            | in `classes_vector ` any ,       |
|                            | in `security_mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_import_clr" class="refsect1">

## Description

This function automatically creates the SQL Type wrappers based on the
CLR Reflection API.

</div>

<div id="params_import_clr" class="refsect1">

## Parameters

<div id="id93934" class="refsect2">

### assemblies_vector

a vector of assembly names (as VARCHAR) to look into (or null).

</div>

<div id="id93937" class="refsect2">

### classes_vector

a vector of type names to create SQL type wrappers for (or null to mark
all the types in the assemblies specified by assemblies_vector. In that
case the `assemblies_vector ` cannot be NULL).

</div>

<div id="id93941" class="refsect2">

### security_mode

This optional parameter defines the access mode as follows:

|                                                                          |
|--------------------------------------------------------------------------|
| <span class="emphasis">*0* </span> - restricted (default if unspecified) |
| <span class="emphasis">*1* </span> - unrestricted                        |

</div>

</div>

<div id="examples_import_clr" class="refsect1">

## Examples

<div id="ex_import_clr" class="example">

**Example 24.186. Importing a Class**

<div class="example-contents">

Here is a simple C# program that we can import and use with Virtuoso.
This example requires that you are running Virtuoso with CLR support.

Using a text editor create a C# source file in the server root directory
called sanity.cs, with the following contents:

``` programlisting
using System;

public class sanity
{
    public static string test(string  name) {
       return "Hello "+ name + ", from Virtuoso";
    }
}
```

This sample needs to be compiled into bytecode assembly before it can be
used. Use a command prompt that is suitably set up to find .NET
utilities in its path, the .NET Framework SDK installation provides a
shortcut in the Start menu to a command prompt that is preconfigured.
From the command prompt change directory to the Virtuoso server root
containing the C# source file. Execute:

``` programlisting
C:\Program Files\OpenLink\Virtuoso 3.0\bin>csc /target:library sanity.cs
Microsoft (R) Visual C# .NET Compiler version 7.00.9466
for Microsoft (R) .NET Framework version 1.0.3705
Copyright (C) Microsoft Corporation 2001. All rights reserved.
```

Now this library must be introduce to the Virtuoso Server. Using ISQL
use the following commands to test the CLR:

``` programlisting
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
```

Congratulations, you have proven that your Virtuoso server can run .NET
classes.

</div>

</div>

  

</div>

<div id="seealso_import_clr" class="refsect1">

## See Also

<a href="ch-runtimehosting.html" class="link"
title="Chapter 18. Runtime Hosting">The Runtime Hosting Chapter</a>

<a href="fn_unimport_clr.html" class="link"
title="unimport_clr">unimport_clr</a>

</div>

</div>
