<div>

<div>

</div>

<div>

## Name

lt , lte , gt , gte , equ , neq — comparison functions

</div>

<div>

## Synopsis

<div>

|                 |                     |
|-----------------|---------------------|
| ` `**`lt`**` (` | in `arg1 ` any ,    |
|                 | in `arg2 ` any `)`; |

<div>

 

</div>

</div>

<div>

|                  |                     |
|------------------|---------------------|
| ` `**`lte`**` (` | in `arg1 ` any ,    |
|                  | in `arg2 ` any `)`; |

<div>

 

</div>

</div>

<div>

|                 |                     |
|-----------------|---------------------|
| ` `**`gt`**` (` | in `arg1 ` any ,    |
|                 | in `arg2 ` any `)`; |

<div>

 

</div>

</div>

<div>

|                  |                     |
|------------------|---------------------|
| ` `**`gte`**` (` | in `arg1 ` any ,    |
|                  | in `arg2 ` any `)`; |

<div>

 

</div>

</div>

<div>

|                  |                  |
|------------------|------------------|
| ` `**`equ`**` (` | `arg1 ` any ,    |
|                  | `arg2 ` any `)`; |

<div>

 

</div>

</div>

<div>

|                  |                     |
|------------------|---------------------|
| ` `**`neq`**` (` | in `arg1 ` any ,    |
|                  | in `arg2 ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

These functions return 1 if their first argument is less than (lt), less
than or equivalent (lte), greater than (gt), greater than or equivalent
(gte), equivalent (equ), or not equivalent (neq) to the second argument,
respectively. If the arguments are not of the same type, then an
appropriate type coercion is done for them before comparison.

These functions correspond to SQL query operators \<, \<=, \>, \>=, =
and \<\> and are needed because the SQL syntax does not allow these
operators to be used on the left side of `FROM` keyword in a `SELECT`
statement.

</div>

<div>

## Parameters

<div>

### *`arg1 `* , *`arg2 `*

<span class="type">integer </span> , <span class="type">float </span> ,
<span class="type">double precision </span> , <span class="type">varchar
</span> or <span class="type">NULL </span> .

</div>

</div>

<div>

## Return Values

An <span class="type">integer </span> value of 1 or 0 is returned.

</div>

<div>

## Examples

<div>

**Example 24.101. Simple Example**

<div>

``` screen
lt('pata','pato')  -> 1 (Yes, 'pata' is less than 'pato')
gt('barbar','bar')  -> 1 (Yes, 'barbar' is greater than 'bar')
equ(17,17)    -> 1 (seventeen is seventeen)
equ(17,17.0)    -> 1 (regardless of number format)
equ(atof('17.0'),17.0))  -> 1 (as it seems be)
equ(atof('17.1'),17.1))  -> 0 (But not always! Beware!)
gte(1234,NULL)    -> 0 (No, 1234 is not "greater"
        than or equal to NULL)
lt(1234,NULL)    -> 1 (Instead, it is "less" than NULL)
```

</div>

</div>

  

</div>

</div>
