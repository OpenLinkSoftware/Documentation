<div id="xsd_interface" class="section">

<div class="titlepage">

<div>

<div>

### 15.7.3. XML Schema Definition Language

</div>

</div>

</div>

The W3C XML Schema Definition Language is a way of describing and
constraining the content of XML documents.

The XML Schema specification consists of three parts. One part defines a
set of simple datatypes, which can be associated with XML element types
and attributes; this allows XML software to do a better job of managing
dates, numbers, and other special forms of information. The second part
of the specification proposes methods for describing the structure and
constraining the contents of XML documents, and defines the rules
governing schema validation of documents. The third part is a primer
that explains what schemas are, how they differ from DTDs, and how one
builds a schema.

XML Schema introduces new levels of flexibility that may accelerate the
adoption of XML for significant industrial use. For example, a schema
author can build a schema that borrows from a previous schema, but
overrides it where new unique features are needed. XML Schema allows the
author to determine which parts of a document may be validated, or
identify parts of a document where a schema may apply. XML Schema also
provides a way for users of e-commerce systems to choose which XML
Schema they use to validate elements in a given namespace, thus
providing better assurance in e-commerce transactions and greater
security against unauthorized changes to validation rules. Further, as
XML Schema are XML documents themselves, they may be managed by XML
authoring tools, or through XSLT. The implementation of XML Schema in
Virtuoso is based on
<a href="http://www.w3c.org/XML/Schema" class="ulink" target="_top">the
W3C XML Schema Specification</a> .

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

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
href="http://www.w3c.org/TR/xmlschema-0/" class="ulink"
target="_top">XML Schema Part-0: Primer</a></p>
<p><a href="http://www.w3c.org/TR/xmlschema-1/" class="ulink"
target="_top">XML Schema Part-1: Structures</a></p>
<p><a href="http://www.w3c.org/TR/xmlschema-2/" class="ulink"
target="_top">XML Schema Part-2: Datatypes</a></p></td>
</tr>
</tbody>
</table>

</div>

For parsing the schema definitions the DTD definition of XML Schema is
used. This definition was taken from
<a href="http://www.w3c.org/TR/xmlschema-1/" class="ulink"
target="_top">XML Schema Part-1: Structures</a> .

</div>
