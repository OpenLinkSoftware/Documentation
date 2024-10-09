<div>

<div>

</div>

<div>

## Name

create-pi — Creates a "processing instruction" XML tree entity.

</div>

<div>

## Synopsis

<div>

|                              |                        |
|------------------------------|------------------------|
| `entity `**`create-pi`**` (` | `piname ` string ,     |
|                              | `pivalue ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is an internal XQUERY function and you will probably never need to
call it explicitly. It is not a part of library of standard XQUERY 1.0
functions.

This function creates an XML entity of sort "processing instruction". If
*`pivalue`* is an empty string, the resulting processing instruction
will have no value at all, exactly as if the *`pivalue`* is not passed
at all.

</div>

<div>

## Parameters

<div>

### piname

Name of processing instruction that should be created

</div>

<div>

### pivalue

String data stored in processing instruction

</div>

</div>

<div>

## Return Types

XML tree entity of type "processing instruction"

</div>

<div>

## See Also

<a href="xpf_create_attribute.html" class="link"
title="create-attribute">create-attribute()</a>

<a href="xpf_create_comment.html" class="link"
title="create-comment">create-comment()</a>

<a href="xpf_create_element.html" class="link"
title="create-element">create-element()</a>

</div>

</div>
