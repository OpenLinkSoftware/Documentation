<div id="xmlrpc" class="section">

<div class="titlepage">

<div>

<div>

## 17.10. XML-RPC support

</div>

</div>

</div>

The XML-RPC is a remote procedure calling system via HTTP using XML as
the encoding. It is very much like the SOAP protocol, but the data
encoding rules are different. XML-RPC supports fewer data types than
SOAP. The data is self-describing and position bound.

The Virtuoso SOAP server can process XML-RPC requests using the XML-RPC
to SOAP bridge. This is done with two filters : input and output filter.
The input filter transforms XML-RPC into a SOAP PRC encoded message.
Then the transformed message is passed to the SOAP server for
processing. The response from the SOAP server will be re-coded into
XML-RPC format in the output filter. The combination of these filters
constitutes the bridge.

It is important to remember that XML-RPC defines two complex types :
array and structure. These two types are represented by vector () and
soap-structure respectively, when passing the data to the PL procedure
in question.

<div id="ex_xmlrpc" class="example">

**Example 17.37. XML-RPC Procedure Definition**

<div class="example-contents">

An example of a PL procedure representing an XML-RPC method
"echoXRtypes" is:

``` programlisting
create procedure echoXRtypes (
                                in  inInteger   integer,
                                in  inString    varchar,
                                in  inDate  datetime,
                                in  inDouble    double precision,
                in  inBoolean   smallint,
                in  inHex   varchar,
                                out outInteger  integer,
                                out outString   varchar,
                                out outDate     datetime,
                                out outDouble   double precision,
                out outBoolean  smallint,
                out outHex  varchar __soap_type 'http://www.w3.org/2001/XMLSchema:base64Binary'
                )
{
    outInteger  := inInteger    ;
    outString   := inString     ;
    outDate     := inDate   ;
    outDouble   := inDouble     ;
    outBoolean  := soap_boolean (inBoolean);
    outHex  := inHex    ;
}
;
```

Note that the definition of such procedures does not differ from those
of SOAP procedures.

An XML-RPC request may look like:

``` programlisting
<?xml version="1.0"?>
<methodCall>
<methodName>echoXRtypes</methodName>
<params>
  <param> <value><i4>42</i4></value> </param>
  <param> <value>String</value> </param>
  <param> <value><dateTime.iso8601>1998-07-17T14:08:55</dateTime.iso8601></value> </param>
  <param> <value><double>1234.567</double></value> </param>
  <param> <value><boolean>1</boolean></value> </param>
  <param> <value><base64>eW91IGNhbid0IHJlYWQgdGhpcyE=</base64></value> </param>
</params>
</methodCall>
```

The response for the above message will be :

``` programlisting
<?xml version="1.0" encoding="ISO-8859-1" ?>
<methodResponse>
<params>
<param> <value> <i4>42</i4> </value> </param>
<param> <value> <string>String</string> </value> </param>
<param> <value> <dateTime.iso8601>1998-07-17T14:08:55.000+03:00</dateTime.iso8601> </value> </param>
<param> <value> <double>1234.567000</double> </value> </param>
<param> <value> <boolean>1</boolean> </value> </param>
<param> <value> <base64>eW91IGNhbid0IHJlYWQgdGhpcyE=</base64> </value> </param>
</params>
</methodResponse>
```

</div>

</div>

  

Enabling the XML-RPC -\> SOAP bridge is very simple. You make a virtual
directory with physical location pointing to /SOAP/ and specify the
'XML-RPC' SOAP option as 'yes'. The following methods are available:

<div class="orderedlist">

1.  **Virtual Directories Visual Administration Interface . ** From the
    main administration menu go to `Web Servers -> Virtual Directories`
    and add or configure a virtual directory. For the directory
    definition add a new option in SOAP options box: " `XML-RPC=yes; `
    ".

2.  **The vhost_define() Function . ** Using the ISQL utility one can
    use the command:

    ``` programlisting
    SQL> vhost_define (lpath=>'/RPC2', ppath=>'/SOAP/', soap_user=>'dba',
        soap_opts=>vector ('XML-RPC', 'yes'));
    ```

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                    |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                              |
|                              | Virtual directories configured in this way can only be used for XML-RPC calls. If you need to make SOAP requests, then another virtual directory will be required. |

</div>

</div>
