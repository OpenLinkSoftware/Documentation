<div>

<div>

<div>

<div>

### 17.15.13. Samples

</div>

</div>

</div>

Simple echo script

``` programlisting
<process name="echo" targetNamespace="http://temp.uri" xmlns:tns="http://temp.uri"
    xmlns="http://schemas.xmlsoap.org/ws/2003/03/business-process/">

    <partnerLinks>
    <partnerLink name="caller" partnerLinkType="tns:echoService"/>
    </partnerLinks>

    <variables>
    <variable name="request" messageType="tns:StringMessageType"/>
    </variables>

    <sequence name="EchoSequence">
    <receive partnerLink="caller" portType="tns:echoPort"
        operation="echo" variable="request"
        createInstance="yes" name="EchoReceive"/>
    <reply partnerLink="caller" portType="tns:echoPort"
        operation="echo" variable="request" name="EchoReply"/>
    </sequence>

</process>
    
```

... and corresponding WSDL

``` programlisting
<definitions targetNamespace="http://temp.uri" xmlns:tns="http://temp.uri"
             xmlns:pl="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
         xmlns:xsd="http://www.w3.org/2001/XMLSchema"
         xmlns="http://schemas.xmlsoap.org/wsdl/">

   <message name="StringMessageType">
      <part name="echoString" type="xsd:string"/>
   </message>

   <portType name="echoPort">
      <operation name="echo">
         <input message="tns:StringMessageType"/>
         <output message="tns:StringMessageType"/>
      </operation>
   </portType>

   <pl:partnerLinkType name="echoService">
     <pl:role name="svc">
       <pl:portType name="tns:echoPort"/>
     </pl:role>
   </pl:partnerLinkType>

</definitions>
    
```

Invoking Echo Service

``` programlisting
    SQL>select xpath_eval ('/echoResponse/echoString/text()',
    xml_tree_doc (
        DB.DBA.soap_client (
        url=>sprintf ('http://example.com:%s/BPELGUI/bpel.vsp?script=file://echo/echo.bpel',server_http_port()),
        operation=>'echo',
        soap_action=>'echo',
        parameters=> vector ('par', xtree_doc (']]&gt;&lt;echoString>hello world&lt;/echoString>&lt;![CDATA[')))
        ));
        callret
        VARCHAR
         _______________________________________________________________________________

         hello world

         1 Rows. -- 330 msec.
```

<div>

<div>

<div>

<div>

#### BPEL Functions

</div>

</div>

</div>

getVariableData

``` programlisting
      ...
      <assign name="assignResult">
        <copy>
          <from expression="concat( 'Hello ', bpws:getVariableData('input', 'payload', '/tns:echovirtRequest/tns:name'), ' ', bpws:getVariableData('input', 'payload', '/tns:echovirtRequest/tns:fname'))"/>
          <to variable="output" part="payload" query="/tns:echovirtResponse/tns:result"/>
        </copy>
      </assign>
      ...
      
```

count

``` programlisting
      ...
      <assign name="assignResult">
        <copy>
          <from part="payload" variable="input" query="count(//lines/line)"/>
          <to variable="count"/>
        </copy>
      </assign>
      ...
      
```

<div>

|                            |                                                                           |
|:--------------------------:|:--------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also: Reference Material in the Tutorial:                             |
|                            | <a                                                                        
                              href="http://demo.openlinksw.com/tutorial/bpeldemo/LoanFlow/LoanFlow.vsp"  
                              class="ulink" target="_top">BP-S-1 Loan Flow demo</a>                      |

</div>

<div>

<table data-border="0"
data-summary="Tip: See Also: Reference Material in the BPELDemo tutorials:
">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also: Reference Material in the
BPELDemo tutorials:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>BPEL4WS VAD package
must be installed in order to view these tutorials.</p>
<p><a href="http://demo.openlinksw.com/tutorial/bpeldemo/" class="ulink"
target="_top">BPELDemo</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
