<div>

<div>

</div>

<div>

## Name

string_output_flush — resets the state of the string_output object

</div>

<div>

## Synopsis

<div>

|                                  |                          |
|----------------------------------|--------------------------|
| ` `**`string_output_flush`**` (` | inout `stream ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function resets the state of the string output object. The string
associated with the string output is dropped and is of 0 characters
after this call.

</div>

<div>

## Parameters

<div>

### stream

stream to clear, must have been created by the string_output function.

</div>

</div>

<div>

## Examples

<div>

**Example 24.408. Flush the String Output Stream**

<div>

``` programlisting
  <?vsp
    declare ses nay;
    ses := string_output ();
    http ('this text never be displayed' , ses);
    string_output_flush (ses);
    http ('stream test' , ses);
    http (string_output_string (ses));
  ?>
  
```

</div>

</div>

  

</div>

</div>
