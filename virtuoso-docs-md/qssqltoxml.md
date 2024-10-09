<div>

<div>

<div>

<div>

## 3.9. SQL to XML

</div>

</div>

</div>

Virtuoso enables you to develop eBusiness solutions that use XML as both
a Data Source and Data Interchange format. Your XML Data documents can
take the form of Pure XML Documents, or documents that are transformed
from SQL-XML on the fly. By supporting the XPATH query language for XML
Data, you are able to use an industry standard query language to query
entire XML Documents or portions of XML Documents stored within
Virtuoso. Virtuoso's inclusion of an XSLT transformation engine then
allow you to transform XML data for other needs. These XML documents are
openly accessible to user agents such as Web Browsers via HTTP and/or
WebDAV. These XML documents are described as being dynamic because they
have varying degrees of sensitivity to changes that occur in the
underlying database tables from which the XML data originates. Virtuoso
allows you to create two types of XML documents from homogeneous or
heterogeneous SQL Data on the fly:

|                                                                                                                                                                                                                                                                                                                                |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Transient*</span> The materialization of the XML Document occurs at the time of file opening, this implies that data from the original SQL database(s) is retrieved and then transformed into XML in one operation. This format of SQL-XML document is highly sensitive to source database(s) changes. |
| <span class="emphasis">*Persistent (Time Synchronized)*</span> - The materialization of the XML Document re-occurs at a user configurable interval after initial creation. This is a caching scheme which is less sensitive to changes in the source databases(s) in favor of performance.                                     |

SQL-XML documents may be Valid or Well Formed XML documents, this
includes support for both DTDs and XML Schemas which my be external
entity references or inlined within the XML Documents prologue in the
case of DTDs.

Virtuoso supports an extended SQL syntax that is identical to that
implemented by Microsoft SQL Server for the purpose of creating SQL-XML
documents. These SQL extensions take the form of a new "FOR XML" clause
that includes three main options which control the structure of the
resulting XML document tree. These options are
<span class="emphasis">*RAW*</span> ,
<span class="emphasis">*AUTO*</span> and
<span class="emphasis">*EXPLICIT*</span> .

Virtuoso's HTML based graphical interface includes a user friendly
mechanism for creating dynamic XML documents from SQL data using the
"FOR XML" extended SQL syntax. The dynamic XML documents created by this
process are typically stored in Virtuoso's WebDAV repository. Documents
stored in this repository are accessible by any XML consuming client
application via HTTP, Windows Web Folders, or any other WebDAV or HTTP
compliant environment. A description of the interface in general can be
found in the <a href="admui.xmlservices.html#sqlxmlstmts" class="link"
title="SQL-XML Statements">SQL-XML Statements</a> in the Visual Server
Administration Interface section.

From Conductor <span class="emphasis">*XML/SQL_XML*</span> you can
execute SQL query with options on how to produce XML structures from the
results.

<div>

<div>

**Figure 3.52. SQL to XML**

<div>

<div>

![SQL to XML](images/ui/qssql2xml001.png)

</div>

</div>

</div>

  

</div>

The illustration above depicts the fact that only minor changes to
standard SQL are required in order to create powerful dynamic XML
documents from SQL. It also illustrates how the entire process of
controlling the type and format of the XML documents and their actually
WebDAV storage is all achieved without any programming. The XML document
extract below is a depiction of the XML document tree produced using the
"FOR XML" AUTO option.

<div>

<div>

**Figure 3.53. SQL to XML results**

<div>

<div>

![SQL to XML results](images/ui/qssql2xml002.png)

</div>

</div>

</div>

  

</div>

The Virtuoso Demo database provides a set of sample tables in the Demo
catalogue, and some sample XML views that use them. The "StoredQueries"
tab lists saved XML Views as shown below.

<div>

<div>

**Figure 3.54. SQL to XML save views**

<div>

<div>

![SQL to XML save views](images/ui/qssql2xml003.png)

</div>

</div>

</div>

  

</div>

You can press <span class="emphasis">*Edit*</span> to edit them, or
<span class="emphasis">*Delete*</span> to remove them or click on the
XML FILE itself to see the results in your default browser, a sample of
the output is shown above.

<div>

<div>

<div>

<div>

### 3.9.1. FOR XML Execution Modes

</div>

</div>

</div>

Now we will consider the programmatical approach along side the visual
interface approach. We will have one example of each of the modes of FOR
XML combined with the
<a href="fn_xml_auto.html" class="link" title="xml_auto"><code
class="function">xml_auto()</code></a> function to help us display the
results simply.

For the programmatical examples to run smoothly using ISQL a number of
steps are required to obtain textual output from the xml_auto() function
which usually is expected to output directly to an HTTP target. To make
the demonstration simpler a utility procedure will be created that will
simply enable us to supply SQL and return XML using the
<a href="fn_xml_auto.html" class="link" title="xml_auto"><code
class="function">xml_auto()</code></a> function.

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

<div>

- <span class="emphasis">*RAW*</span> mode produces an XML entity from
  each row of the result set, and does not attempt to construct
  hierarchies. Each row's data is enclosed in a ROW element and each
  column is either an attribute or child element.

  <div>

  <div>

  **Figure 3.55. SQL to XML using FOR XML RAW mode**

  <div>

  <div>

  ![SQL to XML using FOR XML RAW mode](images/ui/qssql2xml103.png)

  </div>

  </div>

  </div>

    

  </div>

  The same SQL statement containing the FOR XML syntax is used in the
  visual interface shown above, and in the programmatical version shown
  below. This is because both use the xml_auto() function for generating
  results. In the visual interface once the settings and query have been
  confirmed you press the "Execute" button to store the query in the
  specified DAV location.

  ``` programlisting
  xmla ('select "category"."CategoryID", "CategoryName",
      "ProductName", "ProductID"
      from "Demo".."Categories" "category", "Demo".."Products" as "product"
      where "product"."CategoryID" = "category"."CategoryID" FOR XML RAW');
  ```

  <div>

  |                              |                                                                                                                                                                           |
  |:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                     |
  |                              | The xmla function is not a standard function but quick utility for quickly rendering a text output for the <a href="fn_xml_auto.html" class="link" title="xml_auto"><code 
                                  class="function">xml_auto()</code></a> function. The definition is at the top of this section                                                                              |

  </div>

  The resulting XML from either ISQL or the saved links on the visual
  interface will yield:

  ``` screen
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Chai" ProductID="1">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Chang" ProductID="2">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Guaran Fantastica" ProductID="24">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Sasquatch Ale" ProductID="34">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Steeleye Stout" ProductID="35">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="C(te de Blaye" ProductID="38">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Chartreuse verte" ProductID="39">
  </ROW>
  <ROW CategoryID="1" CategoryName="Beverages" ProductName="Ipoh Coffee" ProductID="43">
  </ROW>
  .....
  ```

- <span class="emphasis">*AUTO*</span> mode. A hierarchy is constructed
  with one level for each table of the join for which at least one
  column is selected. The table whose column is first mentioned in the
  selection will be the topmost element, the next table its child etc.
  Each level of the tree will consist of one type of element. A parent
  element will have multiple children if consecutive rows do not differ
  in the column values coming from the parent element. When a table's
  column values differ from the previous row, the element and all
  children thereof are closed and a new element is started, with
  children filled out from other columns of the result set.

  <div>

  <div>

  **Figure 3.56. SQL to XML using FOR XML AUTO mode**

  <div>

  <div>

  ![SQL to XML using FOR XML AUTO mode](images/ui/qssql2xml102.png)

  </div>

  </div>

  </div>

    

  </div>

  The same SQL statement containing the FOR XML syntax is used in the
  visual interface shown above, and in the programmatical version shown
  below. This is because both use the xml_auto() function for generating
  results. In the visual interface once the settings and query have been
  confirmed you press the execute button to store the query in the
  specified DAV location.

  ``` programlisting
  xmla ('select "category"."CategoryID", "CategoryName",
      "ProductName", "ProductID"
      from "Demo".."Categories" "category", "Demo".."Products" as "product"
      where "product"."CategoryID" = "category"."CategoryID" FOR XML AUTO');
  ```

  <div>

  |                              |                                                                                                                                                                           |
  |:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                     |
  |                              | The xmla function is not a standard function but quick utility for quickly rendering a text output for the <a href="fn_xml_auto.html" class="link" title="xml_auto"><code 
                                  class="function">xml_auto()</code></a> function. The definition is at the top of this section                                                                              |

  </div>

  The resulting XML from either ISQL or the saved links on the visual
  interface will yield:

  ``` screen
  <category CategoryID="1" CategoryName="Beverages">
  <product ProductName="Chai" ProductID="1">
  </product>
  <product ProductName="Chang" ProductID="2">
  </product>
  <product ProductName="Guaranß Fantßstica" ProductID="24">
  </product>
  <product ProductName="Sasquatch Ale" ProductID="34">
  </product>
  <product ProductName="Steeleye Stout" ProductID="35">
  </product>
  <product ProductName="C(te de Blaye" ProductID="38">
  </product>
  <product ProductName="Chartreuse verte" ProductID="39">
  </product>
  <product ProductName="Ipoh Coffee" ProductID="43">
  </product>
  <product ProductName="Laughing Lumberjack Lager" ProductID="67">
  </product>
  .....
  ```

  <div>

  |                              |                                                                                                                                                                                                 |
  |:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                           |
  |                              | In contrast to the RAW mode AUTO produces results that are more reasonable and intuitive. Only one category element is used for each category which contains all the children of that category. |

  </div>

- <span class="emphasis">*EXPLICIT*</span> mode gives more control on
  the resulting tree's structure while requiring a more elaborate query
  structure. In this mode, the query will be a UNION ALL of many joins
  and each row will specify exactly one element. Which type of element
  this is and where in the tree it will be placed are determined by the
  values of the 2 first columns, TAG and PARENT.

  <div>

  <div>

  **Figure 3.57. SQL to XML using FOR XML EXPLICIT mode**

  <div>

  <div>

  ![SQL to XML using FOR XML EXPLICIT mode](images/ui/qssql2xml101.png)

  </div>

  </div>

  </div>

    

  </div>

  The same SQL statement containing the FOR XML syntax is used in the
  visual interface shown above, and in the programmatical version shown
  below. This is because both use the xml_auto() function for generating
  results. In the visual interface once the settings and query have been
  confirmed you press the execute button to store the query in the
  specified DAV location.

  ``` programlisting
  xmla ('
  select 1 as tag, null as parent,
         "CategoryID" as [category!1!cid],
         "CategoryName" as [category!1!name],
         NULL as [product!2!pid],
         NULL as [product!2!name!element]
  from "Demo".."Categories"
  union all
  select 2, 1, "category" ."CategoryID", NULL, "ProductID", "ProductName"
      from "Demo".."Categories" "category", "Demo".."Products" as "product"
      where "product"."CategoryID" = "category"."CategoryID"
  order by [category!1!cid], 5
  FOR XML EXPLICIT');
  ```

  <div>

  |                              |                                                                                                                                                                           |
  |:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                     |
  |                              | The xmla function is not a standard function but quick utility for quickly rendering a text output for the <a href="fn_xml_auto.html" class="link" title="xml_auto"><code 
                                  class="function">xml_auto()</code></a> function. The definition is at the top of this section                                                                              |

  </div>

  The resulting XML from either ISQL or the saved links on the visual
  interface will yield:

  ``` screen
  <CATEGORY CID="1" NAME="Beverages">
  <PRODUCT PID="1">
   <NAME>Chai</NAME></PRODUCT>
  <PRODUCT PID="2">
   <NAME>Chang</NAME></PRODUCT>
  <PRODUCT PID="24">
   <NAME>Guaran&#225; Fant&#225;stica</NAME></PRODUCT>
  <PRODUCT PID="34">
   <NAME>Sasquatch Ale</NAME></PRODUCT>
  <PRODUCT PID="35">
   <NAME>Steeleye Stout</NAME></PRODUCT>
  <PRODUCT PID="38">
   <NAME>C&#244;te de Blaye</NAME></PRODUCT>
  <PRODUCT PID="39">
   <NAME>Chartreuse verte</NAME></PRODUCT>
  <PRODUCT PID="43">
   <NAME>Ipoh Coffee</NAME></PRODUCT>
  <PRODUCT PID="67">
   <NAME>Laughing Lumberjack Lager</NAME></PRODUCT>
  <PRODUCT PID="70">
   <NAME>Outback Lager</NAME></PRODUCT>
  <PRODUCT PID="75">
   <NAME>Rh&#246;nbr&#228;u Klosterbier</NAME></PRODUCT>
  <PRODUCT PID="76">
   <NAME>Lakkalik&#246;&#246;ri</NAME></PRODUCT>
  </CATEGORY>
  <CATEGORY CID="2" NAME="Condiments">
  <PRODUCT PID="3">
  .....
  ```

  <div>

  |                              |                                                                          |
  |:----------------------------:|:-------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                    |
  |                              | In contrast again, the EXPLICIT mode produces exactly what we asked for. |

  </div>

</div>

For more details about 'FOR XML, refer to
<a href="ch-webandxml.html#forxmlforsql" class="link"
title="15.1. Rendering SQL Queries as XML (FOR XML Clause)">Rendering
SQL Queries as XML</a> section of the XML Support chapter.

</div>

</div>
