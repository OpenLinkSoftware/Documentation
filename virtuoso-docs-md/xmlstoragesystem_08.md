<div id="xmlstoragesystem_08" class="section">

<div class="titlepage">

<div>

<div>

### 14.7.20. Trackback API

</div>

</div>

</div>

The TrackBack provides a method of notification between websites: it is
a method of person A saying to person B, "This is something you may be
interested in." To do that, person A sends a TrackBack ping to person B.
TrackBack ping call: this is a small message sent from one webserver to
another via HTTP POST or GET. There are few situations where track back
is useful: \*As a form of remote comments rather than posting the
comment directly on person B's weblog, person A posts it on his own
weblog, then sends a TrackBack ping to notify person B. \*Person A has
written a post that group of people are interested in; then it sends a
trackback to a community server and there visitors can show it.

The implementation consist of : \* the "trackback" method which can be
invoked via REST(HTTP POST) \* auto-discovery of the trackback URL in
default blog home page

trackback (varchar id, varchar url, varchar title, varchar excerpt,
varchar blog_name, varchar \_\_mode) the method can be invoked via REST
and returns a XML response.

A typical trackback post request look-like as :

``` programlisting
POST /mt-tb/Http/trackback?id=1
Content-Type: application/x-www-form-urlencoded
title=Some+Title&url=http://www.some.domain/&excerpt=An+excerpt&blog_name=foo
```

A successful trackback response :

``` programlisting
<?xml version="1.0" encoding="ISO-8859-1"?>
<response>
  <error>0</error>
</response>
```

When "\_\_mode" parameter is specified via GET request, then trackback
method returns a RSS v0.91 XML data for given post enclosed in response
element.

A sample request and response follows:

``` programlisting
http://host:port/mt-tb/Http/trackback?id=3&__mode=rss

<response>
<error>0</error>
<rss version="0.91">
<channel>
  <title/>
  <link> http://....  </link>
  <description> Description text ....  </description>
</channel>
</rss>
</response>
```

</div>
