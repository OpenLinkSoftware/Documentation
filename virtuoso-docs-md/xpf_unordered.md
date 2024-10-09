<div>

<div>

</div>

<div>

## Name

unordered — Returns the given sequence in any order.

</div>

<div>

## Synopsis

<div>

|                                |                        |
|--------------------------------|------------------------|
| `sequence `**`unordered`**` (` | `input ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function takes a sequence, or more typically an expression that
evaluates to a sequence, and indicates that the result sequence may be
returned in any order.

</div>

<div>

## Parameters

<div>

### input

The sequence of nodes

</div>

</div>

<div>

## Return Types

Sequence

</div>

<div>

## Examples

<div>

**Example 24.636. Finding pairs of books**

<div>

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
