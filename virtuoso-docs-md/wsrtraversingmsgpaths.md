<div id="wsrtraversingmsgpaths" class="section">

<div class="titlepage">

<div>

<div>

### 17.6.2. Traversing Message Paths

</div>

</div>

</div>

The initial WS-Routing sender generates a WS-Routing "path" header that
indicates the route. The path can indicate a route via one or more
intermediaries using the "via" elements as sub-elements of the "fwd"
element. The initial sender indicates the ultimate destination by using
a "to" element. In the absence of a "to" element the ultimate
destination is deduced by the last "via" in the "fwd" element. The
second option occurs most commonly when an ultimate destination reverses
roles, becomes an initial sender, and uses the reverse path in a
received message as a forward path to send a response to the original
sender.

In addition, the initial WS-Routing sender inserts a reverse path for
indicating where the initial sender can receive reverse path messages.
The initial sender sets the ultimate destination in the reverse path
using a "via" element as a sub-element of the "rev" element.

A WS-Routing receiver receiving a WS-Routing message inspects the SOAP
header and performs the following operations:

<div class="itemizedlist">

- If no "fwd" element is present or if the "fwd" element does not
  contain any "via" elements then inspect the "to" element and verify
  that the value identifies itself. If this is the case then THIS
  receiver is the ultimate destination. If there is no "to" element or
  if the value of the "to" element does not identify THIS WS-Routing
  receiver then generate a fault.

- If the "fwd" element is present and contains one or more "via"
  element(s) then remove the top "via" element listed in the "fwd"
  element and verify that the value of that "via" element is either
  empty or identifies THIS WS-Routing receiver. Failing that generate an
  appropriate WS-Routing fault

  If, after removing the top "via" element there are no remaining "via"
  element(s) listed in the "fwd" element, and there is no "to" element,
  then THIS WS-Routing receiver is the ultimate destination.

</div>

A WS-Routing intermediary MUST follow these additional rules:

<div class="itemizedlist">

- If a "rev" element is present then add a "via" element as the first
  "via" element listed in the "rev" element with a value indicating the
  reverse path endpoint. If a reverse path endpoint cannot be provided
  then generate a 751 "Reverse Path Unavailable" WS-Routing fault.

- If one or more "via" element(s) remain in the "fwd" element then
  forward the WS-Routing message to the endpoint identified by the new
  top "via" element listed in the "fwd" element.

- If there are no remaining "via" element(s) listed in the "fwd" element
  but there is a "to" element then forward the WS-Routing message to the
  endpoint identified by the "to" element.

- In the last two cases if the forwarding does not succeed then generate
  the appropriate WS-Routing fault.

</div>

<div id="wsrexample" class="example">

**Example 17.29. WS Routing Example**

<div class="example-contents">

Here is an example SOAP call from a client to an endpoint D.com via
intermediaries B.com and C.com:

``` programlisting
+------------+   +------------+   +------------+   +-------------+
|  Initial   |   | WS-Routing |   | WS-Routing |   |  Ultimate   |
| WS-Routing |-->

|Intermediary|-->

|Intermediary|-->

|  WS-Routing |
|  Sender A  |<--|      B     |<--|      C     |<--|  Receiver D |
+------------+   +------------+   +------------+   +-------------+
             HTTP             HTTP              HTTP
```

Request from client to intermediary B

``` programlisting
<S:Envelope>
<S:Header>
  <m:path
     xmlns:m="http://schemas.xmlsoap.org/rp/"
     S:actor="http://schemas.xmlsoap.org/soap/actor/next"
     S:mustUnderstand="1">
   <m:action>http://soapinterop.org/</m:action>
   <m:to>http://D.com/router</m:to>
   <m:id>uuid:09233523-345b-4351-b623-5dsf35sgs5d6</m:id>
   <m:fwd>
    <m:via>http://B.com/router</m:via>
    <m:via>http://C.com/router</m:via>
   </m:fwd>
   <m:rev />
  </m:path>
</S:Header>
<S:Body>
...
</S:Body>
</S:Envelope>
```

Request from intermediary B to intermediary C

``` programlisting
<n0:Envelope>
<n0:Header>
  <n2:path
     xmlns:n2="http://schemas.xmlsoap.org/rp/"
     n0:actor="http://schemas.xmlsoap.org/soap/actor/next"
     n0:mustUnderstand="1">
   <n2:action>http://soapinterop.org/</n2:action>
   <n2:to>http://D.com/router</n2:to>
   <n2:id>uuid:09233523-345b-4351-b623-5dsf35sgs5d6</n2:id>
   <n2:fwd>
     <n2:via>http://C.com/router</n2:via>
   </n2:fwd>
   <n2:rev>
     <n2:via />
   </n2:rev>
  </n2:path>
</n0:Header>
<n0:Body>
...
</n0:Body>
</n0:Envelope>
```

Request from intermediary C to endpoint D

``` programlisting
<n0:Envelope>
  <n0:Header>
    <n2:path
      xmlns:n2="http://schemas.xmlsoap.org/rp/"
      n0:actor="http://schemas.xmlsoap.org/soap/actor/next"
      n0:mustUnderstand="1">
     <n2:action>http://soapinterop.org/</n2:action>
     <n2:to>http://D.com/router</n2:to>
     <n2:id>uuid:09233523-345b-4351-b623-5dsf35sgs5d6</n2:id>
     <n2:fwd />
     <n2:rev>
      <n2:via />
      <n2:via />
     </n2:rev>
   </n2:path>
</n0:Header>
<n0:Body>
...
</n0:Body>
</n0:Envelope>
```

Response from endpoint to C

``` programlisting
<n0:Envelope>
<n0:Header>
  <n2:path xmlns:n2="http://schemas.xmlsoap.org/rp/"
          n0:actor="http://schemas.xmlsoap.org/soap/actor/next"
      n0:mustUnderstand="1">
        <n2:action>http://soapinterop.org/</n2:action>
        <n2:id>uuid:2b2d09ec-a93a-11d6-be21-c9f55c969fe7</n2:id>
        <n2:relatesTo>uuid:09233523-345b-4351-b623-5dsf35sgs5d6</n2:relatesTo>
        <n2:fwd>
          <n2:via />
          <n2:via />
        </n2:fwd>
        <n2:rev>
           <n2:via>http://D.com/router</n2:via>
        </n2:rev>
        <n2:from />
  </n2:path>
</n0:Header>
<n0:Body>
...
</n0:Body>
</n0:Envelope>
```

Response from intermediary C to B

``` programlisting
<n0:Envelope>
 <n0:Header>
    <n2:path xmlns:n2="http://schemas.xmlsoap.org/rp/"
             n0:actor="http://schemas.xmlsoap.org/soap/actor/next"
         n0:mustUnderstand="1">
        <n2:action>http://soapinterop.org/</n2:action>
        <n2:id>uuid:2b2d09ec-a93a-11d6-be21-c9f55c969fe7</n2:id>
        <n2:relatesTo>uuid:09233523-345b-4351-b623-5dsf35sgs5d6</n2:relatesTo>
        <n2:fwd>
          <n2:via />
        </n2:fwd>
        <n2:rev>
          <n2:via>http://C.com/router</n2:via>
          <n2:via>http://D.com/router</n2:via>
        </n2:rev>
        <n2:from />
     </n2:path>
</n0:Header>
<n0:Body>
...
</n0:Body>
</n0:Envelope>
```

Response from intermediary B to client

``` programlisting
<n0:Envelope>
<n0:Header>
    <n2:path xmlns:n2="http://schemas.xmlsoap.org/rp/"
             n0:actor="http://schemas.xmlsoap.org/soap/actor/next"
         n0:mustUnderstand="1">
           <n2:action>http://soapinterop.org/</n2:action>
           <n2:id>uuid:2b2d09ec-a93a-11d6-be21-c9f55c969fe7</n2:id>
           <n2:relatesTo>uuid:09233523-345b-4351-b623-5dsf35sgs5d6</n2:relatesTo>
              <n2:fwd />
           <n2:rev>
              <n2:via>http://B.com/router</n2:via>
              <n2:via>http://C.com/router</n2:via>
              <n2:via>http://D.com/router</n2:via>
           </n2:rev>
           <n2:from />
      </n2:path>
</n0:Header>
<n0:Body>
...
</n0:Body>
</n0:Envelope>
```

</div>

</div>

  

</div>
