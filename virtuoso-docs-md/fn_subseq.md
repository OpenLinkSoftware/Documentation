<div>

<div>

</div>

<div>

## Name

subseq — returns substring of a string or sub-vector of a vector

</div>

<div>

## Synopsis

<div>

|                     |                            |
|---------------------|----------------------------|
| ` `**`subseq`**` (` | `str ` string or vector ,  |
|                     | `from ` integer ,          |
|                     | `to ` integer or NULL `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

subseq returns a copy of subsequence of string or vector str using
zero-based indices from (inclusive) and to (exclusive) to delimit the
substring or the vector extracted.

If to is omitted or is NULL, then it equals by default to the length of
str, i.e. everything from from to the end of str is returned.

If to and from are equal, an empty string ''(empty vector) is returned.

If from is greater than to or length of str an error is signalled.

If str is NULL then NULL is returned.

``` screen
subseq('AbracadabrA',0,4) -> 'Abra'
subseq('AbracadabrA',4,8) -> 'cada'
subseq('AbracadabrA',7)    -> 'abrA'
subseq(string,0,strchr(string,'/'))
subseq(vector (1, 2, 3), 2) -> vector (3)
subseq(vector (1, 2, 3), 0, 2) -> vector (1, 2)
```

The last one with string argument returns a copy of the string cut from
the first slash, leaving it and everything following out, and in the
case where there are no slashes present, returns a copy of the whole
string.

</div>

</div>
