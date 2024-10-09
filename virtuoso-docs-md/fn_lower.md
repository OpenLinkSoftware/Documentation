<div>

<div>

</div>

<div>

## Name

lower — returns a lower case version of its argument

</div>

<div>

## Synopsis

<div>

|                    |                    |
|--------------------|--------------------|
| ` `**`lower`**` (` | `str ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

lcase returns a copy of string str with all the uppercase alphabetical
characters converted to corresponding lowercase letters. This includes
also the diacritic letters present in the ISO 8859/1 standard in range
192 - 222 decimal, excluding the character 223, German double-s which
stays the same.

lower is just an alias for lcase.

``` screen
lcase('AbracadabrA')  -> 'abracadabra'
```

</div>

</div>
