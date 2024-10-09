<div>

<div>

<div>

<div>

### 17.15.2. Protocol Support

</div>

</div>

</div>

The Virtuoso BPEL implementation supports WS Security and WS Reliable
Messaging. These protocols may be enabled and configured for individual
partner links. The WS-Addressing protocol is automatically used when the
partner has such capabilities.

The Partner link options are stored in XML format in the
'BPEL.BPEL.partner_link_init' table in 'bpl_opts' column. See the
document format and table description below in this chapter.

<div>

<div>

<div>

<div>

#### WS-Addressing (WSA)

</div>

</div>

</div>

WS-Addressing is transparently handled via WSDL description and request
of the partner(s). If the partner has WSA headers exposed then the
corresponding operation will be invoked with WSA headers. If the partner
uses WSA to call the BPEL service then the service will respond to the
partner with WSA headers included.

The benefit of using WSA consists in transparently handled message
correlation via "MessageID" and "RelatesTo" headers. Thus no explicit
message correlation needs to be specified when the partner is WSA
capable (see <a
href="http://demo.openlinksw.com/tutorial/bpeldemo/LoanFlow/LoanFlow.vsp"
class="ulink" target="_top">LoanFlow</a> demo in tutorials to see how
this works). Also when the reply is asynchronous the return path can be
handled via the "ReplyTo" WSA headers.

As WSA has different revisions that are supported by different
implementations (partners), the version of the protocol is configurable
via wsOptions/addressing element (see below).

The 'wsa' partner link option can be used in
<a href="bpelprot.html#bpelplinkconf" class="link"
title="Configuring the Partner link options">API</a> functions to set or
retrieve the value of the wsOptions/addressing.

</div>

<div>

<div>

<div>

<div>

#### WS-Security (WSS)

</div>

</div>

</div>

There are several cases where privacy and confidentiality must be
observed , this is especially true when business processes involve
payment systems, personal information etc. In those cases a partner may,
depending on Web Service policy, require secure messages (signed,
encrypted or both). Such partners usually do not expose (for many
reasons) in WSDL the WSS headers, hence this must be configured by the
BPEL administrator per partner.

In order for the BPEL server to be able to sign and encrypt messages
keys have to be uploaded into the BPEL user repository. This can be done
with the USER_KEY_LOAD() function or using the BPEL GUI (Partner Link
properties).

It is important to know the following basics:

<div>

- The private key is needed in order to decrypt or sign messages.

- The partner public key is needed to encrypt messages or verify
  signatures.

</div>

These keys have to be described in wsOptions/security/key and
wsOptions/security/pubkey in the 'Partner link options' XML document.
Note that in the options document are stored only the names of the keys,
as the keys themselves are registered in the BPEL user key repository.

Note: Use the 'wss-priv-key' and 'wss-pub-key' partner link option in
<a href="bpelprot.html#bpelplinkconf" class="link"
title="Configuring the Partner link options">API</a> functions to set or
change the value of them.

The encryption and signing is independently configurable for outbound or
inbound messages. This is settable via the following options:

<div>

- wsOptions/security/in/encrypt - 'Optional': inbound message MAY be
  encrypted, 'Mandatory': inbound message MUST be encrypted
  ('wss-in-encrypt' option
  <a href="bpelprot.html#bpelplinkconf" class="link"
  title="Configuring the Partner link options">in API</a> )

- wsOptions/security/in/signature - same as encryption but for XML
  signature ('wss-in-signature' option
  <a href="bpelprot.html#bpelplinkconf" class="link"
  title="Configuring the Partner link options">in API</a> )

- wsOptions/security/in/keys - this is a list of keys (key names) that
  are trusted; only SOAP messages signed with one of these keys will be
  accepted. If this list is empty, all parties will be accepted unless
  signature is invalid or message can not be decrypted.
  ('wss-in-signers' option
  <a href="bpelprot.html#bpelplinkconf" class="link"
  title="Configuring the Partner link options">in API</a> )

- wsOptions/security/out/encrypt - type of the session key for
  encryption 3DES, AES128, AES192 or AES256. ('wss-out-encrypt-key'
  option <a href="bpelprot.html#bpelplinkconf" class="link"
  title="Configuring the Partner link options">in API</a> )

- wsOptions/security/out/signature - 'Default': the WSS default template
  (see WS-Security chapter for details), 'Custom': in this case
  'function' attribute must refer to a PL procedure returning XML
  Signature template. ('wss-out-signature-type' and
  'wss-out-signature-function' options
  <a href="bpelprot.html#bpelplinkconf" class="link"
  title="Configuring the Partner link options">in API</a> )

</div>

</div>

<div>

<div>

<div>

<div>

#### WS-Reliable Messaging (WSRM)

</div>

</div>

</div>

The WSRM is applicable for those partners which can be invoked
asynchronously. For both inbound or outbound (from the point of view of
the process) WSRM can be enabled. The options are settable in
wsOptions/delivery/in or wsOptions/delivery/out ('wsrm-in-type' and
'wsrm-out-type' options
<a href="bpelprot.html#bpelplinkconf" class="link"
title="Configuring the Partner link options">in API</a> ) respectively.

<div>

- ExactlyOnce - message will be delivered only once to the destination.

- InOrder - messages will be delivered in the same order as they are
  sent from the script.

</div>

</div>

<div>

<div>

<div>

<div>

#### HTTP security

</div>

</div>

</div>

Some partner services may require HTTPS or/and HTTP authentication
instead of using WS-Security protocol to ensure SOAP message privacy.

When a partner's endpoint URL contains HTTPS scheme (like https://) the
request and response operations will be made with HTTP over SSL (HTTPS
protocol). In this case no additional options to the partner links are
needed.

In case when a partner service needs a HTTP authentication, the user
name and password (for that service) needs to be configured for the
given partner link. These are settable via wsOptions/security/http-auth
('http-auth-uid' and 'http-auth-pwd' options
<a href="bpelprot.html#bpelplinkconf" class="link"
title="Configuring the Partner link options">in API</a> ) element in
partner link options. Note that only basic HTTP authentication is
supported.

Partner link options format

``` programlisting
<wsOptions>
    <!-- WSA revision namespace -->

    <addressing version="http://schemas.xmlsoap.org/ws/2003/03/addressing|http://schemas.xmlsoap.org/ws/2004/03/addressing"/|http://schemas.xmlsoap.org/ws/2004/08/addressing>
  <!-- WSS options -->

  <security>
      <!-- basic HTTP Authentication -->

      <http-auth username="" password=""/>
      <!-- WSS keys -->

      <key name="[Private Key]"/>
      <pubkey name="[Partner public key]"/>
    <in>
      <encrypt type="NONE|Optional|Mandatory"/>
      <signature type="NONE|Optional|Mandatory" />
      <keys>
      <!-- trusties -->

      <key name="[Trusted Public Key]"/>
      ...
      </keys>
    </in>
    <out>
    <encrypt type="NONE|3DES|AES128|AES192|AES256"/>
    <signature type="NONE|Default|Custom" function="[PL procedure name]"/>
    </out>
  </security>
  <!-- WSRM options -->

  <delivery>
    <in  type="NONE|ExactlyOnce|InOrder"/>
    <out type="NONE|ExactlyOnce|InOrder" />
  </delivery>
</wsOptions>
    
```

</div>

<div>

<div>

<div>

<div>

#### Configuring the Partner link options

</div>

</div>

</div>

The partner link options can be configured vi BPEL UI
(http://host:port/BPELGUI) or programmatically using
<a href="fn_plink_get_option.html" class="link"
title="BPEL.BPEL.plink_get_option"><code
class="function">plink_get_option() </code></a> and
<a href="fn_plink_set_option.html" class="link"
title="BPEL.BPEL.plink_set_option"><code
class="function">plink_set_option() </code></a> functions. It is
possible to update the partner link options with SQL update statement
using the configuration (described above), but use of the BPEL UI or API
functions is recommended.

</div>

<div>

<div>

<div>

<div>

#### Dynamic Partner Links

</div>

</div>

</div>

The 'assign' activity allows partner links to be assigned values at run
time. This means that partner links can be dynamic and that a process
may call partners that were not known at the time of defining the
process. Partner links can be defined at run time using the
'EndpointReference' element from the WS-Addressing specification :

``` programlisting
  <xs:element name="EndpointReference" type="wsa:EndpointReferenceType"/>
  <xs:complexType name="EndpointReferenceType">
    <xs:sequence>
      <xs:element name="Address" type="wsa:AttributedURI"/>
      <xs:element name="ReferenceProperties" type="wsa:ReferencePropertiesType" minOccurs="0"/>
      <xs:element name="PortType" type="wsa:AttributedQName" minOccurs="0"/>
      <xs:element name="ServiceName" type="wsa:ServiceNameType" minOccurs="0"/>
      <xs:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" />
    </xs:sequence>
    <xs:anyAttribute namespace="##other" processContents="lax"/>
  </xs:complexType>
    
```

Thus it may keep endpoint URL, Port type, Service name and any number of
implementation specific options under 'ReferenceProperties'. Also it may
keep any other extensible elements and attributes.

The Virtuoso BPEL implementation extends the EndpointReferenceType with
element 'wsOptions' under WSA element 'ReferenceProperties' (see
previous section for 'wsOptions' element description). Thus it is
possible to decide at run time to send a secure reply (WSS) or to use
reliable messaging (WSRM). The following excerpt shows BPEL source that
assigns WS Security options to a partner link:

``` programlisting
      ...
      <assign>
      <copy>
          <from>
          <EndpointReference xmlns="http://schemas.xmlsoap.org/ws/2003/03/addressing">
              <Address>http://securehost/myService</Address>
              <ReferenceProperties>
              <wsOptions xmlns="">
                  <addressing version="http://schemas.xmlsoap.org/ws/2003/03/addressing"/>
                  <security>
                  <http-auth username="" password=""/>
                  <key name="myKey"/>
                  <pubkey name="serverKey"/>
                  <in>
                      <encrypt type="Optional"/>
                      <signature type="Optional" />
                      <keys/>
                  </in>
                  <out>
                      <encrypt type="AES128"/>
                      <signature type="Default"/>
                  </out>
                  </security>
              </wsOptions>
              </ReferenceProperties>
          </EndpointReference>
          </from>
          <to partnerLink="service"/>
      </copy>
      </assign>
      ...
    
```

To manipulate the partner link options and endpoint URL we can also use
variables declared as element EndpointReference from WS-Addressing
schema.

</div>

</div>
