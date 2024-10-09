<div>

<div>

</div>

<div>

## Name

elh_load_handler — load encoding handler into system

</div>

<div>

## Synopsis

<div>

|                                  |                                              |
|----------------------------------|----------------------------------------------|
| `int `**`elh_load_handler`**` (` | encodedlang_handler_t \* `new_handler ` `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Loads given handler in table of handlers bound to encoding specified in
the handler, using ISO 639 and RFC 1766 language IDs of the handler as
keys for future table lookups. If another handler was already specified
for given RFC 1766 id, table entry will be updated and will refer to new
handler. If another handler was already specified for given ISO 639 id,
it will be replaced only if new handler has ISO 639 language ID equal to
its RFC 1766 ID.

Please do not load custom versions of 'x-any' and 'x-ftq-x-any'
handlers.

</div>

<div>

## Parameters

<div>

### new_handler

Pointer to the structure that lists names of the handler and its
callback functions.

</div>

</div>

<div>

## See Also

<a href="fn_elh_get_handler.html" class="link"
title="elh_get_handler">elh_get_handler</a>

<a href="fn_lh_get_handler.html" class="link"
title="lh_get_handler">lh_get_handler</a>

<a href="fn_lh_load_handler.html" class="link"
title="lh_load_handler">lh_load_handler</a>

</div>

</div>
