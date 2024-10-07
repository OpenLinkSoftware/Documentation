<div id="fn_dt_set_tz" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

dt_set_tz — modifies the timezone component of a datetime

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_dt_set_tz" class="funcsynopsis">

|                        |                       |
|------------------------|-----------------------|
| ` `**`dt_set_tz`**` (` | in `dt ` datetime ,   |
|                        | in `tz ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_dt_set_tz" class="refsect1">

## Description

This modifies the timezone component of a datetime. The value remains
equal for purposes of comparison but will look different when converted
to a string. The timezone component is an offset from UTC in minutes. It
can be retrieved with the timezone function.

Timezoneless: The function returns its first argument with unchanged GMT
value but new timezone offset. Unlike
<a href="fn_adjust_timezone.html" class="link"
title="adjust_timezone"><code
class="function">adjust_timezone()</code></a> , if the argument is
timezoneless then no error is signaled.

</div>

<div id="params_dt_set_tz" class="refsect1">

## Parameters

<div id="id87378" class="refsect2">

### dt

The original <span class="type">DATETIME </span> .

</div>

<div id="id87382" class="refsect2">

### tz

<span class="type">INTEGER </span> new timezone offset.

</div>

</div>

<div id="ret_dt_set_tz" class="refsect1">

## Return Types

A <span class="type">DATETIME </span> with the new timezone set

</div>

</div>
