<div id="xpf_unordered" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

unordered — Returns the given sequence in any order.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_unordered" class="funcsynopsis">

|                                |                        |
|--------------------------------|------------------------|
| `sequence `**`unordered`**` (` | `input ` sequence `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_unordered" class="refsect1">

## Description

The function takes a sequence, or more typically an expression that
evaluates to a sequence, and indicates that the result sequence may be
returned in any order.

</div>

<div id="xpf_params_unordered" class="refsect1">

## Parameters

<div id="id129730" class="refsect2">

### input

The sequence of nodes

</div>

</div>

<div id="xpf_ret_unordered" class="refsect1">

## Return Types

Sequence

</div>

<div id="xpf_examples_unordered" class="refsect1">

## Examples

<div id="xpf_ex_unordered" class="example">

**Example 24.636. Finding pairs of books**

<div class="example-contents">

The following example is from the XQuery standard and it illustrates how
to find pairs of books that have different titles but the same set of
authors (possibly in a different order).

``` screen
<bib>
{
   for $book1 in document("bib.xml")/bib/book,
       $book2 in document("bib.xml")/bib/book
   where $book1/title > $book2/title
   and $book1/author = $book2/author
   return
      <book-pair>
         { $book1/title, $book2/title }
      </book-pair>
}
</bib>
```

</div>

</div>

  

</div>

</div>
