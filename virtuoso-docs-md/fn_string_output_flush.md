<div id="fn_string_output_flush" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

string_output_flush — resets the state of the string_output object

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_string_output_flush" class="funcsynopsis">

|                                  |                          |
|----------------------------------|--------------------------|
| ` `**`string_output_flush`**` (` | inout `stream ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_34" class="refsect1">

## Description

This function resets the state of the string output object. The string
associated with the string output is dropped and is of 0 characters
after this call.

</div>

<div id="params_08" class="refsect1">

## Parameters

<div id="id112375" class="refsect2">

### stream

stream to clear, must have been created by the string_output function.

</div>

</div>

<div id="examples_09" class="refsect1">

## Examples

<div id="ex_string_output_flush" class="example">

**Example 24.408. Flush the String Output Stream**

<div class="example-contents">

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
