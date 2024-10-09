<div>

<div>

</div>

<div>

## Name

internal_type_name , dv_type_title — returns the internal type name of
the argument

</div>

<div>

## Synopsis

<div>

|                                 |                               |
|---------------------------------|-------------------------------|
| ` `**`internal_type_name`**` (` | `internal_type ` integer `)`; |

<div>

 

</div>

</div>

<div>

|                            |                               |
|----------------------------|-------------------------------|
| ` `**`dv_type_title`**` (` | `internal_type ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

internal_type_name returns a string which is a human-readable name for
an internal_type integer given as its argument. The function
`dv_type_title()` is an alias of `internal_type_name()` .

``` screen
internal_type_name (internal_type ('kumikala'))
        -> 'SHORT_STRING'
select internal_type_name(COL_DTP) from SYS_COLS;
```

</div>

</div>
