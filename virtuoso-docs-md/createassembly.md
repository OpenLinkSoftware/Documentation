<div id="createassembly" class="section">

<div class="titlepage">

<div>

<div>

## 11.10. CREATE ASSEMBLY Syntax - External Libraries

</div>

</div>

</div>

External CLR libraries can be hosted inside Virtuoso by creating an
assembly from the library itself using the syntax as follows:

``` programlisting
CREATE ASSEMBLY <assembly_name> FROM <assembly_location>
  [WITH PERMISSION_SET = <perm>] [WITH AUTOREGISTER];
```

|                                                                                                             |
|-------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*assembly_name*</span> - is how Virtuoso will reference the library.                 |
| <span class="emphasis">*assembly_location*</span> - is where Virtuoso will find the library within the CLR. |

Every .NET assembly deployed inside Virtuoso will be verifiable, which
means it will contain code the CLR can verify to be safe in the way it
writes to memory.

Virtuoso also respects the Common Language Runtime's code access
security model. By default, code does not have any permissions to create
a graphical user interface, create threads, access the file system, or
call unmanaged code. The only permissions implemented are those granted
for in-process data access.

Administrators will control the permissions granted to assemblies using
a standard .NET machine and user-level security policy. At runtime, any
code accessing protected resources produces a stack walk that triggers a
permissions check against that code and any code that called it.

To simplify security administration, Virtuoso supports these standard
permission sets for .NET assemblies:

|                                                                                                                                                                                                                                                   |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*SAFE*</span> - This is the default permission set. It allows internal computation and data access. There is no access to resources outside of Virtuoso. Calls to unmanaged code are not allowed. Code must be verifiable. |
| <span class="emphasis">*UNRESTRICTED*</span> - Code can access any resource. Only system administrators (dba group/role) can run unrestricted code. This level allows calls to unmanaged code, and can be unverifiable.                           |

The restricted assemblies (SAFE mode) are not permitted to execute any
code that infringes upon any of the following permissions:

|                               |
|-------------------------------|
| AspNetHostingPermission       |
| EnvironmentPermission         |
| FileIOPermission              |
| IsolatedStoragePermission     |
| ReflectionPermission          |
| RegistryPermission            |
| SecurityPermission            |
| SocketPermission              |
| WebPermissionPermission       |
| DNSPermission                 |
| PrintingPermission            |
| OleDBPermissionPermission     |
| SqlClientPermissionPermission |
| EventLogPermission            |
| MessageQueuePermission        |
| ServiceControllerPermission   |
| PerformanceCountersPermission |
| DirectoryServicePermission    |

If the assembly generates a security exception the error text will be
returned to the client.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                              |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                        |
|                              | Currently on the Microsoft .Net Framework implementation supports permission sets. Virtuoso does not currently support the `EXTERNAL_ACCESS` permission set. |

</div>

<span class="emphasis">*WITH AUTOREGISTER*</span> marks the assembly as
a stored procedure, trigger, user-defined function, etc., based on
custom attributes you add to your .NET code.

Assemblies are stored in the database and are therefore backed-up and
restored with the data. Once assemblies are registered using the
`CREATE ASSEMBLY` syntax there will be no further dependency on the
library file (dll or exe) itself.

You can remove assemblies using the familiar SQL DROP statement:

``` programlisting
DROP ASSEMBLY <assembly_name>;
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                           |
|:--------------------------:|:------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                 |
|                            | <a href="fn_import_clr.html" class="link" 
                              title="import_clr">import_clr()</a>        |

</div>

<div id="ex_createassembly" class="example">

**Example 11.3. Working with assemblies**

<div class="example-contents">

This example is based on the tutorial HO_S_10. we start by obtaining a
C# library compile from the following code (included in the tutorial):

``` programlisting
using System;

[Serializable]
public class Point_10
{
  public Double x;
  public Double y;

  public Point_10 ()
    {
      x = 0;
      y = 0;
    }
  public Point_10 (Double new_x, Double new_y)
    {
      x = new_x;
      y = new_y;
    }

  public Double distance (Point_10 p)
    {
      Double ret;

      ret =  Math.Sqrt ((p.x - this.x) * (p.x - this.x) + (p.y - this.y) * (p.y - this.y));

      return ret;
    }
}
```

This gives us the Point_10 class with two constructors and one method
for finding the distance between two points.

Now we must create the library reference in Virtuoso using the
following:

``` programlisting
DROP ASSEMBLY "myPoint";

CREATE ASSEMBLY "myPoint" as concat (http_root() , '\\tutorial\\hosting\\ho_s_10\\Point_ho_s_10.dll')
  WITH PERMISSION_SET = SAFE WITH AUTOREGISTER;
```

Now for a quick test, we will find the distance between two points:

``` programlisting
SQL> select new Point_10(0,0).distance(Point_10(3,4));
callret
DOUBLE PRECISION
_______________________________________________________

               5
```

Now we will create a table with a column of type Point_10 and then
insert some test data:

``` programlisting
drop table CLR..Supplier_ho_s_10;

create table CLR..Supplier_ho_s_10 (id integer primary key, name varchar (20), location Point_10);

insert into CLR..Supplier_ho_s_10 (id, name, location) values (1, 'S1', new Point_10 (1, 1));
insert into CLR..Supplier_ho_s_10 (id, name, location) values (2, 'S2', new Point_10 (3, 3));
insert into CLR..Supplier_ho_s_10 (id, name, location) values (3, 'S3', new Point_10 (5, 5));
```

Now we will demonstrate how this assembly's class can be used in SQL by
showing some queries on the sample data:

``` programlisting
SQL> select name, s.location.x from CLR..Supplier_ho_s_10 s;
name                  callret
VARCHAR               DOUBLE PRECISION
_______________________________________________________________________________

S1                                   1
S2                                   3
S3                                   5
```

The distances from (0, 0):

``` programlisting
SQL> select name, s.location.distance(Point_10(0,0)) from CLR..Supplier_ho_s_10 s ;
name                  callret
VARCHAR               DOUBLE PRECISION
_______________________________________________________________________________

S1                    1.414213562373095
S2                    4.242640687119285
S3                    7.071067811865476
```

Now, the points that are more than 3 units away from it:

``` programlisting
SQL> select name from CLR..Supplier_ho_s_10 s where s.location.distance(Point_10(0,0)) > 3;
name
VARCHAR
_______________________________________________________________________________

S2
S3
```

</div>

</div>

  

<div id="ex_createassembly2" class="example">

**Example 11.4. Using CREATE ASSEMBLY**

<div class="example-contents">

This example demonstrates the creation of trivial CLR classes and
referencing them from Virtuoso.

<div class="itemizedlist">

- <span class="emphasis">*lib.cs*</span>

  ``` programlisting
  namespace lib
  {
    public class t1
    {
       public static int addit (int a1, int a2) { return a1 + a2; }
    }
  }
  ```

- <span class="emphasis">*exe.cs*</span>

  ``` programlisting
  using lib;

  public class exe
  {
     public static int call_addit (int a1, int a2)
     {
        return t1.addit (a1, a2);
     }

     public static void Main (String [] args)
     {
        Console.WriteLine ("result=" + call_addit (12, 13));
     }
  }
  ```

- <span class="emphasis">*compilation*</span>

  ``` programlisting
  csc /t:library lib.cs
  csc /r:lib.dll exe.cs
  ```

- <span class="emphasis">*Now Virtuoso can use*</span>

  ``` programlisting
  create assembly sql_lib from 'c:\sample\lib.dll'
  create assembly sql_exe from 'c:\sample\exe.exe'
  ```

</div>

</div>

</div>

  

<div id="ex_ctasspermset" class="example">

**Example 11.5. Creating Assemblies with Permission Sets**

<div class="example-contents">

These examples will use an assembly called test.dll, whose source code
is:

``` programlisting
using System;
using System.IO;

public class Sample
{
   public static String GetEnv ()
     {
       return Environment.GetEnvironmentVariable("PATH");
     }
}
```

The assembly will be registered using:

``` programlisting
CREATE ASSEMBLY "test" from 'test.dll' WITH PERMISSION_SET = SAFE WITH AUTOREGISTER;
```

and subsequently called using:

``` programlisting
SQL> select Sample::GetEnv ();
```

returning the following error for attempting to exceed the SAFE
permission set.

``` programlisting
*** Error 42000: [Virtuoso Driver][Virtuoso Server]CLR05: Request for the permission of type System.Security.Permissions.EnvironmentPermission,
      mscorlib, Version=1.0.3300.0, Culture=neutral, PublicKeyToken=b77a5c561934e089 failed.
in
__udt_method_call:(BIF),
<Top Level>
at line 4 of Top-Level:
select Sample::GetEnv ()
```

Now we can try the same sample using PERMISSION_SET = UNRESTRICTED.

``` programlisting
drop ASSEMBLY "test";

CREATE ASSEMBLY "test" from 'test.dll' WITH PERMISSION_SET = UNRESTRICTED WITH AUTOREGISTER;

SQL> select Sample::GetEnv ();
callret
VARCHAR
_______________________________________________________________________________

D:\Virtuoso\bin...;

1 Rows. -- 32 msec.
<
```

Unrestricted assemblies do not have any restrictions on usage.

</div>

</div>

  

</div>
