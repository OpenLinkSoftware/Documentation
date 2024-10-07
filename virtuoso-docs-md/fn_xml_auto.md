<div id="fn_xml_auto" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_auto — prepares and executes given SQL for XML string output

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_auto" class="funcsynopsis">

|                       |                              |
|-----------------------|------------------------------|
| ` `**`xml_auto`**` (` | in `sql_text ` varchar ,     |
|                       | in `params ` any ,           |
|                       | in `string_output ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xml_auto" class="refsect1">

## Description

This function prepares and executes the given SQL string, which should
be a query expression with the FOR XML clause at the end of the last
term. The query is passed the parameters from the params vector, which
should have one element for each ? in the query text, values assigned
from left to right. Consider the query: select a, b from table where a =
? and b = ?; then the params vector could reasonably be:

``` screen
vector(1, 'myfilter')
```

.

The result set is converted to XML and appended to the *`string`*
\_output. If the *`string`* \_output is omitted and the function
executes in the context of a VSP page, the output is sent to the stream
going to the user agent.

</div>

<div id="params_xml_auto" class="refsect1">

## Parameters

<div id="id122706" class="refsect2">

### sql_text

Valid SQL query using the FOR XML clause. Parameterized queries can be
constructed using the question mark (?) to specify a parameter
place-holder that will be replaced at run time with the appropriate
value from the *`params `* vector.

</div>

<div id="id122710" class="refsect2">

### params

Vector of parameters, one element per ? used in the query.

</div>

<div id="id122713" class="refsect2">

### string_output

String variable or stream for receiving the result.

</div>

</div>

<div id="ret_xml_auto" class="refsect1">

## Return Types

If you omit the third parameter, this function will output to the
context of the calling VSP page.

</div>

<div id="errors_xml_auto" class="refsect1">

## Errors

<div id="id122721" class="table">

**Table 24.130. Errors signalled by `xml_auto `**

<div class="table-contents">

| SQLState                              | Error Code                      | Error Text                                                                                                                                        | Description                                                                    |
|---------------------------------------|---------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| <span class="errorcode">42000 </span> | <span class="errorcode"></span> | <span class="errortext">http output function outside of http context and no stream specified </span>                                              | From an attempt to send the output directly to a non HTTP target such as ISQL. |
| <span class="errorcode">42000 </span> | <span class="errorcode"></span> | <span class="errortext">Column 1 of the result set of the select statement should be of INTEGER type when FOR XML EXPLICIT clause is used </span> |                                                                                |
| <span class="errorcode">42000 </span> | <span class="errorcode"></span> | <span class="errortext">Column 2 of the result set of the select statement should be of INTEGER type when FOR XML EXPLICIT clause is used </span> |                                                                                |

</div>

</div>

  

</div>

<div id="examples_xml_auto" class="refsect1">

## Examples

<div id="ex_xml_auto" class="example">

**Example 24.507. Producing XML from SQL**

<div class="example-contents">

The procedure below takes an SQL string, evaluates it - converting to
XML - and produces a result set where the XML text is returned as a
varchar column. Parameters are not passed in this example for the sake
of simplicity.

``` programlisting
create procedure xmla (in q varchar)
{
  declare st any;
  st := string_output ();
  xml_auto (q, vector (), st);
  result_names (q);
  result (string_output_string (st));
}
```

</div>

</div>

  

</div>

<div id="seealso_xml_auto" class="refsect1">

## See Also

<a href="fn_xml_auto_schema.html" class="link"
title="xml_auto_schema"><code
class="function">xml_auto_schema() </code></a> ,
<a href="fn_xml_auto_dtd.html" class="link" title="xml_auto_dtd"><code
class="function">xml_auto_dtd() </code></a>

</div>

</div>
