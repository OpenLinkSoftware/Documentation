<div id="fn_fk_check_input_values" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

fk_check_input_values — alter default foreign key checking behavior

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_fk_check_input_values" class="funcsynopsis">

|                                           |                         |
|-------------------------------------------|-------------------------|
| `DB.DBA. `**`fk_check_input_values`**` (` | in `mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_fk_check_input_values" class="refsect1">

## Description

|                |
|----------------|
| mode = 1 - on  |
| mode = 0 - off |

Enforcing foreign key constraints is enabled by default. This function
allows globally disabling it without however disabling all triggers.
This may be useful for large data imports or other special
circumstances. The return value is the previous state of this setting, 0
for off, 1, for on. The effect of this function is persistent and
survives server restart.

</div>

</div>
