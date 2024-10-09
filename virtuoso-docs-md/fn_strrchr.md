<div>

<div>

</div>

<div>

## Name

strrchr — returns a zero-based index to the last occurrence of the char
in str.

</div>

<div>

## Synopsis

<div>

|                      |                                |
|----------------------|--------------------------------|
| ` `**`strrchr`**` (` | `str ` string ,                |
|                      | `char ` string or integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

strchr returns a zero-based index to the last occurrence of char in
string. If char is not found NULL is returned. char can be given either
as an integer ASCII value or a string, in which case the first character
of that string is searched for in str.

``` screen
strchr('AbracadabrA','A')
         ->  0 (Found as the first character).
strrchr('AbracadabrA',65)
         -> 10 (Found as the eleventh character)
```

</div>

</div>
