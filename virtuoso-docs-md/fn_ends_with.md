<div>

<div>

</div>

<div>

## Name

ends_with — Checks whether string X ends with Y

</div>

<div>

## Synopsis

<div>

|                        |                       |
|------------------------|-----------------------|
| ` `**`ends_with`**` (` | in `str ` string ,    |
|                        | in `sub ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`ends_with ` checks whether string X ends with Y, ignoring occurencies
of Y in other places. Returns 1 or 0.

</div>

<div>

## Parameters

<div>

### str

String to search from.

</div>

<div>

### sub

Substring to search for.

</div>

</div>

<div>

## Return Types

1 if found, 0 if not found.

</div>

<div>

## Examples

<div>

**Example 24.417. Simple example**

<div>

``` programlisting
SQL> select ends_with('AbracadabrA','rA');
ends_with
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

<a href="fn_strcontains.html" class="link" title="strcontains"><code
class="function">strcontains </code></a> .

<a href="fn_starts_with.html" class="link" title="starts_with"><code
class="function">starts_with </code></a> .

</div>

</div>
