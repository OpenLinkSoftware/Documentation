<div>

<div>

</div>

<div>

## Name

after-data-bind — Container for code that should be executed after data
bind.

</div>

<div>

## Synopsis

<div>

|                                                                         |      |
|-------------------------------------------------------------------------|------|
| ` <`**`after-data-bind`**` >(EventHandler)</`**`after-data-bind`**` >(` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The code contained in this element is executed after the default data
bind processing on the returning edge of recursion. The context has self
as the page, control as the control with this handler, event as the
vspx_event which caused the page invocation. Any return value from the
code is ignored.

</div>

</div>
