::: {.topic-text}
[]{#iSPARQL Querying Tutorial with SPARQL Query type "CONSTRUCT".}iSPARQL Querying Tutorial with SPARQL Query type \"CONSTRUCT\".
---------------------------------------------------------------------------------------------------------------------------------

This tutorial shows how to execute a SPARQL query with type
\"CONSTRUCT\". You can find a rich list of Virtuoso SPARQL Queries in
the [References](#References){.c1} section.

::: {.MACRO_TOC .wikitoc}
[iSPARQL Querying Tutorial with SPARQL Query type
\"CONSTRUCT\".](#iSPARQL%20Querying%20Tutorial%20with%20SPARQL%20Query%20type%20%22CONSTRUCT%22.)

[Enter and execute a query](#Enter%20and%20execute%20a%20query)

[References](#References)

-   [ODS SPARQL Queries](#ODS%20SPARQL%20Queries)
-   [ODS Applications SPARQL
    Queries](#ODS%20Applications%20SPARQL%20Queries)
-   [Other Virtuoso SPARQL
    Queries](#Other%20Virtuoso%20SPARQL%20Queries)

[Related](#Related)
:::

### []{#Enter and execute a query}Enter and execute a query

Choose a SPARQL query from the [References](#References){.c1} list. For
this example, let\'s use the SPARQL query which dumps sender, nick, and
name details for all Weblog posts. You can find this SPARQL Query in the
ODS FOAF Queries
List[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/ODSFOAFRef&parent=InteractiveSparqlQueryBuilderQueryTutorialConstruct){.wikiword}.

\

    PREFIX sioc: <http://rdfs.org/sioc/ns#>
    PREFIX sioct: <http://rdfs.org/sioc/types#>
    PREFIX foaf: <http://xmlns.com/foaf/0.1/>
    CONSTRUCT
    {
      ?post foaf:maker ?maker .
      ?maker foaf:nick ?nick .
      ?maker foaf:name ?fname .
    }
    FROM <http://id.myopenlink.net/dataspace>
    WHERE
       {
        ?forum a sioct:Weblog .
        ?forum sioc:container_of ?post.
        OPTIONAL { ?post foaf:maker ?maker }.
        OPTIONAL { ?maker foaf:nick ?nick  } .
        OPTIONAL { ?maker foaf:name ?fname } .
      }

1.  Go to <http://cname/isparql,> for ex.
    <http://id.myopenlink.net/isparql>
2.  The iSPARQL initialization window will be shown:\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isparqlload.png){.c2}\
    \
3.  On successful initialization will be presented the iSPARQL
    **Advanced** tab open with a default SPARQL query:\

        SELECT * WHERE {?s ?p ?o}

    \
    \
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isparql1.png){.c2}\
    \

4.  Go to **QBE** tab:\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isparql2.png){.c2}\
    \
5.  Click the **Clear Pane** icon on the toolbar to empty the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isparql3.png){.c2}\
    \
    \
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isparql4.png){.c2}\
    \
6.  Change the **Data Source URI** field value on the QBE tab to the
    Graph of the database against which you want to execute your query,
    i.e., <http://id.myopenlink.net/dataspace>\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isparql5.png){.c2}\
    \
7.  Click the **Advanced** tab.
8.  Change the **Graph** value to also be as in our example
    `http://id.myopenlink.net/dataspace` and enter (copy-and-paste) the
    query chosen above into the **SPARQL Query** text-area:\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc1.png){.c2}\
    \
9.  Click the **Run Query** button on the **Advanced** tab.
10. The **Results** sub-tab shown below the Results tab will present the
    results of executing our SPARQL Query. By default is View -\>
    **Navigator** mode.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc2.png){.c2}\
    \
11. You can change the visualization to:
    -   **Raw Triples** mode:\
        \
        ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc3.png){.c2}\
        \
    -   **Grid View** mode:\
        \
        ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc4.png){.c2}\
        \
    -   **SVG Graph** mode:\
        \
        ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc5.png){.c2}\
        \
        -   **Equal distances** drop-down menu offers **Equal
            distances** (default) or **All nodes at once**.\
            \
            ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc6.png){.c2}\
            \
        -   **Random** drop-down menu, active only when **\"All nodes at
            once\"** is chosen, offers nodes positioning of **Random**
            (default) or **Circle**.\
            \
            ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc7.png){.c2}\
            \
        -   **Show all nodes** drop-down menu lets you limit the
            displayed nodes by their distance from the selected node,
            from 1 (default) to 4; for example, **Selected up to
            distance 3**.\
            \
            ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc8.png){.c2}\
            \
        -   **Medium distance** drop-down menu adjusts distances between
            nodes, making depiction clearer or more overlapped. Options
            are **Medium distance** (default), **Close distance**, and
            **Far distance**.\
            \
            ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc9.png){.c2}\
            \
        -   **Planar** drop-down menu adjusts model shape between
            **Planar** (default) and **Pseudo-spherical**.\
            \
            ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc10.png){.c2}\
            \
        -   **Labels only on one element** drop-down menu determines
            which nodes are labeled \-- **Labels only on one element**
            (default), **Up to distance from 1 to 4**, or **Labels on
            all elements**.\
            \
            ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc11.png){.c2}\
            \
    -   **Images** mode.
    -   **Google Maps v3** mode:
12. You can view your SPARQL Query with type \"CONSTRUCT\" as a Graph
    model by clicking the \"Load Query to QBE\" button.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorialConstruct/isc12.png){.c2}\
    \

### []{#References}References

#### []{#ODS SPARQL Queries}ODS SPARQL Queries

-   [ODS SIOC
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSIOCRef){.absuri}
-   [ODS FOAF
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRef){.absuri}
-   [ODS SKOS
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRef){.absuri}
-   [ODS Atom OWL
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRef){.absuri}
-   [ODS SIOC Query
    Tutorial](http://virtuoso.openlinksw.com/wiki/main/Main/VOSODSSparqlSamples){.absuri}
-   [WordPress SIOC
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/WordPressSIOCRef){.absuri}
-   [MedaWiki SIOC
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/MediaWikiSIOCRef){.absuri}
-   [PHPBB SIOC
    Reference](http://virtuoso.openlinksw.com/wiki/main/Main/PHPBBSIOCRef){.absuri}

#### []{#ODS Applications SPARQL Queries}ODS Applications SPARQL Queries

  [ODS Application Name](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialConstruct?sort=0&col=1)   [SIOC Reference](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialConstruct?sort=1&col=2)   [SPARQL Query Using Atom OWL Ontology](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialConstruct?sort=2&col=3)   [SPARQL Query Using SKOS Ontology](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialConstruct?sort=3&col=4)   [SPARQL Query Using FOAF Ontology](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorialConstruct?sort=4&col=5)
  --------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
  **Weblog**                                                                                                                                                [SIOCRefBlog](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefBlog){.absuri}                                                                   [ODS-Weblog Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleBlog){.absuri}                                                                  [ODS-Weblog Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleBlog){.absuri}                                                                 [ODS-Weblog Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleBlog){.absuri}
  **Briefcase**                                                                                                                                             [SIOCRefBriefcase](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefBriefcase){.absuri}                                                         [ODS-Briefcase Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleBriefcase){.absuri}                                                          [ODS-Briefcase Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleBriefcase){.absuri}                                                         [ODS-Briefcase Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleBriefcase){.absuri}
  **Feed Manager**                                                                                                                                          [SIOCRefFeeds](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefFeeds){.absuri}                                                                 [ODS-Feed-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleFeeds){.absuri}                                                           [ODS-Feed-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleFeeds){.absuri}                                                          [ODS-Feed-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleFeeds){.absuri}
  **Wiki**                                                                                                                                                  [SIOCRefWiki](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefWiki){.absuri}                                                                   [ODS-Wiki Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleWiki){.absuri}                                                                    [ODS-Wiki Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleWiki){.absuri}                                                                   [ODS-Wiki Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleWiki){.absuri}
  **Calendar**                                                                                                                                              [SIOCRefCalendar](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefCalendar){.absuri}                                                           [ODS-Calendar Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleCalendar){.absuri}                                                            [ODS-Calendar Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleCalendar){.absuri}                                                           [ODS-Calendar Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleCalendar){.absuri}
  **Bookmark Manager**                                                                                                                                      [SIOCRefBookmark](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefBookmark){.absuri}                                                           [ODS-Bookmark-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleBookmarks){.absuri}                                                   [ODS-Bookmark-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleBookmarks){.absuri}                                                  [ODS-Bookmark-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleBookmarks){.absuri}
  **Gallery**                                                                                                                                               [SIOCRefGallery](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefGallery){.absuri}                                                             [ODS-Gallery Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleGallery){.absuri}                                                              [ODS-Gallery Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleGallery){.absuri}                                                             [ODS-Gallery Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleGallery){.absuri}
  **Polls**                                                                                                                                                 [SIOCRefPolls](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefPolls){.absuri}                                                                 \-                                                                                                                                                                        [ODS-Polls Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExamplePolls){.absuri}                                                                 [ODS-Polls Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExamplePolls){.absuri}
  **Addressbook**                                                                                                                                           [ODSAddressBookRef](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAddressBookRef){.absuri}                                                       [ODS-Addressbook Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleAddressbook){.absuri}                                                      [ODS-Addressbook Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleAddressBook){.absuri}                                                     [ODS-Addressbook Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleAddressBook){.absuri}
  **Discussions**                                                                                                                                           [SIOCRefDiscussions](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefDiscussions){.absuri}                                                     [ODSAtomOWLRefExampleDiscussions](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleDiscussions){.absuri}                                                 [ODS-Discussions Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleDiscussion){.absuri}                                                      [ODS-Discussions Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleDiscussion){.absuri}
  **Community**                                                                                                                                             [SIOCRefCommunity](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefCommunity){.absuri}                                                         [ODS-Community Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleCommunity){.absuri}                                                          [ODS-Community Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleCommunity){.absuri}                                                         [ODS-Community Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleCommunity){.absuri}

#### []{#Other Virtuoso SPARQL Queries}Other Virtuoso SPARQL Queries

-   [Query Virtuoso Tutorials using
    SPARQL](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefTutorial){.absuri}
-   [Query Virtuoso Documentation using
    SPARQL](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefDocs){.absuri}

### []{#Related}Related

-   [iSPARQL
    Tutorials](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderTutorials){.wikiword}
-   [Basic iSPARQL Tutorial with query built from a blank canvas and
    pre-typed
    Nodes](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial1){.wikiword}
-   [Basic iSPARQL Tutorial with query built from a blank canvas and
    Nodes dragged from the
    Toolbar](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial2){.wikiword}
-   [Basic iSPARQL
    Tutorial](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderBasicTutorial){.wikiword}
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
