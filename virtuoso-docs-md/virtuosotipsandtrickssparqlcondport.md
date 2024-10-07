<div id="virtuosotipsandtrickssparqlcondport" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.10. Is it possible to have the SPARQL endpoint on a different port than the Conductor?

</div>

</div>

</div>

Virtuoso Web Server has the capability to create extra listeners using
the <a href="admui.internetdomains.html" class="link"
title="6.2.5. Internet Domains">Conductor interface</a> .

<div class="orderedlist">

1.  At install time you have your HTTP Server port in your virtuoso.ini
    set to 8890, which you want to keep in your local network as this
    contains ALL the endpoints that you have registered in Virtuoso. So
    as long as you do not open this port in your firewall, you can only
    get at it from the local machine.

2.  Next you should create a new vhost entry using the EXTERNAL name of
    your machine and use port 80 (or a higher port if you do not want to
    run as root) for ex.:

    ``` programlisting
    Interface: 0.0.0.0
    Port: 8080
    Http Host:  my.example.com
    ```

3.  Next you add a "New directory to this line", click on "Type" radio
    button and choose "Sparql access point" from the drop-down list and
    press Next button. Set "Path" to /sparql and press the "Save
    Changes" button to store.

4.  At this point you have created: http://my.example.com:8080/sparql
    which functions exactly the same as your internal
    http://example.com/sparql. You can now open your firewall and allow
    outside machines to connect to port 8080 so people can use your
    SPARQL endpoint without access to any other endpoint on your
    Virtuoso installation.

5.  You should probably also change your virtuoso.ini so:

    ``` programlisting
    [URIQA]
    DefaultHost = my.example.com:8080
    ```

6.  If you use port 80, you do not have to add :80 at the end of this
    setting, although it should not make any difference.

7.  You can now add other directories / endpoints to the new

    <span class="emphasis">*my.example.com*</span>

    interface you just created e.g. a nice / directory that points to a
    index.html which describes your site etc.

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                      |
|:--------------------------:|:-----------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                            |
|                            | <a href="admui.internetdomains.html" class="link"    
                              title="6.2.5. Internet Domains">Internet Domains</a>  |

</div>

</div>
