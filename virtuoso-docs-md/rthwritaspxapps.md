<div id="rthwritaspxapps" class="section">

<div class="titlepage">

<div>

<div>

## 14.5. Deploying ASP.Net Web Applications

</div>

</div>

</div>

Virtuoso is a CLR host. It is responsible for initializing the runtime,
defining the application domain (its runtime boundaries, security
settings, etc), and executing user code within such domains. Windows can
be used as the development platform, a very developer friendly
environment with a rich set of tools, but you will not be restricted to
Windows, .NET and IIS to run the assemblies produced. Where .NET is not
readily available or desired Virtuoso contains Mono, an open source
re-implementation of Microsoft .NET, a vehicle taking .NET
cross-platform.

The CLR run-time is a part of the Virtuoso process. The Mono run time
may be run either as in-process or as out-of-process. Hosted
applications can make use of the regular Virtuoso .Net data provider to
access Virtuoso SQL data and procedures. Microsoft ASPX files can also
be run directly from Virtuoso either from the file system or WebDAV.
Each of these capabilities releases you from the Microsoft platforms
without compromising your development platform.

The Virtuoso CLR hosting is implemented using the VSEI.

<div class="figure-float">

<div id="http_handler_aspx" class="figure">

**Figure 14.16. The HTTP ASP.Net handler**

<div class="figure-contents">

<div class="mediaobject">

![The HTTP ASP.Net handler](images/http_handler_aspx.jpg)

</div>

</div>

</div>

  

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
<td style="text-align: left;" data-valign="top"><p><a
href="rthclr.html#rthclrenvsetdotnet" class="link"
title="18.2.1. Environment Setup">CLR Host Environment Setup</a></p>
<p><a href="cinterface.html" class="link"
title="18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)">VSEI</a></p>
<p><a href="inprocess.html" class="link"
title="7.6. Virtuoso In-Process Client">In-Process Data Access
Client</a></p></td>
</tr>
</tbody>
</table>

</div>

<div id="rthprogramming" class="section">

<div class="titlepage">

<div>

<div>

### 14.5.1. Programming Concepts

</div>

</div>

</div>

ASP.Net Web Forms are divided into two sections: the user interface and
the application logic. The user interface comprises HTML markup and
ASP.Net web controls whereas the application logic contains all the
programming code that allows the controls to interact with themselves
and the server back-end. This provides the level of abstractions
required for dynamic efficient Web application design. The interface can
be altered without any backward or forward dependence on the code
(logic). The Web Form interface should be created with the .aspx
extension. The application logic can be contained in-line within the
ASPX application, but developers should strive to keep the code in a
separate location known as the "CodeBehind". This is a file that
contains the logic (code) for the Web Form which should end in an
extension appropriate for the programming language used, such as .vb for
Visual Basic or .cs for C#. The CodeBehind can be written in any
language for which there is a .Net compiler for. The compiler generates
bytecode that can be deployed anywhere the .Net runtime exists.

The ASPX Web Form is compiled into an object that takes its place on a
tree of controls and classes. The CodeBehind is compiled into an object
on this tree when the page is requested. The Web Form must inherit from
a "base-class" defined in the CodeBehind class file.

<div class="figure-float">

<div id="rthwriteaspx001" class="figure">

**Figure 14.17. ASPX Web Form class hierarchy**

<div class="figure-contents">

<div class="mediaobject">

![ASPX Web Form class hierarchy](images/rth/writeaspx001.jpg)

</div>

</div>

</div>

  

</div>

Now we will create a new Web Form containing an HTML heading and an
ASP.Net DataGrid control that will display results from the local
Virtuoso server.

<div id="ex_virttest.aspx" class="example">

**Example 14.50. Sample .Net Web Application: VirtTest.aspx**

<div class="example-contents">

``` programlisting
<%@ Page Language="vb" Inherits="VirtTest" Src="VirtTest.aspx.vb" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
    <head>
        <title>Virtuoso Provider to DataGrid in VB</title>
    </head>
    <body>
    <h1>Simple VB Virtuoso DataBinding Demo</h1>
        <form
xml:id="form1" method="post" runat="server">
            <asp:DataGrid id=DataGrid1 runat="server" DataMember="Customers"
                BorderColor="silver"
                BorderWidth="1"
                CellPadding="2"
                Font-Name="Tahoma"
                Font-Size="10pt">
              <HeaderStyle BackColor="#2222ff" ForeColor="yellow"/>
              <PagerStyle Mode="NextPrev" />
            </asp:DataGrid>
        </form>
    <hr>
    </body>
</html>
```

</div>

</div>

  

On the first line of the file we use the `@ page` directive to inherit
the CodeBehind class we will create in the CodeBehind file. The source
of which can be optionally declared here with the `Src=` attribute.
Visual Studio makes use of `CodeBehind=` for tracking associated source
code instead. If either of these two attributes are specified then the
.Net runtime will attempt to compile the code into an assembly (DLL)
upon first execution if it does not already exist or seems out-of-date.
The following code fragment is the CodeBehind, VirtTest.aspx.vb.

Now we want some logic behind the Web Form. We have placed a DataGrid
control on a web page but we need to supply data to it now:

<div id="ex_virttest.aspx.vb" class="example">

**Example 14.51. Sample .Net Web Application CodeBehind:
VirtTest.aspx.vb**

<div class="example-contents">

``` programlisting
imports System
imports System.Web
imports System.Web.UI
imports System.Web.UI.WebControls
imports System.Web.UI.HtmlControls
imports System.Data

imports OpenLink.Data.VirtuosoClient

Public Class VirtTest
    Inherits Page

    Protected WithEvents myConnection As OpenLink.Data.VirtuosoClient.VirtuosoConnection
    Protected WithEvents myCommand As OpenLink.Data.VirtuosoClient.VirtuosoDataAdapter
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents ds As System.Data.DataSet

    Private Sub Page_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim myConnection As new VirtuosoConnection("HOST=noodle:1112;UID=dba;PWD=dba;Database=Demo")
        Dim myCommand As new VirtuosoDataAdapter("select * from Demo..Customers", myConnection)

        Dim ds As new DataSet()
        myCommand.Fill(ds, "Customers")

        DataGrid1.DataSource=ds.Tables("Customers")
        DataGrid1.DataBind()

    End Sub

End Class
```

</div>

</div>

  

This file is compiled using the following command (split across lines
for readability and would otherwise all be on one line):

``` programlisting
E:\myweb\myapp>
  vbc /target:library
    /r:System.dll
    /r: System.Web.dll
    /r:System.Data.dll
    /r:OpenLink.Data.VirtuosoClient.dll
    /r:System.Xml.dll
    /out:bin\VirtTest.dll
    VirtTest.aspx.vb
```

Once compiled, the resulting DLL library should be in the bin
subdirectory of the application root. When the assembly is available in
this way the .aspx file does not need to contain the `Src=` attribute
since there will be no need to compile the CodeBehind. If the `Src=`
attribute is specified in the .aspx file but the CodeBehind file is not
located on the server then an error will be signalled indicating that a
required resource cannot be found, because the CodeBehind class is
compiled on demand.

</div>

</div>
