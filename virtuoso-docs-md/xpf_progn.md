<div>

<div>

</div>

<div>

## Name

progn — Calculates all given expressions and returns the result produced
by the last one.

</div>

<div>

## Synopsis

<div>

|                       |                   |
|-----------------------|-------------------|
| `any `**`progn`**` (` | `expn1 ` any ,    |
|                       | `expn2 ` any ,    |
|                       | ... ,             |
|                       | `expnN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calculates its first argument, then second argument and so
on. The results of these calculations are not used, except the result of
the last expression which is returned. The only useful application for
this function is calling XPath extension functions for side effects.

This function is not a part of library of standard XQuery 1.0 functions.

</div>

<div>

## Parameters

<div>

### expn1, expn2, ... expnN

Expressions to be calculated.

</div>

</div>

<div>

## Return Types

Any (according to the type of *`expnN `* )

</div>

<div>

## Examples

<div>

**Example 24.614. **

<div>

``` screen
[xmlns:fileio='http://www.example.com/file-io']
if (function-available ('fileio:printf'),
  progn (
    fileio:open('greeting.txt', 'wt'),
    fileio:printf('Hello %s', /userinfo/name),
    fileio:close(),
    'File greeting.txt saved' ),
  'File greeting.txt not saved' ) )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_if.html" class="link" title="if">if</a>

<a href="xpf_for.html" class="link" title="for">for</a>

<a href="xpf_let.html" class="link" title="let">let</a>

</div>

</div>
