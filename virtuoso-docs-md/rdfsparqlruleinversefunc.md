<div id="rdfsparqlruleinversefunc" class="section">

<div class="titlepage">

<div>

<div>

### 16.14.9. Identity With Inverse Functional Properties

</div>

</div>

</div>

A graph used used with rdfs_rule_set may declare certain properties to
be inversely functional. If one or more inverse functional properties
(IFP's) are declared in the inference context used with the query,
enabled with define input:inference = "context_name", then the following
semantics apply:

<div class="orderedlist">

1.  If a literal is compared with an IRI, then the literal is
    substituted by all the subject IRI's where this literal occurs as a
    value of an IFP.

2.  If two IRI's are compared for equality, they will be considered the
    same if there is an IFP P such that the same P has the same value on
    both subjects.

3.  If an IRI is processed for distinctness in either distinct or group
    by, the IRI is first translated to be the IRI with the lowest ID
    among all IRI's that share an IFP value with this IRI.

</div>

Thus, if two IRI's are compared for distinctness, they will count as one
if there is an IFP P with the same value with both IRI's. Literal data
types are not translated into IRI's even if these literals occurred as
IFP values of some subject.

It is possible to declare that specific values, even if they occur as
values of an IFP in more than onme subject do not constitute identity
between the subjects. For example, if two subjects were inferred to be
the same because they had the same foaf:mbox_sha1sum, the SHA1 hash of
mailto:// would be excluded. Two individuals have an email address that
has a common default value are not the same.

In an ontology graph, a property IRI is declared to be inversely
functional by making it an instance of the owl:InverseFunctionalProperty
class. A value of an IFP can be declared null, i.e. sharing the value
does not imply identity by by giving the IFP IRI a
\<http://www.openlinksw.com/schemas/virtrdf#nullIFPValue\> property with
the value to be ignored as the object.

#### Example

``` programlisting
  SQL>ttlp ('
  <john1> a <person> .
  <john2> a <person> .
  <mary> a <person> .
  <mike> a <person> .
  <john1> <name> "John" .
  <john2> <name> "John" .
  <john1> <address> "101 A street" .
  <john2> <address> "102 B street" .
  <john2> <knows> <mike> .
  <john1> <http://www.w3.org/2002/07/owl#sameAs> <john2> .
  <mary> <knows> "John" .
  <mike> <knows> <john1> .
  <mike> <knows> <john2> .
  <john1> <name> "Tarzan" .
  <mike> <nam> "Tarzan" .
  ', '', 'ifps');

  SQL>ttlp ('
  <name> a <http://www.w3.org/2002/07/owl#InverseFunctionalProperty> .
  <name> <http://www.openlinksw.com/schemas/virtrdf#nullIFPValue> "Tarzan" .
  ', '', 'ifp_list');

  SQL>rdfs_rule_set ('ifps', 'ifp_list');

  SQL>SPARQL define input:inference "ifps"  SELECT * FROM <ifps> WHERE {<john1> ?p ?o};

  p                                                                                 o
  VARCHAR                                                                           VARCHAR
  _______________________________________________________________________________

  address                                                                           101 A street
  name                                                                              John
  http://www.w3.org/2002/07/owl#sameAs                                              john2
  http://www.w3.org/1999/02/22-rdf-syntax-ns#type                                   person
  name                                                                              Tarzan
  name                                                                              John
  knows                                                                             mike
  http://www.w3.org/1999/02/22-rdf-syntax-ns#type                                   person
  address                                                                           102 B street
  
```

We see that we get the properties of \<john2\> also.

``` programlisting
  SQL>SPARQL define input:inference "ifps" SELECT distinct ?p FROM <ifps> WHERE { ?p a <person>};

  john2
  mike
  mary
  
```

We see that we get only one John. But John is not the same as Mike
because they share the name Tarzan which is not considered as implying
identity. Which John we get is a matter of which gets the lowest
internal ID. This is variable and arbitrary at load time but once loaded
this is permanent as long as the set of subjects with the name John does
not change.

</div>
