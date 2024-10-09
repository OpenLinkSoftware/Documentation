<div>

<div>

</div>

<div>

## Name

xper_locate_words — returns a smallest fragment of persistent XML entity
object ('XPER entity') such that it contains some range of words in its
text

</div>

<div>

## Synopsis

<div>

|                                |                                |
|--------------------------------|--------------------------------|
| ` `**`xper_locate_words`**` (` | in `entity ` any ,             |
|                                | in `starting_word ` integer ,  |
|                                | in `ending_word ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This receives the XML entity and returns its fragment or signals an
error.

</div>

<div>

## Parameters

<div>

### entity

A 'persistent XML' entity to be searched

</div>

<div>

### starting_word

The number of the leftmost word which should be in the selected fragment

</div>

<div>

### ending_word

The number of the rightmost word which should be in the selected
fragment

</div>

</div>

</div>
