<div id="macosxinstpost" class="section">

<div class="titlepage">

<div>

<div>

### 2.4.5. Post Installation

</div>

</div>

</div>

<div id="macosxinstpostsan" class="section">

<div class="titlepage">

<div>

<div>

#### Post-Installation Sanity Check

</div>

</div>

</div>

A quick way to check that the database is running, is to point a browser
to the http port. The following example URLs will show the System
Manager for the default, and the demo Virtuoso databases:

``` programlisting
http://example.com
http://example.com
http://a_virtuoso_server.org:8890
```

</div>

<div id="macosxinstposttrb" class="section">

<div class="titlepage">

<div>

<div>

#### Troubleshooting DB Startup Failures

</div>

</div>

</div>

<span class="emphasis">*Install failure*</span>

Check the .log file in oplmgr (License Manager) location:
`/Library/Application Support/openlink/bin/` , which is for the database
and log files etc. in order to review the installed files binaries and
databases (defaults) for issues if install fails.

<div class="figure-float">

<div id="instmac" class="figure">

**Figure 2.52. The .log file**

<div class="figure-contents">

<div class="mediaobject">

![The .log file](images/ui/instmac.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*.lck existance*</span>

Check .log in case of .lck issue

Delete the .lck file and repeat the steps from above.

<span class="emphasis">*.trx incompatiblity issue*</span>

Check .log in case of .trx incompatiblity issue

<span class="emphasis">*oplmgr issue*</span>

To stop, start, or reload (which updates licenses) use the following
commands:

``` programlisting
/Library/Application Support/openlink/bin/oplmgr +start | +stop | +reload
```

<div class="figure-float">

<div id="instmac2" class="figure">

**Figure 2.53. The .log file**

<div class="figure-contents">

<div class="mediaobject">

![The .log file](images/ui/instmac2.png)

</div>

</div>

</div>

  

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                |
|                            | <a href="oplmgr.html" class="link"                                       
                              title="2.5. OpenLink License Management">OpenLink License Management</a>  |

</div>

</div>

</div>
