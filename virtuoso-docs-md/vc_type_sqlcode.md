<div id="vc_type_sqlcode" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

SqlCode — The type of a string value that is a Text of a Virtuoso/PL
procedure.

</div>

<div id="vc_desc_sqlcode" class="refsect1">

## Description

Text of an event handler or other Virtuoso/PL procedure. This is
expected to be a complete statement or sequence of statements, hence to
be terminated like a statement, unlike the 'calculatable value'
expression case.

The type identifier 'SqlCode' is introduced only for diagnostic
purposes, you will never use it in VSPX code. When Virtuoso server tries
to compile an invalid VSPX page, you might see a diagnostic messages
like 'the value of attribute X of a control Y does not match pattern ...
for type SqlCode'. If you see this then you should check the syntax of
the value of the specified attribute.

</div>

</div>
