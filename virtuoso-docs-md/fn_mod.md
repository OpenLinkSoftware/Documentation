<div>

<div>

</div>

<div>

## Name

mod — returns the modulus of its arguments

</div>

<div>

## Synopsis

<div>

|                  |                         |
|------------------|-------------------------|
| ` `**`mod`**` (` | `dividend ` integer ,   |
|                  | `divisor ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

mod returns the modulus (i.e. remainder) of the division
dividend/divisor. If the divisor is zero the SQL error 22012 "Division
by zero" is generated.

``` screen
mod(35,3)           -> 2
mod(35,-3)          -> 2
mod(-35,3)          -> -2
mod(-35,-3)         -> -2
mod(3,35)           -> 3
mod(0,7)            -> 0
mod(60,3)           -> 0
```

</div>

</div>
