<div>

<div>

<div>

<div>

## 17.14. Testing Web Published Web Services

</div>

</div>

</div>

Virtuoso provides a mechanism for testing SOAP messages instantly. This
mechanism is the Virtuoso Service Module for XML (VSMX) - an
automatically generated test page for published web services. The VSMX
file is generated at the same time the WSDL file is generated. A VSMX
file is a SOAP operations test page generated based on the descriptions
of a WSDL file. The VSMX file has the extension .vsmx, as opposed to the
.wsdl extension of the WSDL file, and can be accessed similarly.

VSMX pages give instant access to published SOAP services for testing.
Any newly created service will need testing which normally means writing
more code to call the service, supply parameters, retrieve the result,
display the results in some manor, etc. The VSMX feature of Virtuoso
eliminates this otherwise repetitive process by automatically
maintaining a test page for SOAP messages: the VSMX file. This greatly
speeds up the development and testing cycle. The beauty of this is that
this is automated, even Microsoft's ASMX file requires that you code the
services descriptions before seeing the results.

Web Service developers would use VSMX to forego the test bed creation
step in light of automatic test page generation. Project managers can
easily keep track of their developers progress by checking the test page
periodically.

Since WSDL descriptions by themselves are not very pleasing to the human
eye, the VSMX test page can be used to preview services available on a
Virtuoso server, or from a remote source using
<a href="importwsdl.html" class="link"
title="17.2.5. Importing A WSDL File &amp; SOAP/WSDL Proxying">SOAP/WSDL
Proxying</a> . Even experienced developers will find these easier to
read than WSDL files.

Each SOAP enabled virtual directory will have a WSDL and VSMX file
available. The VSMX file is a test page for the SOAP operations. This
test page can be found as simply as the WSDL can be found. From the WSDL
chapter we have seen that for every SOAP enabled virtual directory you
automatically get the file:

``` programlisting
http://[host:port]/[SOAP Virtual Directory]/services.wsdl
```

likewise you also get:

``` programlisting
http://[host:port]/[SOAP Virtual Directory]/services.vsmx
```

You simply point your web browser to this file for the test page. The
demo database contains samples that can be found as:

``` programlisting
http://[host:port]/SOAP/services.vsmx
```

<div>

<div>

**Figure 17.66. VSMX Test Page**

<div>

<div>

![VSMX Test Page](images/ui/vsmx001.png)

</div>

</div>

</div>

  

</div>

The page shows all the operations that are available. Click on the link
that corresponds to the operation to test and the services details and
test facilities will also appear, allowing you to supply input
parameters making the SOAP call.

Once executed the result of SOAP call will be rendered using the
Virtuoso XSLT processor and built-in style sheet, and appended to bottom
of the services details.

In addition to the simple types: numbers and strings, more complex types
such as arrays and structures can be specified as input parameters. For
an array, each value must be specified on a separate row in the input
text field. For structures the names of structure members will be
displayed, following by the equals sign, the values of the structures
members can then be input after the equals sign. Arrays of arrays or
structures of arrays cannot be used on the test page.

The first comment line of a stored procedure in the format:

``` programlisting
--## [comment]
```

will be included in the WSDL description of the SOAP message for that
procedure when generating the WSDL file.

</div>
