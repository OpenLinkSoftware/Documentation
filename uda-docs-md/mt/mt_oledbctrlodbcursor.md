<div id="mt_oledbctrlodbcursor" class="section">

<div class="titlepage">

<div>

<div>

## 5.4. Controlling ODBC Cursor Library Usage

</div>

</div>

</div>

The OpenLink ODBC Provider requires that the underlying ODBC driver
supports some form of scrollable cursor. In order to support OLE DB
rowsets, the minimum scrolling functionality requirements include:

|                             |
|-----------------------------|
| bookmark support            |
| absolute cursor positioning |
| backwards scrolling         |

Keyset driven and static cursors both support this functionality. All
OpenLink ODBC drivers support these cursor models. However, if the
OpenLink ODBC provider is to be used with a third party driver, either
the driver must support one of these cursor types natively, or the
Microsoft ODBC Cursor Library must be used. The latter only supports
static scrollable cursors, but provides sufficient functionality to
allow third party drivers to be used with the OpenLink provider. When
using an OpenLink ODBC driver, it is preferable not to use the Microsoft
Cursor Library.

To control how the OpenLink Provider uses the ODBC Cursor Library, the
provider supports the provider specific keyword “Cursors” in the
‘Extended Properties’ property string. The keyword can be set to one of
three values:

|          |
|----------|
| ODBC     |
| Driver   |
| IfNeeded |

The meaning of each of these values is analogous to their ODBC
counterpart SQL_CUR_USE_xxx. The default setting is Cursors=IfNeeded.

The table below lists the required ‘Cursors’ setting for various ODBC
drivers when used with the OpenLink ODBC Provider.

<div id="id4147" class="decimalstyle">

**Table 5.1. Features Comparison**

<div class="decimalstyle-contents">

| ODBC Driver                        | Cursor                       | Comments                                                                                          |
|:-----------------------------------|------------------------------|---------------------------------------------------------------------------------------------------|
| All OpenLink ODBC drivers          | Driver or IfNeeded (default) | The native scrollable cursor support in the OpenLink drivers provides the necessary functionality |
| Native Microsoft SQL Server driver | ODBC                         | The native scrollable cursor support is inadequate.                                               |

</div>

</div>

  

</div>
