<div id="udthostedforiegnobjects" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.14. Hosted Foreign Objects in Virtuoso

</div>

</div>

</div>

<div id="udtjvmhost" class="section">

<div class="titlepage">

<div>

<div>

#### Java VM Hosted Objects

</div>

</div>

</div>

A special build of Virtuoso hosts a Java VM and allows manipulation of
Java classes through the SQL user defined types.

In order to access the Java class instances they have to be defined as
Virtuoso types using CREATE TYPE and specifying LANGUAGE JAVA. Java
classes have to be in the CLASSPATH of the hosted Java VM.

<div id="ex_jvmhostobj" class="example">

**Example 9.13. Hosted Java Objects**

<div class="example-contents">

Java (Point.java):

``` programlisting
public class Point implements java.io.Serializable
{
  public double x = 0;
  public double y = 0;

  public Point (double new_x, double new_y)
  {
    x = new_x;
    y = new_y;
  }

  public double distance (Point p)
  {
    return Math.sqrt ((p.x - this.x) * (p.x - this.x) + (p.y - this.y) * (p.y - this.y));
  }
}
```

This Java class should be compiled and the corresponding Point.class
should be placed in the hosted VM's classpath. Then a Virtuoso user
defined type should be created as follows:

``` programlisting
create type Point language java external name 'Point'
 as (
  x double precision external name 'x',
    y double precision external name 'y'
)

constructor method Point (new_x double precision, new_y double precision),
method distance (Point p) returns double precision external name 'distance';
```

From now on the SQL Point type can be used to create instances of the
Java Point class, access it's members, call it's methods and store it
into tables (since the Java Point class implements the
`java.io.Serializable` interface).

</div>

</div>

  

For the hosted Java objects a LANGUAGE JAVA should be specified. The
format of EXTERNAL NAME is:

|                                                                     |
|---------------------------------------------------------------------|
| the full name of the Java class for classes (ex. 'java.lang.Class') |
| the name of the methods/instance members                            |

Since Java has static members and the Virtuoso SQL types do not,
Virtuoso allows read-only access to static members through static
observer functions with EXTERNAL VARIABLE NAME instead of EXTERNAL NAME.

<div id="ex_staticmembers" class="example">

**Example 9.14. Static Member Access**

<div class="example-contents">

``` programlisting
java (stat.java) :
public class stat
{
  static stat_m double;
}
```

Virtuoso SQL:

``` programlisting
create type stat language java external name 'stat'
static method observe_stat_m ()
  returns double precision external variable name 'stat_m';
```

</div>

</div>

  

Virtuoso does automatic mapping between the Virtuoso SQL data types and
the Java data types. Since Java data types are much more primitive than
Virtuoso types it is safe to explicitly specify the Java type of an
instance member, method parameter or method return value. This is done
by using the Type Signatures format described in the Java Native
Interface Specification (chapter 3 : JNI Types and Data Structures :
Table 3.2). The signatures are supplied as string values to EXTERNAL
TYPE clause.

To facilitate the creation of the wrapper SQL types Virtuoso uses the
Java Reflection API to get the description of the class in XML form.
This XML is then transformed using an XSL stylesheet to makes the CREATE
TYPE statements required automatically. In the process it preserves the
superclass/subclass relationships of the specified Java classes and
represents them as a supertypes/subtypes in SQL. The
<a href="fn_jvm_ref_import.html" class="link"
title="jvm_ref_import"><code
class="function">jvm_ref_import()</code></a> procedure is used to create
the XML by calling the Java Reflection API.

The function
<a href="fn_import_jar.html" class="link" title="import_jar"><code
class="function">import_jar()</code></a> takes the same parameters as
`jvm_ref_import()` but will automatically create and execute the create
type statements within the Virtuoso server.

<div id="id33088" class="table">

**Table 9.2. Java Type to Virtuoso Type Conversions**

<div class="table-contents">

| Java Type/Class  | Virtuoso Internal Type |
|------------------|------------------------|
| boolean          | smallint               |
| byte             | smallint               |
| char             | smallint               |
| short            | integer                |
| int              | integer                |
| long             | integer                |
| float            | real                   |
| double           | double precision       |
| byte\[\]         | binary                 |
| java.lang.String | NVARCHAR               |
| java.util.Date   | DATETIME               |
| \[\]             | vector                 |

</div>

</div>

  

<div id="id33132" class="table">

**Table 9.3. Virtuoso Type to Java Type Conversions**

<div class="table-contents">

| Virtuoso Internal Type | Java Type/Class  |
|------------------------|------------------|
| smallint               | short            |
| integer                | integer          |
| real                   | float            |
| double precision       | double           |
| varchar                | java.lang.String |
| nvarchar               | java.lang.String |
| datetime               | java.util.Date   |
| timestamp              | java.util.Date   |
| binary                 | byte\[\]         |

</div>

</div>

  

For all the other types encountered in the signatures of the Java
methods/members it makes a forward reference to a Virtuoso/PL user
defined type based on the java class name, replacing the dot ('.') with
the underscore ('\_') character.

For example:

`'java.lang.System'` becomes `'java_lang_System'`

In order to correctly map a java superclass/subclass relationship
between class A and class B when importing, it is necessary to include
A, B and all the intermediate classes in the superclass/subclass chain
in a single `import_jar()` call.

To implement serialization/deserialization for Java object the Virtuoso
needs the \_\_virt_helper Java class. This class contains utility
functions implementing serialization/deserialization. This class must be
in the CLASSPATH.

The Java VM hosted inside the Virtuoso binary is not started at startup,
but when first needed. It's startup is marked by a message in the
Virtuoso log file. An application can control the initialization of the
Java VM by explicitly initializing the Java VM (preferably on server
startup) by calling the VSE:
<a href="fn_java_vm_attach.html" class="link"
title="java_vm_attach"><code
class="function">java_vm_attach()</code></a>

</div>

<div id="udtclrhosted" class="section">

<div class="titlepage">

<div>

<div>

#### CLR Hosted Objects

</div>

</div>

</div>

A special virtuoso build is available to allow SQL types integration
with the CLR (Common Language Runtime) on Windows. This is achieved by
providing COM server in C# (virtclr.dll) that is called from the native
code through COM.

The virtclr.dll library should be registered into the CLR's Global
assembly cache.

The semantics of CLR hosted objects are largely the same as those
described for Java hosted objects. As before, native objects need SQL
Type wrappers, but with LANGUAGE CLR clause specified.

To automatically create the SQL Type wrappers based on the CLR
Reflection API the Virtuoso CLR binary has a system stored procedure:
<a href="fn_import_clr.html" class="link" title="import_clr"><code
class="function">import_clr()</code></a>

There are three forms for specifying the EXTERNAL NAME of a CLR class:

<div class="itemizedlist">

- a\) `<Assembly public name>/<namespace-prefixed-class-name>` Here the
  Virtuoso CLR host issues Assembly.Load with `<Assembly public name>`
  to find the assembly. After finding it, it looks for
  `<namespace-prefixed-class-name>` in it.

- b\) `<namespace-prefixed-class-name>` Here the Virtuoso CLR host
  issues Assembly.Load with `<namespace-prefixed-class-name>` . After
  finding it, it looks for `<namespace-prefixed-class-name>` in it.

- c\) `<path-to-the-assembly-binary>/<namespace-prefixed-class-name>`
  Here the Virtuoso CLR host issues Assembly.LoadFrom with
  `<path-to-the-assembly-binary>` . After finding it, it looks for
  `<namespace-prefixed-class-name>` in it.

</div>

The Virtuoso CLR host does the above when creating an instance of the
type, accessing static methods or properties.

However when it deserializes an serialized CLR instance it calls the CLR
deserialization class BinaryFormatter. The BinaryFormatter.Deserialize
calls internally Assembly.Load to find the serialized class description.
So although the classes defined with EXTERNAL name as in c) above are
otherwise accessible (and serializable) they will possibly not
deserialize correctly (as the assembly binary may not be findable
through the Assembly.Load). To avoid that CLR limitation it is advisable
to use the EXTERNAL NAME forms a) and b) wherever possible.

The Assembly.Load process of finding Assemblies is very well documented
on the <a
href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpguide/html/cpconhowruntimelocatesassemblies.asp"
class="ulink" target="_top">MSDN</a> . Note that if an assembly was
loaded through Assembly.LoadFrom it is not considered as "already
loaded" by the Assembly.Load. The Virtuoso CLR is a CLR runtime host. As
such it can use the normal CLR configuration files. It also is able of
using private assemblies.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | The <a href="createassembly.html" class="link"                    
                              title="11.10. CREATE ASSEMBLY Syntax - External Libraries">Create  
                              Assembly</a> Syntax                                                |

</div>

</div>

<div id="udtaspxhosting" class="section">

<div class="titlepage">

<div>

<div>

#### ASPX Hosting Using the Hosted CLR

</div>

</div>

</div>

Virtuoso CLR hosting allows ASPX pages to be executed through the
Virtuoso HTTP server inside the hosted CLR Virtual machine. To enable
this support an additional library (virt_http.dll) needs to be
registered with the Global Assembly cache. Having achieve this and
copying ASPX project files under the Virtuoso HTTP server's root allows
direct execution of the ASPX page. See the sample ASPX pages in the
Virtuoso distribution.

If the ASPX project files reside in a WebDAV directory they are copied
into a temporary file system directory under a special temporary
directory (configurable by the TempASPXDir INI parameter in
\[HTTPServer\] section of <a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">virtuoso ini</a> file) before
executed. In order to be execute correctly from WebDAV the ASPX files
should have Execute WebDAV permission set them. The execution of ASPX is
also controlled by the EnableDavVSP INI parameter in the \[HTTPServer\]
as with any active content within WebDAV.

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
href="rthwritaspxapps.html" class="link"
title="14.5. Deploying ASP.Net Web Applications">Deploying ASP.Net Web
Applications</a></p>
<p>Runtime Hosting</p></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="udtaspxhostexprsdeps" class="section">

<div class="titlepage">

<div>

<div>

#### Expressing Hosted Language Supertype/Subtype Dependencies With Virtuoso/PL User-Defined-Types

</div>

</div>

</div>

It is also possible to represent the tree or in-part of Java or the
CLR's superclass/subclass hierarchy with Virtuoso user defined type
mappings.

Consider the following sample Java code:

``` programlisting
class g1 { public int g1_value; public int mtd_g1 (int x) { return g1_value; } };
class g2 extends g1 { public int g2_value; public int mtd_g2 (int x) { return g2_value; } };
class g3 extends g2 { public int g3_value; };
class g2_sib extends g1 { public int g2_sib_value; };

class uses_types {
  public static g3 mtd (int x) { return new g3 (); }
}
```

One can create SQL user defined types for `g1` , `g2` and `g3` to
represent the `g1` /`g2` / `g3` Java class hierarchy if calling `mtd_g1`
and `mtd_g2` is needed:

``` programlisting
create type sql_g1 language java external name 'g1' as (
    g1_value int)
method mtd_g1 (x integer) returns integer;

create type sql_g2 under sql_g1 language java external name 'g2' as (
    g2_value int)
method mtd_g2 (x integer) returns integer;

create type sql_g3 under sql_g2 language java external name 'g3' as (
    g3_value int)
method mtd_g3 (x integer) returns integer;

create type uses_types language java external name 'uses_types'
 static method mtd (x integer) returns sql_g3;
```

provided with the above, one can call `uses_types.g3 ()` method and call
`mtd_g1 ()` on the returned instance in Virtuoso/PL as follows:

``` programlisting
select uses_types::mtd (12).mtd_g1 (10);
```

Sometimes it is not desirable or necessary to mirror the full
supertype/subtype hierarchy from Java to Virtuoso/PL.

For the above example only `sql_g2` and `sql_g3` can be defined if the
goal was to call `mtd_g2()` instead of `mtd_g1()` .

When creating instances of the Virtuoso/PL user defined types to
represent the data returned by the hosted code, Virtuoso tries to find
the closest common ancestor of the hosted instance's class and the ones
defined in Virtuoso as user defined types.

For example if in the above example a Java function returns an instance
of `g3` and there is a `sql_g3` defined inside virtuoso the `g3` Java
instance will be wrapped into an `sql_g3` Virtuoso/PL instance. Note
that that will not depend on the presence or absence of `sql_g1` and
`sql_g2` definitions - i.e. Virtuoso will favor the exact match.

If, however `sql_g3` is not defined, but `sql_g2` and `sql_g1` are, then
the `g3` instance will be wrapped up in an `sql_g2` instance when
returned.

Similarly, if an instance of the `g2_sib` is to be returned in
Virtuoso/PL and `sql_g1` to `sql_g3` are defined, Virtuoso will wrap the
`g2_sib` Java instance into an `sql_g1` SQL instance.

</div>

</div>
