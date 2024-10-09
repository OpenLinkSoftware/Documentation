<div>

<div>

</div>

<div>

## Name

iszero — returns true if argument is numeric zero

</div>

<div>

## Synopsis

<div>

|                     |                 |
|---------------------|-----------------|
| ` `**`iszero`**` (` | `arg ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

iszero returns one if its argument is an integer 0, a float 0.0 or a
double 0.0 For any other arguments, of whatever type, it will return
zero.

``` screen
iszero(0)       -> 1 (Yes it is)
iszero(0.0)     -> 1 (Double precision zero also
                is a zero)
iszero(atof('0.0')) -> 1 (As well as single
                precision floating point)
iszero(1)       -> 0 (No, it's not)
iszero('Cifra')     -> 0 (neither is this one)
iszero(NULL)        -> 0 (nor this one)
```

</div>

</div>
