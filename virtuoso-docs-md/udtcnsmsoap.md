<div id="udtcnsmsoap" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.16. Consuming Third-Party SOAP Services via User Defined Types

</div>

</div>

</div>

Virtuoso provides function for acting as a SOAP client called
<a href="fn_soap_client.html" class="link" title="soap_client"><code
class="function">SOAP_CLIENT()</code></a> . Embedding SOAP Web Service
methods in Virtuoso/PL procedures using this function, however, is not
suitable in most cases, especially if the services contained a large
number of parameters of different type, the procedure could become very
complex, the encoding may also vary. Thus direct SOAP_CLIENT()
invocation in some cases in non-trivial and may lead to errors that are
hard to debug.

To aid development of Web based applications written in PL that use the
SOAP protocol, Virtuoso introduces two new approaches for consuming a
Web service:

|                                                                  |
|------------------------------------------------------------------|
| generate SOAP proxy wrappers encapsulated in a PL Module         |
| generate a User Defined Type (UDT) for SOAP proxy encapsulation. |

Please note that both methods of making a SOAP proxy-wrapper requires a
WSDL description. If some SOAP service does not have a corresponding
WSDL, neither of these methods can be used.

The first approach can be achieved using the SOAP_WSDL_IMPORT()
function. This will make a PL module utilizing the SOAP_CLIENT()
function that will import the complex types and pass appropriate
parameters. But it has one significant problem in that it will return
the result as a parsed XML entity. The result should then be processed
in the application code, which requires prior knowledge of the return
parameters.

The second approach consists of creating a UDT encapsulation of the SOAP
wrappers using the <a href="fn_wsdl_import_udt.html" class="link"
title="wsdl_import_udt"><code class="function">WSDL_IMPORT_UDT()</code>
.</a>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>The <a
href="fn_soap_wsdl_import.html" class="link"
title="soap_wsdl_import"><code
class="function">SOAP_WSDL_IMPORT()</code></a> function.</p>
<p>The <a href="fn_wsdl_import_udt.html" class="link"
title="wsdl_import_udt"><code
class="function">WSDL_IMPORT_UDT()</code></a> function.</p></td>
</tr>
</tbody>
</table>

</div>

The import function `WSDL_IMPORT_UDT()` has two phases:

|                                                                                   |
|-----------------------------------------------------------------------------------|
| retrieve and expand the WSDL file (expansion will be done if import is specified) |
| compile the result and make SQL script with UDT definition                        |

The following points will hold true for this method of SOAP
encapsulation:

<div class="itemizedlist">

- Any XML Schema types, required for calling the target SOAP service
  will be imported in database.

- A UDT will be created for each service defined within the WSDL
  description.

- The UDT will have members: url, request, response, and debug.

  <div class="itemizedlist">

  - the 'url' member designate the endpoint for SOAP invocation

  - debug is a flag to manage wrappers to return wire dumps if needed

  - request and response members will contain wire dumps if 'debug' is
    equal to 'true' (integer 1).

  </div>

- for each method defined in the WSDL description there will be UDT's
  method.

- each method of UDT will contain:

  <div class="itemizedlist">

  - a number IN/OUT/INOUT parameters (depending on the target method)

  - no return value, SOAP does not define explicitly return values.

  - call to the SOAP_CLIENT () function with appropriate arguments

  - XPATH over the result and transform with SOAP validation functions
    to ensure value of OUT and INOUT parameters.

  </div>

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                                                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                                                                                                                                                                 |
|                            | The Virtuoso Administration Interface provides a web based interface for importing WSDL definitions and creating UDTs and procedures. This can be found in the <a href="admui.webservices.html#admiui.wsdl" class="link" 
                              title="Import WSDL">Visual Server Administration Interface</a> Chapter.                                                                                                                                                   |

</div>

</div>
