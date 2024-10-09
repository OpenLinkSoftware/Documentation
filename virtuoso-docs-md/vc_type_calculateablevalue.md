<div>

<div>

</div>

<div>

## Name

CalculateableValue — The type of attribute that contains an expression
to be calculated at run time.

</div>

<div>

## Description

The type of a string constant or an expression. If the value of this
type is started with '--', the rest of string is the text of an
expression to be calculated in order to get the effective value of the
property. If the value of this type is not started with '--', the
effective value is the original string itself.

The type identifier 'CalculateableValue' is introduced only for
diagnostic purposes, you will never use it in VSPX code. When Virtuoso
server tries to compile an invalid VSPX page, you might see a diagnostic
messages like 'the value of attribute X of a control Y does not match
pattern ... for type CalculateableValue'. If you see this then you
should check the syntax of the value of the specified attribute.

</div>

</div>
