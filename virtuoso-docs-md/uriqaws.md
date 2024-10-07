<div id="uriqaws" class="section">

<div class="titlepage">

<div>

<div>

### 19.2.2. URIQA Web Service

</div>

</div>

</div>

Virtuoso provides the '/uriqa/' web service for clients that do not
support URIQA-specific methods. Instead of passing URI and method name
in HTTP parameter lines, web service calls pass them as part of web
service URI. The beginning of the path can be any, starting from
'/uriqa/' or '/URIQA/'. The following two requests are to retrieve
metadata about 'http://example.com/foo'.

``` programlisting
GET /uriqa?uri=http%3a%2f%2fexample%2ecom%2ffoo HTTP/1.1
```

``` programlisting
GET /uriqa?uri=http%3a%2f%2fexample%2ecom%2ffoo&method=MGET HTTP/1.1
```

The following request header is for MPUT

``` programlisting
GET /uriqa?uri=http%3a%2f%2fexample%2ecom%2ffoo&method=MPUT HTTP/1.1
```

The URIQA web service does not need complicated rules for URI passing
because the request can not be significantly changed by any proxy. The
value of the 'uri' parameter should be an absolute URI.

</div>
