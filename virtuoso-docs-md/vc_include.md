<div id="vc_include" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

include — A place where the source code of other page should be
inserted.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_include" class="funcsynopsis">

|                         |                               |
|-------------------------|-------------------------------|
| ` <`**`include`**` />(` | `url` (required) ,            |
|                         | `active` (optional) ,         |
|                         | `initial-active` (optional) , |
|                         | `debug-srcfile` (optional) ,  |
|                         | `debug-srcline` (optional) ,  |
|                         | `debug-log` (optional) `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_include" class="refsect1">

## Description

The VSPX compiler replaces this control with the content of another
page. This will include the content from the specified url at this point
of the page. The url is relative to the page. The inclusion will be done
before compilation of VSPX into Virtuoso/PL, hence the include can
contain either vspx or static HTML content. The only requirement is that
the included file be well formed. Note also that if you are using vspx
namespace in the include file, it must be declared as such. This element
will not be instantiated. instead of instantiating it will be replaced
with content of the specified document. The included page may or may not
contain a 'page' element. If a 'page' element is found in the included
file this will be skipped in the resulting page. Also names of controls
in the included file MUST NOT conflict with names of controls in the top
level page or other included content.

</div>

<div id="vc_attrs_include" class="refsect1">

## Attributes

**url. ** URL of file to be included. If relative then the base is the
page where the control resides. E.g. If '/home/pageA' includes
'subdir1/pageB' and the included page includes 'subdir2/pageC' then
'pageC' should reside in '/home/subdir1/subdir2', not in
'/home/subdir2'.

**active = <a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A data bound
value to enable or disable the link. The default is '1' meaning
'enable'.

**initial-active =
<a href="vc_type_calculateablevalue.html" class="link"
title="CalculateableValue">CalculateableValue</a> . ** A data bound
value to enable or disable the link. The default is '1' meaning
'enable'. Unlike 'active' attribute, this one is effective only when the
page is displayed in the first time, not after user posts data back to
the page.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_ex_include" class="refsect1">

## Examples

<div id="vc_ex_include__0" class="example">

**Example 14.34.  Include a common back-link into the end of page**

<div class="example-contents">

If the file footer.xml is placed in the same directory where this sample
page is located and contains the paragraph \<P\>\<a
href="index.vspx"\>Back to index\</a\>\</P\> then the resulting page
will have additional paragraph at the end.

``` screen
<v:page name="include__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head><title>VSPX samples | v:include</title></head>
    <body>
      <p>The link after the horizontal ruler is included from footer.xml</p>
      <hr/>
      <v:include url="footer.xml"/> <!-- this will include the file described above -->

    </body>
  </html>
</v:page>
```

</div>

</div>

  

</div>

</div>
