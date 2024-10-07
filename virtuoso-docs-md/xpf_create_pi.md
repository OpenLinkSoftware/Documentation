<div id="xpf_create_pi" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

create-pi — Creates a "processing instruction" XML tree entity.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_create_pi" class="funcsynopsis">

|                              |                        |
|------------------------------|------------------------|
| `entity `**`create-pi`**` (` | `piname ` string ,     |
|                              | `pivalue ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_create_pi" class="refsect1">

## Description

This is an internal XQUERY function and you will probably never need to
call it explicitly. It is not a part of library of standard XQUERY 1.0
functions.

This function creates an XML entity of sort "processing instruction". If
*`pivalue`* is an empty string, the resulting processing instruction
will have no value at all, exactly as if the *`pivalue`* is not passed
at all.

</div>

<div id="xpf_params_create_pi" class="refsect1">

## Parameters

<div id="id126706" class="refsect2">

### piname

Name of processing instruction that should be created

</div>

<div id="id126709" class="refsect2">

### pivalue

String data stored in processing instruction

</div>

</div>

<div id="xpf_ret_create_pi" class="refsect1">

## Return Types

XML tree entity of type "processing instruction"

</div>

<div id="xpf_seealso_create_pi" class="refsect1">

## See Also

<a href="xpf_create_attribute.html" class="link"
title="create-attribute">create-attribute()</a>

<a href="xpf_create_comment.html" class="link"
title="create-comment">create-comment()</a>

<a href="xpf_create_element.html" class="link"
title="create-element">create-element()</a>

</div>

</div>
