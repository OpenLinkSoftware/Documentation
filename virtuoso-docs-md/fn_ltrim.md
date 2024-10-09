<div>

<div>

</div>

<div>

## Name

ltrim — removes specific characters from a string

</div>

<div>

## Synopsis

<div>

|                    |                          |
|--------------------|--------------------------|
| ` `**`ltrim`**` (` | `str ` string ,          |
|                    | `trimchars ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

ltrim returns a copy of subsequence of string str with all the
characters present in trimchars trimmed off from the beginning. If the
second argument is omitted, it is a space ' ' by default.

rtrim is similar except that it trims from the right.

trim trims from both ends.

``` screen
concat('*',trim('   SIMURG   '),'*') -> '*SIMURG*'
ltrim('AbracadabrA','bAr')  -> 'acadabrA'
rtrim('AbracadabrA','bAr')  -> 'Abracada'
trim('AbracadabrA','bAr')    -> 'acada'
```

</div>

</div>
