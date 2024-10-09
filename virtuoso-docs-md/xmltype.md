<div>

<div>

<div>

<div>

## 15.10. XMLType

</div>

</div>

</div>

XMLType is a predefined type for representing XML entities as UDT
objects. This is compatible with Oracle9i and later. You can get better
performance and flexibility by using use plain built-in functions that
directly operate with XML entities. All predefined member functions of
XMLType for extracting fragments from an XMLType are actually wrappers
for <a href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval()</code></a> built-in function. You can
declare a column of XMLType but the actual type of the created column
will be "LONG XML". Thus any XML-related feature that can be used for
"LONG XML" column will work with XMLType. E.g.
<a href="sqlrefcreattablewithschema.html" class="link"
title="9.8.9. The WITH SCHEMA Constraint">WITH SCHEMA constraint</a>
allows you to force stored values to match a particular schema;
<a href="usingxmlfreetext.html" class="link"
title="15.4.5. Using XML and Free Text">XML free text index</a> can
accelerate search for documents by content etc.

XMLType behaves like any user-defined type, with the only difference in
type conversion rules. If an XML entity is passed as an argument instead
of an instance of XMLType, a new instance of XMLType is created by a
constructor that takes the entity as an argument. Similarly, functions
that accept XML entities as arguments can also accept an instance of
XMLType as an actual value of argument.

The following example creates a table with an XMLType column, put two
records there and performs a simple search:

``` screen
CREATE TABLE Xml_tab ( xmlval XMLType);

INSERT INTO Xml_tab VALUES (
   xmltype('<?xml version="1.0"?>
               <EMP>
                  <EMPNO>221</EMPNO>
                  <ENAME>John</ENAME>
               </EMP>'));

INSERT INTO Xml_tab VALUES (
   xmltype('<?xml version="1.0"?>
               <PO>
                  <PONO>331</PONO>
                  <PONAME>PO_1</PONAME>
               </PO>'));

-- now extract the numerical values for the employee numbers

SELECT e.xmlval.extract('//EMPNO/text()').getNumVal() as empno
   FROM Xml_tab
   WHERE e.xmlval.existsnode('/EMP/EMPNO')  = 1;
```

To create a new instance of XMLType, the constructor
<a href="fn_xmltype.xmltype.html" class="link"
title="XMLType.XMLType"><code class="function">XMLType()</code></a> or a
function
<a href="fn_createxml.html" class="link" title="createXML"><code
class="function">createXML()</code></a> is used.

Virtuoso can perform XPATH search in XMLType instances:
<a href="fn_xmltype.extract.html" class="link"
title="XMLType.extract"><code class="function">extract()</code></a> and
<a href="fn_xmltype.existsnode.html" class="link"
title="XMLType.existsNode"><code
class="function">existsNode()</code></a> member functions are convenient
for simple searches and any built-in XPATH functions like
<a href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval()</code></a> or
<a href="fn_xquery_eval.html" class="link" title="xquery_eval"><code
class="function">xquery_eval()</code></a> can handle XMLType parameters
instead of XML entity parameters. An application can use
<a href="fn_xmltype.getstringval.html" class="link"
title="XMLType.getStringVal"><code
class="function">getStringVal()</code></a> ,
<a href="fn_xmltype.getnumval.html" class="link"
title="XMLType.getNumVal"><code class="function">getNumVal()</code></a>
and <a href="fn_xmltype.getclobval.html" class="link"
title="XMLType.getClobVal"><code
class="function">getColbVal()</code></a> member functions to convert
found node to strings, numbers or an XML source text of the node.

Instances of the type can store the URL of the XML schema to which they
should conform. This URL can be specified when an instance is
constructed; Once an instance is created, its schema URL cannot be
changed but a modified copy can be created by
<a href="fn_xmltype.createschemabasedxml.html" class="link"
title="XMLType.createSchemaBasedXML"><code
class="function">createSchemaBasedXML()</code></a> and
<a href="fn_xmltype.createnonschemabasedxml.html" class="link"
title="XMLType.createNonSchemaBasedXML"><code
class="function">createNonSchemaBasedXML()</code></a> member functions;
<a href="fn_xmltype.isschemabased.html" class="link"
title="XMLType.isSchemaBased"><code
class="function">isSchemaBased()</code></a> and
<a href="fn_xmltype.getschemaurl.html" class="link"
title="XMLType.getSchemaURL"><code
class="function">getSchemaURL()</code></a> member functions check
whether the given instance is schema based or not and what particular
schema is used.

An schema based XMLType instance can be validated against its schema; If
it has been validated against its schema once with no errors detected
then a special "VALIDATED" flag is set in the instance indicating that
there is no need to validate it again.
<a href="fn_xmltype.schemavalidate.html" class="link"
title="XMLType.schemaValidate"><code
class="function">schemaValidate()</code></a> member function performs
the validation, <a href="fn_xmltype.isschemavalidated.html" class="link"
title="XMLType.isSchemaValidated"><code
class="function">isSchemaValidated()</code></a> queries the "VALIDATED"
flag and <a href="fn_xmltype.setschemavalidated.html" class="link"
title="XMLType.setSchemaValidated"><code
class="function">setSchemaValidated()</code></a> changes the "VALIDATED"
flag if application needs optimization tricks.

In addition, any instance can be validated against an arbitrary schema
via member function <a href="fn_xmltype.isschemavalid.html" class="link"
title="XMLType.isSchemaValid"><code
class="function">isSchemaValid()</code></a> . Built-in function
`xml_validate_schema()` may accept instance of XMLType as its first
argument, providing even more validation functionality.

</div>
