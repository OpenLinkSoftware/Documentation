<div id="createxmlschema" class="section">

<div class="titlepage">

<div>

<div>

## 9.14. CREATE XML SCHEMA Statement

</div>

</div>

</div>

``` programlisting
<xml schema definition> ::=
    CREATE XML SCHEMA <text of schema>
```

Virtuoso supports registering XML Schemas for use in
<a href="sqlrefcreattablewithschema.html" class="link"
title="9.8.9. The WITH SCHEMA Constraint">WITH SCHEMA</a> constraint for
column values. The statement contains the whole text of the schema as a
string constant, i.e. enclosed in single quotes. This is not the best
possible syntax, because single quotes inside the text of schema should
be carefully quoted, but this is de-facto standard. If the schema
contains number of single quotes (e.g. attributes are in single quotes
instead of typically used double quotes), try a system stored procedure

``` programlisting
DB.DBA.SYS_CREATE_XML_SCHEMA (text_of_schema);
```

that will have the same effect, but is not portable.

In principle, you can register any valid XMLSchema, but some features
can cause prohibitive loss of performance. It is strongly advised to
compose the schema as a "standalone" document that has no references to
external DTDs or external generic entities. It is also strongly advised
to avoid xs:include and xs:import directives. The only sort of external
references that does not affect performance is xs:include or xs:import
of a registered "sibling" schema. They say that a schema X is a
"sibling" of schema Y if their target namespace URIs have identical
protocol names and host names and differs only in local path, and schema
X imports Y using relative (not absolute!) URI that contain only
relative path, (no protocol and no host).

<div id="ex_createxmlschema" class="example">

**Example 9.29. Registering Sibling Schemas**

<div class="example-contents">

Two sibling schemas are registered here. First statement registers an
XMLSchema for "http://www.example.com/parts" target namespace. Second
statement registers an XMLSchema for "http://www.example.com/jobs"
target namespace that imports the first schema using relative URI. The
rest of statements demonstrate a single WITH SCHEMA constraint that
inspect elements of these two target namespaces.

``` programlisting
CREATE XML SCHEMA '<?xml version="1.0" encoding="utf-8" ?>
<xs:schema targetNamespace="http://www.example.com/parts"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:p="http://www.example.com/parts">
   <xs:element name="Part">
      <xs:complexType>
         <xs:choice minOccurs="0" maxOccurs="unbounded">
       <xs:element ref="p:Part"/>
     </xs:choice>
         <xs:attribute name="ID" type="xs:string" use="required" />
         <xs:attribute name="Count" type="xs:int" use="optional" />
         <xs:attribute name="Type" type="xs:string" use="optional" />
      </xs:complexType>
   </xs:element>
</xs:schema>'

CREATE XML SCHEMA '<?xml version="1.0" encoding="utf-8" ?>
<xs:schema targetNamespace="http://www.example.com/jobs"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:p="http://www.example.com/parts"
  xmlns:j="http://www.example.com/jobs">
   <xs:import schemaLocation="parts" />
   <xs:element name="Job">
      <xs:complexType>
         <xs:sequence>
       <xs:element ref="p:Part"/>
     </xs:sequence>
         <xs:attribute name="JobID" type="xs:string" use="required" />
      </xs:complexType>
   </xs:element>
</xs:schema>'

create table JOBS (
  PACK_ID integer primary key,
  CONTENT XMLType with schema ('http://www.example.com/jobs', 'Job')
  )

insert into JOBS values (1, '
<j:Job xmlns:j="http://www.example.com/jobs" xmlns:p="http://www.example.com/parts" JobID="asmkeyboard">
  <p:Part xmlns:p="http://www.example.com/parts"
xml:id="keyboard_03">
    <p:Part Count="101"/>
    <p:Part
xml:id="body_03"/>
  </p:Part>
</j:Job>')

*** Error 42000: [Virtuoso Driver][Virtuoso Server]XML parser detected an error:
    ERROR  : Only 0 out of 1 required attributes are defined for element <p:Part>, e.g. the element has no attribute 'ID'
at line 4 column 27 of '(value to be placed in column DB.DBA.JOBS of CONTENT)'
    <p:Part Count="101"/>
-------------------------^

insert into JOBS values (2, '
<j:Job xmlns:j="http://www.example.com/jobs" xmlns:p="http://www.example.com/parts" JobID="asmkeyboard">
  <p:Part xmlns:p="http://www.example.com/parts"
xml:id="keyboard_04">
    <p:Part
xml:id="key_02" Count="101"/>
    <p:Part
xml:id="body_04"/>
  </p:Part>
</j:Job>');
```

</div>

</div>

  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                     |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                               |
|                              | There is no way to change a registered schema if it is used in some WITH SCHEMA constraint. Double-check any schema before using it, because it may be hard to fix the error later. |

</div>

</div>
