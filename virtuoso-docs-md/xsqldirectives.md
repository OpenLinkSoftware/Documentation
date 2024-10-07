<div id="xsqldirectives" class="section">

<div class="titlepage">

<div>

<div>

### 17.16.2. XSQL Directives

</div>

</div>

</div>

<div id="xsql_delete_request" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:delete-request

</div>

</div>

</div>

Deletes the rows listed in the context XML.

``` programlisting
<xsql:delete-request
  table="table_name"
  key-columns="column_list"
  [ transform="calculateable_URI_string" ]
/>
```

If 'transform' URI is specified then it is used as a name of XSLT
stylesheet that is applied to the context XML before the rest of
processing. The result of that stylesheet should be in standard
ROWSET/ROW form. The result may also contain elements with other names
but they will be silently ignored.

After this optional XSLT transformation, the XSQL procedure gets all ROW
elements in all top-level ROWSET elements of the source XML. For each
such element it parses all subelements whose names match column names
listed in the 'key-columns' attribute. It is legal to have a ROW element
that does not contain an element that matches a particular column; the
missing element is treated as a database NULL. If a subelement of ROW
has attribute 'NULL' equal to 'Y' then it is also treated as database
NULL.

When required subelements of ROW are parsed, the procedure deletes all
rows from the specified table that have all specified column values
equal to values specified by ROW subelements. When the delete operation
is complete, the procedure parses all subelements of the next ROW
element in queue and so on.

``` programlisting
<xsql:delete-request table='"Demo"."demo"."Customers"' key-columns='"CustomerID"'/>
```

</div>

<div id="xsql_dml" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:dml

</div>

</div>

</div>

Executes an arbitrary fragment of Virtuoso/PL code.

``` programlisting
<xsql:dml>
One or more Virtuoso/PL statements, {@X} syntax is allowed.
</xsql:dml>
```

The XSQL procedure will contain the text of the directive 'as is'; the
only change is that `{@X}` notation is replaced with appropriate
Virtuoso/PL variables. Note that the use of `<![CDATA[...]]>` XML syntax
is very convenient here.

``` programlisting
<xsql:set-page-param name="X" value="2"/>
<xsql:set-page-param name="Y" value="2"/>
<xsql:dml><![CDATA[
-- This will simply print the string on server's console:
dbg_obj_print ('Hello World\n');
-- This will compose a string '2 * 2 =' and print on console:
dbg_obj_print ('{@X} * {@Y} = ');
-- This will calculate and print a well-known product.
-- Note that attempt to write {@X * @Y} or {@X * Y} results in a syntax error.
dbg_obj_print ({@X} * {@Y}, '\n');
]]>
</xsql:dml>
```

</div>

<div id="xsql_include_owa" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:include-owa

</div>

</div>

</div>

This Oracle-specific directive is not implemented.

</div>

<div id="xsql_include_param" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:include-param

</div>

</div>

</div>

Puts the value of the specified page parameter into the resulting XML of
the page.

``` programlisting
<xsql:include-param name="page_param_name"/>
```

This writes the value of the specified page parameter as an element
whose name is made from the name of parameter. NULL value results in an
empty element that has attribute named 'NULL' with value 'Y'.

Note that XML elements ROWSET and ROW have special use in XSQL pages.
The use of parameter names ROWSET and ROW is legal but may cause
undesired effects.

``` programlisting
<xsql:set-page-param name="an-int" value="2"/>
<xsql:set-page-param name="an-xml" value="xtree_doc('<sample>text</sample>')"/>
<xsql:set-page-param name="a-null" value="NULL"/>

<!-- This will form an element <an-int>2</an-int> -->

<xsql:include-param name="an-int"/>

<!-- This will form an element <an-xml><sample>text</sample></an-xml> -->

<xsql:include-param name="an-xml"/>

<!-- This will form an element <a-null NULL="Y"/> -->

<xsql:include-param name="a-null"/>
```

</div>

<div id="xsql_include_request_params" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:include-request-params

</div>

</div>

</div>

This directive is not implemented in this version.

</div>

<div id="xsql_include_xml" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:include-xml

</div>

</div>

</div>

This directive is not implemented in this version.

</div>

<div id="xsql_include_xsql" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:include-xsql

</div>

</div>

</div>

This directive is not implemented in this version.

</div>

<div id="xsql_insert_param" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:insert-param

</div>

</div>

</div>

Inserts rows listed in XML that is stored in page parameter.

``` programlisting
<xsql:insert-param
  name="parameter_XML_name"
  table="table_name"
  [ mode="enum" (could be "into", "soft" or "replacing", default is "into") ]
  [ columns="column_list" ]
  [ date-format="string" (allowed but ignored) ]
  [ transform="calculateable_URI_string" ]
/>
```

The directive inserts into a table all data rows listed in the value of
a page parameter that is named by 'name' attribute. The destination
table is specified by 'table' attribute.

If 'transform' URI is specified then it is used as a name of XSLT
stylesheet that is applied to the source data before the rest of
processing. The result of that stylesheet should be in standard
ROWSET/ROW form. The result may also contain redundant elements but they
will be silently ignored.

After this optional XSLT transformation, the XSQL procedure gets all ROW
elements in all top-level ROWSET elements of the source. For each such
element it parses all subelements whose names match column names listed
in the 'columns' attribute; if the 'columns' attribute is not specified
then all column names from the destination table are used. It is legal
to have a ROW element that does not contain an element that matches a
particular column; the missing element is treated as a database NULL. If
a subelement of ROW has attribute 'NULL' equal to 'Y' then it is also
treated as database NULL.

When required subelements of ROW are parsed, the procedure adds a row to
the table. It executes INSERT INTO, INSERT SOFT or INSERT REPLACING
statement depending on the value of 'mode' attribute. When the insert
operation is complete, the procedure parses all subelements of the next
ROW element in queue and so on.

``` programlisting
<xsql:insert-param name="customer-details" table='"Demo"."demo"."Customers"' />
```

</div>

<div id="xsql_insert_request" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:insert-request

</div>

</div>

</div>

Inserts the rows listed in context XML.

``` programlisting
<xsql:insert-request
  table="table_name"
  [ mode="enum" (could be "into", "soft" or "replacing", default is "into") ]
  [ columns="column_list" ]
  [ date-format="string" (allowed but ignored) ]
  [ transform="calculateable_URI_string" ]
/>
```

The directive inserts into a table all data rows listed in context XML.
The destination table is specified by 'table' attribute.

If 'transform' URI is specified then it is used as a name of XSLT
stylesheet that is applied to the context XML before the rest of
processing. The result of that stylesheet should be in standard
ROWSET/ROW form. The result may also contain redundant elements but they
will be silently ignored.

After this optional XSLT transformation, the XSQL procedure gets all ROW
elements in all top-level ROWSET elements of the source. For each such
element it parses all subelements whose names match column names listed
in the 'columns' attribute; if the 'columns' attribute is not specified
then all column names from the destination table are used. It is legal
to have a ROW element that does not contain an element that matches a
particular column; the missing element is treated as a database NULL. If
a subelement of ROW has attribute 'NULL' equal to 'Y' then it is also
treated as database NULL.

When required subelements of ROW are parsed, the procedure adds a row to
the table. It executes INSERT INTO, INSERT SOFT or INSERT REPLACING
statement depending on the value of 'mode' attribute. When the insert
operation is complete, the procedure parses all subelements of the next
ROW element in queue and so on.

``` programlisting
<xsql:insert-request table='"Demo"."demo"."Customers"' columns='"CustomerID", "Phone", "Fax"'/>
```

</div>

<div id="xsql_query" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:query

</div>

</div>

</div>

This executes an SELECT statement and writes its result set into the
resulting XML in some sort of ROWSET/ROW format.

``` programlisting
<xsql:query
  [ fetch-size="integer" (allowed but ignored) ]
  [ id-attribute="calculateable_XML_NAME_string" ]
  [ id-attribute-column="SQL_column_name" ]
  [ max-rows="integer_SQL_expn" (default is no limit) ]
  [ null-indicator="boolean" (default value is "no") ]
  [ row-element="calculateable_XML_NAME_string" (default value is "ROW") ]
  [ rowset-element="string" (default value is "ROWSET") ]
  [ skip-rows="integer_SQL_expn" (default is no skip) ]
  [ tag-case="enum" (could be "lower" or "upper", default is "lower") ]
>
Text of SELECT statement, {@X} syntax is allowed.
</xsql:query>
```

When no attributes is specified, the directive executes the SELECT
statement and composes an XML fragment that consists of ROWSET element
that have one ROW child element per row of the result set of the
executed statement. Every ROW has one child element per result set
column. The name of each element is made by converting column name to
lowercase and element values are serializations of result set fields.
The procedure does not create elements for fields with NULL values so an
element with no text inside means empty string value but the totally
missing element means NULL. In addition, ROW element have so-called "id
attribute" whose name is 'num' and value is a number of the row in the
result set.

If attribute 'null-indicator' is equal to '1' or 'yes' then elements are
created for both non-NULL and NULL field values. Unlike elements that
represent empty strings, element that represent NULL will have an
attribute with name 'NULL' and value 'Y'.

Attributes 'id-attribute' and 'id-attribute-column' configures the
composing of "id attribute". 'id-attribute-column' instructs to use the
value specified SQL column as a value of attribute, 'id-attribute' can
specify an attribute name other than default 'num'.

Attribute 'tag-case' specifies the character case of elements for
columns. This does not affect names for ROW and ROWSET elements.

Element names ROW and ROWSET can be changed to whatever else by
specifying attributes 'row-element' and 'rowset-element'. Either or both
of these elements can be omitted at all by specifying empty string value
for appropriate attributes; this will prevent the result set from proper
parsing by some standard tools but may be convenient for special
purposes. Note that If 'row-element' is empty string and ROW should not
be created then attributes 'id-attribute' and 'id-attribute-column'
should not be used.

Attributes 'max-rows' and 'skip-rows' adds TOP N and SKIP N clauses to
the specified SELECT statement. They are supported mostly for
compatibility. Attribute 'fetch-size' is ignored at all.

Note that Oracle allows the xsql:query to contain any code that produces
a result set whereas Virtuoso allows only SELECT statement.

``` programlisting
<xsql:set-page-param name="usermask" value="'%DAV%'"/>
<xsql:query>
-- This will produce the following XML fragment:
-- <ROWSET>
--   <ROW num="1"><u_id>3</u_id><u_name>administrators</u_name>
--      <u_full_name>WebDAV Administrators</u_full_name><ROW>
--   <ROW num="2"><u_id>3</u_id><u_name>dav</u_name>
--      <u_full_name>WebDAV System Administrator</u_full_name><ROW>
-- </ROWSET>
SELECT U_ID, U_NAME, U_FULL_NAME from SYS_USERS where U_FULL_NAME like {@usermask}
</xsql:query>
```

</div>

<div id="xsql_ref_cursor" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:ref-cursor-function

</div>

</div>

</div>

This directive is not implemented in this version of Virtuoso Server.

</div>

<div id="xsql_set_cookie" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:set-cookie

</div>

</div>

</div>

This Oracle-specific directive is not implemented.

</div>

<div id="xsql_set_page_param" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:set-page-param

</div>

</div>

</div>

Declares a page parameter and assigns a value to it.

``` programlisting
<xsql:set-page-param
  name="XML_name"
  [ ignore-empty-value="boolean" ]
  [ value="SQL_expression" ]
  [ xpath="XPATH_expression" ]
>
SQL expression, {@X} syntax is allowed, but only
for names that were declared above the current one.
</xsql:set-page-param>
```

The declaration should contain either 'value' attribute or 'xpath'
attribute or a SQL expression as a text inside element, but not two or
three of them simultaneously. The specified expression is calculated and
the result is saved as a page variable with name specified by 'name'
attribute. The resulting page variable can be used in other SQL
expressions and calculateable strings of the page via '{@X}' notation
described in <a href="xsql.html#xsqlsyntax" class="link"
title="17.16.1. XSQL Syntax">XSQL Syntax</a> subsection above.

If the directive uses 'xpath' attribute, the XPATH expression is applied
to the context XML of the page. To apply an XPATH expression to some
other XML entity, use
<a href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval()</code></a> function in SQL expression
specified by 'value' attribute or text inside the element.

If attribute 'ignore-empty-value' is set to 'yes' or '1' and the value
of the calculated expression is an empty string then the page parameter
is set to NULL. This may be convenient for handling default values that
are passed to the page from HTML forms.

It is recommended to have names of parameters compatible with "XML 1.1
unqualified name" syntax. Hence, it is better to use minus sign instead
of underscore and avoid using unusual characters like spaces. This
become important when you use xsql:include-param because the name of
create XML element will be equal to the name of parameter.

``` programlisting

<!-- string constant '%DAV%' is an SQL expression -->

<xsql:set-page-param name="user-mask" value="'%DAV%'"/>

<!-- SELECT statement is an expression too, but only when enclosed in parenthesis.
  Without parenthesis, it is an SQL operator but not an SQL expression. -->

<xsql:set-page-param name="user-id">
(select U_ID from SYS_USERS where U_FULL_NAME like {@user-mask})
</xsql:set-page-param>

<!-- This copies implicit page argument 'context XML'
  into plain page parameter 'my-context' -->

<xsql:set-page-param name="my-context" xpath="." />
```

</div>

<div id="xsql_set_session_param" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:set-session-param

</div>

</div>

</div>

This Oracle-specific directive is not implemented.

</div>

<div id="xsql_set_stylesheet_param" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:set-stylesheet-param

</div>

</div>

</div>

This directive is not implemented.

</div>

<div id="xsql_update_request" class="section">

<div class="titlepage">

<div>

<div>

#### xsql:insert-request

</div>

</div>

</div>

Updates the rows listed in context XML.

``` programlisting
<xsql:update-request
  key-columns="column_list"
  table="table_name"
  [ columns="column_list" ]
  [ date-format="string" (allowed but ignored) ]
  [ transform="calculateable_URI_string" ]
/>
```

The directive updates a table by changing rows listed in the context
XML. The destination table is specified by 'table' attribute.

If 'transform' URI is specified then it is used as a name of XSLT
stylesheet that is applied to the context XML before the rest of
processing. The result of that stylesheet should be in standard
ROWSET/ROW form. The result may also contain redundant elements but they
will be silently ignored.

After this optional XSLT transformation, the XSQL procedure gets all ROW
elements in all top-level ROWSET elements of the source. For each such
element it parses all subelements whose names match column names listed
in the 'key-columns' attribute or in the 'columns' attribute; if the
'columns' attribute is not specified then it works as if all column
names from the destination table are listed in 'columns'. It is legal to
have a ROW element that does not contain an element that matches a
particular column; the missing element is treated as a database NULL. If
a subelement of ROW has attribute 'NULL' equal to 'Y' then it is also
treated as database NULL.

When required subelements of ROW are parsed, the procedure updates all
rows in the table that have all values of key columns equal to values
listed in ROW. All these rows are updated by values from subelements of
ROW. If 'columns' is specified then only named fields are updated;
otherwise, the update operation changes all fields of a table.

When the update operation is complete, the procedure parses all
subelements of the next ROW element in queue and so on.

``` programlisting
<xsql:insert-request table='"Demo"."demo"."Customers"' columns='"CustomerID", "Phone", "Fax"'/>
```

</div>

</div>
