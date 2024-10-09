<div>

<div>

<div>

<div>

### 16.5.10. Join Optimization -- Declaring IRI Subclasses

</div>

</div>

</div>

Additional problem appears when the equality is between two IRIs of two
different IRI classes. Even if both of them are bijections, the compiler
does not know if these IRI classes behave identically on the
intersection of their domains. To let the optimizer know this fact, one
IRI class can be explicitly declared as a subclass of another:

``` programlisting
make oplsioc:user_iri subclass of oplsioc:grantee_iri .
make oplsioc:group_iri subclass of oplsioc:grantee_iri .
```

The SPARQL compiler can not check the validity of a subclass
declaration. The developer should carefully test functions to ensure
that transformations are really subclasses, as well as to ensure that
functions of an IRI class declarations are really inverse to each other.

When declaring that a table's primary key is converted into a IRI
according to one IRI class, one usually declares that all foreign keys
referring to this class also get converted into an IRI as per this same
class, or subclass of same class.

Subclasses can be declared for literal classes as well as for IRI
classes, but this case is rare. The reason is that most of literals are
made by identity literal classes that are disjoint to each other even if
values may be equal in SQL sense, such as
<span class="emphasis">*"2"*</span> of type
<span class="emphasis">*xsd:integer*</span> and
<span class="emphasis">*"2.0"*</span> of type
<span class="emphasis">*xsd:double*</span> .

</div>
