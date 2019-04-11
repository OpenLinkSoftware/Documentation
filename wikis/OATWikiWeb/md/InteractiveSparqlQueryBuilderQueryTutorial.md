::: {.topic-text}
[]{#iSPARQL Querying Tutorial with SPARQL Query type "SELECT".}iSPARQL Querying Tutorial with SPARQL Query type \"SELECT\".
---------------------------------------------------------------------------------------------------------------------------

This tutorial shows how to execute a SPARQL query with type \"SELECT\".
You can find a rich list of Virtuoso SPARQL Queries in the
[References](#References){.c1} section.

::: {.MACRO_TOC .wikitoc}
[iSPARQL Querying Tutorial with SPARQL Query type
\"SELECT\".](#iSPARQL%20Querying%20Tutorial%20with%20SPARQL%20Query%20type%20%22SELECT%22.)

[Enter and execute a query](#Enter%20and%20execute%20a%20query)

[Execute another query](#Execute%20another%20query)

[References](#References)

-   [ODS SPARQL Queries](#ODS%20SPARQL%20Queries)
-   [ODS Applications SPARQL
    Queries](#ODS%20Applications%20SPARQL%20Queries)
-   [Other Virtuoso SPARQL
    Queries](#Other%20Virtuoso%20SPARQL%20Queries)
:::

### []{#Enter and execute a query}Enter and execute a query

Choose a SPARQL query from the [References](#References){.c1} list. For
this example, let\'s use the SPARQL query, which dumps all Weblog Posts
for the ODS Member \"demo\". You can find this SPARQL Query in either
the ODS SPARQL
Queries[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/ODSSIOCRef&parent=InteractiveSparqlQueryBuilderQueryTutorial){.wikiword}
or the ODS Weblog SPARQL
Queries[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/SIOCRefBlog&parent=InteractiveSparqlQueryBuilderQueryTutorial){.wikiword}
list.

\

    PREFIX    rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
    PREFIX   sioc:  <http://rdfs.org/sioc/ns#> 
    PREFIX  sioct:  <http://rdfs.org/sioc/types#>
    PREFIX    xsd:  <http://www.w3.org/2001/XMLSchema#> 
    PREFIX    dct:  <http://purl.org/dc/elements/1.1/>
    PREFIX    dcc:  <http://purl.org/dc/terms/>
    SELECT DISTINCT  ?forum_name
                     ?post
                     ?title
                     ?cr
                     ?url 
    FROM <http://demo.openlinksw.com/dataspace> 
    WHERE
      { 
        ?forum  a                  sioct:Weblog                                      .
        ?forum  sioc:id            ?forum_name                                       .
        ?forum  sioc:scope_of      ?role                                             .
        ?role   sioc:function_of   <http://demo.openlinksw.com/dataspace/demo#this>  .
        ?forum  sioc:container_of  ?post                                             . 
        OPTIONAL { ?post  dct:title    ?title }  .
        OPTIONAL { ?post  dcc:created  ?cr    }  .
        OPTIONAL { ?post  sioc:link    ?url   }  .
      }
    ORDER BY DESC (?cr)

1.  Go to [iSPARQL demo](http://demo.openlinksw.com/isparql){.absuri}
    page.
2.  By default, user name **demo** and password **demo** should be shown
    in the Login form. Click **OK**.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlLogin.png){.c2}\
    \
3.  You will now see the iSPARQL home page, with **QBE** tab open and
    default graph elements on the Canvas. Click the **Clear Pane** icon
    on the toolbar to empty the Canvas.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample1.png){.c2}\
    \
4.  Change the **Data Source URI** field value on the QBE tab to the
    Graph of the database against which you want to execute your query,
    i.e., for this example \--
    **[http://demo.openlinksw.com/dataspace]{style="font-family: monospace"}**\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample37.png){.c2}\
    \
5.  Click the **Advanced** tab.
6.  Change the **Graph** value to also be
    **[http://demo.openlinksw.com/dataspace]{style="font-family: monospace"}**,
    and enter (copy-and-paste) the query chosen above into the **SPARQL
    Query** text-area:\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample38.png){.c2}\
    \
7.  Click the **Run Query** button on the **Advanced** tab.
8.  The **Result** sub-tab shown below the Advanced SPARQL Query Working
    Canvas will present the results of executing our SPARQL Query, by
    default in **Human readable** format.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample39.png){.c2}\
    \
9.  **Change the results table column widths** by dragging the ends of
    the column labels.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample40.png){.c2}\
    \
10. **Change the output viewable mode** to **Machine readable**, if
    desired\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample40a.png){.c2}\
    \
11. **View the SPARQL Query as Graph model** by clicking the **Load
    Query to QBE** button shown in the Toolbar with Result, SPARQL
    Params, Response, and Query sub-tabs.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample41.png){.c2}\
    \

### []{#Execute another query}Execute another query

Now we will enter a different SPARQL query to execute, to show how the
navigation buttons (grayed-out blue arrows in the toolbar of the
**Results** tab) work. You can find this SPARQL Query in the ODS SPARQL
Queries
list[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/ODSSIOCRef&parent=InteractiveSparqlQueryBuilderQueryTutorial){.wikiword}
and also in the ODS Feed Manager SPARQL Queries
list[?](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/OdsFeedManager&parent=InteractiveSparqlQueryBuilderQueryTutorial){.wikiword}.
It should obtain a dump of all Posts within an ODS-Feeds Data Space for
user \"demo\".\

    PREFIX   sioc: <http://rdfs.org/sioc/ns#>
    PREFIX  sioct: <http://rdfs.org/sioc/types#>
    PREFIX    dct: <http://purl.org/dc/elements/1.1/>
    PREFIX    dcc: <http://purl.org/dc/terms/>
    SELECT  ?forum_name
            ?channel
            ?item_title
            ?created
    FROM <http://demo.openlinksw.com/dataspace>
    WHERE
      {
        ?forum    a                  sioct:SubscriptionList                            ;
                  sioc:id            ?forum_name                                       .
        ?forum    sioc:scope_of      ?role                                             . 
        ?role     sioc:function_of   <http://demo.openlinksw.com/dataspace/demo#this>  .
        ?forum    sioc:parent_of     ?channel                                          .
        ?channel  sioc:container_of  ?post                                             .
        OPTIONAL { ?post  dct:title    ?item_title }  .
        OPTIONAL { ?post  dcc:created  ?created    }  .
      }
    LIMIT 20

1.  Click to the **Advanced** tab. Change the SPARQL Query to the
    above.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample42.png){.c2}\
    \
2.  Click the **Run Query** button on the **Advanced** toolbar.
3.  The **Result** sub-tab will present the results of the query.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample43.png){.c2}\
    \
4.  With the blue navigation buttons shown after the **Query** sub-tab,
    you can view the results of the first, previous, next and last
    executed queries. Click the furthest-left blue arrow.
5.  The results of the first query we executed \-- all Weblog Posts for
    the ODS Member \"demo\" \-- will be shown. Note that the content of
    the SPARQL Query area of the Advanced tab has also changed to
    match.\
    \
    ![](InteractiveSparqlQueryBuilderQueryTutorial/isparqlSample44.png){.c2}\
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

  [ODS Application Name](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorial?sort=0&col=1)   [SIOC Reference](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorial?sort=1&col=2)   [SPARQL Query Using Atom OWL Ontology](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorial?sort=2&col=3)   [SPARQL Query Using SKOS Ontology](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorial?sort=3&col=4)   [SPARQL Query Using FOAF Ontology](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/InteractiveSparqlQueryBuilderQueryTutorial?sort=4&col=5)
  ------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------
  **Weblog**                                                                                                                                       [SIOCRefBlog](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefBlog){.absuri}                                                          [ODS-Weblog Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleBlog){.absuri}                                                         [ODS-Weblog Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleBlog){.absuri}                                                        [ODS-Weblog Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleBlog){.absuri}
  **Briefcase**                                                                                                                                    [SIOCRefBriefcase](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefBriefcase){.absuri}                                                [ODS-Briefcase Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleBriefcase){.absuri}                                                 [ODS-Briefcase Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleBriefcase){.absuri}                                                [ODS-Briefcase Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleBriefcase){.absuri}
  **Feed Manager**                                                                                                                                 [SIOCRefFeeds](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefFeeds){.absuri}                                                        [ODS-Feed-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleFeeds){.absuri}                                                  [ODS-Feed-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleFeeds){.absuri}                                                 [ODS-Feed-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleFeeds){.absuri}
  **Wiki**                                                                                                                                         [SIOCRefWiki](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefWiki){.absuri}                                                          [ODS-Wiki Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleWiki){.absuri}                                                           [ODS-Wiki Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleWiki){.absuri}                                                          [ODS-Wiki Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleWiki){.absuri}
  **Calendar**                                                                                                                                     [SIOCRefCalendar](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefCalendar){.absuri}                                                  [ODS-Calendar Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleCalendar){.absuri}                                                   [ODS-Calendar Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleCalendar){.absuri}                                                  [ODS-Calendar Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleCalendar){.absuri}
  **Bookmark Manager**                                                                                                                             [SIOCRefBookmark](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefBookmark){.absuri}                                                  [ODS-Bookmark-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleBookmarks){.absuri}                                          [ODS-Bookmark-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleBookmarks){.absuri}                                         [ODS-Bookmark-Manager Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleBookmarks){.absuri}
  **Gallery**                                                                                                                                      [SIOCRefGallery](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefGallery){.absuri}                                                    [ODS-Gallery Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleGallery){.absuri}                                                     [ODS-Gallery Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleGallery){.absuri}                                                    [ODS-Gallery Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleGallery){.absuri}
  **Polls**                                                                                                                                        [SIOCRefPolls](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefPolls){.absuri}                                                        \-                                                                                                                                                               [ODS-Polls Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExamplePolls){.absuri}                                                        [ODS-Polls Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExamplePolls){.absuri}
  **Addressbook**                                                                                                                                  [ODSAddressBookRef](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAddressBookRef){.absuri}                                              [ODS-Addressbook Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleAddressbook){.absuri}                                             [ODS-Addressbook Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleAddressBook){.absuri}                                            [ODS-Addressbook Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleAddressBook){.absuri}
  **Discussions**                                                                                                                                  [SIOCRefDiscussions](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefDiscussions){.absuri}                                            [ODSAtomOWLRefExampleDiscussions](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleDiscussions){.absuri}                                        [ODS-Discussions Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleDiscussion){.absuri}                                             [ODS-Discussions Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleDiscussion){.absuri}
  **Community**                                                                                                                                    [SIOCRefCommunity](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefCommunity){.absuri}                                                [ODS-Community Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSAtomOWLRefExampleCommunity){.absuri}                                                 [ODS-Community Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSSKOSRefExampleCommunity){.absuri}                                                [ODS-Community Data Query](http://virtuoso.openlinksw.com/wiki/main/Main/ODSFOAFRefExampleCommunity){.absuri}

#### []{#Other Virtuoso SPARQL Queries}Other Virtuoso SPARQL Queries

-   [Query Virtuoso Tutorials using
    SPARQL](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefTutorial){.absuri}
-   [Query Virtuoso Documentation using
    SPARQL](http://virtuoso.openlinksw.com/wiki/main/Main/SIOCRefDocs){.absuri}

[CategorySPARQL](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategorySPARQL){.wikiword}
[CategoryRDF](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryRDF){.wikiword}
[CategoryOpenSource](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryOpenSource){.wikiword}
[CategoryOAT](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryOAT){.wikiword}
[CategoryDocumentation](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryDocumentation){.wikiword}
[CategoryTutorial](http://wikis.openlinksw.com:80/dataspace/owiki/wiki/OATWikiWeb/CategoryTutorial){.wikiword}
:::
