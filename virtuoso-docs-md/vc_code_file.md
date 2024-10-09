<div>

<div>

</div>

<div>

## Name

code-file — Code-behind file containing SQL script.

</div>

<div>

## Synopsis

<div>

|                           |                              |
|---------------------------|------------------------------|
| ` <`**`code-file`**` />(` | `url` (required) ,           |
|                           | `debug-srcfile` (optional) , |
|                           | `debug-srcline` (optional) , |
|                           | `debug-log` (optional) `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

This element is used to load an external SQL script after page class
compilation and before page execution. This script may contain page
subclass or custom control definitions. In this way SQL code can be
separated from VSPX markup, or in other words to separate page design
from application logic.

</div>

<div>

## Attributes

**url. ** URL of file to be loaded after VSPX page compilation. If
relative then the base is the page where the control resides (i.e. same
URL resolution rules applied as for includes).

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Examples

<div>

**Example 14.23.  Code-behind SQL script**

<div>

The script of a button's post event is in separate SQL file.

The code_file\_\_0.sql contents is:

``` screen
drop type my_page_subclass
;

create type my_page_subclass under DB.dba.page__vspx_code__file____0_vspx
temporary self as ref
overriding method vc_post_b1 (control vspx_button, e vspx_event) returns any,
method button_change (control vspx_button) returns any
;

create method vc_post_b1 (inout control vspx_button, inout e vspx_event) for my_page_subclass
 {
   if (not control.vc_focus) return;
   self.button_change (control);
   return;
 }
;

create method button_change (inout control vspx_button) for my_page_subclass
 {
   self.var1 := self.var1 + 1;
   control.ufl_value := 'Activated';
 }
;
```

``` screen
<v:page name="page1" xmlns:v="http://http://example.com/vspx/" page-subclass="my_page_subclass">
  <html>
    <body>
      <v:code-file  url="code_file__0.sql"/>
      <v:variable name="var1" type="int" default="0" param-name="id" persist="pagestate" />
      <v:form type="simple" name="f1">
    <v:label name="l1" value="--self.var1" format="%d" />
    <v:button action="simple" name="b1" value="Submit" />
      </v:form>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

</div>

</div>
