<div id="fn_elh_get_handler" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

elh_get_handler — get localization function handler

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_elh_get_handler" class="funcsynopsis">

|                                                     |                                        |
|-----------------------------------------------------|----------------------------------------|
| `encodedlang_handler_t * `**`elh_get_handler`**` (` | encoding_handler_t \* `encoding ` ,    |
|                                                     | language_handler_t \* `language ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_elh_get_handler" class="refsect1">

## Description

Gets localization.

</div>

<div id="params_elh_get_handler" class="refsect1">

## Parameters

<div id="id87550" class="refsect2">

### encoding

Name of the encoding to be used.

</div>

<div id="id87553" class="refsect2">

### language

Name of the text language

</div>

</div>

<div id="ret_elh_get_handler" class="refsect1">

## Return Types

Returns "encoded language" handler for optimized processing of texts on
given language with given encoding as described in section
<a href="langfuncapi.html" class="link"
title="18.5.10. Adding New Languages And Encodings Into Virtuoso">Adding
New Languages and Encodings Into Virtuoso</a> of the main documentation.
If *`encoding`* is NULL, or if there's no optimized handler for given
encoding/language combination, then NULL will be returned, indicating
failure, otherwise combination's handler will be returned.

</div>

<div id="examples_elh_get_handler" class="refsect1">

## Examples

<div id="ex_elh_get_handler_1" class="example">

**Example 24.98. Returning a Handler Pointer**

<div class="example-contents">

``` screen
encodedlang_handler_t *elh =
  elh_get_handler(eh_get_handler("MY-ENCODING"),
    lh_get_handler("x-my-language")
  );
```

</div>

</div>

  

</div>

<div id="seealso_elh_get_handler" class="refsect1">

## See Also

<a href="fn_elh_load_handler.html" class="link"
title="elh_load_handler">elh_load_handler</a>

<a href="fn_lh_get_handler.html" class="link"
title="lh_get_handler">lh_get_handler</a>

<a href="fn_lh_load_handler.html" class="link"
title="lh_load_handler">lh_load_handler</a>

<a href="langfuncapi.html" class="link"
title="18.5.10. Adding New Languages And Encodings Into Virtuoso">Adding
New Languages and Encodings Into Virtuoso</a>

</div>

</div>
