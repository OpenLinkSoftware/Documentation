<div id="fn_internal_type_name" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

internal_type_name , dv_type_title — returns the internal type name of
the argument

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_internal_type_name" class="funcsynopsis">

|                                 |                               |
|---------------------------------|-------------------------------|
| ` `**`internal_type_name`**` (` | `internal_type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_dv_type_title" class="funcsynopsis">

|                            |                               |
|----------------------------|-------------------------------|
| ` `**`dv_type_title`**` (` | `internal_type ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_02" class="refsect1">

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
