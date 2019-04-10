::: {.topic-text}
[]{#Interactive SPARQL Query Builder: Basic Tutorial} Interactive SPARQL Query Builder: Basic Tutorial
======================================================================================================

::: {.MACRO_TOC .wikitoc}
[Creating RDF Instance Data using
iSPARQL](#Creating%20RDF%20Instance%20Data%20using%20iSPARQL)

[Querying](#Querying)

[Saving the Graph Model](#Saving%20the%20Graph%20Model)

[Generating a SPARQL Query from the Graph
Model](#Generating%20a%20SPARQL%20Query%20from%20the%20Graph%20Model)

[Setting Results Rows](#Setting%20Results%20Rows)

[Adding a dataset](#Adding%20a%20dataset)

[Other iSPARQL Features](#Other%20iSPARQL%20Features)

-   [Auto arrange the Graph
    Model](#Auto%20arrange%20the%20Graph%20Model)
-   [Group selected nodes of the Graph
    Model](#Group%20selected%20nodes%20of%20the%20Graph%20Model)
-   [Add Named Graph(s) to the SPARQL
    query](#Add%20Named%20Graph%28s%29%20to%20the%20SPARQL%20query)
-   [Add statement to the SPARQL
    query](#Add%20statement%20to%20the%20SPARQL%20query)

[Related](#Related)
:::

[]{#Creating RDF Instance Data using iSPARQL} Creating RDF Instance Data using iSPARQL
--------------------------------------------------------------------------------------

1.  Go to <http://cname/isparql,> for ex.
    <http://id.myopenlink.net/isparql>
2.  The iSPARQL initialization window will be shown:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isparqlload.png){.c1}\
    \
3.  Finally will be presented the iSPARQL **Advanced** tab open with a
    default SPARQL query:\

        SELECT * WHERE {?s ?p ?o}

    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isparql1.png){.c1}\
    \

4.  Go to **QBE** tab:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isparql2.png){.c1}\
    \
5.  Click the **Clear Pane** icon on the toolbar to empty the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isparql3.png){.c1}\
    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isparql4.png){.c1}\
    \
6.  Next we will import the Schemas that contain the Terms to be used in
    the our Graph Pattern. In the **Schemas** pane enter
    <http://rdfs.org/sioc/types>\# and click the \"Import\" button.
    Perform the same steps for the schema with URL:
    <http://rdfs.org/sioc/ns>\#
7.  As result the **Schemas** window under \"unbound\", you should now
    see the items **sioct** and **sioc**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg1.png){.c1}\
    \
8.  Now click on the **sioct** -\> **Classes** -\> **+** icon in order
    to expand the classes list:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg2.png){.c1}\
    \
9.  Scroll down the shown list and drag-and-drop the Subject Node
    **Weblog** onto the QBE working Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg3.png){.c1}\
    \
10. As result should be created a Subject node of Datatype
    **sioct:Weblog** at the point you dropped it.
11. The properties of the selected node are shown in the Subject
    **Node** pane where you can:
    1.  Change the **Node type** to URI or Literal;
    2.  Change the **Node Variable label** value;
    3.  Set the **Node Datatype**;
    4.  Set the **visibility property** of the variable by hatching the
        \"Visible?\" check-box;
    5.  Set **participation** in the \"Order By\" clause bz hatching the
        \"Order By\" check-box:\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg4.png){.c1}\
        \
12. You can **add a new node** from the QBE toolbar. Click the **Add
    mode** icon, and drag-and-drop an Object Node onto the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg5.png){.c1}\
    \
13. In the Object **Node** pane, change the **type** to **Literal** and
    change the **Variable** label value to **?s**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg6.png){.c1}\
    \
14. You can **add a Datatype to a node** through the **Schemas** pane or
    enter it manually. To use the Schemas pane \--
    1.  Import the schema that contains the terms you wish to use in
        your Graph Pattern. For ex. import the foaf schema:
        <http://xmlns.com/foaf/0.1/>\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg7.png){.c1}\
        \
    2.  Drag-and-drop the Class **Document** item from the Concepts list
        over the Node with **Literal** type that we created above.
    3.  You should now see that the **Datatype** in the **Node** pane
        for the selected node has changed, from **Literal** to
        **foaf:Document**.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg8.png){.c1}\
        \
15. To **delete a node**, select the desired node, e.g., the Node with
    Variable label **?s**, and click the **Remove** button in the QBE
    toolbar. You will be prompted to verify deletion. Click **OK** to
    delete.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg9.png){.c1}\
    \
16. You can add more nodes:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg10.png){.c1}\
    \
17. **Add connections** by clicking the **Connector** icon on the QBE
    toolbar and drag from one node to another.
    1.  For example, drag a connection from the node with Variable label
        **?forum** to the **?post** node.
    2.  A connection will now be shown between the two nodes and a
        **Connector** pane will be shown above the **Schema** pane; this
        is the property window for the currently selected connection.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg11.png){.c1}\
        \
    3.  Enter for **Name** for ex. **sioc:container\_of** and un-hatch
        the **Visible?** check-box.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg12.png){.c1}\
        \
    4.  Click the **Connector** icon from the QBE toolbar and drag from
        the **?post** node to to the **?maker** node.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg13.png){.c1}\
        \
    5.  In the **Connector** pane, check the **Optional?** check-box and
        un-hatch the **Visible?** check-box.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg14.png){.c1}\
        \
    6.  Now we will add a type (from the foaf schema) to this
        connection. The type can be an **Attribute** (A) or
        **Relationship** (R) property from the Schema pane.
        \"Attribute\" (A) items are shown under each imported Schema\'s
        Properties with a green letter \"A\" icon. \"Relationship\" (R)
        items are shown under each imported Schema\'s Properties with a
        blue letter \"R\" icon. In the **Schemas** pane, go to foaf -\>
        Properties and drag the \"Relationship\" (R) property **maker**
        onto the selected connection on the Canvas.
    7.  In the **Connector** pane, the value of the **Name** field will
        change to **foaf:maker**. Note that the connection line between
        the nodes **?post** and **?maker** is not solid, because we set
        it to be optional in the **Connector** window:\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg15.png){.c1}\
        \
    8.  Click the \"Connector\" icon from the QBE toolbar and drag from
        the **?maker** node to the **?nick** node.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg16.png){.c1}\
        \
    9.  In the **Connector** window hatch the **Optional?** check-box
        and un-hatch the **Visible?** check-box. Enter **foaf:nick** for
        **Name**.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg17.png){.c1}\
        \
18. **The Final Graph Model** can be viewed in the QBE working pane.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg18.png){.c1}\
    \

[]{#Querying} Querying
----------------------

1.  We now have the final graph model. Before using it in a query, we
    need to set a proper target Graph URI. For this, change the value in
    the **Data Source URI** field for ex. to
    <http://id.myopenlink.net/dataspace>\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg19.png){.c1}\
    \
2.  Click the **Run Query** button on the QBE toolbar.
3.  The query results will be shown in the **Results** tab.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg20.png){.c1}\
    \
4.  You can also change dereferencing:
    -   \"SPARQL Describe\" ( by default ): for selected link of the
        result set performs describe, for ex. for link
        \"<http://id.myopenlink.net/dataspace/Bratsas/weblog/Bratsas%27s%20Weblog>\":\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg21.png){.c1}\
        \
    -   \"SELECT IRI as S or O\": for selected link of the result set
        performs select IRI as S or O, for ex. for link
        \"<http://id.myopenlink.net/dataspace/Bratsas/weblog/Bratsas%27s%20Weblog>\":\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg22.png){.c1}\
        \
    -   \"GET PAGE\": for selected link of the result set performs
        redirect to this link, for ex. for link
        \"<http://id.myopenlink.net/dataspace/Bratsas/weblog/Bratsas%27s%20Weblog>\":\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg23.png){.c1}\
        \
    -   \"Use Virtuoso Web Service\", for selected link of the result
        set performs Virtuoso Web Service execution, for ex. link for
        \"<http://id.myopenlink.net/dataspace/Bratsas/weblog/Bratsas%27s%20Weblog>\":\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg24.png){.c1}\
        \
5.  View the SPARQL parameters values in the **SPARQL Params** sub-tab:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg25.png){.c1}\
    \
6.  View the response values from the **Response** sub-tab:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg26.png){.c1}\
    \
7.  View the SPARQL query produced from the graph model you have built
    from the **Query** sub-tab:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg27.png){.c1}\
    \

[]{#Saving the Graph Model} Saving the Graph Model
--------------------------------------------------

1.  Go to QBE tab and click the **Save As** icon from the QBE toolbar.
2.  As result should be shown the
    WebDAV[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/WebDAV&parent=InteractiveSparqlQueryBuilderBasicTutorial){.wikiword}
    Browser:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg28.png){.c1}\
    \
3.  Select a destination folder, input a file name, for e.g.,
    MySimpleTest[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/MySimpleTest&parent=InteractiveSparqlQueryBuilderBasicTutorial){.wikiword},
    and select **SPARQL Definitions (\*.rq)** for **File type**. You may
    also save the query in XML format, by choosing **Dynamic Data Web
    Page (\*.isparql)** for **File type**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg29.png){.c1}\
    \
4.  Click \"Save\".

[]{#Generating a SPARQL Query from the Graph Model} Generating a SPARQL Query from the Graph Model
--------------------------------------------------------------------------------------------------

1.  Go to QBE tab.
2.  Click the **Generate** icon on the toolbar.
3.  The **Advanced** tab will open, with the query generated from your
    Graph in the **SPARQL Query** text-area.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg30.png){.c1}\
    \
4.  Use the **Prefixes**, **Templates**, and **Statement Help**
    drop-down lists above the **SPARQL Query** text-area to format the
    query.
    -   *Note*: You can revert your changes by clicking the \"Get from
        QBE\" button on the **Advanced** tab toolbar.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg31.png){.c1}\
        \
5.  Now in the SPARQL Query Working area of the Advanced tab, add a new
    optional node to the query for **foaf:phone**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg32.png){.c1}\
    \
6.  To apply the query changes to the Graph model, click the
    \"Visualize\" button on the **Advanced** tab toolbar.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg33.png){.c1}\
    \

[]{#Setting Results Rows} Setting Results Rows
----------------------------------------------

1.  Go to the **QBE** tab.
2.  At the bottom of the page change in \"Query options\" the **Resize
    site limit** value, for ex. to 10:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg34.png){.c1}\
    \

[]{#Adding a dataset} Adding a dataset
--------------------------------------

1.  On the QBE toolbar, click the **Dataset** button.
2.  Choose **Type** and enter a **Data Source URI** value.
3.  Click the **Add** button.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg35.png){.c1}\
    \

[]{#Other iSPARQL Features} Other iSPARQL Features
--------------------------------------------------

### []{#Auto arrange the Graph Model} Auto arrange the Graph Model

1.  Go to the **QBE** tab.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg36.png){.c1}\
    \
2.  Click the **Auto arrange** icon on the toolbar.
3.  The Graph model layout will be re-arranged to a more compact form.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg37.png){.c1}\
    \

### []{#Group selected nodes of the Graph Model} Group selected nodes of the Graph Model

1.  Go to the **QBE** tab.
2.  Select several nodes from the Graph. You can do this by holding the
    \"Shift\" (on Windows) or \"Command\"/\"Apple\" (on Mac) key while
    clicking the nodes.
3.  Click the \"Group Selected\" icon from the toolbar.
4.  The selected nodes will be shown on the Canvas in one-color area as
    grouped. You can use the **Group** pane which will be shown above
    the **Schemas** window to:
    -   Change the **Group Type**: Graph, Optional, Union or Construct
    -   Set the Group\'s ID label.\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial/isg38.png){.c1}\
        \

### []{#Add Named Graph(s) to the SPARQL query} Add Named Graph(s) to the SPARQL query

1.  Click to the **Advanced** tab.
2.  Click to the **Named Graph(s)** sub-tab.
3.  In the form, enter a value for **Named Graph**, and click the
    **Add** button.
4.  The number of added Graphs will be shown, right-aligned to the
    **Named Graph(s)** sub-tab.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial/isg39.png){.c1}\
    \

### []{#Add statement to the SPARQL query} Add statement to the SPARQL query

1.  Go to the **Advanced** tab.
2.  You can add a statement to the SPARQL Query with
    -   the **Statement Help** drop-down list or
    -   the **Statement Help** button shown right after it.
        1.  Click the button \"Statement Help\".
        2.  Click on the desired statement name in the **Statement
            Help** window which appears.\
            \
            ![](InteractiveSparqlQueryBuilderBasicTutorial/isg40.png){.c1}\
            \

[]{#Related} Related
--------------------

-   [iSPARQL
    Tutorials](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderTutorials){.wikiword}
-   [Basic iSPARQL Tutorial with query built from a blank canvas and
    pre-typed
    Nodes](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial1){.wikiword}
-   [Basic iSPARQL Tutorial with query built from a blank canvas and
    Nodes dragged from the
    Toolbar](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial2){.wikiword}
-   [iSPARQL Querying Tutorial with SPARQL Query type
    \"CONSTRUCT\"](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialConstruct){.wikiword}
-   [iSPARQL Querying Tutorial with SPARQL Query type
    \"DESCRIBE\"](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialDescribe){.wikiword}
-   [iSPARQL Querying Tutorial \"DESCRIBE\" with Google Maps View
    Results](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialDescribeGoogleMapView){.wikiword}
-   [iSPARQL Querying Tutorial with SPARQL Query type
    \"INSERT\"](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialInsert){.wikiword}
-   [iSPARQL Querying Tutorial with SPARQL Query type
    \"DELETE\"](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialDelete){.wikiword}
-   [iSPARQL Querying Tutorial with SPARQL Query type
    \"SELECT\"](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialSlc){.wikiword}
-   [OpenLink AJAX Toolkit
    (OAT)](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/OATWikiWebIndex){.wikiword}

[CategorySPARQL](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategorySPARQL){.wikiword}
[CategoryRDF](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryRDF){.wikiword}
[CategoryOpenSource](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryOpenSource){.wikiword}
[CategoryOAT](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryOAT){.wikiword}
[CategoryTutorial](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryTutorial){.wikiword}
[CategoryDocumentation](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryDocumentation){.wikiword}
:::
