<div>

<div>

<div>

<div>

## 9.15. DROP XML SCHEMA Statement

</div>

</div>

</div>

``` programlisting
<xml schema removal> ::=
    DROP XML SCHEMA <target URI>
```

This reverts the effect of <a href="createxmlschema.html" class="link"
title="9.14. CREATE XML SCHEMA Statement">CREATE XML SCHEMA</a> .

The \<target URI\> should be a string constant that is equal to the
value of "targetNamespace" attribute of "xs:schema" element of a
previously declared XML schema.

The statement signals an error if the XMLSchema to be dropped is used in
some WITH SCHEMA constraint.

</div>
