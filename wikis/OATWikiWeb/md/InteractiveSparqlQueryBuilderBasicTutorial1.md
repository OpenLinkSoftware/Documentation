::: {.topic-text}
[]{#Basic Tutorial for iSPARQL, the Interactive SPARQL Query Builder (part 2)} Basic Tutorial for iSPARQL, the Interactive SPARQL Query Builder (part 2)
========================================================================================================================================================

::: {.MACRO_TOC .wikitoc}
-   [Building a query on a blank canvas, starting with pre-defined
    schema
    nodes](#Building%20a%20query%20on%20a%20blank%20canvas%2C%20starting%20with%20pre-defined%20schema%20nodes)
-   [Related](#Related)
:::

[]{#Building a query on a blank canvas, starting with pre-defined schema nodes} Building a query on a blank canvas, starting with pre-defined schema nodes
----------------------------------------------------------------------------------------------------------------------------------------------------------

This tutorial contains Initial Steps assuming a query is being built
from a blank canvas and you want the Nodes to be pre-typed (i.e., you
will drag-and-drop from the schema window).

1.  Go to <http://cname/isparql,> for ex.
    <http://id.myopenlink.net/isparql>
2.  The iSPARQL initialization window will be shown:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparqlload.png){.c1}\
    \
3.  Finally will be presented the iSPARQL **Advanced** tab open with a
    default SPARQL query:\

        SELECT * WHERE {?s ?p ?o}

    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql1.png){.c1}\
    \

4.  Go to **QBE** tab:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql2.png){.c1}\
    \
5.  Click the **Clear Pane** icon on the toolbar to empty the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql3.png){.c1}\
    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql4.png){.c1}\
    \
6.  Change the **Data Source URI** field value on the QBE tab to the
    Graph of the database against which you want to execute your query,
    for ex: <http://id.myopenlink.net/dataspace>\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql5.png){.c1}\
    \
7.  Go to the **Schemas** Pane.
8.  Import the Schema that contains the Terms to be used in your Graph
    Pattern. For this example, import the FOAF schema -
    <http://xmlns.com/foaf/0.1/>\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql6.png){.c1}\
    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql7.png){.c1}\
    \
9.  Click on the imported schema **Classes** item **+** icon to expand
    it.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql8.png){.c1}\
    \
10. Drag a **Subject Node**, e.g. **Person**, onto the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql9.png){.c1}\
    \
11. Select the node with value **?** and in the **Node** pane, change
    the **Variable** field value to: **?s**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql10.png){.c1}\
    \
12. Select the **Add nodes** icon from the QBE Navigation bar, and drag
    an **Object Node** on to the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql11.png){.c1}\
    \
13. In the **Node** pane, enter the **Variable** value: **?pname**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql12.png){.c1}\
    \
14. Select the **Connector** icon from the QBE Navigation bar and
    connect the node **?s** with node **?pname**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql13.png){.c1}\
    \
15. Click on the FOAF schema **Properties** item **+** icon to expand
    it.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql14.png){.c1}\
    \
16. Drag an **Attribute** (A) or **Relationship** (R) property onto the
    connector between the nodes **?s** and **?pname**. For example, drag
    the attribute **name**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql15.png){.c1}\
    \
17. Click the **Run Query** button.
18. You should see the results found by the query execution shown in the
    Results tab.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql16.png){.c1}\
    \
19. To view the generated query:
    1.  Go to **QBE** tab and click the **Generate** button or
    2.  Go directly to the **Advanced** tab:
20. As result the generated query will be shown in the Advanced tab
    canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial1/isparql17.png){.c1}\
    \

[]{#Related}Related
-------------------

-   [iSPARQL
    Tutorials](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderTutorials){.wikiword}
-   [Basic iSPARQL Tutorial with query built from a blank canvas and
    Nodes dragged from the
    Toolbar](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial2){.wikiword}
-   [Basic iSPARQL
    Tutorial](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial){.wikiword}
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
[CategoryDocumentation](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryDocumentation){.wikiword}
[CategoryWebSite](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryWebSite){.wikiword}
[CategoryTutorial](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryTutorial){.wikiword}
:::
