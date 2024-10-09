<div>

<div>

</div>

<div>

## Name

on-post — Container for code that should be executed when the element
gets a post.

</div>

<div>

## Synopsis

<div>

|                                                         |      |
|---------------------------------------------------------|------|
| ` <`**`on-post`**` >(EventHandler)</`**`on-post`**` >(` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The code contained in this element is executed when the element gets a
post. For fields and forms, this is a context for an a SQL compound
statement that will be executed. The statement should end with a return
1 or 0. The implicit return is 0. A return of 1 means that the post is
fully handled here and not to be passed on to the parent chain. A 0
means that the post was not handled and the next control up the chain
will try.

The context has a self which is the page, a vspx_control which is the
control which defines this handler, and a origin_control, which is the
control that first got the post event. This will be a data field or
button. The vspx_event with the post's data will be in the variable
event.

The interpretation of the return value is the same for other event
handlers. SQL conditions signalled will go to the page, these condition
handlers are invoked in no special context, hence the declare handler
for SQL construct should not be used to pass control between handlers,
but only within handlers.

</div>

</div>
