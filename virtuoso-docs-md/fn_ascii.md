<div>

<div>

</div>

<div>

## Name

ascii — Get ASCII value of a character

</div>

<div>

## Synopsis

<div>

|                           |                 |
|---------------------------|-----------------|
| `integer `**`ascii`**` (` | `arg ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`ascii ` returns the ASCII value of the first character of a string. If
an empty string is given, then zero is returned.

</div>

<div>

## Parameters

<div>

### *`arg `*

A <span class="type">string </span>

</div>

</div>

<div>

## Return Values

The <span class="type">integer </span> ASCII value of the first
character of the input string is returned. If the input string is empty,
then zero is returned

</div>

<div>

## Errors

<div>

**Table 24.3. Errors signalled by ascii**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                      | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR044 </span> | <span class="errortext">Function ascii needs a string as an argument, not an argument of type %d (= %s) </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.14. Simple example**

<div>

``` screen
SQL> select ascii('Zardoz');
callret
INTEGER
_______________________________________________________________________________

90

1 Rows. -- 14 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref </code></a> ,
<a href="fn_chr.html" class="link" title="chr"><code
class="function">chr</code></a>

</div>

</div>
