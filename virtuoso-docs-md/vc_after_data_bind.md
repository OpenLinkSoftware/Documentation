<div id="vc_after_data_bind" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

after-data-bind — Container for code that should be executed after data
bind.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_after_data_bind" class="funcsynopsis">

|                                                                         |      |
|-------------------------------------------------------------------------|------|
| ` <`**`after-data-bind`**` >(EventHandler)</`**`after-data-bind`**` >(` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_after_data_bind" class="refsect1">

## Description

The code contained in this element is executed after the default data
bind processing on the returning edge of recursion. The context has self
as the page, control as the control with this handler, event as the
vspx_event which caused the page invocation. Any return value from the
code is ignored.

</div>

</div>
