<div>

<div>

<div>

<div>

### 16.5.9. Lookup Optimization -- BIJECTION and RETURNS Options

</div>

</div>

</div>

There is one subtle problem with IRI class declarations. To get benefit
from a relational index, SPARQL optimizer should compose equality
between table column and some known SQL value, not between return value
of IRI class and a known composed IRI. In addition, redundant
calculations of IRIs takes time. To enable this optimization, an IRI
class declaration should end with <span class="emphasis">*option
(bijection)*</span> clause. For some simple format strings the compiler
may recognize the bijection automatically but an explicit declaration is
always a good idea.

<div>

<table data-border="0" data-summary="Note: Note:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>See also: <a
href="http://en.wikipedia.org/wiki/One-to-one_correspondence"
class="ulink" target="_top">Wikipedia - Bijection</a> . In mathematics,
a bijection, or a bijective function is a function f from a set X to a
set Y such that, for every y in Y, there is exactly one x in X such that
f(x) = y.</p>
<p>Alternatively, f is bijective if it is a one-to-one correspondence
between those sets; i.e., both one-to-one (injective) and onto
(surjective).</p></td>
</tr>
</tbody>
</table>

</div>

The SPARQL compiler may produce big amounts of SQL code when the query
contains equality of two calculated IRIs and these IRIs may come from
many different IRI classes. It is possible to provide hints that will
let the compiler check if two IRI classes form disjoint sets of possible
IRI values. The more disjoint sets are found the less possible
combinations remain so the resulting SQL query will contain fewer unions
of joins. The SPARQL compiler can prove some properties of sprintf
format strings. E.g., it can prove that set of all strings printed by
"http://example.com/item%d" and the set of strings printed by
"http://example.com/item%d/" are disjoint. It can prove some more
complicated statements about unions and intersections of sets of
strings. The IRI or literal class declaration may contain
<span class="emphasis">*option (returns ...)*</span> clause that will
specify one or more sprintf patterns that cover the set of generated
values. Consider a better version of IRI class declaration listed above:

``` programlisting
create iri class oplsioc:grantee_iri using
  function DB.DBA.GRANTEE_URI (in id integer)
    returns varchar,
  function DB.DBA.GRANTEE_URI_INVERSE (in id_iri varchar)
    returns integer
  option ( bijection,
    returns "http://myhost/sys/group?id=%d"
    union   "http://myhost/sys/user?id=%d" ) .
```

It is very important to keep IRI classes easily distinguishable by the
text of IRI string and easy to parse.

<div>

- Format

  <span class="emphasis">*%U*</span>

  is better than

  <span class="emphasis">*%s*</span>

  , especially in the middle of IRI, because the

  <span class="emphasis">*%U*</span>

  fragment can not contain characters like "/" or "="; one may prove
  that

  <span class="emphasis">*/%U/*</span>

  and

  <span class="emphasis">*/abra%d/cadabra/*</span>

  are disjoint but

  <span class="emphasis">*/%s/*</span>

  and

  <span class="emphasis">*/abra%d/cadabra/*</span>

  are not disjoint.

- It is better when the variable part like

  <span class="emphasis">*%U*</span>

  or

  <span class="emphasis">*%d*</span>

  is placed between characters that may not occur in the

  <span class="emphasis">*%U*</span>

  or

  <span class="emphasis">*%d*</span>

  output, i.e.

  <span class="emphasis">*%U*</span>

  is placed between "/", "&" or "=" and

  <span class="emphasis">*%d*</span>

  is placed between non-digits;

  <span class="emphasis">*order_line\_%d*</span>

  is better than

  <span class="emphasis">*order-line-%d*</span>

  because minus may be part of

  <span class="emphasis">*%d*</span>

  output.

- End-of-line is treated as a special character, so placing

  <span class="emphasis">*%U*</span>

  or

  <span class="emphasis">*%d*</span>

  between "/" and end of line is as good as placing it between two "/".

</div>

In some cases <span class="emphasis">*option (returns ...)*</span> can
be used for IRI classes that are declared using sprintf format, but
actual data have more specific format. Consider a literal class
declaration that is used to output strings and the application knows
that all these strings are ISBN numbers:

``` programlisting
create literal class example:isbn_ref "%s" (in isbn varchar not null)
  option ( bijection, returns "%u-%u-%u-%u" union "%u-%u-%u-X" )
```

Sometimes interoperability restrictions will force you to violate these
rules but please try to follow them as often as possible.

</div>
