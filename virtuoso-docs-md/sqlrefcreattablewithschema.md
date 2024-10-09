<div>

<div>

<div>

<div>

### 9.8.9. The WITH SCHEMA Constraint

</div>

</div>

</div>

The WITH SCHEMA constraint allows you force values of an XML column to
match a particular schema. The syntax is as follows:

``` programlisting
WITH SCHEMA (namespace-uri, top-element-name [, optional-dtd-configuration])
```

To use this feature, you should make load an XMLSchema to the server by
a <a href="createxmlschema.html" class="link"
title="9.14. CREATE XML SCHEMA Statement">CREATE XML SCHEMA</a>
statement. As soon as schema is loaded, its target namespace URI can be
used in WITH SCHEMA constraint to validate every new value of the column
against this schema. In addition, the constraint ensures that the
document is a well-formed XML document (not a well-formed generic XML
entity) and checks if the name of the top level element of the document
is equal to one specified in the constraint.

Depending on document size and the complexity of the schema, schema
validation may be a time- and memory- consuming operation. An
application can win a lot if every stored value is validated only once
and avoid repeating validations on every read of the stored data, but it
also may loose if the validation is actually redundant (e.g. if the data
always comes from sources which produce valid content).

The parameter "optional-dtd-configuration" lets an application to
specify how strict the validation should be. In real life, documents may
match the schema in general, but not in minor details that are not
important for a particular application. If specified, the parameter must
be a string in the format described in
<a href="dtd_config.html" class="link"
title="15.7.2. Configuration Options of the DTD Validator">Configuration
Options of the DTD Validator</a> . The default value is suitable for
most of applications and forces the validator to check well-formedness
of the document, nesting of elements, presence of all "required"
attributes, syntax of values of typed elements and attributes; it also
will check referential integrity of ID and IDREF attributes.

<div>

**Example 9.26. Creating a table with the WITH SCHEMA constraint**

<div>

Here a simple table will be created with a WITH SCHEMA constraint.
Sample SQL statements follow that will demonstrate the effectiveness of
the check constraints.

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
</xs:schema>';

create table SPARE_PARTS (
  PACK_ID integer primary key,
  CONTENT XMLType with schema ('http://www.example.com/parts', 'Part')
  );

insert into SPARE_PARTS values (1, '
<p:Part xmlns:p="http://www.example.com/parts"
xml:id="keyboard">
  <p:Part Count="101"/>
  <p:Part
xml:id="body"/>
</p:Part>')

*** Error 42000: [Virtuoso Driver][Virtuoso Server]XML parser detected an error:
    ERROR  : Only 0 out of 1 required attributes are defined for element <p:Part>, e.g. the element has no attribute 'ID'
at line 3 column 25 of '(value to be placed in column DB.DBA.SPARE_PARTS of CONTENT)'
  <p:Part Count="101"/>
-----------------------^

insert into SPARE_PARTS values (2, '
<p:Part xmlns:p="http://www.example.com/parts"
xml:id="keyboard_01">
  <p:Part
xml:id="key" Count="101"/>
  <p:Part
xml:id="body_01"/>
</p:Part>')

select * from SPARE_PARTS
PACK_ID           CONTENT
INTEGER NOT NULL  LONG VARCHAR
_______________________________________________________________________________

2
<n0:Part xmlns:n0="http://www.example.com/parts"
xml:id="keyboard_02">
  <n0:Part
xml:id="key_01" Count="101" />
  <n0:Part
xml:id="body_02" />
</n0:Part>

1 Rows. -- 00000 msec.
```

</div>

</div>

  

ALTER TABLE ... MODIFY COLUMN statement does not support changes of WITH
SCHEMA constraint. Double check your XMLSchema and carefully test it on
real data used by an application before using this constraint. If you
can't test your schema this way then calling of
<a href="fn_xml_validate_schema.html" class="link"
title="xml_validate_schema"><code
class="function">xml_validate_schema()</code></a> in triggers may be
safer than using the constraint: such triggers will be slower than the
constraint but you can drop triggers without re-creating the table.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="createxmlschema.html" class="link"
title="9.14. CREATE XML SCHEMA Statement">CREATE XML SCHEMA
Statement</a></p>
<p><a href="fn_xml_validate_schema.html" class="link"
title="xml_validate_schema"><code
class="function">xml_validate_schema()</code></a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
