<div>

<div>

<div>

<div>

### 17.7.4. WS-RM Protocol Endpoint Configuration

</div>

</div>

</div>

The setup is a virtual directory definition and grant of rights to the
procedures for sender and receiver endpoints.

This will be demonstrated as an example of setting up both endpoints:

<div>

- <span class="emphasis">*Sender* </span>

  ``` programlisting
  create user WSRMS;
  grant execute on WSRMSequenceAcknowledgment to WSRMS;
  vhost_define (lpath=>'/replyto', ppath=>'/SOAP/', soap_user=>'WSRMS');
  ```

- <span class="emphasis">*Reply*</span>

  ``` programlisting
  create user WSRMR;
  grant execute on WSRMSequence to WSRMR;
  grant execute on WSRMSequenceTerminate to WSRMR;
  grant execute on WSRMAckRequested to WSRMR;
  vhost_define (lpath=>'/wsrm', ppath=>'/SOAP/', soap_user=>'WSRMR');
  ```

</div>

<div>

**Example 17.32. WS-RM Ping Test Example**

<div>

This is an example client used to perform the interoperability test
"Ping" as proposed in "Interop Workshop Scenarios"

``` programlisting
soap_dt_define ('',
        '<element
            xmlns="http://www.w3.org/2001/XMLSchema"
            name="Ping" type="test:Ping_t"
            targetNamespace = "http://tempuri.org/" xmlns:test="http://tempuri.org/" />');
```

``` programlisting
soap_dt_define ('',
        '<complexType xmlns="http://www.w3.org/2001/XMLSchema"
                  name="Ping_t" targetNamespace = "http://tempuri.org/">
                <sequence>
                    <element minOccurs="1" maxOccurs="1" name="Text" type="string"/>
                </sequence>
        </complexType>');
```

``` programlisting
create procedure WSRMTestPing (in _to varchar, in _from varchar)
  {
    declare addr wsa_cli;
    declare test wsrm_cli;
    declare req soap_client_req;
    declare finish any;
    declare ping soap_parameter;

    ping := new soap_parameter (1);

    ping.set_xsd ('http://tempuri.org/:Ping');
    ping.s := vector ('Hello World');

    addr := new wsa_cli ();
    addr."to" := _to;
    addr."from" := _from;
    addr.action := 'urn:wsrm:Ping';

    req := new soap_client_req ();
    req.url := _to;
    req.operation := 'Ping';
    req.parameters := ping.get_call_param ('');

    test := new wsrm_cli (addr, _to);

    test.send_message (req);
    test.send_message (req);
    test.finish (req);
    return test.seq;
  }
;
```

</div>

</div>

  

</div>
