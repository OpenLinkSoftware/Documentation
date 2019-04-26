This chapter covers Virtuoso's XML, full text retrieval and related functions.

Virtuoso provides free text indexing capabilities for textual data, including XML data. Virtuoso supports extraction of XML documents from SQL datasets. It also supports XPath , XQuery , XSLT and XML Schema validation.

An SQL long varchar, long xml or xmltype column in a database table can contain XML data as text or in a binary serialized format, respectively. If a column value is a well-formed XML fragment there are special operations that can be performed on the value. There is an SQL data type that represents an XML entity. A string representing a well-formed XML entity can be converted into an entity object representing the root node. XPath expressions can then be applied to the entity in order to retrieve other entities or sets of entities. Returning an XML entity to a client application or printing it out on a dynamic web page will produce the text representation of the entity, complete with start and end tags, attributes, namespaces, and so forth.

An entity object can be stored as a value of a long varchar or varchar column. This will produce and store the text corresponding to the entity. Storing the same into a long xml or xmltype column will provide a more compact representation and will guarantee well-formedness and optionally schema validity, even if the data comes in as text.

A long varchar column can contain huge XML documents as special "persistent XML entity" objects. XML entities of this sort consume only a little amount of memory and load small portions of data from disk to memory on demand; an application can handle XML documents that are order of magnitude larger than the amount of available memory. LONG XML column type is convenient if a column contains only valid XML documents. An application can save XML entities to LONG XML columns and retrieve them back without calling any type conversion functions. A special user-defined type XMLType allows the use of an XML entity as a base for deriving user-defined types from it.

The xpath_contains SQL predicate can be used to test whether a column value matches a given XPath expression. If the XPath expression specifies a node set and that set is non-empty for a given column value, it is possible to bind a result variable to each element of the set. In this way a single row of data in a table can produce multiple rows in an SQL result set, one for each entity selected by the XPath predicate.

If there is a free text index on a column it is possible to define that the content be checked for well-formedness. In this case both contains and xpath_contains predicates can be applied to the same column in the same query. You should create a free text index on your XML data if you expect any content-based searches. The free text index will recognize specific features of XML and allow their use in searches.

The xcontains SQL predicate is a combination of XPath and free text, making automatic use of the free text index for evaluating an XPath expression. This predicate also allows you to test text values of entities for complex free text conditions such as proximity.

There is a user interface for using this feature on DAV resources. The use of the xpath_contains predicate is not limited to DAV resources though. The use of XPath with XML values is independent of free text indexing and of XML views.

Virtuoso offers functions for XPath processing of well-formed XML strings in SQL. Together with the Virtuoso free text support, these functions offer a powerful free-form and structured content retrieval system. You can search for XPath matches in any XML-populated column. One practical example would be the RES_CONTENT column of the WS.WS.SYS_DAV_RES table, which contains the contents of documents stored in the WebDAV repository. As with the sample database, which contains the XML sources for this documentation, you may store XML documents directly in the WebDAV repository.

An SQL statement can return complex XML documents based on relational data. Virtuoso supports both Microsoft's "FOR XML" syntax and the standard set of SQLX XML composing functions like XMLELEMENT and XMLAGG . Very complicated processing can be done in a single statement that combines XML composing functions, xquery_eval and xslt .

Virtuoso/PL routines can modify XML entities in DOM style (functions like XMLAppendChildren and XMLReplace ). Doing local changes this way can be simpler than via XSLT or XQuery; DOM modifications also help speed-critical applications to avoid unnecessary copying of data.

Virtuoso's XML parser can read XML documents of any complexity. It can validate source documents against DTD and XML schema, load compound documents or their fragments, recover from errors in ill-formed HTML documents like popular browsers can.

