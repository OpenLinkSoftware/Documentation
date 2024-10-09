<div>

<div>

</div>

<div>

## Name

isfloat — returns true if its argument is a float

</div>

<div>

## Synopsis

<div>

|                      |                      |
|----------------------|----------------------|
| ` `**`isfloat`**` (` | `arg ` anything `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`isfloat ` returns one if its argument is of type single float, zero
otherwise.

``` screen
isfloat(0.0)        -> 0 (No it is not, because decimal
                literals are by default
                converted to double precision
                numbers)
isfloat(atof('0.0'))    -> 1 (Only with explicit atof we get
                a single float)
```

</div>

</div>
