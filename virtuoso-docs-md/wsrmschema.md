<div id="wsrmschema" class="section">

<div class="titlepage">

<div>

<div>

### 17.7.6. WS-RM Schema

</div>

</div>

</div>

``` programlisting
<xsd:schema
    targetNamespace="http://schemas.xmlsoap.org/ws/2003/03/rm"
    xmlns:wsu="http://schemas.xmlsoap.org/ws/2002/07/utility"
    xmlns:wsrm="http://schemas.xmlsoap.org/ws/2003/03/rm"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    elementFormDefault="qualified" attributeFormDefault="unqualified">

    <!-- *** BASE *** -->

    <xsd:complexType name="SequenceType">
    <xsd:sequence>
        <xsd:element ref="wsu:Identifier"/>
        <xsd:element name="MessageNumber" type="xsd:unsignedLong"/>
        <xsd:element name="LastMessage" type="xsd:ENTITY" minOccurs="0"/>
    </xsd:sequence>
    </xsd:complexType>

    <xsd:complexType name="SequenceTerminate_t">
    <xsd:sequence>
        <xsd:element ref="wsu:Identifier"/>
    </xsd:sequence>
    </xsd:complexType>

    <xsd:complexType name="AcknowledgmentRange_t">
    <xsd:sequence/>
    <xsd:attribute name="Upper" type="xsd:unsignedLong" use="required"/>
    <xsd:attribute name="Lower" type="xsd:unsignedLong" use="required"/>
    </xsd:complexType>

    <xsd:complexType name="SequenceAcknowledgment_t">
    <xsd:sequence>
        <xsd:element ref="wsu:Identifier"/>
        <xsd:element name="AcknowledgmentRange" type="wsrm:AcknowledgmentRange_t" maxOccurs="unbounded">
        </xsd:element>
    </xsd:sequence>
    </xsd:complexType>

    <xsd:complexType name="AckRequestedType">
    <xsd:sequence>
        <xsd:element ref="wsu:Identifier"/>
    </xsd:sequence>
    </xsd:complexType>

    <xsd:element name="Sequence" type="wsrm:SequenceType"/>
    <xsd:element name="SequenceTerminate" type="wsrm:SequenceTerminate_t"/>
    <xsd:element name="SequenceAcknowledgment" type="wsrm:SequenceAcknowledgment_t" />
    <xsd:element name="AckRequested" type="wsrm:AckRequestedType"/>

    <!-- *** FAULTS *** -->

    <xsd:simpleType name="FaultCodes">
    <xsd:restriction base="xsd:QName">
        <xsd:enumeration value="wsrm:UnknownSequence"/>
        <xsd:enumeration value="wsrm:SequenceTerminated"/>
        <xsd:enumeration value="wsrm:InvalidAcknowledgment"/>
        <xsd:enumeration value="wsrm:MessageNumberRollover"/>
    </xsd:restriction>
    </xsd:simpleType>

    <xsd:complexType name="SequenceFaultType">
    <xsd:sequence>
        <xsd:element ref="wsu:Identifier"/>
        <xsd:element name="FaultCode" type="wsrm:FaultCodes"/>
    </xsd:sequence>
    </xsd:complexType>

    <xsd:element name="SequenceFault" type="wsrm:SequenceFaultType"/>

    <!-- *** ASSERTIONS *** -->

    <xsd:complexType name="InactivityTimeout_t">
    <xsd:sequence/>
    <xsd:attribute name="Milliseconds" type="xsd:unsignedLong" use="required"/>
    </xsd:complexType>

    <xsd:complexType name="BaseRetransmissionInterval_t">
    <xsd:sequence/>
    <xsd:attribute name="Milliseconds" type="xsd:unsignedLong" use="required"/>
    </xsd:complexType>

    <xsd:complexType name="AcknowledgmentInterval_t">
    <xsd:sequence/>
    <xsd:attribute name="Milliseconds" type="xsd:unsignedLong" use="required"/>
    </xsd:complexType>

    <xsd:complexType name="PolicyAssertionType">
    <xsd:sequence>
        <xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
    <xsd:anyAttribute namespace="##other"/>
    </xsd:complexType>

    <xsd:simpleType name="DeliveryAssuranceEnum">
    <xsd:restriction base="xsd:QName">
        <xsd:enumeration value="wsrm:AtMostOnce"/>
        <xsd:enumeration value="wsrm:AtLeastOnce"/>
        <xsd:enumeration value="wsrm:ExactlyOnce"/>
        <xsd:enumeration value="wsrm:InOrder"/>
    </xsd:restriction>
    </xsd:simpleType>

    <xsd:complexType name="DeliveryAssurance_t">
    <xsd:sequence/>
    <xsd:attribute name="Value" type="xsd:QName" use="required"/>
    </xsd:complexType>

    <xsd:element name="InactivityTimeout" type="wsrm:InactivityTimeout_t" />
    <xsd:element name="BaseRetransmissionInterval" type="wsrm:BaseRetransmissionInterval_t" />
    <xsd:element name="ExponentialBackoff" type="wsrm:PolicyAssertionType"/>
    <xsd:element name="AcknowledgmentInterval" type="wsrm:AcknowledgmentInterval_t"/>
    <xsd:element name="DeliveryAssurance" type="wsrm:DeliveryAssurance_t"/>

    <!-- *** Sequence Reference *** -->

    <xsd:complexType name="SequenceRefType">
    <xsd:sequence />
    <xsd:attribute name="Identifier" type="xsd:anyURI" use="required"/>
    <xsd:attribute name="Match" type="wsrm:MatchChoiceType" use="optional"/>
    </xsd:complexType>

    <xsd:simpleType name="MatchChoiceType">
    <xsd:restriction base="xsd:QName">
        <xsd:enumeration value="wsrm:Exact"/>
        <xsd:enumeration value="wsrm:Prefix"/>
    </xsd:restriction>
    </xsd:simpleType>
    <xsd:element name="SequenceRef" type="wsrm:SequenceRefType"/>

</xsd:schema>
```

</div>
