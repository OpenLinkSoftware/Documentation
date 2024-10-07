<div id="fn_soap_wsdl_import" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

SOAP_WSDL_IMPORT

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_wsdl_import" class="funcsynopsis">

|                                            |                               |
|--------------------------------------------|-------------------------------|
| `array DB.DBA. `**`SOAP_WSDL_IMPORT`**` (` | in `target_url ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_soap_wsdl_import" class="refsect1">

## Description

The `soap_wsdl_import() ` function is used to import operations and
types definitions from an WSDL file on a remote server. The retrieved
file will be parsed and PL (procedure language) wrappers will be
generated for each SOAP operation that is described. The SOAP service
will be represented by a PL module which will be the overall container
the generated PL wrappers. Once the WSDL file has been imported the PL
wrappers are automatically generated and available for use.

</div>

<div id="params_soap_wsdl_import" class="refsect1">

## Parameters

<div id="id110927" class="refsect2">

### target_url

A URL to a WSDL file.

</div>

</div>

<div id="ret_soap_wsdl_import" class="refsect1">

## Return Types

soap_wsdl_import() returns an array that consists of the name of module,
the name of PL wrapper, and a vector of parameter name/type pairs. An
example of the result is: vector (\[module name\], \[wrapper1\], vector
(\[param1\], \[type1\], \[param2\], \[tyep2\] ...), \[wrapper2\] vector
(...))

</div>

<div id="examples_soap_wsdl_import" class="refsect1">

## Examples

<div id="ex_soap_wsdl_import" class="example">

**Example 24.386. Importing and using a Web Services description file**

<div class="example-contents">

``` screen
 SQL> soap_wsdl_import('http://[host:port]/chemistry.wsdl');

 Done. -- 1286 msec.
 SQL> select xml_tree_doc (Chemistry.getElementBySymbol('Ni'));
 callret
 VARCHAR
 _______________________________________________________________________________

 <getElementBySymbolResponse>
   <return>
     <atomicnumber>28</atomicnumber>
     <symbol>Ni</symbol>
     <name>Nickel</name>
     <mass>58.69</mass>
     <meltingPoint>1726.0</meltingPoint>
     <boilingPoint>3005.0</boilingPoint>
     <found>1751</found>
  </return>
 </getElementBySymbolResponse>

 Note: the namespaces from response are omitted for better reading.
```

</div>

</div>

  

</div>

<div id="seealso_soap_wsdl_import" class="refsect1">

## See Also

<a href="fn_soap_wsdl.html" class="link"
title="soap_wsdl">soap_wsdl()</a>

</div>

</div>
