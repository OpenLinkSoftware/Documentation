<div id="xmlstoragesystem_06" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.18. Weblogs API

</div>

</div>

</div>

This API consists of "weblogUpdates.ping" XML-RPC call and server-side
implementation.

The blog owner may enable weblogs pings as option in the blog settings.
Then when it's blog gets updated a ping request will be sent on periodic
basis to the "http://rpc.weblogs.com/weblogUpdates" server.

The server also implements weblogUpdates.ping method. If this method is
exposed on a XML-RPC enabled endpoint, other parties may use it for
notification.

The server implementation consist of : weblogUpdates.ping (in weblogname
varchar, in weblogurl varchar, out Result struct). The party sends a
ping with blog name and url and receive a common for blogger API
response as struct (flError boolean, message varchar). Also a public
accessible http://host:port/blog/weblogs.xml file is available for
aggregators to track the latest additions made via Weblogs ping call.
Please note that this file generates during on weblog site setup. hence
we will have this file only if community blog pages are generated.

The weblogs.xml file follows the XMLSchema below:

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xs:element name="weblog">
    <xs:complexType>
      <xs:attribute name="name" type="xs:string" use="required"/>
      <xs:attribute name="url" type="xs:string" use="required"/>
      <xs:attribute name="when" type="xs:int" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="weblogUpdates">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="weblog" maxOccurs="unbounded"/>
      </xs:sequence>
      <xs:attribute name="version" type="xs:string" use="required" fixed="1"/>
      <xs:attribute name="updated" type="xs:string" use="required"/>
      <xs:attribute name="count" type="xs:int" use="required"/>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

</div>
