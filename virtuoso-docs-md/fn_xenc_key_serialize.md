<div id="fn_xenc_key_serialize" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xenc_key_serialize — Extracts a key from user's repository

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xenc_key_serialize" class="funcsynopsis">

|                                        |                       |
|----------------------------------------|-----------------------|
| `varchar `**`xenc_key_serialize`**` (` | in `name ` varchar ,  |
|                                        | in `public ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xenc_key_serialize" class="refsect1">

## Description

The function returns a string containing base64 encoded binary key data.
It is used to extract symmetric or asymmetric keys. So if key is
asymmetric (RSA or DSA) the second parameter designate which part to
extract private or public.

</div>

<div id="params_xenc_key_serialize" class="refsect1">

## Parameters

<div id="id120740" class="refsect2">

### name

The key name.

</div>

<div id="id120743" class="refsect2">

### public

1 - export public part, 0 - export private key if exists.

</div>

</div>

<div id="ret_xenc_key_serialize" class="refsect1">

## Return Types

The function returns serialized key material.

</div>

<div id="examples_xenc_key_serialize" class="refsect1">

## Examples

<div id="ex_xenc_key_serialize" class="example">

**Example 24.476. Exporting a RSA public key.**

<div class="example-contents">

The 'ServerPrivate.pfx' is a own RSA key so we exporting public part to
supply to some party to encrypt data for us.

``` screen
SQL> select xenc_key_serialize ('ServerPrivate.pfx', 1);
callret
VARCHAR
_______________________________________________________________________________

MIGJAoGBAMuSqCUCsie6RGUPBdtyM3fPF+yN5ot34i9/IPmjfmlSOlOQ/A9eYClJyvxRVDEHkkNFJWUzPWVRDoIEsUsYgBA6ls8qfai6XdWYoB/2dFB/08tT5uJajNleSF5sjJrjcPvmvn7k1SrVFtCIILioihtGpR2Dpp26MFjfffAnLhiDAgMBAAE=

1 Rows. -- 1 msec.
```

</div>

</div>

  

</div>

</div>
