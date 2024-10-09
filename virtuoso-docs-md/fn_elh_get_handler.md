<div>

<div>

</div>

<div>

## Name

elh_get_handler — get localization function handler

</div>

<div>

## Synopsis

<div>

|                                                     |                                        |
|-----------------------------------------------------|----------------------------------------|
| `encodedlang_handler_t * `**`elh_get_handler`**` (` | encoding_handler_t \* `encoding ` ,    |
|                                                     | language_handler_t \* `language ` `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Gets localization.

</div>

<div>

## Parameters

<div>

### encoding

Name of the encoding to be used.

</div>

<div>

### language

Name of the text language

</div>

</div>

<div>

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

<div>

## Examples

<div>

**Example 24.98. Returning a Handler Pointer**

<div>

``` screen
encodedlang_handler_t *elh =
  elh_get_handler(eh_get_handler("MY-ENCODING"),
    lh_get_handler("x-my-language")
  );
```

</div>

</div>

  

</div>

<div>

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
