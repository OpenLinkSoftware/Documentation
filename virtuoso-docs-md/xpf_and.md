<div>

<div>

</div>

<div>

## Name

and — Returns false if a value of some argument is false, otherwise
returns true.

</div>

<div>

## Synopsis

<div>

|                         |                      |
|-------------------------|----------------------|
| `boolean `**`and`**` (` | `val1 ` boolean ,    |
|                         | `val2 ` boolean ,    |
|                         | `... ` ,             |
|                         | `valN ` boolean `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calculates the values of its arguments from left to right.
If the value of the calculated parameter is false, the function returns
false immediately, without calculating the remaining parameters. If the
list of arguments ends without any false value calculated, the function
returns true (thus it will return true if called without arguments).

The name of this function is the same as the name of "and" XPATH and
XQUERY operator. Thus it must be surrounded by double quotes when used
in XPATH or XQUERY expressions. Moreover, this function is not a part of
XPATH standard, so it cannot be used if portability is important.

</div>

<div>

## Parameters

<div>

### vali

Value of boolean expression argument

</div>

</div>

<div>

## Return Types

boolean

</div>

<div>

## Examples

<div>

**Example 24.562. Control over sequence of search operations**

<div>

If two conditions must be checked, where one is simple and another is
hard to calculate, then "and" may be used to calculate second condition
only if first is true, to reduce average time of processing

``` screen
"and" ( authors,
  document(concat('http://www.lib20.org/findxml.cgi?isbn=',@isbn))/status[@outofprint='NO'] )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_not.html" class="link" title="not">not</a>
<a href="xpf_or.html" class="link" title="or">or</a>
<a href="xpf_every.html" class="link" title="every">every</a>

</div>

</div>
