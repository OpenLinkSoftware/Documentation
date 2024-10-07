<div id="rthclrmonotest" class="section">

<div class="titlepage">

<div>

<div>

### 18.3.2. Testing the Virtuoso Mono Runtime Environment

</div>

</div>

</div>

To test that you have successfully started the Virtuoso server with Mono
CLR runtime support make a simple library, import the contained class
into Virtuoso and call it.

Using an text editor create a C# source file in the server root
directory called sanity.cs, with the following contents:

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
used. Make sure you environment is configured to use Mono, change
directory to the Virtuoso server root containing the C# source file.
Run:

``` programlisting
bash$ mcs /target:library sanity.cs
Compilation succeeded
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
classes via Mono Runtime.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                                                                     |
|:--------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                                                           |
|                            | The Virtuoso Tutorials, which are installed with the Demo Virtuoso Server (port 1112), contains numerous samples further demonstrating the use of the CLR, .NET, Mono and Virtuoso. |

</div>

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

</div>
