<div id="xmlstoragesystem_09" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.21. Pingback API

</div>

</div>

</div>

The Pingback is another form of trackback, just protocol and parameters
are different. In Pingback is used XML-RPC instead of REST model. Also
the requester sends his own and target url as part of request.

The implementation consists of "pingback.ping" XML-RPC method and
auto-discovery in blog home page.

"pingback.ping" (in sourceURI varchar, in targetURI varchar) return
varchar

The sourceURI is URL for page of requester; targetURI is page on the
target server. The pingback.ping method will retrieve sourceURI and will
record the data as trackback it targetURI exists on same server and it's
valid permaLink. On success it returns a string 'Success' otherwise
XML-RPC error code.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                     |
|:--------------------------:|:--------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                           |
|                            | <a href="http://www.hixie.ch/specs/pingback/pingback" class="ulink" 
                              target="_top">Pingback 1.0</a>                                       |

</div>

</div>
