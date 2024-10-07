<div id="fn_randomize" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

randomize — initializes the random number generator

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_randomize" class="funcsynopsis">

|                        |                         |
|------------------------|-------------------------|
| ` `**`randomize`**` (` | in `seed ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_08" class="refsect1">

## Description

The rnd function returns a random number between zero and n - 1,
inclusive.

randomize initializes the random number generator.

The random number generator is initialized after the clock at first
usage, so the produced sequences will be different each time unless
specifically initialized.

</div>

</div>
