<div id="jvmapisecurity" class="section">

<div class="titlepage">

<div>

<div>

### 18.4.6. Java Security

</div>

</div>

</div>

Java classes are hosted in one of two modes:

|              |
|--------------|
| Restricted   |
| Unrestricted |

Java class Permissions are managed by security classes that fall into
categories as follows listed with it managing class:

|                                               |
|-----------------------------------------------|
| File - java.io.FilePermission                 |
| Socket - java.net.SocketPermission            |
| Net - java.net.NetPermission                  |
| Security - java.security.SecurityPermission   |
| Runtime - java.lang.RuntimePermission         |
| Property - java.util.PropertyPermission       |
| AWT - java.awt.AWTPermission                  |
| Reflect - java.lang.reflect.ReflectPermission |
| Serializable - java.io.SerializablePermission |

Restricted classes are not allowed any of the above privileges. Virtuoso
returns errors that are returned by the security manager if breaches in
security are attempted by a hosted Java class.

By default all Java classes are imported/created/hosted in restricted
mode. To create Java class based user defined types that are
unrestricted you need to use create type syntax with UNRESTRICTED
keyword. The
<a href="fn_import_jar.html" class="link" title="import_jar"><code
class="function">import_jar()</code></a> function can also be used to
import classes, its third optional parameter can be used to define the
security mode.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                          |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                    |
|                              | New behavior since Virtuoso 3.2 provides these two security modes defaulting to restricted. Prior to this Java classes were hosted in unrestricted mode. |

</div>

<div id="ex_javasecurity" class="example">

**Example 18.1. Java Security**

<div class="example-contents">

The class Write_file, shown below, will attempt to write to a file on
the file system. This class will be used to create a user defined type
first in unrestricted mode and then in restricted mode to demonstrate
how security exceptions are returned.

Source of Write_file.java:

``` programlisting
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
```

Create the unrestricted type:

``` programlisting
create type "Write_file" language JAVA external name 'Write_file'
  unrestricted METHOD "write" ()
  returns nvarchar external type 'Ljava/lang/String;' external name 'write';
```

Test calling the method:

``` programlisting
SQL> select new Write_file().write();
callret
NVARCHAR
_________________________________________

OK
```

Now we want to recreate the type in restricted mode, remembering to drop
it first:

``` programlisting
drop type DB.DBA.write_file;

create type "Write_file" language JAVA external name 'Write_file'
  METHOD "write" ()
  returns nvarchar external type 'Ljava/lang/String;' external name 'write';
```

Test calling the method:

``` programlisting
SQL> select new Write_file().write();

*** Error 42000: [Virtuoso Driver][Virtuoso Server]JV001: Java exception
occurred : java.security.AccessControlException : access denied
(java.io.FilePermission foo write)
in  __udt_method_call:(BIF),
<Top Level>
at line 1 of Top-Level:
select new Write_file().write()
```

Another way to import the above class is by use the `import_jar()` such
as:

``` programlisting
import_jar (NULL, 'Write_file', 1) - will import java classes in unrestricted mode.
import_jar (NULL, 'Write_file') - will import java classes in restricted mode.
```

</div>

</div>

  

</div>
