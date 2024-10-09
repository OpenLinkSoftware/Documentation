<div>

<div>

</div>

<div>

## Name

number — Converts its argument to a number.

</div>

<div>

## Synopsis

<div>

|                           |                 |
|---------------------------|-----------------|
| `number `**`number`**` (` | `obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The number function converts its argument to a number as follows:

<div>

- A string that consists of decimal number and optional whitespaces is
  converted to the number recorded. Any other string is converted to NaN
  ("not-a-number" value). More precisely, a string that consists of
  optional whitespace followed by an optional plus or minus sign
  followed by a Number followed by whitespace is converted to the IEEE
  754 number that is nearest (according to the IEEE 754 round-to-nearest
  rule) to the mathematical value represented by the string. Note that
  it differs from XPATH 1.0 standard where plus sign is not allowed
  before Number part of the string.

- Boolean true is converted to 1; boolean false is converted to 0.

- A node-set is first converted to a string as if by a call to the
  string function and then converted in the same way as a string
  argument.

- An object of a type other than the four basic types is converted to a
  number in a way that is dependent on that type.

</div>

If the argument is omitted, it defaults to a node-set with the context
node as its only member.

</div>

<div>

## Parameters

<div>

### obj

Value to be converted to a number.

</div>

</div>

<div>

## Return Types

Number

</div>

<div>

## Examples

<div>

**Example 24.607. **

<div>

``` screen
number(' 3.1415926 ')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_boolean.html" class="link" title="boolean">boolean()</a>

</div>

</div>
