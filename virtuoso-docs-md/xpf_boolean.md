<div>

<div>

</div>

<div>

## Name

boolean — Converts its argument to boolean

</div>

<div>

## Synopsis

<div>

|                             |                 |
|-----------------------------|-----------------|
| `boolean `**`boolean`**` (` | `obj ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function converts its argument to a boolean as follows:

<div>

- A number is true if and only if it is neither zero nor NaN.

- A node-set is true if and only if it is non-empty.

- A string is true if and only if its length is non-zero.

- An object of a type other than the four basic types is converted to a
  boolean in a way that is dependent on that type.

</div>

</div>

<div>

## Parameters

<div>

### obj

The object to be converted into boolean.

</div>

</div>

<div>

## Return Types

Boolean

</div>

<div>

## Examples

<div>

**Example 24.566. **

<div>

The following expressions are true:

``` screen
boolean('aaa') = true()
boolean('false') = true()
boolean(false()) = false()
boolean(.) = true()
boolean('0') = true()
boolean(0) = false()
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_number.html" class="link" title="number">number()</a>

</div>

</div>
