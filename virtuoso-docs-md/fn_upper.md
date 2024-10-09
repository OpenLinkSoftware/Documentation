<div>

<div>

</div>

<div>

## Name

upper — returns upper case version of string argument

</div>

<div>

## Synopsis

<div>

|                    |                    |
|--------------------|--------------------|
| ` `**`upper`**` (` | `str ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`ucase ` returns a copy of string str with all the lowercase
alphabetical characters converted to corresponding uppercase letters.
This includes also the diacritic letters present in the ISO 8859/1
standard in range 224 - 254 decimal, excluding the character 255, y
diaeresis, which is not converted to a German double-s.

upper is just an alias for ucase.

``` screen
ucase('AbracadabrA')  -> 'ABRACADABRA'
```

</div>

</div>
