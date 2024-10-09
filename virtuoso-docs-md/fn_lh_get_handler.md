<div>

<div>

</div>

<div>

## Name

lh_get_handler — Returns language handler

</div>

<div>

## Synopsis

<div>

|                                             |                                     |
|---------------------------------------------|-------------------------------------|
| `lang_handler_t * `**`lh_get_handler`**` (` | const char \* `language_name ` `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns language handler

</div>

<div>

## Parameters

<div>

### language_name

Name of language handler.

</div>

</div>

<div>

## Return Types

Returns language handler for given language, or universal 'x-any'
handler if no matches found. Unlike elh_get_handler, it will never
return NULL.

</div>

<div>

## See Also

<a href="fn_elh_get_handler.html" class="link"
title="elh_get_handler">elh_get_handler</a>

<a href="fn_elh_load_handler.html" class="link"
title="elh_load_handler">elh_load_handler</a>

<a href="fn_lh_load_handler.html" class="link"
title="lh_load_handler">lh_load_handler</a>

</div>

</div>
