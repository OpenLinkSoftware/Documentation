<div>

<div>

<div>

<div>

### 17.5.3. Virtual Directory SOAP WSS Options

</div>

</div>

</div>

The following SOAP options are available for configuring a virtual
directory:

<div>

- **WS-SEC . ** WS-Security processing is enabled on the endpoint, in
  practice this enables the input and output message filters for
  Security Header processing. This MUST be set to enable WS-Security
  endpoints. All other WS related options will be ignored if this option
  is disabled. The possible values for this option are "yes" or "no"

- **WSS-KEY . ** The name of a PL procedure that is expected to return a
  key instance. Examples of this can be found in the
  <a href="vwsssupport.html#vwssreferencingkeys" class="link"
  title="Referencing Keys">Referencing Keys</a> section. If this NULL or
  undefined the SOAP server will not encrypt outgoing messages.

- **WSS-Template . ** path and file name to a file containing a
  template - an instruction for how to make the XML signature for the
  response message. For more information see the
  <a href="vwsssectemplates.html" class="link"
  title="17.5.5. Signature Templates">Security Templates</a> section. If
  this option is NULL or undefined the SOAP server will not sign any
  outgoing messages from this endpoint. As an example, if the value
  "sig.xml" was supplied to this option this would imply that the
  content of template is stored in the file called sig.xml located in
  the servers working directory. A default template can be used by
  setting this option to the value `[key reference for signing]` - (note
  '\[\]' around name is required). In this case the server will generate
  a default template based on a key, and produce a default rule for
  making a signature.

- **WSS-Validate-Signature. ** This option controls how the SOAP server
  responds to incoming messages i.e. how to verify the incoming message.

  possible values are:

  |                                                                    |
  |--------------------------------------------------------------------|
  | <span class="emphasis">*0* </span> do not verify signatures        |
  | <span class="emphasis">*1* </span> expects signature to exist      |
  | <span class="emphasis">*2* </span> will verify signature if exists |

</div>

<div>

**Example 17.27. Configuring WS Secure Endpoints**

<div>

``` programlisting
-- definition of /SecureWebServices endpoint
VHOST_DEFINE (
  lpath=>'/SecureWebServices', ppath=>'/SOAP/', soap_user=>'WSS',
  soap_opts=>vector(
    'Namespace','http://temp.uri/',
    'MethodInSoapAction','yes',
    'ServiceName', 'WSSecure',
    'CR-escape', 'no',
    'WS-SEC','yes',
    'WSS-Validate-Signature', 2)
  )
;
```

this will define a WS-Security enabled endpoint that is compatible with
.NET WSDK examples. This endpoint will accept encrypted/or signed SOAP
messages and will generate an error if security checking fails. Upon
success it will return non-encrypted message. Therefore it's a one-way
encryption example.

``` programlisting
-- complex example
VHOST_DEFINE (
  lpath=>'/wss', ppath=>'/SOAP/', soap_user=>'WSS',
  soap_opts=>vector(
    'Namespace','http://soapinterop.org/',
        'MethodInSoapAction','no',
        'ServiceName', 'WSSecure',
        'HeaderNS', 'http://soapinterop.org/echoheader/',
        'CR-escape', 'no',
    'WS-SEC','yes',
        'WSS-KEY','DB.DBA.WS_SOAP_GET_KEY',
        'WSS-Template','wss_tmpl.xml',
    'WSS-Validate-Signature', 1)
  )
;
```

This endpoint will expect signed and encrypted incoming messages and
will sign and encrypt outgoing messages too. This is a two-way
encryption example, for client to server and reverse.

</div>

</div>

  

</div>
