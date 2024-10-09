<div>

<div>

</div>

<div>

## Name

soap_make_error — Creates a SOAP error reply XML message based on its
parameters.

</div>

<div>

## Synopsis

<div>

|                                     |                               |
|-------------------------------------|-------------------------------|
| `varchar `**`soap_make_error`**` (` | in `soap_code ` varchar ,     |
|                                     | in `sql_state ` varchar ,     |
|                                     | in `error_message ` varchar , |
|                                     | in `soap_version ` integer ,  |
|                                     | in `do_uddi ` integer `)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function creates a SOAP error reply based on the given parameters.
It returns the generated XML as a varchar value.

</div>

<div>

## Parameters

<div>

### soap_code

Required. The fault code according to the SOAP specification.

</div>

<div>

### sql_state

Required. The error's SQL state.

</div>

<div>

### error_message

Required. The error text.

</div>

<div>

### soap_version

Optional (default 11). The SOAP version used to encode the SOAP error
reply.

</div>

<div>

### do_uddi

Optional (default 0). 1 = produce UDDI error format; 0 = SOAP error
format.

</div>

</div>

<div>

## Return Types

Returns generated XML as a varchar.

</div>

</div>
