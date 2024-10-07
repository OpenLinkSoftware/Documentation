<div id="fn_totp_generate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

TOTP_generate — Returns TOTP string Time-based One-time Password
Generator (rfc6238)

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_totp_generate" class="funcsynopsis">

|                                   |                                |
|-----------------------------------|--------------------------------|
| `varchar `**`TOTP_generate`**` (` | in `start_date ` datetime ,    |
|                                   | in `date ` datetime ,          |
|                                   | in `step ` integer ,           |
|                                   | in `return_digits ` integer ,  |
|                                   | in `key_name ` varchar ,       |
|                                   | in `digest_algo ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_totp_generate" class="refsect1">

## Description

Returns TOTP string Time-based One-time Password Generator (rfc6238).

</div>

<div id="params_totp_generate" class="refsect1">

## Parameters

<div id="id119932" class="refsect2">

### start_date

T0 (zero time, usually 1970-1-1) .

</div>

<div id="id119935" class="refsect2">

### date

The current time ex. now () .

</div>

<div id="id119938" class="refsect2">

### step

Time step in secconds, usually 30.

</div>

<div id="id119941" class="refsect2">

### return_digits

How much digits to return, from 1 to 8.

</div>

<div id="id119944" class="refsect2">

### key_name

The key name keeping secret. Note: when setting up the key, should use
20 bytes for hmac-sha1, 32 bytes for hmac-sha256. Also the systems that
are used for TOTP should have time synchronized.

</div>

<div id="id119947" class="refsect2">

### digest_algo

string, one of hmac-sha1 or hmac-sha256 .

</div>

</div>

<div id="ret_totp_generate" class="refsect1">

## Return Types

On success the function will return TOTP string Time-based One-time
Password Generator (rfc6238).

</div>

<div id="examples_totp_generate" class="refsect1">

## Examples

<div id="ex_totp_generate" class="example">

**Example 24.461. **

<div class="example-contents">

``` screen
 xenc_key_RAW_read ('k2', encode_base64 (cast (hex2bin ('3132333435363738393031323334353637383930313233343536373839303132') as varchar)));
 select TOTP_generate (stringdate ('1970-01-01Z'), stringdate ('2603-10-11 11:33:20Z'), 30, 8, 'k2', 'hmac-sha256');
```

</div>

</div>

  

</div>

<div id="seealso_totp_generate" class="refsect1">

## See Also

<a href="fn_encrypt.html" class="link" title="encrypt"><code
class="function">encrypt() </code></a>

<a href="fn_xenc_encrypt.html" class="link" title="xenc_encrypt"><code
class="function">xenc_encrypt() </code></a>

<a href="fn_dsig_template_ext.html" class="link"
title="dsig_template_ext"><code
class="function">dsig_template_ext() </code></a>

<a href="fn_xenc_key_inst_create.html" class="link"
title="xenc_key_inst_create"><code
class="function">xenc_key_inst_create() </code></a>

</div>

</div>
