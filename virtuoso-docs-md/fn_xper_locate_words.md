<div id="fn_xper_locate_words" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xper_locate_words — returns a smallest fragment of persistent XML entity
object ('XPER entity') such that it contains some range of words in its
text

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xper_doc_01" class="funcsynopsis">

|                                |                                |
|--------------------------------|--------------------------------|
| ` `**`xper_locate_words`**` (` | in `entity ` any ,             |
|                                | in `starting_word ` integer ,  |
|                                | in `ending_word ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_77" class="refsect1">

## Description

This receives the XML entity and returns its fragment or signals an
error.

</div>

<div id="params_03_01" class="refsect1">

## Parameters

<div id="id124293" class="refsect2">

### entity

A 'persistent XML' entity to be searched

</div>

<div id="id124296" class="refsect2">

### starting_word

The number of the leftmost word which should be in the selected fragment

</div>

<div id="id124299" class="refsect2">

### ending_word

The number of the rightmost word which should be in the selected
fragment

</div>

</div>

</div>
