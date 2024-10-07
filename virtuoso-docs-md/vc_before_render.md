<div id="vc_before_render" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

before-render — Container for code that should be executed before
rendering.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_before_render" class="funcsynopsis">

|                                                                     |      |
|---------------------------------------------------------------------|------|
| ` <`**`before-render`**` >(EventHandler)</`**`before-render`**` >(` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_before_render" class="refsect1">

## Description

The code contained in this element is executed on the descending edge of
recursion when traversing the vspx control tree before rendering. This
is expected to have side effects on vspx controls only, not to return
anything or emit any output. Any return value from the code is ignored.

</div>

</div>
