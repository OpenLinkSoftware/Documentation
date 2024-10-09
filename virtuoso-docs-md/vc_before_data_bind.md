<div>

<div>

</div>

<div>

## Name

before-data-bind — Container for code that should be executed before
data bind.

</div>

<div>

## Synopsis

<div>

|                                                                           |      |
|---------------------------------------------------------------------------|------|
| ` <`**`before-data-bind`**` >(EventHandler)</`**`before-data-bind`**` >(` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The code contained in this element is executed before the default data
bind processing on the descending edge of recursion. The context has
self as the page, control as the control with this handler, event as the
vspx_event which caused the page invocation. A return value from the
code if equal to 1 (one) will stop further data-bind processing of the
containing control and it's children if any.

</div>

</div>
