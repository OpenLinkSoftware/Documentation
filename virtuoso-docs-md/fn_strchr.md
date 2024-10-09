<div>

<div>

</div>

<div>

## Name

strchr — strchr returns a zero-based index to the first occurrence of
the character.

</div>

<div>

## Synopsis

<div>

|                     |                                |
|---------------------|--------------------------------|
| ` `**`strchr`**` (` | `str ` string ,                |
|                     | `char ` string or integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

strchr returns a zero-based index to the first occurrence of char. If
char is not found NULL is returned. char can be given either as an
integer ASCII value or a string, in which case the first character of
that string is searched fo.

``` screen
strchr('AbracadabrA','A')
         ->  0 (Found as the first character).
strrchr('AbracadabrA',65)
         -> 10 (Found as the eleventh character)
```

</div>

</div>
