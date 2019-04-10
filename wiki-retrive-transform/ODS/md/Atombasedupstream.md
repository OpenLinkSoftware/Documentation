::: {.topic-text}
[]{#Atom based upstream support} Atom based upstream support
------------------------------------------------------------

ODSWiki now supports Atom based upstreaming. Any cluster can be
configured to escalate any changes to one or several remoted ODSWiki
instances.

[]{#Configuration} Configuration
--------------------------------

Upstreaming can be configured in `Cluster     Settings` page in
`Upstreams` tab.

The form for adding or changing existing upstream contains following
fields:

  [Field](http://ods.openlinksw.com:80/dataspace/owiki/wiki/ODS/Atombasedupstream?sort=0&col=1)   [Value](http://ods.openlinksw.com:80/dataspace/owiki/wiki/ODS/Atombasedupstream?sort=1&col=2)
  ----------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------
  name                                                                                            name of the upstream - list of upstreams actually a list of such names
  URL                                                                                             URL of remote ODSWiki Atom endpoint. Usually it is something like =http://{server}\[:port\]/dataspace/{ownername}/wiki/{clustername}/atom-pub=
  user                                                                                            name of user who has write permissions on the remote ODSWiki instance
  password                                                                                        password of **user**

### []{#Simple example:}Simple example:

-   Note: At myopenlink.net:8890/ods :
    1.  There is an user test1 with pwd 1 registered.
    2.  User test1 is an owner of a test1Wiki wiki instance.

1.  Install ODS and Wiki packages.
2.  Login at [http://host:port/ods](http://host:port/ods){.absuri}
3.  Go to Wiki tab from the ODS main navigation.
4.  Click the \"Create New\" link.
5.  In the shown form click the \"Create and Launch application\".
6.  As result is shown the
    [WelcomeVisitors](http://ods.openlinksw.com:80/dataspace/owiki/wiki/ODS/WelcomeVisitors){.wikiword}
    wiki home page. From the right vertical navigation click the
    \"Cluster Settings\" link.
7.  Click the \"Upstreams\" link.
8.  Enter in the shown form:
    1.  For field \"name\": My upstream
    2.  For field \"URL\":
        <http://myopenlink.net:8890/dataspace/test1/wiki/test1Wiki/atom-pub>
    3.  For field \"user\": test1
    4.  For field \"password\": 1
    5.  Check the check-box for \"Make full cluster upstream first\".
9.  Click the button \"Add/Update Upstream\".
10. In the \"Go\" field enter
    TestStream[?](http://ods.openlinksw.com:80/dataspace/owiki/wiki/ODS/TestStream&parent=Atombasedupstream){.wikiword}
    and click enter.
11. Enter for the article\'s body: simple text.
12. Click the button \"Save and release lock\".
13. After a while, go to
    <http://myopenlink.net:8890/dataspace/test1/wiki/test1Wiki/>
14. Click the \"Index\" link from the bottom of the page.
15. As result among the article from this instance, should be shown also
    the
    TestStream[?](http://ods.openlinksw.com:80/dataspace/owiki/wiki/ODS/TestStream&parent=Atombasedupstream){.wikiword}
    article.

[CategoryWiki](http://ods.openlinksw.com:80/dataspace/owiki/wiki/ODS/CategoryWiki){.wikiword}
:::
