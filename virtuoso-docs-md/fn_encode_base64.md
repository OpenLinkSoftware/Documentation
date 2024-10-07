<div id="fn_encode_base64" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

encode_base64 , decode_base64 — base64-encode/decode a string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_encode_base64" class="funcsynopsis">

|                            |                        |
|----------------------------|------------------------|
| ` `**`encode_base64`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_decode_base64" class="funcsynopsis">

|                            |                        |
|----------------------------|------------------------|
| ` `**`decode_base64`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_encode_base64" class="refsect1">

## Description

These functions convert strings from/to base64-encoding.

</div>

<div id="params_encode_base64" class="refsect1">

## Parameters

<div id="id87633" class="refsect2">

### *`str `*

A <span class="type">varchar </span> value.

</div>

</div>

<div id="ret_encode_base64" class="refsect1">

## Return Values

`encode_base64 ` returns a <span class="type">varchar </span> containing
base64-encoded data. `decode_base64` returns a
<span class="type">varchar </span> containing the result of the
base64-decoding.

</div>

<div id="examples_encode_base64" class="refsect1">

## Examples

<div id="ex_encode_base64_1" class="example">

**Example 24.99. Simple Example**

<div class="example-contents">

Base64-encode a string

``` screen
SQL> select encode_base64('Rutabaga');
callret
VARCHAR
_______________________________________________________________________________

UnV0YWJhZ2E=

1 Rows. -- 25 msec.
```

</div>

</div>

  

<div id="ex_encode_base64" class="example">

**Example 24.100. Web example**

<div class="example-contents">

Using encode-base64 with serialize to persist complex data

``` screen
declare n any; n := vector ('a', 3.14157, 4711, 'Hic Iacet Corpus.');
http (sprintf ('<input type="hidden" name="saved" value="%s">', encode_base64 (serialize (n))));
```

To retrieve this data in VSP context when handling a form submit:

``` screen
declare n any; n := deserialize (decode_base64 (get_keyword ('saved', params, '')));
```

</div>

</div>

  

</div>

<div id="seealso_encode_base64" class="refsect1">

## See Also

<a href="fn_serialize.html" class="link" title="serialize"><code
class="function">serialize </code></a>

</div>

</div>
