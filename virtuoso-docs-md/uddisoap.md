<div>

<div>

<div>

<div>

### 17.12.2. Dealing with SOAP

</div>

</div>

</div>

UDDI API functions are exposed as SOAP v1.1 messages over the HTTP
protocol. In version 1, the `SOAPAction` HTTP Header is required. The
value passed in this HTTP Header must be an empty string that is
surrounded by double quotes.

<div>

**Example 17.39. UDDI and Soap**

<div>

``` programlisting
POST /UDDI/inquiry HTTP/1.1
Host: www.foo.com
Content-Type: text/xml
Content-Length: nnnn
SOAPAction: ""

.... body follows ....
```

</div>

</div>

  

SOAP is used in conjunction with HTTP to provide a simple mechanism for
passing XML messages to UDDI-enabled servers using a standard HTTP-POST
protocol. Unless specified, all responses will be returned in the normal
HTTP response document.

<div>

|                            |                                                                                                                                            |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                  |
|                            | For more information about Virtuoso's SOAP Implementation see the <a href="ch-functions.html#soap" class="link">SOAP Services</a> section. |

</div>

</div>
