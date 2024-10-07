<div id="fn_iri_split" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

iri_split — Splits into the namespace prefix and the local part
according to the TTL rules.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_iri_split" class="funcsynopsis">

|                        |                           |
|------------------------|---------------------------|
| ` `**`iri_split`**` (` | in `qname ` varchar ,     |
|                        | out `local ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_iri_split" class="refsect1">

## Description

Iri is a qualified name. It is split into the namespace prefix and the
local part according to the TTL rules. The prefix is returned. If a
second argument is given, it is set to the local part.

</div>

<div id="params_iri_split" class="refsect1">

## Parameters

<div id="id103229" class="refsect2">

### qname

namespace prefix

</div>

<div id="id103232" class="refsect2">

### local

local part

</div>

</div>

</div>
