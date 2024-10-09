<div>

<div>

<div>

<div>

## 17.13. Exposing Persistent Stored Modules as Web Services

</div>

</div>

</div>

Virtuoso SQL stored procedures and functions can be exposed as SOAP
services very simply from Virtuoso, whether they are native Virtuoso or
on remote data sources. This powerful ability means that any database
servers already existing within an organization can easily become a
component in an eBusiness solution using Virtuoso. All you need is a few
simple steps that typically take mere minutes to complete:

<div>

- **Choose your stored procedure(s) . ** The procedures that you want to
  expose can either be native Virtuoso stored procedures, or remote
  stored procedures that can be linked in using the Remote Procedures
  user interface.

- **Choose a virtual directory . ** Because SOAP services need to be
  exposed and accessed via HTTP a Virtuoso virtual directory must be
  used. Either use the existing SOAP virtual directory or create a new
  one.

- **Publish procedures to virtual directory . ** The user specified as
  SOAP account on the virtual directory must have execute privileges on
  the procedures. Use the Publish options on the virtual directory user
  interface.

- **Test the VSMX output . ** Once procedures have been published as
  SOAP services they are automatically described by WSDL and testable
  using Virtuoso's VSMX feature.

</div>

XML Query Templates provide a direct way to store SQL in an XML file on
the Virtuoso server that when executed, i.e. fetched from a web browser,
actually returns the results of the query.

The C Interface chapter describes how users can define custom built-in
functions, from C or other programming languages, that can be used from
within Virtuoso PL. This also means that VSE's can also be published as
a Web Service!

<div>

<div>

<div>

<div>

### 17.13.1. Publishing Stored Procedures as Web Services

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Choosing Stored Procedures to Expose

</div>

</div>

</div>

You can either expose native Virtuoso stored procedures (previously
defined or newly created) using the CREATE PROCEDURE statement, or
stored procedures from other database types can be linked into Virtuoso
using an ODBC datasource.

Virtuoso lists available stored procedures for each catalog in Conductor
under: <span class="emphasis">*/Database/External Data Sources/External
Linked Objects / with checked "Stored Procedures"*</span> .

To link a stored procedure from another database system we must first
create a valid data source that leads to a connection to that database.
Once verified proceed to the Remote Procedures page. Select the "Link
objects" link for a data source.

<div>

<div>

**Figure 17.53. Linking Procedures from Remote Data Sources**

<div>

<div>

![Linking Procedures from Remote Data
Sources](images/ui/admrmtprocs001.png)

</div>

</div>

</div>

  

</div>

Select the check-box "Store Procedures". Click the "Apply" button. As
result will be shown the list of available procedures.

<div>

<div>

**Figure 17.54. Linking Procedures from Remote Datasources**

<div>

<div>

![Linking Procedures from Remote
Datasources](images/ui/admrmtprocs002.png)

</div>

</div>

</div>

  

</div>

Select the check-boxes for the procedures you want to link and click the
"Link" button.

<div>

<div>

**Figure 17.55. Linking Procedures from Remote Datasources**

<div>

<div>

![Linking Procedures from Remote
Datasources](images/ui/admrmtprocs003.png)

</div>

</div>

</div>

  

</div>

You will be presented with a new page listing the chosen procedures and
their data type information. This gives you an opportunity to alter the
data type mappings that Virtuoso will use both internally and for any
future interactions with the SOAP server. If you do not want to specify
any special type information the details can be left as default.

<div>

<div>

**Figure 17.56. Linking Procedures from Remote Datasources**

<div>

<div>

![Linking Procedures from Remote
Datasources](images/ui/admrmtprocs004.png)

</div>

</div>

</div>

  

</div>

For each remote procedure you may change how they will be referenced
within Virtuoso by making changes to the fields for
<span class="emphasis">*Catalog*</span> ,
<span class="emphasis">*Owner*</span> , <span class="emphasis">*Link
as*</span> , and <span class="emphasis">*Description*</span> fields.
These fields define how you will find the linked procedure locally to
Virtuoso only and do not affect the remote data source.

For each procedure there is an option to <span class="emphasis">*PL
Wrapper Requirement*</span> . This option is required if your remote
procedure is capable of returning a resultset that you want to process
via Virtuoso. Can be <span class="emphasis">*SOAP Execution*</span> ,
<span class="emphasis">*SQL Execution*</span> or
<span class="emphasis">*None*</span> . Also you can specify
<span class="emphasis">*Return Type*</span> ,
<span class="emphasis">*Data Type*</span> , <span class="emphasis">*SOAP
Type*</span> .

Once the details are correct press the "Link" button.

<div>

|                            |                                                         |
|:--------------------------:|:--------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                               |
|                            | <a href="dbadmin.html#remoteprocedures" class="link"    
                              title="Remote Procedures">Linking Remote Procedures</a>  |

</div>

</div>

<div>

<div>

<div>

<div>

#### Defining Virtual Directories

</div>

</div>

</div>

Before any procedures native or linked can be exposed as SOAP Services a
location in HTTP space must be defined. From Conductor
<span class="emphasis">*Web Application Server/Virtual Domains &
Directories*</span> you make a new URL Mappings. Click on the
<span class="emphasis">*New Directory*</span> link for the {Default Web
Site} line to begin defining a new SOAP mapping.

<div>

<div>

**Figure 17.57. Virtual Directories**

<div>

<div>

![Virtual Directories](images/ui/admvirtdir001.png)

</div>

</div>

</div>

  

</div>

Select for "Type" from the list the value "SOAP access point" and click
the "Next" button.

<div>

<div>

**Figure 17.58. Virtual Directories Mappings**

<div>

<div>

![Virtual Directories Mappings](images/ui/admvirtdir003.png)

</div>

</div>

</div>

  

</div>

You will then be presented with the following tabs: "Virtual Directory
Information", "Authentication", "Web Service Option", "WS Security" and
"Publish Objects". Particular options to note are "Virtual Directory
Information" and "Publish Objects".

<div>

<div>

**Figure 17.59. Virtual Directories**

<div>

<div>

![Virtual Directories](images/ui/admvirtdir004.png)

</div>

</div>

</div>

  

</div>

In <span class="emphasis">*Publish Objects* </span> you can select
Virtuoso stored procedures, or remotely linked procedures to be
published as SOAP web services. Also you can publish Pl Modules, User
Defined Types, or Saved Queries.

<div>

<div>

**Figure 17.60. Publish Objects**

<div>

<div>

![Publish Objects](images/ui/admvirtdir005.png)

</div>

</div>

</div>

  

</div>

<div>

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="admui.internetdomains.html#httpvirtualdirs" class="link" 
                              title="HTTP Virtual Directories">Virtual Directories</a>           |

</div>

</div>

<div>

<div>

<div>

<div>

#### Publishing Procedures to a Virtual Directory

</div>

</div>

</div>

If you already have a virtual directory defined and know what procedures
you want to expose as web services you will have to repeat some of the
steps in the section above. From Conductor go to
<span class="emphasis">*Web Application Server/Virtual Domains &
Directories*</span> . Click on the "folder" icon for your {Default Web
Site}. You will find the list of previously existing mappings, from
which you can select the mapping that you want to edit by pressing on
its <span class="emphasis">*Edit*</span> link. Note, the virtual
directory should have type "SOAP".

<div>

<div>

**Figure 17.61. Virtual Directories**

<div>

<div>

![Virtual Directories](images/ui/admvirtdir006.png)

</div>

</div>

</div>

  

</div>

Go to tab "publish Objects" to expose/hide your procedures, Pl Modules,
User Defined Types and Saved Queries.

<div>

<div>

**Figure 17.62. Publish Objects**

<div>

<div>

![Publish Objects](images/ui/admvirtdir008.png)

</div>

</div>

</div>

  

</div>

The "Procedures" tab presents the list of available procedures. You can
select a catalogue in order to list the procedures you want to publish.
When the procedures to be published are selected, you can either click
the "Publish Selected" button, or before this to click the "Edit
Description" button.

<div>

<div>

**Figure 17.63. Choosing Procedure aPublish**

<div>

<div>

![Choosing Procedure aPublish](images/ui/admvirtdir007.png)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

#### Testing SOAP Services Using VSMX

</div>

</div>

</div>

Virtual directory definitions have a <span class="emphasis">*Logical
Path* </span> field, which is reference in URL to find the correct SOAP
services. If you connect to Virtuoso on
<span class="emphasis">*http://example.com/*</span> , and defined your
virtual directory with the logical path of
<span class="emphasis">*/mysoap*</span> then you will be able to test
the following URLs:

|                                         |
|-----------------------------------------|
| http://example.com/mysoap/services.wsdl |
| http://example.com/mysoap/services.vsmx |

<div>

<div>

**Figure 17.64. Services.wsdl**

<div>

<div>

![Services.wsdl](images/ui/admvirtdir009.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 17.65. Services.vsmx**

<div>

<div>

![Services.vsmx](images/ui/admvirtdir010.png)

</div>

</div>

</div>

  

</div>

The WSDL description is a standards-based description of the Web
Services available from /mysoap. The VSMX page is a Virtuoso generated
test page allowing you to test SOAP services. This feature should
improve your development time.

<div>

|                            |                                                                                                                                                                                      |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                                                            |
|                            | <a href="vsmx.html" class="link"                                                                                                                                                     
                              title="17.14. Testing Web Published Web Services">VSMX</a> ; <a href="ch-functions.html#soap" class="link">SOAP</a> ; <a href="wsdl.html" class="link" title="17.2. WSDL">WSDL</a> .  |

</div>

</div>

</div>

</div>
