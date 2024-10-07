<div id="fn_lh_load_handler" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

lh_load_handler — Loads given handler in global table of the server

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_lh_load_handler" class="funcsynopsis">

|                                 |                                       |
|---------------------------------|---------------------------------------|
| `int `**`lh_load_handler`**` (` | lang_handler_t \* `new_handler ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_lh_load_handler" class="refsect1">

## Description

Loads given handler in global table of the server, using ISO 639 and RFC
1766 language IDs of the handler as keys for future table lookups. If
another handler was already specified for given RFC 1766 id, table entry
will be updated and will refer to new handler. If another handler was
already specified for given ISO 639 id, it will be replaced only if new
handler has ISO 639 language ID equal to its RFC 1766 ID.

Please do not load custom versions of 'x-any' and 'x-ftq-x-any'
handlers.

</div>

<div id="params_lh_load_handler" class="refsect1">

## Parameters

<div id="id95775" class="refsect2">

### new_handler

Pointer to the structure that lists names of the handler and its
callback functions.

</div>

</div>

<div id="seealso_lh_load_handler" class="refsect1">

## See Also

<a href="fn_elh_get_handler.html" class="link"
title="elh_get_handler">elh_get_handler()</a>

<a href="fn_elh_load_handler.html" class="link"
title="elh_load_handler">elh_load_handler()</a>

<a href="fn_lh_get_handler.html" class="link"
title="lh_get_handler">lh_get_handler()</a>

</div>

</div>
