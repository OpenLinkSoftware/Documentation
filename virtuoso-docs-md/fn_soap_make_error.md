<div id="fn_soap_make_error" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

soap_make_error — Creates a SOAP error reply XML message based on its
parameters.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_soap_make_error" class="funcsynopsis">

|                                     |                               |
|-------------------------------------|-------------------------------|
| `varchar `**`soap_make_error`**` (` | in `soap_code ` varchar ,     |
|                                     | in `sql_state ` varchar ,     |
|                                     | in `error_message ` varchar , |
|                                     | in `soap_version ` integer ,  |
|                                     | in `do_uddi ` integer `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_make_error" class="refsect1">

## Description

This function creates a SOAP error reply based on the given parameters.
It returns the generated XML as a varchar value.

</div>

<div id="params_make_error" class="refsect1">

## Parameters

<div id="id110739" class="refsect2">

### soap_code

Required. The fault code according to the SOAP specification.

</div>

<div id="id110742" class="refsect2">

### sql_state

Required. The error's SQL state.

</div>

<div id="id110745" class="refsect2">

### error_message

Required. The error text.

</div>

<div id="id110748" class="refsect2">

### soap_version

Optional (default 11). The SOAP version used to encode the SOAP error
reply.

</div>

<div id="id110751" class="refsect2">

### do_uddi

Optional (default 0). 1 = produce UDDI error format; 0 = SOAP error
format.

</div>

</div>

<div id="ret_make_error" class="refsect1">

## Return Types

Returns generated XML as a varchar.

</div>

</div>
