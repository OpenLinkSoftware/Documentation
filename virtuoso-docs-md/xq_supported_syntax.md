<div>

<div>

<div>

<div>

### 15.8.2. Details of XQuery Syntax

</div>

</div>

</div>

Virtuoso XQuery uses some syntax extensions. Most visible is an
additional notation for qualified names as described above (name is
surrounded by "(!...!)" delimiters. An earlier implementation allowed
single-line comments started with "#" or "--" continuing to the end of
line, this syntax is now obsolete.

The "default namespace declaration" clause is not currently supported,
to make the text of XQuery unambiguous. If used, default namespaces must
extend element names but not attribute names. Extension function names
must be extended as they have non-default namespace prefixes but the
names of basic functions should not be extended by the default
namespace. Finally, Virtuoso will not preserve any information about
used namespace prefixes, so default namespaces will be converted into
non-default when the resulting XML entity is printed.

</div>
