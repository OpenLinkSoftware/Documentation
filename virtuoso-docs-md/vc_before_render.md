<div>

<div>

</div>

<div>

## Name

before-render — Container for code that should be executed before
rendering.

</div>

<div>

## Synopsis

<div>

|                                                                     |      |
|---------------------------------------------------------------------|------|
| ` <`**`before-render`**` >(EventHandler)</`**`before-render`**` >(` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The code contained in this element is executed on the descending edge of
recursion when traversing the vspx control tree before rendering. This
is expected to have side effects on vspx controls only, not to return
anything or emit any output. Any return value from the code is ignored.

</div>

</div>
