<div>

<div>

</div>

<div>

## Name

TOTP_generate — Returns TOTP string Time-based One-time Password
Generator (rfc6238)

</div>

<div>

## Synopsis

<div>

|                                   |                                |
|-----------------------------------|--------------------------------|
| `varchar `**`TOTP_generate`**` (` | in `start_date ` datetime ,    |
|                                   | in `date ` datetime ,          |
|                                   | in `step ` integer ,           |
|                                   | in `return_digits ` integer ,  |
|                                   | in `key_name ` varchar ,       |
|                                   | in `digest_algo ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns TOTP string Time-based One-time Password Generator (rfc6238).

</div>

<div>

## Parameters

<div>

### start_date

T0 (zero time, usually 1970-1-1) .

</div>

<div>

### date

The current time ex. now () .

</div>

<div>

### step

Time step in secconds, usually 30.

</div>

<div>

### return_digits

How much digits to return, from 1 to 8.

</div>

<div>

### key_name

The key name keeping secret. Note: when setting up the key, should use
20 bytes for hmac-sha1, 32 bytes for hmac-sha256. Also the systems that
are used for TOTP should have time synchronized.

</div>

<div>

### digest_algo

string, one of hmac-sha1 or hmac-sha256 .

</div>

</div>

<div>

## Return Types

On success the function will return TOTP string Time-based One-time
Password Generator (rfc6238).

</div>

<div>

## Examples

<div>

**Example 24.461. **

<div>

``` screen
 xenc_key_RAW_read ('k2', encode_base64 (cast (hex2bin ('3132333435363738393031323334353637383930313233343536373839303132') as varchar)));
 select TOTP_generate (stringdate ('1970-01-01Z'), stringdate ('2603-10-11 11:33:20Z'), 30, 8, 'k2', 'hmac-sha256');
```

</div>

</div>

  

</div>

<div>

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
