<div>

<div>

</div>

<div>

## Name

create-attribute — Creates a special "attribute descriptor" object.

</div>

<div>

## Synopsis

<div>

|                                        |                          |
|----------------------------------------|--------------------------|
| `attribute `**`create-attribute`**` (` | `attrname ` string ,     |
|                                        | `attrvalue ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### attrname

Name of attribute which should be created or changed

</div>

<div>

### attrvalue

Value of of attribute

</div>

</div>

<div>

## Return Types

Attribute descriptor

</div>

<div>

## See Also

<a href="xpf_create_comment.html" class="link"
title="create-comment">create-comment()</a>

<a href="xpf_create_element.html" class="link"
title="create-element">create-element()</a>

<a href="xpf_create_pi.html" class="link"
title="create-pi">create-pi()</a>

</div>

</div>
