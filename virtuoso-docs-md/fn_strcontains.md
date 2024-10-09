<div>

<div>

</div>

<div>

## Name

strcontains — Performs substring search

</div>

<div>

## Synopsis

<div>

|                          |                       |
|--------------------------|-----------------------|
| ` `**`strcontains`**` (` | in `str ` string ,    |
|                          | in `sub ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`strcontains ` performs a substring search, returning 1 or 0.

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

**Example 24.415. Simple example**

<div>

``` programlisting
SQL> select strcontains('AbracadabrA','abrA');
strcontains
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 0 msec.

SQL> select strcontains('AbracadabrA','XZ');
strcontains
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 0 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_strcasestr.html" class="link" title="strcasestr"><code
class="function">strcasestr </code></a> .

<a href="fn_starts_with.html" class="link" title="starts_with"><code
class="function">starts_with </code></a> .

<a href="fn_ends_with.html" class="link" title="ends_with"><code
class="function">end_with </code></a> .

</div>

</div>
