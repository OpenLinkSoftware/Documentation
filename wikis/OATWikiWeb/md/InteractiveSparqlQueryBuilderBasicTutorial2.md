::: {.topic-text}
[]{#Basic iSPARQL Tutorial with query built from a blank canvas and Nodes from the Toolbar}Basic iSPARQL Tutorial with query built from a blank canvas and Nodes from the Toolbar
=================================================================================================================================================================================

This tutorial contains initial Steps assuming a blank canvas, and Nodes
you will drag from the Toolbar.

1.  Go to <http://cname/isparql,> for ex:
    <http://id.myopenlink.net/isparql>
2.  The iSPARQL initialization window will be shown:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparqlload.png){.c1}\
    \
3.  Finally will be presented the iSPARQL Advanced tab open with a
    default SPARQL query:\

        SELECT * WHERE {?s ?p ?o}

    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql1.png){.c1}\
    \

4.  Go to **QBE** tab:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql2.png){.c1}\
    \
5.  Click the **Clear** Pane icon on the toolbar to empty the Canvas:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql3.png){.c1}\
    \
    \
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql4.png){.c1}\
    \
6.  Change the **Data Source URI** field value on the QBE tab to the
    Graph of the database against which you want to execute your query,
    i.e., <http://id.myopenlink.net/dataspace>\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql5.png){.c1}\
    \
7.  Click the **Add nodes** Toolbar item\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql18.png){.c1}\
    \
8.  Drag the **Subject Node** to the Canvas\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql19.png){.c1}\
    \
9.  In the **Node** pane, enter the **Variable** value: **?pname**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql20.png){.c1}\
    \
10. Drag the **Object Node** to the Canvas\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql21.png){.c1}\
    \
11. In the **Node** pane, enter the **Variable** value: **?o**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql22.png){.c1}\
    \
12. Click the **Connector** Toolbar item\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql23.png){.c1}\
    \
13. Click and drag from **Subject Node** to **Object Node**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql24.png){.c1}\
    \
14. In the **Schema** pane, import the following Schemas/Ontologies:
    1.  rdf-schema: <http://www.w3.org/2000/01/rdf-schema>\#
    2.  FOAF - <http://xmlns.com/foaf/0.1/>\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql25.png){.c1}\
        \
        \
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql26.png){.c1}\
        \
15. Click on the **+** **Classes** icon in the FOAF schema to expand
    it.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql27.png){.c1}\
    \
16. Select the **Class** item **Person** and drag it over the **Subject
    Node**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql28.png){.c1}\
    \
17. Click the **Add nodes** Toolbar item and add a node to the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql29.png){.c1}\
    \
18. In the **Node** pane, enter the **Variable** value: **?sname**\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql30.png){.c1}\
    \
19. Click the **Connector** Toolbar item.
20. Click and drag from **Object Node** to the Node **?sname**:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql31.png){.c1}\
    \
21. Click on the **+** **Properties** icon in the rdfs schema in order
    to expand it.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql32.png){.c1}\
    \
22. Select the **Property** item **seeAlso** and drag it over the
    connection between the **Object Node** and the Node **?sname**:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql33.png){.c1}\
    \
23. Click on the **+** **Properties** icon in the FOAF schema in order
    to expand it and drag an **Attribute** (A) or **Relationship** (R)
    property from the Schema Window over the Connector between the
    Subject and the Object nodes. For example, drag the relationship
    **knows**.\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql34.png){.c1}\
    \
24. Click the **Run Query** button.
25. You should see in the Results tab the results found by the query
    execution:\
    \
    ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql35.png){.c1}\
    \
26. To view the generated query:
    1.  Go to the **QBE** tab and click the **Generate** button or
    2.  Go directly to the **Advanced tab**:\
        \
        ![](InteractiveSparqlQueryBuilderBasicTutorial2/isparql36.png){.c1}\
        \

[]{#Related}Related
-------------------

-   [iSPARQL
    Tutorials](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderTutorials){.wikiword}
-   [Basic iSPARQL Tutorial with query built from a blank canvas and
    pre-typed
    Nodes](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial1){.wikiword}
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
[CategoryTutorial](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryTutorial){.wikiword}
:::
