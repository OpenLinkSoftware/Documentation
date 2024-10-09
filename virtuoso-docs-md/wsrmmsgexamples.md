<div>

<div>

<div>

<div>

### 17.7.5. Message Examples

</div>

</div>

</div>

<div>

**Example 17.33. Example: Initial request**

<div>

``` programlisting
<SOAP:Envelope>
  <SOAP:Header>
    <wsa:MessageID>uuid:aa8bd508-110b-11d8-8344-8cfad4a25a87</wsa:MessageID>
    <wsa:To>http://host:9999/wsrm</wsa:To>
    <wsa:From>
      <wsa:Address>http://host:9999/replyto</wsa:Address>
    </wsa:From>
    <wsa:Action><!-- depending of application -->

</wsa:Action>
    <wsrm:Sequence>
      <wsu:Identifier>uuid:aa8bfa74-110b-11d8-8344-8cfad4a25a87</wsu:Identifier>
      <wsrm:MessageNumber>1</wsrm:MessageNumber>
    </wsrm:Sequence>
  </SOAP:Header>
  <SOAP:Body>
    <!-- some application data -->

  </SOAP:Body>
</SOAP:Envelope>
```

receiver accepts and return just

``` programlisting
HTTP/1.1 202 Accepted
Content-Length: 0
```

Last message

``` programlisting
<SOAP:Envelope>
  <SOAP:Header>
    <wsa:MessageID>uuid:aa8bd508-110b-11d8-8344-8cfad4a25a87</wsa:MessageID>
    <wsa:To>http://host:9999/wsrm</wsa:To>
    <wsa:From>
      <wsa:Address>http://host:9999/replyto</wsa:Address>
    </wsa:From>
    <wsa:Action><!-- depending of application -->

</wsa:Action>
    <wsrm:Sequence>
      <wsu:Identifier>uuid:aa8bfa74-110b-11d8-8344-8cfad4a25a87</wsu:Identifier>
      <wsrm:MessageNumber>2</wsrm:MessageNumber>
      <wsrm:LastMessage/>
    </wsrm:Sequence>
  </SOAP:Header>
  <SOAP:Body>
    <!-- some application data -->

  </SOAP:Body>
</SOAP:Envelope>
```

receiver accepts and returns

``` programlisting
HTTP/1.1 202 Accepted
Content-Length: 0
```

Sequence Acknowledgment response; sent via another channel

``` programlisting
<SOAP:Envelope>
  <SOAP:Header>
    <wsa:MessageID>uuid:aadedf64-110b-11d8-8344-8cfad4a25a87</wsa:MessageID>
    <wsa:To>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</wsa:To>
    <wsa:From>
      <wsa:Address>http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous</wsa:Address>
    </wsa:From>
    <wsa:Action>http://schemas.xmlsoap.org/ws/2004/08/rm#SequenceAcknowledgment</wsa:Action>
    <wsrm:SequenceAcknowledgment>
      <wsu:Identifier>uuid:aa8bfa74-110b-11d8-8344-8cfad4a25a87</wsu:Identifier>
      <wsrm:AcknowledgmentRange Upper="2" Lower="1"/>
    </wsrm:SequenceAcknowledgment>
  </SOAP:Header>
  <SOAP:Body/>
</SOAP:Envelope>
```

initial sender accepts and returns

``` programlisting
HTTP/1.1 202 Accepted
Content-Length: 0
```

</div>

</div>

  

</div>
