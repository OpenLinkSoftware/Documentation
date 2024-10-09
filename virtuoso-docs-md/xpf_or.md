<div>

<div>

</div>

<div>

## Name

or — Returns true if a value of some argument is true, otherwise returns
false.

</div>

<div>

## Synopsis

<div>

|                        |                      |
|------------------------|----------------------|
| `boolean `**`or`**` (` | `val1 ` boolean ,    |
|                        | `val2 ` boolean ,    |
|                        | `... ` ,             |
|                        | `valN ` boolean `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function calculates values of its arguments, from left to right. If
the value of calculated parameter is true, the function returns true
immediately, without calculating of the remaining parameters. If the
list of arguments ends without any true value calculated, the function
returns false (Thus it returns true when called without arguments).

The name of this function is the same as name of "or" XPATH and XQUERY
operator. Thus it must be surrounded by double quotes when used in XPATH
or XQUERY expressions. Moreover, this function is not a part of XPATH
standard, so it cannot be used if portability is important.

</div>

<div>

## Parameters

<div>

### valI

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

**Example 24.608. Control over sequence of search operations**

<div>

If two conditions must be checked, where one is simple and another is
hard to calculate, then "and" may be used to calculate second condition
only if first is false, to reduce average time of processing

``` screen
"or" ( empty(authors),
  document(concat('http://www.lib20.org/findxml.cgi?isbn=',@isbn))/status[@outofprint='YES'] )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_not.html" class="link" title="not">not</a>
<a href="xpf_and.html" class="link" title="and">and</a>
<a href="xpf_some.html" class="link" title="some">some</a>

</div>

</div>
