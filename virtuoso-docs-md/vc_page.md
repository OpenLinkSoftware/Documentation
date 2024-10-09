<div>

<div>

</div>

<div>

## Name

page — Container of VSPX code.

</div>

<div>

## Synopsis

<div>

|                      |                                   |
|----------------------|-----------------------------------|
| ` <`**`page`**` />(` | `name` (required) ,               |
|                      | `decor` (optional) ,              |
|                      | `style` (optional) ,              |
|                      | `on-error-redirect` (optional) ,  |
|                      | `on-deadlock-retry` (optional) ,  |
|                      | `doctype` (optional) ,            |
|                      | `doctype-system` (optional) ,     |
|                      | `page-subclass` (optional) ,      |
|                      | `file-name` (optional) ,          |
|                      | `no-script-function` (optional) , |
|                      | `xsd-stub-xhtml` (optional) ,     |
|                      | `width` (optional) ,              |
|                      | `height` (optional) ,             |
|                      | `debug-srcfile` (optional) ,      |
|                      | `debug-srcline` (optional) ,      |
|                      | `debug-log` (optional) `)`;       |

<div>

 

</div>

</div>

</div>

<div>

## Description

The container for the rest of the vspx code. The page or a subclass of
it will be the outermost VSPX element on any VSPX page. Each .vspx file
defines explicitly one custom page class derived from vspx_page. This
element can enclose all HTML elements or can be incorporated in it's
children on place apropriate for rendering the VSPX controls, but one
VSPX page must contain only one vspx:page element. and noe VSPX-specific
element may appear outside the vspx:page. It can be placed in other HTML
stuff or around it, doesnt' matter, but VSP & VSPX code must be inside
it (the same applies to customized HTML attributes, i.e. containing \<?V
& \<?U shortcuts). Note that when using 'include' or 'decoration'
features the top level page element will be : in case of include -
'this' page, in case of 'decoration' - the decoration page. Also page
variables, controls will be combined in all cases of inclusion or
macro-expansion, so their names must not be duplicated; this means that
names of variables introduced by macro expansion or inclusion must not
conflict with cnames of variables or controls in the top level page or
any included or macro content.

</div>

<div>

## Attributes

**name =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The name of subclass of vspx_page to be generated. The name of
class will be prefixed with 'page\_' plus that name.

**decor. ** This attribute specifies a 'decoration' page URL. The
decoration page is a VSPX page that is wrapped around the including
page. The content of the including page is then put in the place
indicated by a placeholder element in the decor page. This is useful for
defining enclosing tables, headers, footers and other repeating content.

**style. ** This designates an external XSL-T style sheet to be apply
over the page, before page compilation. This is useful as a 'macro'
feature. The XSLT sheet may define rules for macroexpanding things in
the page body.

**on-error-redirect. ** This specifies where to redirect the HTTP client
in the event of an an unhandled error. This will pass a \_\_SQL_STATE,
\_\_SQL_MESSAGE and \_\_PAGE as parameters to the error page.

**on-deadlock-retry. ** This specifies how many times to retry page
execution upon deadlock. When the number of retries is reached, the
behaviour will be as for other SQL errors.

**doctype. ** This is to specify the resulting document type declaration
(DTD) public URI.

**doctype-system. ** This is to specify the resulting document type
declaration (DTD) system URI.

**page-subclass =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** The name of page subclass to be instantiated for processing. The
subclass with this name MUST already be defined. The subclass definition
can be kept in a code-behind file (see code-file element).

**file-name. ** The name of page to be generated. Used by wizards to
designate where generated page will be stored. This attribute do not
affect VSPX processing.

**no-script-function. ** A function to enable or disable automatic
NOSCRIPT element generation.

**xsd-stub-xhtml. ** This attribute is for internal use only. It has no
effect if added to the source VSPX file.

**width. ** Visible width of the control when it is displayed in WYSIWYG
tools when the source VSPX text is edited. The value of this attribute
will not be used when the resulting HTML is rendered.

**height. ** Visible width of the control when it is displayed in
WYSIWYG tools when the source VSPX text is edited. The value of this
attribute will not be used when the resulting HTML is rendered.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div>

## Declaration of type vspx_page

VSPX Page Class , from it must be derived all VSPX pages, no subcalsses
for others

``` screen
create type vspx_page under vspx_control
as (
    vc_view_state any,
    vc_is_postback int default 0,
    vc_persisted_vars any,
    vc_event vspx_event,
    vc_is_valid int default 1,          -- set to 0 when first validator fails
    vc_authenticated int default 0,     -- is true if login control in the page suceeded
    vc_current_id int default 0,
    vc_browser_caps any default 0,
    vc_authentication_mode int default 1, -- authentication mode 0 - cookie, 1 - url, 2 - digest
    vc_debug_log_acc any default null   -- The accumulator in xte_nodebld_... style for keeping debugging info.
    )  temporary self as ref
  method vc_state_deserialize (stream any, n int) returns any,
  method vc_get_debug_log (title varchar) returns any
```

</div>

<div>

## Examples

<div>

**Example 14.38.  Sample VSPX page**

<div>

``` screen
<v:page name="page__0" xmlns:v="http://http://example.com/vspx/">
  <html>
    <head><title>VSPX samples | v:page</title></head>
    <body>
      <p>This VSPX page does nothing.<br/>
It does not even print traditional 'Hello world' phrase.</p>
    </body>
  </html>
</v:page>
```

</div>

</div>

  

<div>

<table data-border="0"
data-summary="Tip: See Also: Reference Material in the Tutorial:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also: Reference Material in the
Tutorial:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="http://demo.openlinksw.com/tutorial/web/vx_s_1/simple.vspx"
class="ulink" target="_top">VX-S-1</a></p>
<p><a href="http://demo.openlinksw.com/tutorial/web/vx_s_8/formsty.vspx"
class="ulink" target="_top">VX-S-8</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
