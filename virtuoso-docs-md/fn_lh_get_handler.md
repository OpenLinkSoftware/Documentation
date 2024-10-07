<div id="fn_lh_get_handler" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

lh_get_handler — Returns language handler

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_lh_get_handler" class="funcsynopsis">

|                                             |                                     |
|---------------------------------------------|-------------------------------------|
| `lang_handler_t * `**`lh_get_handler`**` (` | const char \* `language_name ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_lh_get_handler" class="refsect1">

## Description

Returns language handler

</div>

<div id="params_lh_get_handler" class="refsect1">

## Parameters

<div id="id95741" class="refsect2">

### language_name

Name of language handler.

</div>

</div>

<div id="ret_lh_get_handler" class="refsect1">

## Return Types

Returns language handler for given language, or universal 'x-any'
handler if no matches found. Unlike elh_get_handler, it will never
return NULL.

</div>

<div id="seealso_lh_get_handler" class="refsect1">

## See Also

<a href="fn_elh_get_handler.html" class="link"
title="elh_get_handler">elh_get_handler</a>

<a href="fn_elh_load_handler.html" class="link"
title="elh_load_handler">elh_load_handler</a>

<a href="fn_lh_load_handler.html" class="link"
title="lh_load_handler">lh_load_handler</a>

</div>

</div>
