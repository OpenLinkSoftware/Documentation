<div id="vc_before_data_bind" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

before-data-bind — Container for code that should be executed before
data bind.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_before_data_bind" class="funcsynopsis">

|                                                                           |      |
|---------------------------------------------------------------------------|------|
| ` <`**`before-data-bind`**` >(EventHandler)</`**`before-data-bind`**` >(` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_before_data_bind" class="refsect1">

## Description

The code contained in this element is executed before the default data
bind processing on the descending edge of recursion. The context has
self as the page, control as the control with this handler, event as the
vspx_event which caused the page invocation. A return value from the
code if equal to 1 (one) will stop further data-bind processing of the
containing control and it's children if any.

</div>

</div>
