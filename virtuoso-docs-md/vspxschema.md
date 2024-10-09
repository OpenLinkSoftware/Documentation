<div>

<div>

<div>

<div>

### 14.4.11. XMLSchema for VSPX page

</div>

</div>

</div>

``` programlisting
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema targetNamespace="http://example.com/vspx/" xmlns:v="http://example.com/vspx/" xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
  <xs:simpleType name="CalculateableValue" final="restriction">
    <xs:restriction base="xs:string">
      <xs:whiteSpace value="preserve"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ButtonStyle" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="submit"/>
      <xs:enumeration value="url"/>
      <xs:enumeration value="image"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ButtonAction" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="simple"/>
      <xs:enumeration value="submit"/>
      <xs:enumeration value="delete"/>
      <xs:enumeration value="browse"/>
      <xs:enumeration value="return"/>
      <xs:enumeration value="logout"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SqlName" final="restriction">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" fixed="false"/>
      <xs:maxLength value="32" fixed="false"/>
      <xs:pattern value="[A-Za-z0-9_]{1,32}"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SqlTableQname" final="restriction">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Za-z0-9_]{1,32}\.[A-Za-z0-9_]{0,32}\.[A-Za-z0-9_]{1,32}"/>
      <xs:pattern value="[A-Za-z0-9_]{1,32}"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="SqlCode" final="restriction">
    <xs:restriction base="xs:string">
      <xs:whiteSpace value="preserve"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="LoginMode" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="digest"/>
      <xs:enumeration value="url"/>
      <xs:enumeration value="cookie"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="Unused" final="restriction">
    <xs:restriction base="xs:string"/>
  </xs:simpleType>
  <xs:simpleType name="TreeOrientation" final="restriction">
    <xs:restriction base="xs:string">
      <xs:pattern value="horizontal"/>
      <xs:pattern value="vertical"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="PlCursorType" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="static"/>
      <xs:enumeration value="dynamic"/>
      <xs:enumeration value="keyset"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:attributeGroup name="HtmlGenAttributes">
    <xs:anyAttribute processContents="strict"/>
  </xs:attributeGroup>
  <xs:attributeGroup name="SqlGenAttributes">
    <xs:attribute name="name" type="v:SqlName" use="required"/>
    <xs:attribute name="annotation" type="xs:string" use="optional"/>
    <xs:attribute name="initial-enable" type="v:CalculateableValue" use="optional"/>
    <xs:attribute name="enabled" type="v:CalculateableValue" use="optional"/>
    <xs:attributeGroup ref="v:HtmlGenAttributes"/>
    <xs:anyAttribute namespace="##other" processContents="skip"/>
  </xs:attributeGroup>
  <xs:attributeGroup name="SqlColumn">
    <xs:attribute name="column" type="v:SqlName" use="optional"/>
  </xs:attributeGroup>
  <xs:attributeGroup name="UserInputAttributes">
    <xs:attribute name="error-glyph" type="xs:string" use="optional"/>
  </xs:attributeGroup>
  <xs:attributeGroup name="LoginParams">
    <xs:attribute name="realm" type="xs:NMTOKEN" use="required"/>
    <xs:attribute name="mode" type="v:LoginMode" use="required"/>
    <xs:attribute name="user-password" type="xs:NMTOKEN" use="required"/>
    <xs:attribute name="user-password-check" type="xs:NMTOKEN" use="required"/>
  </xs:attributeGroup>
  <xs:attributeGroup name="BrowseButtonParams">
    <xs:attribute name="child-window-options" type="xs:string" use="optional"/>
    <xs:attribute name="browser-current" type="xs:int" use="optional" default="0"/>
    <xs:attribute name="browser-filter" type="xs:string" use="optional" default="*"/>
    <xs:attribute name="browser-list" type="xs:string" use="optional" default="1"/>
    <xs:attribute name="browser-mode" type="xs:string" use="optional" default="RES"/>
    <xs:attribute name="browser-type" type="xs:string" use="optional"/>
    <xs:attribute name="browser-xfer" type="xs:string" use="optional" fixed="DOM"/>
    <xs:attribute name="selector" type="xs:anyURI" use="optional"/>
  </xs:attributeGroup>
  <xs:group name="AnyHtmlContent">
    <xs:choice>
      <xs:element ref="v:style"/>
      <xs:element ref="v:placeholder"/>
      <xs:any namespace="##other" processContents="skip"/>
    </xs:choice>
  </xs:group>
  <xs:complexType name="EventHandler" mixed="true">
    <xs:choice minOccurs="0">
      <xs:element ref="v:script"/>
    </xs:choice>
  </xs:complexType>
  <xs:element name="after-data-bind" type="v:EventHandler"/>
  <xs:element name="before-data-bind" type="v:EventHandler"/>
  <xs:element name="on-post" type="v:EventHandler"/>
  <xs:element name="before-render" type="v:EventHandler"/>
  <xs:element name="on-init" type="v:EventHandler"/>
  <xs:group name="EventTarget">
    <xs:choice>
      <xs:element ref="v:after-data-bind"/>
      <xs:element ref="v:before-data-bind"/>
      <xs:element ref="v:on-post"/>
      <xs:element ref="v:before-render"/>
      <xs:element ref="v:on-init"/>
    </xs:choice>
  </xs:group>
  <xs:element name="page">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
        <xs:any/>
      </xs:choice>
      <xs:attribute name="name" type="v:SqlName" use="required"/>
      <xs:attribute name="decor" type="xs:anyURI" use="optional"/>
      <xs:attribute name="style" type="xs:anyURI" use="optional"/>
      <xs:attribute name="on-error-redirect" type="xs:anyURI" use="optional"/>
      <xs:attribute name="on-deadlock-retry" type="xs:integer" use="optional" default="0"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="include">
    <xs:complexType>
      <xs:attribute name="url" type="xs:anyURI" use="required"/>
      <xs:attribute name="name" type="v:Unused" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="template">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="type" type="v:TemplateType" use="optional"/>
      <xs:attribute name="redirect" type="xs:anyURI" use="optional"/>
      <xs:attribute name="condition" type="v:SqlCode" use="optional"/>
      <xs:attribute name="name-to-remove" type="xs:QName" use="optional"/>
      <xs:attribute name="set-to-remove" type="v:TemplateSetToRemove" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:simpleType name="TemplateType" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="simple"/>
      <xs:enumeration value="repeat"/>
      <xs:enumeration value="row"/>
      <xs:enumeration value="frame"/>
      <xs:enumeration value="if-exists"/>
      <xs:enumeration value="if-not-exists"/>
      <xs:enumeration value="add"/>
      <xs:enumeration value="browse"/>
      <xs:enumeration value="edit"/>
      <xs:enumeration value="if-login"/>
      <xs:enumeration value="if-not-login"/>
      <xs:enumeration value="tree-node"/>
      <xs:enumeration value="tree-leaf"/>
      <xs:enumeration value="input"/>
      <xs:enumeration value="result"/>
      <xs:enumeration value="error"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="TemplateSetToRemove" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="none"/>
      <xs:enumeration value="top"/>
      <xs:enumeration value="bottom"/>
      <xs:enumeration value="both"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:element name="form">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:FormSpecificContent"/>
        <xs:group ref="v:FormNonSpecificContent"/>
        <xs:group ref="v:UserInputTarget"/>
        <xs:group ref="v:AnyHtmlContent"/>
        <xs:element ref="v:template"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="type" type="v:FormType" use="optional"/>
      <xs:attribute name="action" type="xs:string" use="optional"/>
      <xs:attribute name="method" type="v:FormMethod" use="optional" default="POST"/>
      <xs:attribute name="table" type="v:SqlTableQname" use="optional"/>
      <xs:attribute name="if-not-exists" type="v:FormUpdateIfNotExists" use="optional"/>
      <xs:attribute name="concurrency" type="xs:boolean" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:simpleType name="FormType" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="simple"/>
      <xs:enumeration value="update"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="FormMethod" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="GET"/>
      <xs:enumeration value="POST"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="VariableStorage" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="session"/>
      <xs:enumeration value="pagestate"/>
      <xs:enumeration value="temp"/>
      <xs:enumeration value="0"/>
      <xs:enumeration value="1"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="FormUpdateIfNotExists" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="insert"/>
      <xs:enumeration value="nothing"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:element name="tab">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyHtmlContent"/>
        <xs:element ref="v:template"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="initial-active" type="v:SqlName" use="optional"/>
      <xs:attribute name="style" type="xs:string" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="script">
    <xs:complexType mixed="true">
      <xs:sequence minOccurs="0" maxOccurs="unbounded">
        <xs:any namespace="##any"/>
      </xs:sequence>
      <xs:attribute name="language" type="v:SqlName" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="variable">
    <xs:complexType mixed="true">
      <xs:sequence minOccurs="0" maxOccurs="unbounded">
        <xs:any namespace="##any"/>
      </xs:sequence>
      <xs:attribute name="name" type="v:SqlName" use="required"/>
      <xs:attribute name="type" type="v:SqlName" use="required"/>
      <xs:attribute name="default" type="v:SqlCode" use="optional"/>
      <xs:attribute name="persist" type="v:VariableStorage" use="optional" default="pagestate"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="validator">
    <xs:complexType>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="test" type="xs:string" use="required"/>
      <xs:attribute name="min" type="xs:string" use="optional"/>
      <xs:attribute name="max" type="xs:string" use="optional"/>
      <xs:attribute name="regexp" type="xs:string" use="optional"/>
      <xs:attribute name="empty-allowed" type="xs:boolean" use="optional"/>
      <xs:attribute name="message" type="xs:string" use="required"/>
      <xs:attribute name="runat" type="v:ValidatorType" use="optional" default="server"/>
    </xs:complexType>
  </xs:element>
  <xs:simpleType name="ValidatorType" final="restriction">
    <xs:restriction base="xs:string">
      <xs:enumeration value="server"/>
      <xs:enumeration value="client"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:group name="UserInputTarget">
    <xs:choice>
      <xs:element ref="v:validator"/>
    </xs:choice>
  </xs:group>
  <xs:element name="field">
    <xs:complexType>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="button">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:element ref="v:field"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attribute name="action" type="v:ButtonAction" use="required"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="style" type="v:ButtonStyle" use="optional"/>
      <xs:attribute name="active" type="v:CalculateableValue" use="optional"/>
      <xs:attributeGroup ref="v:BrowseButtonParams"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="radio-button">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attributeGroup ref="v:UserInputAttributes"/>
      <xs:attribute name="group-name" type="xs:NCName" use="required"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="initial-checked" type="xs:integer" use="optional" default="0"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="check-box">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attributeGroup ref="v:UserInputAttributes"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="group-name" type="v:SqlName" use="optional"/>
      <xs:attribute name="initial-checked" type="xs:integer" use="optional" default="0"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="text">
    <xs:complexType mixed="false">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:UserInputTarget"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attributeGroup ref="v:UserInputAttributes"/>
      <xs:attribute name="type" type="v:TextInputType" use="optional" default="plain"/>
      <xs:attribute name="default" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="textarea">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:UserInputTarget"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attributeGroup ref="v:UserInputAttributes"/>
      <xs:attribute name="type" type="v:TextInputType" use="optional" default="plain"/>
      <xs:attribute name="default" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:simpleType name="TextInputType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="plain"/>
      <xs:enumeration value="password"/>
      <xs:enumeration value="hidden"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:element name="item">
    <xs:complexType>
      <xs:attribute name="name" type="v:SqlCode" use="required"/>
      <xs:attribute name="value" type="xs:string" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="select-list">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:element ref="v:item"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attributeGroup ref="v:UserInputAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="key">
    <xs:complexType>
      <xs:attribute name="column" type="v:SqlName" use="required"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="default" type="v:CalculateableValue" use="optional" default="null"/>
    </xs:complexType>
  </xs:element>
  <xs:group name="FormSpecificContent">
    <xs:choice>
      <xs:element ref="v:button"/>
      <xs:element ref="v:radio-group"/>
      <xs:element ref="v:radio-button"/>
      <xs:element ref="v:check-box"/>
      <xs:element ref="v:select-list"/>
      <xs:element ref="v:data-list"/>
      <xs:element ref="v:textarea"/>
      <xs:element ref="v:text"/>
      <xs:element ref="v:key"/>
      <xs:element ref="v:error-summary"/>
      <xs:element ref="v:calendar"/>
    </xs:choice>
  </xs:group>
  <xs:element name="label">
    <xs:complexType>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="format" type="xs:string" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="url">
    <xs:complexType>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="format" type="xs:string" use="optional"/>
      <xs:attribute name="url" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="active" type="v:CalculateableValue" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="data-list">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:SqlColumn"/>
      <xs:attribute name="table" type="v:SqlTableQname" use="required"/>
      <xs:attribute name="key" type="v:SqlName" use="required"/>
      <xs:attribute name="value" type="v:SqlName" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="node">
    <xs:complexType>
      <xs:attribute name="void" type="xs:string" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="tree">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:element ref="v:template"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="show-root" type="xs:boolean" use="required"/>
      <xs:attribute name="multi-branch" type="xs:boolean" use="required"/>
      <xs:attribute name="orientation" type="v:TreeOrientation" use="required"/>
      <xs:attribute name="root-function" type="v:SqlName" use="required"/>
      <xs:attribute name="child-function" type="v:SqlName" use="required"/>
      <xs:attribute name="start-path" type="v:CalculateableValue" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="error-summary">
    <xs:complexType>
      <xs:attribute name="match" type="xs:string" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:group name="FormNonSpecificContent">
    <xs:choice>
      <xs:element ref="v:variable"/>
      <xs:element ref="v:label"/>
      <xs:element ref="v:url"/>
      <xs:element ref="v:data-grid"/>
      <xs:element ref="v:data-set"/>
      <xs:element ref="v:tab"/>
      <xs:element ref="v:tree"/>
      <xs:element ref="v:include"/>
      <xs:element ref="v:isql"/>
    </xs:choice>
  </xs:group>
  <xs:element name="login-form">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="required" type="xs:boolean" use="required"/>
      <xs:attribute name="title" type="xs:string" use="required"/>
      <xs:attribute name="user-title" type="xs:string" use="required"/>
      <xs:attribute name="password-title" type="xs:string" use="required"/>
      <xs:attribute name="submit-title" type="xs:string" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="login">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:FormNonSpecificContent"/>
        <xs:group ref="v:FormSpecificContent"/>
        <xs:element ref="v:template"/>
        <xs:element ref="v:login-form"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="realm" type="xs:string" use="required"/>
      <xs:attribute name="mode" type="xs:string" use="required"/>
      <xs:attribute name="user-password" type="xs:string" use="optional"/>
      <xs:attribute name="user-password-check" type="xs:string" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:group name="AnyVspxPageContent">
    <xs:choice minOccurs="0" maxOccurs="unbounded">
      <xs:group ref="v:FormSpecificContent"/>
      <xs:group ref="v:FormNonSpecificContent"/>
      <xs:group ref="v:AnyHtmlContent"/>
      <xs:element ref="v:node"/>
      <xs:element ref="v:form"/>
      <xs:element ref="v:template"/>
      <xs:element ref="v:hidden"/>
      <xs:element ref="v:login"/>
      <xs:element ref="v:login-form"/>
    </xs:choice>
  </xs:group>
  <xs:element name="column">
    <xs:complexType>
      <xs:attribute name="name" type="v:SqlName" use="required"/>
      <xs:attribute name="label" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="input-format" type="xs:string" use="optional"/>
      <xs:attribute name="output-format" type="xs:string" use="optional"/>
      <xs:attributeGroup ref="v:HtmlGenAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="data-set">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
        <xs:element ref="v:column"/>
        <xs:element ref="v:param"/>
        <xs:element ref="v:key"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="sql" type="v:SqlCode" use="optional"/>
      <xs:attribute name="data-source" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="nrows" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="scrollable" type="xs:boolean" use="required"/>
      <xs:attribute name="cursor-type" type="v:PlCursorType" use="optional" default="dynamic"/>
      <xs:attribute name="edit" type="xs:boolean" use="optional" default="false"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="param">
    <xs:complexType>
      <xs:attribute name="name" type="v:SqlName" use="required"/>
      <xs:attribute name="value" type="v:CalculateableValue" use="required"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="data-grid">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
        <xs:element ref="v:column"/>
        <xs:element ref="v:param"/>
        <xs:element ref="v:key"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="data" type="v:CalculateableValue"/>
      <xs:attribute name="meta" type="v:CalculateableValue"/>
      <xs:attribute name="nrows" type="v:CalculateableValue"/>
      <xs:attribute name="sql" type="v:SqlCode" use="required"/>
      <xs:attribute name="scrollable" type="xs:boolean"/>
      <xs:attribute name="cursor-type" type="v:PlCursorType"/>
      <xs:attribute name="edit" type="xs:boolean"/>
      <xs:anyAttribute namespace="##any"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="isql">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:element ref="v:template"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="isolation" type="v:IsqlIsolation" use="optional"/>
      <xs:attribute name="timeout" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="maxrows" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="user" type="v:CalculateableValue" use="optional"/>
      <xs:attribute name="password" type="v:CalculateableValue" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:simpleType name="IsqlIsolation">
    <xs:restriction base="xs:string">
      <xs:enumeration value="committed"/>
    </xs:restriction>
  </xs:simpleType>
  <xs:element name="radio-group">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attributeGroup ref="v:UserInputAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="row-template">
    <xs:complexType>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="tree-node">
    <xs:complexType>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="hidden">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:AnyVspxPageContent"/>
      </xs:choice>
      <xs:attributeGroup ref="v:HtmlGenAttributes"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="style">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:AnyVspxPageContent"/>
      </xs:choice>
      <xs:attribute name="name" type="xs:NMTOKEN" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="placeholder">
    <xs:complexType/>
  </xs:element>
  <xs:element name="calendar">
    <xs:complexType>
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
        <xs:element ref="v:param"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="inital-date" type="v:CalculateableValue"/>
      <xs:anyAttribute namespace="##any"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="expression">
    <xs:complexType mixed="true">
      <xs:sequence minOccurs="0" maxOccurs="unbounded">
        <xs:any namespace="##any"/>
      </xs:sequence>
      <xs:attribute name="language" type="v:SqlName" use="optional"/>
    </xs:complexType>
  </xs:element>
  <xs:element name="data-source">
    <xs:complexType mixed="true">
      <xs:choice minOccurs="0" maxOccurs="unbounded">
        <xs:group ref="v:EventTarget"/>
        <xs:group ref="v:AnyVspxPageContent"/>
        <xs:element ref="v:column"/>
        <xs:element ref="v:param"/>
        <xs:element ref="v:expression"/>
      </xs:choice>
      <xs:attributeGroup ref="v:SqlGenAttributes"/>
      <xs:attribute name="expression-type" type="xs:string" use="required"/>
      <xs:attribute name="nrows" type="v:CalculateableValue" use="required"/>
      <xs:attribute name="initial-offset" type="v:CalculateableValue" use="required"/>
    </xs:complexType>
  </xs:element>
</xs:schema>
 
```

</div>
