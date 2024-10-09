<div>

<div>

</div>

<div>

## Name

xenc_key_serialize — Extracts a key from user's repository

</div>

<div>

## Synopsis

<div>

|                                        |                       |
|----------------------------------------|-----------------------|
| `varchar `**`xenc_key_serialize`**` (` | in `name ` varchar ,  |
|                                        | in `public ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns a string containing base64 encoded binary key data.
It is used to extract symmetric or asymmetric keys. So if key is
asymmetric (RSA or DSA) the second parameter designate which part to
extract private or public.

</div>

<div>

## Parameters

<div>

### name

The key name.

</div>

<div>

### public

1 - export public part, 0 - export private key if exists.

</div>

</div>

<div>

## Return Types

The function returns serialized key material.

</div>

<div>

## Examples

<div>

**Example 24.476. Exporting a RSA public key.**

<div>

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
