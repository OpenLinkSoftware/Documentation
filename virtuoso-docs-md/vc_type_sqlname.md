<div>

<div>

</div>

<div>

## Name

SqlName — The type of attribute that contains a name of the Virtuoso/PL
UDT instance that should be created for the control.

</div>

<div>

## Description

The type for a Virtuoso/PL name that should be used during code
generation. KNOWN BUG: If double quotes are used in the value of this
type then the generated code may be incorrect. This is why this schema
restrictes the syntax of values of such type.

The type identifier 'SqlName' is introduced only for diagnostic
purposes, you will never use it in VSPX code. When Virtuoso server tries
to compile an invalid VSPX page, you might see a diagnostic messages
like 'the value of attribute X of a control Y does not match pattern ...
for type SqlName'. If you see this then you should check the syntax of
the value of the specified attribute.

</div>

</div>
