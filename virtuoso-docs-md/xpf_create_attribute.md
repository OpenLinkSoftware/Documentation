<div id="xpf_create_attribute" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

create-attribute — Creates a special "attribute descriptor" object.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_create_attribute" class="funcsynopsis">

|                                        |                          |
|----------------------------------------|--------------------------|
| `attribute `**`create-attribute`**` (` | `attrname ` string ,     |
|                                        | `attrvalue ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_create_attribute" class="refsect1">

## Description

This is an internal XQUERY function and you will probably never need to
call it explicitly. It is not a part of library of standard XQUERY 1.0
functions.

This function creates an special object, called "attribute descriptor",
which may be used only as argument of create-element() XQUERY function.
Every attribute descriptor will force create-element() function to add
an attribute with specified name and value into opening tag of the
created element. If attribute with such name already exists, its value
will be replaced.

</div>

<div id="xpf_params_create_attribute" class="refsect1">

## Parameters

<div id="id126466" class="refsect2">

### attrname

Name of attribute which should be created or changed

</div>

<div id="id126469" class="refsect2">

### attrvalue

Value of of attribute

</div>

</div>

<div id="xpf_ret_create_attribute" class="refsect1">

## Return Types

Attribute descriptor

</div>

<div id="xpf_seealso_create_attribute" class="refsect1">

## See Also

<a href="xpf_create_comment.html" class="link"
title="create-comment">create-comment()</a>

<a href="xpf_create_element.html" class="link"
title="create-element">create-element()</a>

<a href="xpf_create_pi.html" class="link"
title="create-pi">create-pi()</a>

</div>

</div>
