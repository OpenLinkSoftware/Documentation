<div>

<div>

<div>

<div>

## 3.8. VSMX - Virtuoso Service Module for XML

</div>

</div>

</div>

Every WSDL file generated by Virtuoso is automatically accompanied by a
SOAP Operations Test page known as a VSMX file, which has the extension
.vsmx. You find this file in the same place as the WSDL file. For a SOAP
enabled virtual directory you have the facility to find the WSDL file:

``` programlisting
http://[host:port]/[SOAP Virtual Directory]/services.wsdl
```

likewise you also get a VSMX file:

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

**Figure 3.51. VSMX Test Page**

<div>

<div>

![VSMX Test Page](images/ui/vsmx001.png)

</div>

</div>

</div>

  

</div>

<div>

|                            |                                                                                     |
|:--------------------------:|:------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                           |
|                            | The <a href="vsmx.html" class="link"                                                
                              title="17.14. Testing Web Published Web Services">VSMX section</a> for more details  |

</div>

</div>
