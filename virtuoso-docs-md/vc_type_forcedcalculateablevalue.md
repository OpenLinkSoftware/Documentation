<div>

<div>

</div>

<div>

## Name

ForcedCalculateableValue — The type of attribute that contains an
expression to be calculated at run time.

</div>

<div>

## Description

The type of an expression. The value of this type must be started with
'--', the rest of string is the text of an expression to be calculated
in order to get the effective value of the property.

The type identifier 'ForcedCalculateableValue' is introduced only for
diagnostic purposes, you will never use it in VSPX code. When Virtuoso
server tries to compile an invalid VSPX page, you might see a diagnostic
messages like 'the value of attribute X of a control Y does not match
pattern ... for type ForcedCalculateableValue'. If you see this then you
should check the syntax of the value of the specified attribute.

</div>

</div>
