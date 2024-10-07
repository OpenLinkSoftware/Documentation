<div id="rdfinsertmethodvirtuosocrawler" class="section">

<div class="titlepage">

<div>

<div>

### 16.9.8. Using Virtuoso Crawler

</div>

</div>

</div>

Using Virtuoso Crawler (which includes the Sponger options so you crawl
non-RDF but get RDF and this can go to the Quad Store).

<span class="emphasis">*Example:*</span>

<div class="orderedlist">

1.  Go to Conductor UI. For ex. at http://example.com/conductor :

    <div class="figure-float">

    <div id="rdfinsertwebdav11" class="figure">

    **Figure 16.86. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert11.png)

    </div>

    </div>

    </div>

      

    </div>

2.  Enter admin user credentials:

    <div class="figure-float">

    <div id="rdfinsertwebdav12" class="figure">

    **Figure 16.87. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert12.png)

    </div>

    </div>

    </div>

      

    </div>

3.  Go to tab Web Application Server:

    <div class="figure-float">

    <div id="rdfinsertwebdav13" class="figure">

    **Figure 16.88. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert13.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Go to tab Content Imports:

    <div class="figure-float">

    <div id="rdfinsertwebdav14" class="figure">

    **Figure 16.89. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert14.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Click the "New Target" button:

    <div class="figure-float">

    <div id="rdfinsertwebdav15" class="figure">

    **Figure 16.90. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert15.png)

    </div>

    </div>

    </div>

      

    </div>

6.  In the shown form set respectively:

    <div class="orderedlist">

    1.  "Target description": Tim Berners-Lee's electronic Business Card

    2.  "Target URL": http://www.w3.org/People/Berners-Lee/ ;

    3.  "Copy to local DAV collection " for ex.:
        /DAV/home/demo/my-crawling/ ;

    4.  Choose from the list "Local resources owner": demo ;

    5.  Leave checked by default the check-box "Store documents
        locally". -- Note: if "Store document locally" is not checked,
        then in this case no documents will be save as DAV resource and
        the specified DAV folder from above will not be used ;

    6.  Check the check-box with label "Store metadata" ;

    7.  Specify which cartridges to be involved by hatching their
        check-box ;

    8.  Note: when selected "Convert Link", then all HREFs in the local
        stored content will be relative.

    </div>

    <div class="figure-float">

    <div id="rdfinsertwebdav16" class="figure">

    **Figure 16.91. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert16.png)

    </div>

    </div>

    </div>

      

    </div>

    <div class="figure-float">

    <div id="rdfinsertwebdav17" class="figure">

    **Figure 16.92. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert17.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click the button "Create":

    <div class="figure-float">

    <div id="rdfinsertwebdav19" class="figure">

    **Figure 16.93. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert19.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Click the button "Import Queues":

    <div class="figure-float">

    <div id="rdfinsertwebdav20" class="figure">

    **Figure 16.94. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert20.png)

    </div>

    </div>

    </div>

      

    </div>

9.  For "Robot target" with label "Tim Berners-Lee's electronic Business
    Card" click "Run".

10. As result should be shown the number of the pages retrieved.

    <div class="figure-float">

    <div id="rdfinsertwebdav2" class="figure">

    **Figure 16.95. Using Virtuoso Crawler**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Using Virtuoso Crawler](images/ui/rdfinsert2.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

<span class="emphasis">*Example: Use of schedular to interface Virtuoso
Quad Store with PTSW using the following program:*</span>

``` programlisting

create procedure PTSW_CRAWL ()
{
  declare xt, xp any;
  declare content, headers any;

  content := http_get ('http://pingthesemanticweb.com/export/', headers);
  xt := xtree_doc (content);
  xp := xpath_eval ('//rdfdocument/@url', xt, 0);
  foreach (any x in xp) do
    {
      x := cast (x as varchar);
      dbg_obj_print (x);
      {
    declare exit handler for sqlstate '*' {
      log_message (sprintf ('PTSW crawler can not load : %s', x));
    };
        sparql load ?:x into graph ?:x;
    update DB.DBA.SYS_HTTP_SPONGE set HS_LOCAL_IRI = x, HS_EXPIRATION = null WHERE HS_LOCAL_IRI = 'destMD5=' || md5 (x) || '&graphMD5=' || md5 (x);
    commit work;
      }
    }
}
;

insert soft SYS_SCHEDULED_EVENT (SE_SQL, SE_START, SE_INTERVAL, SE_NAME)
    values ('DB.DBA.PTSW_CRAWL ()', cast (stringtime ('0:0') as DATETIME), 60, 'PTSW Crawling');
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                |
|                            | <a href="admui.webservices.html#contentcrawlerrdf" class="link"          
                              title="Set Up the Content Crawler to Gather RDF">Other Methods to Set Up  
                              the Content Crawler for RDF gathering.</a>                                |

</div>

</div>
