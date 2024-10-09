<div>

<div>

</div>

<div>

## Name

string — Returns a string value of its argument.

</div>

<div>

## Synopsis

<div>

|                           |                 |
|---------------------------|-----------------|
| `string `**`string`**` (` | `obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The string() function converts an object to a string as follows:

<div>

- An empty sequence is converted to an empty string.

- A nonempty node-set is converted to a string by returning the
  string-value of the first node in the node-set. Note that the XPATH
  standard says that 'first' means 'first in document order' here, not
  'first value returned'. For almost all queries, there is no difference
  between these two orders; it may be important only for node-sets
  calculated by so-called reverse-order axis. Moreover, the rure of
  standard is senseless if node-set contains nodes from more than one
  document. That is why the standard is violated here, intentionally.

- A nonempty sequence which is not a node-set is converted to a string
  by returning the string-value of the first node in the sequence.

- A NaN number is converted to the string 'NaN'.

- Zero is converted to the string '0'.

- Positive infinity is converted to the string 'Infinity'

- Negative infinity is converted to the string '-Infinity'

- Integer number is represented in decimal form with no decimal point
  and no leading zeros, preceded by a minus sign '-' if the number is
  negative.

- Non-integer number is represented in decimal form including a decimal
  point with at least one digit before the decimal point and at least
  one digit after the decimal point, preceded by a minus sign '-' if the
  number is negative; there must be no leading zeros before the decimal
  point apart possibly from the one required digit immediately before
  the decimal point; beyond the one required digit after the decimal
  point there will be be as many, but only as many, more digits as are
  needed to uniquely distinguish the number from all other IEEE 754
  numeric values.

- The boolean false value is converted to the string 'false'. The
  boolean 'true' value is converted to the string 'true'.

- An object of a type other than the listed above is converted to a
  string in a way that is dependent on that type.

</div>

If the argument is omitted, context node is converted instead as if it
is a node-set of one element.

</div>

<div>

## Parameters

<div>

### obj

Value to be converted into the string

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Examples

<div>

**Example 24.621. Examples**

<div>

``` programlisting
SQL> select xpath_eval ('string (//*)', xtree_doc ('<a>abc</a>')) ;
xpath_eval
VARCHAR
abc

SQL> select xpath_eval ('string (//title)', xtree_doc ('<doc><title>Simple test</title></doc>')) ;
xpath_eval
VARCHAR
Simple test

SQL> select xpath_eval ('string(.) div 21', xtree_doc ('<a>100</a>'))
xpath_eval
VARCHAR
4.761904761904762
No. of rows in result: 1

SQL> select xpath_eval ('string(//title) div 21', xtree_doc ('<a>100</a>'))
xpath_eval
VARCHAR
 0
No. of rows in result: 1

SQL> select xpath_eval ('string(//a) div 20', xtree_doc ('<a>100</a>'))
Query result:
xpath_eval
VARCHAR
 5
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_format_number.html" class="link"
title="format-number">format_number()</a>

<a href="xpf_serialize.html" class="link"
title="serialize">serialize()</a>

<a href="xpf_urlify.html" class="link" title="urlify">urlify()</a>

<a href="xpf_concat.html" class="link" title="concat">concat()</a>

</div>

</div>
