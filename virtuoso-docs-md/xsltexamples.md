<div>

<div>

<div>

<div>

### 15.9.5. XSLT Examples

</div>

</div>

</div>

This section covers some examples of applying XSLT to various stored
data.

<div>

**Example 15.23. XSLT example**

<div>

``` programlisting
create procedure xml_view_string (in _view varchar)
{
  declare _body any;
  declare _pf varchar;
  _body := string_output ();
  http ('<document>', _body);
  _pf := concat ('DB.DBA.http_view_', _view);
  call (_pf) (_body);
  http ('</document>', _body);

  return (string_output_string (_body));
}
```

``` programlisting
create procedure xslt_view (in v varchar, in xst varchar)
{

  declare str, r varchar;
  xslt_sheet (xst, xtree_doc (file_to_string (xst)));
  str := xml_view_string (v);
  r := xslt (xst, xtree_doc (str));
  declare str_out any;
  str_out := string_output ();
  http_value (r, 0, str_out);
  string_to_file ('xslt.out', string_output_string (str_out), 0);
}
```

</div>

</div>

  

These functions will take the serialized text of an XML view created
with CREATE XML VIEW, transform it with a stylesheet and store the
result into a file.

The first function returns a string containing the text generated as the
value of the XML view specified as argument. It calls the serialization
function, which is

``` programlisting
DB.DBA.http_view_ +
view name
```

. This function writes the text into the string output stream passed to
it. Note that the function wraps the text inside a *`<document>`*
element in order to make it well-formed, since the view serialization
function will emit multiple top-level elements, one for each selected
row in the root table in the XML view.

The `xslt_view()` function first defines the style sheet, which it takes
from a file in this case. The `xslt_sheet()` function is called with the
name and root element of the parsed file.

The function next gets the string to process, parses it as XML, and
converts the parse tree into an entity object. This is then passed to
the `xslt()` function. The result is another entity object. This is
finally serialized as XML text and written into the file *`xslt.out`* .

These examples show how to parse and serialize XML using varchars,
string output streams and the entity data type.

The central points are:

<div>

1.  The XML entity object is a reference to a particular element of a
    parsed XML document, The underlying document is only visible through
    this reference. A string is converted into such a document and a
    reference to the document's root is returned by the

    ``` programlisting
    xtree_doc (string)
    ```

    function. In previous versions of Virtuoso, the combination

    ``` programlisting
    xml_tree_doc (xml_tree (string))
    ```

    was used for this purpose; this combination still works to maintain
    backwards compatibility, but using xtree_doc() is preferable.

2.  A string output is used to capture the serialization of data by the
    `http_value()` function. If the string output were not specified the
    data would be sent to the HTTP client directly, if we were running
    in an HTTP request context.

</div>

</div>
