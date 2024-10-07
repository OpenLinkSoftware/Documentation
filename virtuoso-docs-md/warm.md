<div id="warm" class="section">

<div class="titlepage">

<div>

<div>

## 17.7. Web Services Reliable Messaging Protocol (WS-ReliableMessaging)

</div>

</div>

</div>

The WS-ReliableMessaging protocol is a SOAP-based RPC protocol for
guaranteed delivery of messages; possibly in specific order from one
sender to one receiver. Such messages are usual SOAP messages - XML
documents conforming to the SOAP specification. The Sender is an alias
of the transmission initiator, i.e. the originator of the message
transfer. The Receiver is a recipient, that which accepts the messages.
How accepted messages should be processed is not covered in this
document.; What to do with the data and whether to send replies is at
the discretion of the application.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:
">
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
href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnglobspec/html/ws-reliablemessaging.asp"
class="ulink" target="_top">WS Reliable Messaging</a></p>
<p><a
href="http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dnglobspec/html/WS-RM-exec-summary.asp"
class="ulink" target="_top">WS Reliable Messaging Exec
Summary</a></p></td>
</tr>
</tbody>
</table>

</div>

Further in this section for brevity WS-RM will be used in place of "Web
Services Reliable Messaging Protocol".

<span class="emphasis">*Delivery Assurances Types:* </span>

|                                                                                                                                                                                                                                                                                                                               |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*AtMostOnce* </span> - Delivery at most once without duplication or an error will be raised on at least one endpoint. It is possible that some messages in a sequence may not be delivered.                                                                                                            |
| <span class="emphasis">*AtLeastOnce*</span> - Every message sent will be delivered or an error will be raised on at least one endpoint. Some messages may be delivered more than once.                                                                                                                                        |
| <span class="emphasis">*ExactlyOnce*</span> - Every message sent will be delivered without duplication or an error will be raised on at least one endpoint. This delivery assurance is the logical "and" of the two prior delivery assurances.                                                                                |
| <span class="emphasis">*InOrder*</span> - Messages will be delivered in the order that they were sent. This delivery assurance may be combined with any of the above delivery assurances. It requires that the sequence observed by the ultimate receiver be non-decreasing. It says nothing about duplications or omissions. |

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                           |
|:--------------------------:|:----------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                 |
|                            | <a href="systabswsrm.html" class="link"                   
                              title="23.6.11. WS Reliable Messaging">WS-RM System Table  
                              Definitions</a> in the Appendix section                    |

</div>

<div id="wsrmsoapcliapi" class="section">

<div class="titlepage">

<div>

<div>

### 17.7.1. SOAP CLIENT API Extensions

</div>

</div>

</div>

The SOAP Client API is used for handling, building and accessing complex
types required to perform a SOAP request. It allows you to build a
structures to access their elements and to build values suitable for
passing to the
<a href="fn_soap_client.html" class="link" title="soap_client"><code
class="function">SOAP_CLIENT()</code></a> function. It also allows to
de-serialize a SOAP response to a `soap_parameter` and access its
members and attributes safely.

Vectors are used to pass or retrieve a complex type using SOAP These
vectors contain special content or UDTs. In SOAP, structures are allowed
to have multiple members of the same name, or conditional members
(choices). Thus it is not possible to cover all variants of XSD types
with UDTs (which would be the most elegant way to represent structures).
So to cover all variants of structure handling or to express structures
containing attributes, we have to use vectors. Since we used a special
structure with vectors for expressing such complex types we introduce
the following API to deal with them.

The base of API is a UDT 'soap_parameter':

``` programlisting
create type soap_parameter as
        (
          s any default null,
          param_type int default 1,
          param_xsd varchar default null,
          ver int default 11
        )
        temporary self as ref
;
```

Its members are:

|                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*'s'* </span> - a vector representing a structure, array or simple type.                          |
| <span class="emphasis">*'param_type'*</span> - designates what is kept in 's' : 1 is struct ; 0 - simple type; 2 - array |
| <span class="emphasis">*'param_xsd'* </span> - URL; QName of the type stored in 's'                                      |
| <span class="emphasis">*'ver'* </span> - soap version to be used for serialization/deserialization if RPC style is used. |

Its Constructors are:

``` programlisting
constructor method soap_complex_parameter ()
Instantiate an empty structure placeholder;
```

``` programlisting
constructor method soap_simple_parameter (val any),
Instantiate an empty simple type placeholder
```

``` programlisting
constructor method soap_array_parameter (n int),
Instantiate an array placeholder
```

``` programlisting
constructor method soap_single_parameter (elm soap_parameter),
Instantiate an element of containing a type of 'elm'
```

Its Methods are:

``` programlisting
method get_length () returns any,
Returns the  length of the parameter
```

``` programlisting
method add_member (name varchar, val any) returns any,
Add a new member element to the structure placeholder
```

``` programlisting
method set_member (name varchar, val any) returns any
Sets the value of an existing member by name or will add a new member  if  the member does not exist
```

``` programlisting
method set_member (pos int, val any) returns any,
the same as above but using ordinal position of the member;
```

``` programlisting
method get_member (name varchar) returns any,
Returns a member's value by name
```

``` programlisting
method get_member (pos int) returns any,
Returns member value by ordinal position
```

``` programlisting
method get_value () returns any,
Returns value for simple types. Only for simple type is applicable
```

``` programlisting
method set_value (val any) returns any,
Sets the value of a simple type
```

``` programlisting
method set_attribute (name varchar, val any) returns any,
Set an attribute value of a structure or simple type
```

``` programlisting
method get_attribute (name varchar) returns any,
Return an attribute value of a structure or simple type
```

``` programlisting
method get_call_param (name varchar) returns any,
```

Serializes the parameter in a form suitable for passing to the
SOAP_CLIENT() function. When several parameters needs to be passed to
it, then result of those calls must be concatenated (see
vector_concat()) Important: set_xsd have to be called with valid
ExQName, before doing get_call_param call.

``` programlisting
method set_xsd (xsd varchar) returns any,
```

Establish a SOAP data-type Expanded QName, referencing the data kept in
the soap_parameter. This is a reference to a SOAP complex data-type
already defined with soap_dt_define () function (see function
reference). This method only sets the relation between data kept in
soap_parameter and doesn't check its validity unless serialize is
performed. The data-type Expanded QName also will be included into
output of the get_call_param method.

<div id="ex_wsrmtypes" class="example">

**Example 17.30. Complex WS Type Example**

<div class="example-contents">

Consider the following complex type:

``` programlisting
<xsd:complexType
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    name="SOAPComplexType"
    targetNamespace="http://soapinterop.org/xsd">
 <xsd:sequence>
    <xsd:element minOccurs="1" maxOccurs="1" name="varInt" type="xsd:int" />
    <xsd:element minOccurs="0" maxOccurs="1" name="varString" type="xsd:string" />
    <xsd:element minOccurs="1" maxOccurs="1" name="varFloat" type="xsd:float" />
 </xsd:sequence>
</xsd:complexType>

declare s soap_parameter ;
s := new soap_parameter ();
s.set_xsd ('http://soapinterop.org/xsd:SOAPComplexType');
s.add_member ('varString', 'string');
s.serialize ('mystruct'); -- will generate an error as, varInt and varFloat are
                          -- missing but they are declared as minOccurs="1"
```

So if we add two more members, and remove varString, to the statements
above.

``` programlisting
s.add_member ('varInt', 123);
s.add_member ('varFloat', 3.14);
s.serialize ('mystruct');
```

Will produce valid output:

``` programlisting
<mystruct><varInt>123</varInt><varFloat>3.14</varFloat></mystruct>
```

and finally we can make a parameter for the SOAP_CLIENT() function:

``` programlisting
par := s.get_call_param ('par1');
```

here are the contents of 'par':

``` programlisting
(
  ("par1", "http://soapinterop.org/xsd:SOAPComplexType" ), -- designates parameter par1, with type SOAPComplexType
  (<COMPOSITE>, "",   -- this is a marker that it's a struct
    "varInt", 123,  -- the members name/value pairs follows
    "varFloat", 3.14
  )
)
```

</div>

</div>

  

Further methods are:

``` programlisting
method deserialize (xs any, elem varchar) returns any,
```

Deserializes a element 'elem' from 'xs' (XML tree object) the the
soap_parameter.

``` programlisting
method serialize (tag varchar) returns any,
```

Returns an XML document representing the data kept into the
soap_parameter.

``` programlisting
method set_struct (s any) returns any
```

Explicitly sets the structure/array/simple type kept in the
soap_parameter UDT. This can be used to disassemble a nested complex
type into its components.

<div id="ex_wsrmuseparam" class="example">

**Example 17.31. Example Using WS-RM**

<div class="example-contents">

echoStruct invocation

``` programlisting
declare ret any;
declare pa soap_parameter;

pa := new soap_parameter ();
pa.add_member ('varString', 'My String');
pa.add_member ('varInt', 12345);
pa.add_member ('varFloat', 3.1415926);
pa.set_xsd ('http://soapinterop.org/xsd:SOAPStruct');

ret := SOAP_CLIENT (url=>'http://.../interop',
  operation=>'echoStruct', parameters=>pa.get_call_param ('inputStruct'));

pa := new soap_parameter ();
pa.set_xsd ('http://soapinterop.org/xsd:SOAPStruct');
pa.deserialize (ret, 'CallReturn');
return pa.get_member ('varString');
```

echoDocument invocation

``` programlisting
declare ret any;
declare doc, pa soap_parameter;

doc := new soap_parameter ('The document content');
doc.set_attribute ('ID', uuid());
doc.set_xsd ('http://soapinterop.org/xsd:x_Document');

ret := SOAP_CLIENT (url=>'http://.../r3/Compound1', operation=>'echoDocument',
  parameters=>doc.get_call_param ('x'), style=>1);

pa := new soap_parameter ();
pa.set_xsd ('http://soapinterop.org/xsd:Document');
pa.deserialize (ret, 'result_Document');
dbg_obj_print (pa.s);

return pa.get_attribute ('ID');
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                      |
|:--------------------------:|:---------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                            |
|                            | <a href="fn_soap_client.html" class="link" title="soap_client"><code 
                              class="function">SOAP_CLIENT() </code></a>                            |

</div>

</div>

</div>
