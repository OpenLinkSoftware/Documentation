<div id="fn_wsdl_import_udt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

WSDL_IMPORT_UDT — Returns a string containing a UDT definition

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_wsdl_import_udt" class="funcsynopsis">

|                                     |                     |
|-------------------------------------|---------------------|
| `varchar `**`WSDL_IMPORT_UDT`**` (` | in `url ` varchar , |
|                                     | in `f ` varchar ,   |
|                                     | in `exec ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_wsdl_import_udt" class="refsect1">

## Description

This function is used to create a user defined type (UDT) definition
automatically based on a WSDL file. The source WSDL is supplied via a
URL.

The returned definition can be saved to a file and/or executed
automatically to provide instant access to the new UDT.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                            |
|:----------------------------:|:-----------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                      |
|                              | To save the file you must have an appropriate ACL defined. |

</div>

</div>

<div id="params_wsdl_import_udt" class="refsect1">

## Parameters

<div id="id119282" class="refsect2">

### url

The URI of the target WSDL file to build a UDT definition of.

</div>

<div id="id119285" class="refsect2">

### f

The name of the file if the definition is to be saved. This will produce
a file on the file system under the server root directory.

The default value is NULL, which will not create a file.

</div>

<div id="id119289" class="refsect2">

### exec

This flag indicates whether the definition should be immediately
executed upon import. This takes the form of 0 or 1. The default value
of 0 will not execute the definition.

</div>

</div>

<div id="ret_wsdl_import_udt" class="refsect1">

## Return Types

This function returns the text of the UDT definition as a varchar.

</div>

<div id="examples_wsdl_import_udt" class="refsect1">

## Examples

<div id="ex_wsdl_import_udt" class="example">

**Example 24.451. Simple example of a WSDL driven UDT**

<div class="example-contents">

Web Service proxy wrapper for Redcoal SMS SOAP interface:

``` programlisting
SQL> WSDL_IMPORT_UDT ('http://xml.redcoal.com/soapserver.dll/wsdl/ISoapServer', 'redcoal.sql');
```

This will create the following file on file system called `redcoal.sql`
:

``` screen
-- Automatically generated code
-- imported from WSDL URI: "http://xml.redcoal.com/soapserver.dll/wsdl/ISoapServer"
-- UDT class
drop type "ISOAPServerservice"
;

create type "ISOAPServerservice"
  as
    (
      debug int default 0,
      url varchar default 'http://xml.redcoal.com/soapserver.dll/soap/ISoapServer',
      request varchar,
      response varchar
    )
-- Binding: "http://tempuri.org/:ISOAPServerbinding"

method "SendTextSMS"
       (
        "strInSerialNo" any,
        "strInSMSKey" any,
        "strInRecipients" any,
        "strInMessageText" any,
        "strInReplyEmail" any,
        "strInOriginator" any,
        "iInType" any,
        "strOutMessageIDs" any,
        "return" any
       ) returns any,

.... more methods follows ; do not supplied for brevity

method "RedWebServiceVersion"
       (
        "return" any
       ) returns any,

method style () returns any
;

-- Methods

create method "SendTextSMS"
       (
        in "strInSerialNo" any,
        in "strInSMSKey" any,
        in "strInRecipients" any,
        in "strInMessageText" any,
        in "strInReplyEmail" any,
        in "strInOriginator" any,
        in "iInType" any,
        inout "strOutMessageIDs" any,
        out "return" any
       ) for "ISOAPServerservice"
{
  declare action, namespace, enc varchar;
  declare style int;
  declare _result, _body, xe any;
  action := 'urn:SOAPServerImpl-ISOAPServer#SendTextSMS';

  namespace := 'urn:SOAPServerImpl-ISOAPServer';

  style := 0;

  if (self.debug)
    style := style + 2;
  _result := SOAP_CLIENT (
            url=>self.url,
        operation=>'SendTextSMS',
        soap_action=>action,
            target_namespace=>namespace,
        parameters=>vector
    (
     vector('strInSerialNo', 'http://www.w3.org/2001/XMLSchema:string'), "strInSerialNo" ,
     vector('strInSMSKey', 'http://www.w3.org/2001/XMLSchema:string'), "strInSMSKey" ,
     vector('strInRecipients', 'http://www.w3.org/2001/XMLSchema:string'), "strInRecipients" ,
     vector('strInMessageText', 'http://www.w3.org/2001/XMLSchema:string'), "strInMessageText" ,
     vector('strInReplyEmail', 'http://www.w3.org/2001/XMLSchema:string'), "strInReplyEmail" ,
     vector('strInOriginator', 'http://www.w3.org/2001/XMLSchema:string'), "strInOriginator" ,
     vector('iInType', 'http://www.w3.org/2001/XMLSchema:int'), "iInType" ,
     vector('strOutMessageIDs', 'http://www.w3.org/2001/XMLSchema:string'), "strOutMessageIDs"
    ),
        style=>style
               );
  if (self.debug)
    {
      _body := _result[0];
      self.request := _result[1];
      self.response := _result[2];
    }
  else
    _body := _result;
  xe := xml_cut (xml_tree_doc (_body));
  "strOutMessageIDs" := xml_cut (xpath_eval ('//strOutMessageIDs', xe, 1));
  "strOutMessageIDs" := soap_box_xml_entity_validating ("strOutMessageIDs",
    'http://www.w3.org/2001/XMLSchema:string', 0);
  "return" := xml_cut (xpath_eval ('//return', xe, 1));
  "return" := soap_box_xml_entity_validating ("return", 'http://www.w3.org/2001/XMLSchema:int', 0);

  return _result;
}
;

.... more method definitions follows ; not supplied for brevity

create method "RedWebServiceVersion"
       (
        out "return" any
       ) for "ISOAPServerservice"
{
  declare action, namespace, enc varchar;
  declare style int;
  declare _result, _body, xe any;
  action := 'urn:SOAPServerImpl-ISOAPServer#RedWebServiceVersion';

  namespace := 'urn:SOAPServerImpl-ISOAPServer';

  style := 0;

  if (self.debug)
    style := style + 2;
  _result := SOAP_CLIENT (
            url=>self.url,
        operation=>'RedWebServiceVersion',
        soap_action=>action,
            target_namespace=>namespace,
        parameters=>vector
                        (

            ),
        style=>style
               );
  if (self.debug)
    {
      _body := _result[0];
      self.request := _result[1];
      self.response := _result[2];
    }
  else
    _body := _result;
  xe := xml_cut (xml_tree_doc (_body));
  "return" := xml_cut (xpath_eval ('//return', xe, 1));
  "return" := soap_box_xml_entity_validating ("return",
    'http://www.w3.org/2001/XMLSchema:string', 0);

  return _result;
}
;
```

This script, executed via the ISQL tool, or automatically if the 'exec'
flag is set to 'true', will define the desired UDT in database.
Developing a simple application for checking the Redcoal SMS SOAP
interface could be done as follows using a stored procedure:

``` screen
create procedure
redcoaltest ()
{
  declare svc "ISOAPServerservice";
  declare res nvarchar;
  svc := new "ISOAPServerservice" ();
  svc."RedWebServiceVersion" (res);
  result_names (res);
  result (res);
}
;
```

Which could have the following output:

``` screen
SQL> redcoaltest();
res
NVARCHAR
____________________________________________

5.0

1 Rows. -- 1974 msec.
```

</div>

</div>

  

</div>

<div id="seealso_wsdl_import_udt" class="refsect1">

## See Also

The <a href="udtcnsmsoap.html" class="link"
title="9.2.16. Consuming Third-Party SOAP Services via User Defined Types">???</a>
section.

</div>

</div>
