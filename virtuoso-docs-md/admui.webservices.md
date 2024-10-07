<div id="admui.webservices" class="section">

<div class="titlepage">

<div>

<div>

### 6.2.3. Web Services

</div>

</div>

</div>

<div id="contentcrawler" class="section">

<div class="titlepage">

<div>

<div>

#### Content Crawler

</div>

</div>

</div>

Some of the supported features are:

<div class="itemizedlist">

- <span class="emphasis">*Import Targets*</span> : Virtuoso can be set
  up to retrieve content from external web sites and host it in its own
  WebDAV repository via this page.

  <div class="figure-float">

  <div id="id13962" class="figure">

  **Figure 6.13. Web Robot - Crawl Job**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Web Robot - Crawl Job](images/ui/dav_rbt_trgt_01.png)

  </div>

  </div>

  </div>

    

  </div>

  <div class="figure-float">

  <div id="id13967" class="figure">

  **Figure 6.14. Web Robot - Crawl Job**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Web Robot - Crawl Job](images/ui/dav_rbt_trgt_02.png)

  </div>

  </div>

  </div>

    

  </div>

  <div class="itemizedlist">

  - <span class="emphasis">*Target description* </span> lets you provide
    a friendly name for the target that you are defining.

  - <span class="emphasis">*Target URL* </span> is the url of the web
    site that you are trying to retrieve content from. Only the hostname
    should be provided here, along with the protocol. For example
    http://www.myhost.com.

  - <span class="emphasis">*Login name on target*</span> is the username
    for accessing the remote server, if required.

  - <span class="emphasis">*Login password on target* </span> is the
    password for the login name above.

  - <span class="emphasis">*Copy to local DAV collection* </span> this
    \*mandatory\* value will serve as the DAV root location if content
    is stored locally.

  - <span class="emphasis">*Single page download*</span> radio button
    specifies whether Virtuoso will retrieved linked content also.

  - <span class="emphasis">*Local Resources Owner*</span> The DAV user
    that will be the owner of the content that will copied to DAV.

  - The <span class="emphasis">*Download only newer than*</span> field
    allows you to specify a datetime value to prevent Virtuoso
    downloading files that are older than that datetime.

  - Use the <span class="emphasis">*Follow links matching (delimited
    with ;)*</span> field to limit the content that is downloaded by
    specify pattern matching criteria.

  - <span class="emphasis">*Do not follow links matching (delimited with
    ;)*</span> allows you limit content by specifying what files not to
    download.

  </div>

- <span class="emphasis">*Use robots.txt*</span> check-box is checked by
  default.

- <span class="emphasis">*Custom HTTP headers*</span> can be used to
  specigy custom HTTP headers.

- <span class="emphasis">*Number of HTTP redirects to follow*</span> is
  set by default to 1.

- <span class="emphasis">*XPath expression for links extraction*</span>
  allows to be entered custom XPath expression.

- <span class="emphasis">*Crawling depth limit*</span> allows to limit
  crawling depth. By default is set to "unlimited".

- <span class="emphasis">*Update Interval (minutes)*</span> is on what
  interval the updated of the crawled data should be performed.

- <span class="emphasis">*Number of threads*</span> allows setting
  crawling threads.

- <span class="emphasis">*Crawl delay (sec)*</span> allows to be
  specified a delay. By default is set to "0.00".

- <span class="emphasis">*Store Function*</span> allows to be used a
  specific stored function for ex. in Semantic Sitemaps crawling.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                                                                  |
  |:--------------------------:|:-----------------------------------------------------------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                                                                        |
  |                            | <a                                                                                                               
                                href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtSetCrawlerJobsGuideSemanticSitemapsFuncExample"  
                                class="ulink" target="_top" shape="rect">Example of Stored                                                        
                                Functions.</a>                                                                                                    |

  </div>

- <span class="emphasis">*Extract Function*</span> allows to be used a
  specific extract function for ex. in Semantic Sitemaps crawling. If
  left empty, will be used a system Store function.

  <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                            |                                                                                                                  |
  |:--------------------------:|:-----------------------------------------------------------------------------------------------------------------|
  | ![\[Tip\]](images/tip.png) | See Also:                                                                                                        |
  |                            | <a                                                                                                               
                                href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtSetCrawlerJobsGuideSemanticSitemapsFuncExample"  
                                class="ulink" target="_top" shape="rect">Example of Stored                                                        
                                Functions.</a>                                                                                                    |

  </div>

- <span class="emphasis">*Semantic Web Crawling*</span> : hatch to
  retrieve Semantic Sitemaps. If left empty, will be used a system Store
  function.

- <span class="emphasis">*If Graph IRI is unassigned use this Data
  Source URL:*</span> use to specify a custom graph URI for data
  storage.

- <span class="emphasis">*Follow URLs outside of the target host*</span>
  is check-box to specify either to follow URIS outside of the target
  host.

- <span class="emphasis">*Follow HTML meta link*</span> is check-box to
  specifiy either to follow HTML meta links.

- <span class="emphasis">*Follow RDF properties (one IRI per
  row)*</span> .

- <span class="emphasis">*Download Images*</span> radio buttons to allow
  Virtuoso to pull down image type also. You may want to prevent this if
  you are more interested in the textual content rather than bandwidth
  draining images.

- <span class="emphasis">*Use WebDAV methods*</span> can be checked if
  the host is known to support WebDAV methods. This would enable better
  copying of sites that support DAV.

- <span class="emphasis">*Delete if remove on remote detected*</span>
  can be switched on so that when Virtuoso synchronizes its content with
  that on the remote host it will check for files that have been removed
  on the remote and remove them from the local copy also.

- <span class="emphasis">*Store metadata\**</span> when checked offers
  to be stored respectively metadata from FOAF, RDF, RSS/RDF and GRDLL
  data depending on which check-box is checked.

- When all details have been completed press the
  <span class="emphasis">*Add*</span> (or Update if updating) button to
  submit the web robot task to the queue.

- <span class="emphasis">*Import Queues*</span> : This page shows you a
  list of web copy targets that have been enlisted with the Virtuoso
  Server, and a list of web robot update schedules. Several options are
  available for each item listed: Start, Update, Schedule, Reset, and
  Stop. You can configure the scheduled update interval by pressing the
  Schedule link and entering a value in minutes. Once that is done you
  can start the schedule by pressing the Start link. You make a manual
  update of the content by pressing the Update link. You can stop the
  scheduled updates taking place by pressing the Stop link. To reset the
  details of the web copy item press the Reset link.

  <div class="figure-float">

  <div id="id14076" class="figure">

  **Figure 6.15. Web Robot - Queues**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Web Robot - Queues](images/ui/dav_rbt_que_01.png)

  </div>

  </div>

  </div>

    

  </div>

- <span class="emphasis">*Retrieved Sites*</span> : You can view a list
  of the links retrieved from the web copy from this page. You are also
  able to remove some of the content from this page by following the
  Edit link.

  <div class="figure-float">

  <div id="id14084" class="figure">

  **Figure 6.16. Web Robot - Retrieved Links**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Web Robot - Retrieved Links](images/ui/dav_rbt_rtrd_01.png)

  </div>

  </div>

  </div>

    

  </div>

- <span class="emphasis">*Export*</span> : You can export content from
  the WebDAV repository. Note that you can only export content that has
  been retrieved using Virtuoso's Web Robot.

  When you click the "Export" link for a retrieved collection, you will
  be presented with a form for selecting the export target location.
  Choose the export method: either File System or DAV by clicking the
  "External WebDAV Server URL" check-box. This lets you indicate to the
  remote target where to store the exported content. Then type the
  target URL to an existing location on the server. Finally press the
  <span class="emphasis">*Export*</span> button to export. A
  confirmation will be supplied once the operation is complete.

  <div class="figure-float">

  <div id="dav_rbt_expt_02" class="figure">

  **Figure 6.17. Web Robot - Exporting Content**

  <div class="figure-contents">

  <div class="mediaobject">

  ![Web Robot - Exporting Content](images/ui/dav_rbt_expt_02.png)

  </div>

  </div>

  </div>

    

  </div>

  <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

  |                              |                                                                                                                                                                                                                                                                                               |
  |:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                         |
  |                              | If is not checked the "External WebDAV Server URL" check-box, i.e. you are selecting the filesystem method, then you are restricted to Virtuoso targets. However WebDAV methods can be applied to any WebDAV server. WebDAV methods assume that the target is publicly available for writing. |

  </div>

- <span class="emphasis">*Populate the RDF Quad Store*</span> :
  Virtuoso's built-in Content Crawler to can be used to populate its RDF
  Quad Store, as a one-time run or on a scheduled basis.

  Transforming data sources into RDF "on the fly" is sufficient for many
  use cases, but there are times when the volume or sheer nature of a
  data source makes batch-loading necessary.

  For example, Freebase offers RDF representations of its data, but it
  doesn't publish RDF dumps; even if it did, such dumps would usually be
  outdated by the time they were loaded.

  One practical solution takes the form of a scheduled crawl of specific
  resources of interest.

</div>

<div id="contentcrawlerrdf" class="section">

<div class="titlepage">

<div>

<div>

##### Set Up the Content Crawler to Gather RDF

</div>

</div>

</div>

The Virtuoso Conductor can be used to set up various Content Crawler
Jobs:

<div id="contentcrawlerrdfquad" class="section">

<div class="titlepage">

<div>

<div>

###### Setting up a Content Crawler Job to Add RDF Data to the Quad Store

</div>

</div>

</div>

See
<a href="rdfinsertmethodvirtuosocrawler.html" class="link" shape="rect"
title="16.9.8. Using Virtuoso Crawler">details</a> how to use Virtuoso
Crawler for including the Sponger options so you crawl non-RDF but get
RDF and this to the Quad Store.

</div>

<div id="contentcrawlerrdfsm" class="section">

<div class="titlepage">

<div>

<div>

###### Setting up a Content Crawler Job to Retrieve Sitemaps (when the source includes RDFa)

</div>

</div>

</div>

The following section describes how to set up a crawler job for getting
content of a basic Sitemap where the source includes RDFa.

<div class="orderedlist">

1.  From the Virtuoso Conductor User Interface i.e.
    http://cname:port/conductor, login as the "dba" user.

2.  Go to the "Web Application Server" tab.

    <div class="figure-float">

    <div id="cr1" class="figure">

    **Figure 6.18. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Go to the "Content Imports" tab.

    <div class="figure-float">

    <div id="cr2" class="figure">

    **Figure 6.19. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click on the "New Target" button.

    <div class="figure-float">

    <div id="cr3" class="figure">

    **Figure 6.20. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  In the form displayed:

    <div class="itemizedlist">

    - Enter a name of choice in the "Target description" text box:

      ``` programlisting
      Virtuoso Sample Example
      ```

    - Enter the URL of the site to be crawled in the "Target URL" text
      box:

      ``` programlisting
      http://virtuoso.openlinksw.com/sitemap.xml
      ```

    - Enter the location in the Virtuoso WebDAV repository the crawled
      should stored, in the "Copy to local DAV collection" text box, for
      example, if user demo is available, then:

      ``` programlisting
      /DAV/home/demo/VirtSample/
      ```

    - Choose the "Local resources owner" for the collection from the
      list box available, for ex: user demo.

    - Select the "Accept RDF" check box.

    - Optionally you can select "Convert Links" to make all HREFs in the
      local stored content relative.

    </div>

    <div class="figure-float">

    <div id="cr11" class="figure">

    **Figure 6.21. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr11.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="cr11a" class="figure">

    **Figure 6.22. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr11a.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click the "Create" button to create the import.

    <div class="figure-float">

    <div id="cr11a_01" class="figure">

    **Figure 6.23. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr11ab.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click the "Import Queues" button.

    <div class="figure-float">

    <div id="cr12" class="figure">

    **Figure 6.24. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr12.png)

    </div>

    </div>

    </div>

      

    </div>

8.  For the "Robot targets" with label "Virtuoso Sample Example" click
    the "Run" button.

9.  This will result in the Target site being crawled and the retrieved
    pages stored locally in DAV and any network resource triples being
    fetched in the RDF Quad store.

    <div class="figure-float">

    <div id="cr12a" class="figure">

    **Figure 6.25. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr12a.png)

    </div>

    </div>

    </div>

      

    </div>

10. Go to the "Web Application Server" -\> "Content Management" tab and
    navigate to the location of newly created DAV collection:

    ``` programlisting
    /DAV/home/demo/VirtSample/
    ```

11. The retrieved content will be shown:

    <div class="figure-float">

    <div id="cr15" class="figure">

    **Figure 6.26. Setting up a Content Crawler Job to Retrieve
    Sitemaps**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve
    Sitemaps](images/ui/cr15.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="contentcrawlerrdfssm" class="section">

<div class="titlepage">

<div>

<div>

###### Setting up a Content Crawler Job to Retrieve Semantic Sitemaps (a variation of the standard sitemap)

</div>

</div>

</div>

The following section describes how to set up crawler job for getting
Semantic Sitemap's content: a variation of standard sitemap:

<div class="orderedlist">

1.  From the Virtuoso Conductor User Interface i.e.
    http://cname:port/conductor, login as the "dba" user.

2.  Go to "Web Application Server".

    <div class="figure-float">

    <div id="cr1_01" class="figure">

    **Figure 6.27. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Go to "Content Imports".

    <div class="figure-float">

    <div id="cr2_01" class="figure">

    **Figure 6.28. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click "New Target".

    <div class="figure-float">

    <div id="cr3_01" class="figure">

    **Figure 6.29. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  In the shown form:

    <div class="itemizedlist">

    - Enter for "Target description":

      ``` programlisting
      Semantic Web Sitemap Example
      ```

    - Enter for "Target URL":

      ``` programlisting
      http://virtuoso.openlinksw.com/sitemap-semantic.xml
      ```

    - Enter the location in the Virtuoso WebDAV repository the crawled
      should stored in the "Copy to local DAV collection" text box, for
      example, if user demo is available, then:

      ``` programlisting
      /DAV/home/demo/semantic_sitemap/
      ```

    - Choose the "Local resources owner" for the collection from the
      list box available, for ex: user demo.

    - Hatch "Semantic Web Crawling"

      <div class="itemizedlist">

      - Note: when you select this option, you can either:

        <div class="orderedlist">

        1.  Leave the Store Function and Extract Function empty - in
            this case the system Store and Extract functions will be
            used for the Semantic Web Crawling Process, or:

        2.  You can select your own Store and Extract Functions, for ex:

            ``` programlisting
            -- Example of Extract Function
            use WS;

            create procedure WS.WS.SITEMAP_BB_PARSE (
              in _host varchar,
              in _url varchar,
              in _root varchar,
              inout _content varchar,
              in _c_type varchar := null,
              in lev int := 0))
            {
              --pl_debug+
              declare xt, xp, graph any;
              declare inx int;

            --  dbg_obj_print ('WS.WS.GET_URLS_SITEMAP', _url);

              declare exit handler for sqlstate '*'
                {
            --      dbg_obj_print (__SQL_MESSAGE);
                  return;
                };

              if (_url like '%.xml.gz')
                {
                  _content := gzip_uncompress (_content);
                }

              if (_url like '%.xml' or _url like '%.xml.gz' or _url like '%.rdf')
                {
                  xt := xtree_doc (_content);
                  if (xpath_eval ('/urlset/dataset', xt) is not null)
                {
                  xp := xpath_eval ('/urlset/dataset/dataDumpLocation/text()', xt, 0);
                  graph := cast (xpath_eval ('/urlset/dataset/datasetURI/text()', xt) as varchar);
                  if (length (graph))
                    update VFS_SITE set VS_UDATA = serialize (vector ('graph', graph)) where VS_HOST = _host and VS_ROOT = _root;
                  inx := 0;
                  foreach (any u in xp) do
                    {
                      declare hf, host, url varchar;

                      u := cast (u as varchar);
                      hf := WS.WS.PARSE_URI (u);
                      host := hf[1];
                      --dbg_obj_print ('WS.WS.GET_URLS_SITEMAP PARSE', u);
                      url := hf[2];
                      insert soft VFS_QUEUE (VQ_HOST, VQ_TS, VQ_URL, VQ_STAT, VQ_ROOT, VQ_OTHER)
                      values (host, now (), url, 'waiting', _root, NULL);
                      if (row_count () = 0)
                    update VFS_QUEUE set VQ_STAT = 'waiting', VQ_TS = now () where VQ_HOST = host and VQ_ROOT = _root and VQ_URL = url;
                      inx := inx + 1;
                    }
                }
                  if (xpath_eval ('/sitemapindex/sitemap/loc', xt) is not null)
                {
                  xp := xpath_eval ('/sitemapindex/sitemap/loc/text()', xt, 0);
                  inx := 0;
                  foreach (any u in xp) do
                    {
                      declare hf, host, url varchar;

                      u := trim (cast (u as varchar));
                      hf := WS.WS.PARSE_URI (u);
                      host := hf[1];
            --        dbg_obj_print ('WS.WS.GET_URLS_SITEMAP', host, _host);
                      url := hf[2];
                      if (url <> '')
                    {
                      insert soft VFS_QUEUE (VQ_HOST, VQ_TS, VQ_URL, VQ_STAT, VQ_ROOT, VQ_OTHER)
                          values (host, now (), url, 'waiting', _root, NULL);
                      if (row_count () = 0)
                        update VFS_QUEUE set VQ_STAT = 'waiting', VQ_TS = now () where VQ_HOST = host and VQ_ROOT = _root and VQ_URL = url;
                      inx := inx + 1;
                    }
                    }
                }
                }
              commit work;
            }
            ;

            -- Example of Store Function
            use WS;

            create procedure WS.WS.SITEMAP_BB_STORE (
              in _host varchar,
              in _url varchar,
              in _root varchar,
              inout _content varchar,
              in _s_etag varchar,
              in _c_type varchar,
              in store_flag int := 1,
              in udata any := null,
              in lev int := 0)
            {
              --pl_debug+
              declare graph varchar;

            --  dbg_obj_print ('WS.WS.SITEMAP_BB_STORE', _url, udata);
              if (isarray (udata))
                graph := get_keyword ('graph', udata);
              else
                graph := null;

              if (graph is not null and _url like '%.rdf')
                {
                  DB.DBA.RDF_LOAD_RDFXML (_content, graph, graph);
                  DB.DBA.VT_INC_INDEX_DB_DBA_RDF_OBJ ();
                }
              insert soft VFS_URL (VU_HOST, VU_URL, VU_CHKSUM, VU_CPTIME, VU_ETAG, VU_ROOT)
                  values (_host, _url, md5 (_content), now (), _s_etag, _root);
              if (row_count () = 0)
                update VFS_URL set VU_CHKSUM = md5 (_content), VU_CPTIME = now (), VU_ETAG = _s_etag where
                VU_HOST = _host and VU_URL = _url and VU_ROOT = _root;
              commit work;
            }
            ;
            ```

        </div>

      </div>

    </div>

6.  Optionally you can select "Convert Link" to make all HREFs in the
    local stored content relative.

7.  Hatch "Accept RDF"

    <div class="figure-float">

    <div id="cr16" class="figure">

    **Figure 6.30. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr16.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="cr17" class="figure">

    **Figure 6.31. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr17.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="cr17_01" class="figure">

    **Figure 6.32. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr17b.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Optionally you can hatch "Store metadata \*" and specify which RDF
    Cartridges to be included from the Sponger:

    <div class="figure-float">

    <div id="cr17a" class="figure">

    **Figure 6.33. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr17a.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click the button "Create".

    <div class="figure-float">

    <div id="cr18" class="figure">

    **Figure 6.34. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr18.png)

    </div>

    </div>

    </div>

      

    </div>

10. Click "Import Queues".

    <div class="figure-float">

    <div id="cr19" class="figure">

    **Figure 6.35. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr19.png)

    </div>

    </div>

    </div>

      

    </div>

11. For "Robot target" with label "Semantic Web Sitemap Example" click
    "Run".

12. As result should be shown the number of the pages retrieved.

    <div class="figure-float">

    <div id="cr20" class="figure">

    **Figure 6.36. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr20.png)

    </div>

    </div>

    </div>

      

    </div>

13. Check the retrieved RDF data from your Virtuoso instance sparql
    endpoint http://cname:port/sparql with the following query selecting
    all the retrieved graphs for ex:

    ``` programlisting
    SELECT ?g
    FROM <http://host:port/>
    WHERE
      {
        graph ?g { ?s ?p ?o } .
        FILTER ( ?g LIKE <http://virtuoso.openlinksw.com/%> )
      }
    ```

    <div class="figure-float">

    <div id="cr21" class="figure">

    **Figure 6.37. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr21.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="cr22" class="figure">

    **Figure 6.38. Setting up a Content Crawler Job to Retrieve Semantic
    Sitemap content**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Semantic Sitemap
    content](images/ui/cr22.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="contentcrawlerrdfsd" class="section">

<div class="titlepage">

<div>

<div>

###### Setting up a Content Crawler Job to Retrieve Content from Specific Directories

</div>

</div>

</div>

The following section describes how to set up crawler job for getting
directories using Conductor.

<div class="orderedlist">

1.  From the Virtuoso Conductor User Interface i.e.
    http://cname:port/conductor, login as the "dba" user.

2.  Go to "Web Application Server".

    <div class="figure-float">

    <div id="cr1_02" class="figure">

    **Figure 6.39. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/cr1.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Go to "Content Imports".

    <div class="figure-float">

    <div id="cr2_02" class="figure">

    **Figure 6.40. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/cr2.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click "New Target".

    <div class="figure-float">

    <div id="cr3_02" class="figure">

    **Figure 6.41. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/cr3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  In the shown form:

    <div class="itemizedlist">

    - Enter for "Target description":

      ``` programlisting
      UDA WebSite
      ```

    - Enter for "Target URL":

      ``` programlisting
      http://uda.openlinksw.com/
      ```

    - Enter for "Copy to local DAV collection" for available user, for
      ex. demo:

      ``` programlisting
      /DAV/home/demo/uda/
      ```

    - Choose from the available list "Local resources owner" an user,
      for ex. demo.

      <div class="figure-float">

      <div id="d1" class="figure">

      **Figure 6.42. Setting up a Content Crawler Job to Retrieve
      Content from Specific Directories**

      <div class="figure-contents">

      <div class="mediaobject">

      ![Setting up a Content Crawler Job to Retrieve Content from
      Specific Directories](images/ui/d1.png)

      </div>

      </div>

      </div>

        

      </div>

      <div class="figure-float">

      <div id="d1a" class="figure">

      **Figure 6.43. Setting up a Content Crawler Job to Retrieve
      Content from Specific Directories**

      <div class="figure-contents">

      <div class="mediaobject">

      ![Setting up a Content Crawler Job to Retrieve Content from
      Specific Directories](images/ui/d1a.png)

      </div>

      </div>

      </div>

        

      </div>

    - Optionally you can select "Convert Link" to make all HREFs in the
      local stored content relative.

    - Click the button "Create".

    </div>

6.  As result the Robot target will be created:

    <div class="figure-float">

    <div id="d2" class="figure">

    **Figure 6.44. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/d2.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click "Import Queues".

    <div class="figure-float">

    <div id="d3" class="figure">

    **Figure 6.45. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/d3.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click "Run" and go to "Retrieved Sites".

9.  As result should be shown the number of the total pages retrieved.

    <div class="figure-float">

    <div id="d5" class="figure">

    **Figure 6.46. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/d5.png)

    </div>

    </div>

    </div>

      

    </div>

10. Go to "Web Application Server" -\> "Content Management" and go to
    path:

    ``` programlisting
    DAV/home/demo/uda/
    ```

11. As result the retrieved content will be shown:

    <div class="figure-float">

    <div id="d7" class="figure">

    **Figure 6.47. Setting up a Content Crawler Job to Retrieve Content
    from Specific Directories**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Setting up a Content Crawler Job to Retrieve Content from Specific
    Directories](images/ui/d7.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="contentcrawleratom" class="section">

<div class="titlepage">

<div>

<div>

###### Setting up a Content Crawler Job to Retrieve Content from ATOM feed

</div>

</div>

</div>

This section demonstrates populating the Virtuoso Quad Store using ATOM
feed.

Populating the Virtuoso Quad Store can be done in different ways
Virtuoso supports. The Conductor -\> Content Import UI offers plenty of
options, one of which is the XPath expression for crawling RDF resources
URLs and this feature is a powerful and easy-to-use for managing the
Quad Store.

To populate the Virtuoso Quad Store, in this Guide we will use a XPAth
expression for the URLs of the RDF resources references in a given ATOM
feed. For ex. this one of the "National Bibliography" Store.

<div class="orderedlist">

1.  Go to http://cname/conductor

2.  Enter dba credentials

3.  Go to Web Application Server -\> Content Management -\> Content
    Imports:

    <div class="figure-float">

    <div id="cra1" class="figure">

    **Figure 6.48. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra1.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Click "New Target":

    <div class="figure-float">

    <div id="cr3_03" class="figure">

    **Figure 6.49. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cr3.png)

    </div>

    </div>

    </div>

      

    </div>

5.  In the presented form specify respectively:

    <div class="itemizedlist">

    - "Target description": for ex. National Bibliography ;

    - "Target URL": for ex.
      http://data.libris.kb.se/nationalbibliography/feed/ ;

      Note: the entered URL will be the graph URI for storing the
      imported RDF data. You can also set it explicitly by entering
      another graph URI in the "If Graph IRI is unassigned use this Data
      Source URL:" shown as option in this form.

    - "Copy to local DAV collection": for ex.

      ``` programlisting
      /DAV/temp/nbio/
      ```

    - "XPath expression for links extraction:":

      ``` programlisting
      //entry/link/@href
      ```

    - "Update Interval (minutes)": for ex. 10 ;

    - "Run Sponger": hatch this check-box ;

    - "Accept RDF": hatch this check-box ;

    - Optionally you can hatch "Store metadata" ;

    - "RDF Cartridge": hatch this check-box and specify what cartridges
      will be used.

      <div class="figure-float">

      <div id="cra3" class="figure">

      **Figure 6.50. Crawling ATOM feed**

      <div class="figure-contents">

      <div class="mediaobject">

      ![Crawling ATOM feed](images/ui/cra3.png)

      </div>

      </div>

      </div>

        

      </div>

      <div class="figure-float">

      <div id="cra4" class="figure">

      **Figure 6.51. Crawling ATOM feed**

      <div class="figure-contents">

      <div class="mediaobject">

      ![Crawling ATOM feed](images/ui/cra4.png)

      </div>

      </div>

      </div>

        

      </div>

    </div>

6.  Click "Create".

7.  The new created target should be displayed in the list of available
    Targets:

    <div class="figure-float">

    <div id="cra7" class="figure">

    **Figure 6.52. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click "Import Queues":

    <div class="figure-float">

    <div id="cra8" class="figure">

    **Figure 6.53. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Click for "National Bibliography" target the "Run" link from the
    very-right "Action" column.

10. Should be presented list of Top pending URLs:

    <div class="figure-float">

    <div id="cra9" class="figure">

    **Figure 6.54. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra9.png)

    </div>

    </div>

    </div>

      

    </div>

11. Go to "Retrieved Sites" to check the total URLs that were processed:

    <div class="figure-float">

    <div id="cra10" class="figure">

    **Figure 6.55. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra10.png)

    </div>

    </div>

    </div>

      

    </div>

12. To view the imported RDF data, go to http://example.com/sparql and
    enter a simple query for ex.:

    ``` programlisting
    SELECT *
    FROM <http://data.libris.kb.se/nationalbibliography/feed/>
    WHERE
      {
        ?s ?p ?o
      }
    ```

    <div class="figure-float">

    <div id="cra14" class="figure">

    **Figure 6.56. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra14.png)

    </div>

    </div>

    </div>

      

    </div>

13. Click "Run Query".

14. The imported RDF data triples should be shown:

    <div class="figure-float">

    <div id="cra15" class="figure">

    **Figure 6.57. Crawling ATOM feed**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling ATOM feed](images/ui/cra15.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="contentcrawlersparqlendp" class="section">

<div class="titlepage">

<div>

<div>

###### Setting up a Content Crawler Job to Retrieve Content from SPARQL endpoint

</div>

</div>

</div>

The following step-by section walks you through the process of:

<div class="itemizedlist">

- Populating a Virtuoso Quad Store with data from a 3rd party SPARQL
  endpoint

- Generating RDF dumps that are accessible to basic HTTP or WebDAV user
  agents.

</div>

<div class="orderedlist">

1.  Sample SPARQL query producing a list SPARQL endpoints:

    ``` programlisting
    PREFIX rdf:      <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
    PREFIX rdfs:     <http://www.w3.org/2000/01/rdf-schema#>
    PREFIX owl:      <http://www.w3.org/2002/07/owl#>
    PREFIX xsd:      <http://www.w3.org/2001/XMLSchema#>
    PREFIX foaf:     <http://xmlns.com/foaf/0.1/>
    PREFIX dcterms:  <http://purl.org/dc/terms/>
    PREFIX scovo:    <http://purl.org/NET/scovo#>
    PREFIX void:     <http://rdfs.org/ns/void#>
    PREFIX akt:      <http://www.aktors.org/ontology/portal#>

    SELECT DISTINCT ?endpoint
    WHERE
      {
        ?ds a void:Dataset .
        ?ds void:sparqlEndpoint ?endpoint
      }
    ```

2.  Here is a sample SPARQL protocol URL constructed from one of the
    sparql endpoints in the result from the query above:

    ``` programlisting
    http://void.rkbexplorer.com/sparql/?query=PREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0D%0APREFIX+void%3A+++++%3Chttp%3A%2F%2Frdfs.org%2Fns%2Fvoid%23%3E++%0D%0ASELECT+distinct+%3Furl++WHERE+%7B+%3Fds+a+void%3ADataset+%3B+foaf%3Ahomepage+%3Furl+%7D%0D%0A&format=sparql
    ```

3.  Here is the cURL output showing a Virtuoso SPARQL URL that executes
    against a 3rd party SPARQL Endpoint URL:

    ``` programlisting
    $ curl "http://void.rkbexplorer.com/sparql/?query=PREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0D%0APREFIX+void
    %3A+++++%3Chttp%3A%2F%2Frdfs.org%2Fns%2Fvoid%23%3E++%0D%0ASELECT+distinct+%3Furl++WHERE+%7B+%3Fds+a+void%3ADataset+%3B+foaf%3Ah
    omepage+%3Furl+%7D%0D%0A&format=sparql"
    <?xml version="1.0" ?>
    <sparql xmlns="http://www.w3.org/2005/sparql-results#">
      <head>
        <variable name="url"/>
      </head>
      <results ordered="false" distinct="true">
        <result>
          <binding name="url"><uri>http://kisti.rkbexplorer.com/</uri></binding>
        </result>
        <result>
          <binding name="url"><uri>http://epsrc.rkbexplorer.com/</uri></binding>
        </result>
        <result>
          <binding name="url"><uri>http://test2.rkbexplorer.com/</uri></binding>
        </result>
        <result>
          <binding name="url"><uri>http://test.rkbexplorer.com/</uri></binding>
        </result>
        ...
        ...
        ...
      </results>
    </sparql>
    ```

4.  Go to Conductor UI -- http://example.com/conductor and provide dba
    credentials;

5.  Go to "Web Application Server"-\> "Content Management" -\> "Content
    Imports"

    <div class="figure-float">

    <div id="scp2" class="figure">

    **Figure 6.58. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/cra1.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click "New Target":

    <div class="figure-float">

    <div id="cr3_04" class="figure">

    **Figure 6.59. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/cr3.png)

    </div>

    </div>

    </div>

      

    </div>

7.  In the presented form enter for ex.:

    <div class="orderedlist">

    1.  "Target description": voiD store

    2.  "Target URL": the url from above i.e.:

        ``` programlisting
        http://void.rkbexplorer.com/sparql/?query=PREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0D%0APREFIX+void%3A+++++%3Chttp%3A%2F%2Frdfs.org%2Fns%2Fvoid%23%3E++%0D%0ASELECT+distinct+%3Furl++WHERE+%7B+%3Fds+a+void%3ADataset+%3B+foaf%3Ahomepage+%3Furl+%7D%0D%0A&format=sparql
        ```

    3.  "Copy to local DAV collection":

        ``` programlisting
        /DAV/void.rkbexplorer.com/content
        ```

    4.  "Follow links matching (delimited with ;)":

        ``` programlisting
        %
        ```

    5.  Un-hatch "Use robots.txt" ;

    6.  "XPath expression for links extraction":

        ``` programlisting
        //binding[@name="url"]/uri/text()
        ```

    7.  Hatch "Semantic Web Crawling";

    8.  "If Graph IRI is unassigned use this Data Source URL:": enter
        for ex:

        ``` programlisting
        http://void.collection
        ```

    9.  Hatch "Follow URLs outside of the target host";

    10. Hatch "Run "Sponger" and "Accept RDF"

        <div class="figure-float">

        <div id="scp4" class="figure">

        **Figure 6.60. Crawling SPARQL Endpoints**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Crawling SPARQL Endpoints](images/ui/scp4.png)

        </div>

        </div>

        </div>

          

        </div>

        <div class="figure-float">

        <div id="scp5" class="figure">

        **Figure 6.61. Crawling SPARQL Endpoints**

        <div class="figure-contents">

        <div class="mediaobject">

        ![Crawling SPARQL Endpoints](images/ui/scp5.png)

        </div>

        </div>

        </div>

          

        </div>

    </div>

8.  Click "Create";

9.  The target should be created and presented in the list of available
    targets:

    <div class="figure-float">

    <div id="scp7" class="figure">

    **Figure 6.62. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp7.png)

    </div>

    </div>

    </div>

      

    </div>

10. Click "Import Queues":

    <div class="figure-float">

    <div id="scp8" class="figure">

    **Figure 6.63. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp8.png)

    </div>

    </div>

    </div>

      

    </div>

11. Click "Run" for the imported target:

    <div class="figure-float">

    <div id="scp9" class="figure">

    **Figure 6.64. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp9.png)

    </div>

    </div>

    </div>

      

    </div>

12. To check the retrieved content go to "Web Application Server"-\>
    "Content Management" -\> "Content Imports" -\> "Retrieved Sites":

    <div class="figure-float">

    <div id="scp11" class="figure">

    **Figure 6.65. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp11.png)

    </div>

    </div>

    </div>

      

    </div>

13. Click "voiD store" -\> "Edit":

    <div class="figure-float">

    <div id="scp12" class="figure">

    **Figure 6.66. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp12.png)

    </div>

    </div>

    </div>

      

    </div>

14. To check the imported URLs go to "Web Application Server"-\>
    "Content Management" -\> "Repository" path
    DAV/void.rkbexplorer.com/content/:

    <div class="figure-float">

    <div id="scp10" class="figure">

    **Figure 6.67. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp10.png)

    </div>

    </div>

    </div>

      

    </div>

15. To check the inserted into the RDF QUAD data go to
    http://cname/sparql and execute the following query:

    ``` programlisting
    SELECT *
    FROM <http://void.collection>
    WHERE
      {
        ?s ?p ?o
      }
    ```

    <div class="figure-float">

    <div id="scp13" class="figure">

    **Figure 6.68. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp13.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="scp14" class="figure">

    **Figure 6.69. Crawling SPARQL Endpoints**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Crawling SPARQL Endpoints](images/ui/scp14.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>

</div>

<div id="admiui.accesscontrol" class="section">

<div class="titlepage">

<div>

<div>

#### Access Control

</div>

</div>

</div>

From "System Admin" -\> Security -\> "Access Controls" you can manage
Rules and ACL respectively for HTTP, News, Proxy. The tabs PSH and
PSH-SSL are available only when the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/pubsubhub_dav.vad"
class="ulink" target="_top" shape="rect">pubsubhub_dav.vad</a> is
installed.

<div class="figure-float">

<div id="acl001" class="figure">

**Figure 6.70. Access Control Lists**

<div class="figure-contents">

<div class="mediaobject">

![Access Control Lists](images/ui/acl001.png)

</div>

</div>

</div>

  

</div>

For each of the tabs "HTTP", "NEWS", "PROXY" the created rules will be
shown in a list with Filter, Access, Destination, Object, Mode, Rate
values. You can also add/delete rules, re-arrange rules order.

<div class="figure-float">

<div id="acl002" class="figure">

**Figure 6.71. Access Control List for HTTP**

<div class="figure-contents">

<div class="mediaobject">

![Access Control List for HTTP](images/ui/acl002.png)

</div>

</div>

</div>

  

</div>

Click the link "Edit" for a rule. Then specify the filter and access
values.

<div class="figure-float">

<div id="acl003" class="figure">

**Figure 6.72. Access Control Lists**

<div class="figure-contents">

<div class="mediaobject">

![Access Control Lists](images/ui/acl003.png)

</div>

</div>

</div>

  

</div>

</div>

<div id="admiui.wsdl" class="section">

<div class="titlepage">

<div>

<div>

#### Import WSDL

</div>

</div>

</div>

From "Web Services" / "WSDL Import/Export" you can provide a URL to a
WSDL description. In return Virtuoso will automatically provide a
wrapper for the services available, hence stored procedures and
user-defined types that are callable within Virtuoso while the
processing and mechanics of the services are actually handled at the
source.

<div class="figure-float">

<div id="wsdlimp001" class="figure">

**Figure 6.73. WSDL Import**

<div class="figure-contents">

<div class="mediaobject">

![WSDL Import](images/ui/wsdlimp001.png)

</div>

</div>

</div>

  

</div>

After Virtuoso examines the supplied URL to a WSDL you are presented
with the source code for the PL wrappers and Virtuoso user-defined types
to be created. You have the chance to edit the code for more specific
needs and then you can either save this to a file for later work, or
execute it in Virtuoso to create the procedures and types.

<div class="figure-float">

<div id="wsdlimp002" class="figure">

**Figure 6.74. WSDL Import**

<div class="figure-contents">

<div class="mediaobject">

![WSDL Import](images/ui/wsdlimp002.png)

</div>

</div>

</div>

  

</div>

Any errors in the code will be highlighted if you try and execute it.

If you wish to save the file the appropriate file system ACLs must be in
place for the destination.

</div>

</div>
