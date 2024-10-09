<div>

<div>

<div>

<div>

## 7.5. OLE DB Provider for Virtuoso

</div>

</div>

</div>

OLE DB is an open data access technology developed and promoted by
Microsoft. It allows for uniform data access across diverse data sources
including but not limited to conventional RDBMSes. Based on the COM
architecture it provides very flexible and exhaustive set of interfaces
any database application developer might ever need. At the same time,
OLE DB is somewhat overcomplicated and therefore is rarely used
directly. In the majority of cases people use ADO(+) instead, ADO is
another, somewhat simpler, of Microsoft's data access technologies.
However, ADO itself is based upon OLE DB, thus those who use ADO make
indirect use of OLE DB as well.

With the advent of ADO.NET, OLE DB is no longer as an much essential
part of the overall Microsoft data access architecture as it used to be.
However it still remains important and useful working together with the
Microsoft OLE DB .NET Data Provider.

The OLE DB Provider for Virtuoso (VIRTOLEDB) gives OLE DB and ADO
applications access to the Virtuoso databases. In principle, the same
thing is possible through the conjunction of the Virtuoso ODBC driver
and Microsoft OLE DB Provider for ODBC. However, VIRTOLEDB provides
native OLE DB access which is more complete and more efficient.
Therefore it is preferable for this purpose.

<div>

<div>

<div>

<div>

### 7.5.1. Using the OLE DB Provider for Virtuoso

</div>

</div>

</div>

Being a COM in-process server VIRTOLEDB has to be installed on the
client computer. When VIRTOLEDB is properly installed it can be used by
a host of existing applications thanks to the support of standard OLE DB
interfaces.

<div>

<div>

<div>

<div>

#### System Requirements

</div>

</div>

</div>

VIRTOLEDB requires the following software:

<div>

- Windows 98, ME, NT4.0, 2000, or XP.

- Virtuoso Server running on the same or remote computer.

- Redistributable files provided with Microsoft Data Access Components
  (MDAC) 2.5 or higher. Note that this version of MDAC comes along with
  Windows 2000. It is also available (as well as other versions of MDAC)
  at the Microsoft Web site:
  <a href="http://www.microsoft.com/data/" class="ulink"
  target="_top">http://www.microsoft.com/data/</a>

</div>

</div>

<div>

<div>

<div>

<div>

#### Installing the Provider

</div>

</div>

</div>

VIRTOLEDB is installed as a part of Virtuoso installation on a Windows
platform. The following files pertain to the OLE DB Provider for
Virtuoso.

<div>

**Table 7.17. OLE DB Provider for Virtuoso Files**

<div>

| File          | Description                                         |
|---------------|-----------------------------------------------------|
| virtoledb.dll | DLL that implements the VIRTOLEDB provider.         |
| virtoledb.h   | Header file for development of VIRTOLEDB consumers. |

</div>

</div>

  

The installation procedure, in addition to placing VIRTOLEDB files on a
client computer, also registers VIRTOLEDB in the system to make it known
as a COM server. This also makes it available through the OLE DB root
enumerator object and the Data Links component.

</div>

<div>

<div>

<div>

<div>

#### Invoking the Provider

</div>

</div>

</div>

Applications that utilize OLE DB Data Links component can use VIRTOLEDB
without any specific measures. Applications that need to directly invoke
VIRTOLEDB should follow examples provided in this section.

<div>

<div>

<div>

<div>

##### Using Data Link User Interface

</div>

</div>

</div>

Data Links is a user interface component for connecting to OLE DB data
sources and constructing ADO-style connection strings. It belongs to OLE
DB core components and is a part of MDAC. It is used my many
applications including development environments like MS Visual Studio.

VIRTOLEDB uses the extension mechanism of the Data Link API and provides
a customized version of the Data Link connection page.

<div>

<div>

**Figure 7.33. Data Link Provider Page**

<div>

<div>

![Data Link Provider Page](images/datalinkprovider.jpg)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 7.34. Data Link Connection Page**

<div>

<div>

![Data Link Connection Page](images/datalinkvirtuosoconnection.jpg)

</div>

</div>

</div>

  

</div>

</div>

<div>

<div>

<div>

<div>

##### Using COM and OLE DB Interfaces Directly

</div>

</div>

</div>

Applications that utilize OLE DB Data Links component can use VIRTOLEDB
without any specific measures. Applications that need to directly invoke
VIRTOLEDB should follow examples provided in this section.

<div>

``` programlisting
#define INITGUID
#include "virtoledb.h"

..

  IDBInitialize* pIDBInitialize = NULL;
  HRESULT hr = CoCreateInstance(CLSID_VIRTOLEDB, NULL, CLSCTX_INPROC_SERVER,
                                IID_IDBInitialize, (void**) &pIDBInitialize);
  if (FAILED(hr))
    goto EXIT;
```

</div>

</div>

<div>

<div>

<div>

<div>

##### ADO Applications

</div>

</div>

</div>

<div>

``` programlisting
Dim strConn As String
Dim objConn As ADODB.Connection

strConn = "Provider=VIRTOLEDB;Data Source=localhost:1111;User Id=dba;Password=dba;Initial Catalog=Demo;Prompt=NoPrompt;"

Set objConn = New ADODB.Connection
objConn.CursorLocation = adUseServer
objConn.Open strConn
```

</div>

</div>

</div>

</div>

</div>
