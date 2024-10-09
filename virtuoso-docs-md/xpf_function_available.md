<div>

<div>

</div>

<div>

## Name

function-available — Returns true if XPATH extension function with the
requested name is defined in the XPATH Processor, otherwise returns
false.

</div>

<div>

## Synopsis

<div>

|                                        |                        |
|----------------------------------------|------------------------|
| `boolean `**`function-available`**` (` | `funname ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns true if XPATH Processor can execute XPATH extension
function with the name specified by *`funname`* argument. If such
function is not defined, function-available returns false.

</div>

<div>

## Parameters

<div>

### funname

The name of XPATH extension function

</div>

</div>

<div>

## Return Types

Boolean

</div>

<div>

## Examples

<div>

**Example 24.590. **

<div>

This expression should return false.

``` screen
function-available('http://example.com/Virtuoso/nosuchfunction')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xpf_extension.html" class="link"
title="xpf_extension">xpf_extension()</a>

</div>

</div>
