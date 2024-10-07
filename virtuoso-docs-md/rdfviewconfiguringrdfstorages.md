<div id="rdfviewconfiguringrdfstorages" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.4. Configuring RDF Storages

</div>

</div>

</div>

"<span class="emphasis">*Quad Storage*</span> " is a named set of quad
map patterns. The declaration <span class="emphasis">*define
input:storage storage-name*</span> states that a SPARQL query will be
executed using only quad patterns of the given quad storage.
Declarations of IRI classes, literal classes and quad patterns are
shared between all quad storages of an RDF meta schema but every quad
storage contains only a subset of all available quad patterns. Two quad
storages are always defined:

<div class="itemizedlist">

- A

  <span class="emphasis">*virtrdf:default*</span>

  one usually consists of everything (all user-relational mappings plus

  <span class="emphasis">*virtrdf:DefaultQuadMap*</span>

  for "native-form" quads from

  <span class="emphasis">*DB.DBA.RDF_QUAD*</span>

  )

- A

  <span class="emphasis">*virtrdf:empty*</span>

  storage refers solely to

  <span class="emphasis">*DB.DBA.RDF_QUAD*</span>

  and can not be altered.

</div>

Three statements for manipulating storages are

<div class="itemizedlist">

- <span class="emphasis">*create quad storage storage-name {
  quad-map-decls } .*</span>

- <span class="emphasis">*alter quad storage storage-name {
  quad-map-decls-or-drops } .*</span>

- <span class="emphasis">*drop quad storage storage-name .* </span>

</div>

A map pattern can be created only as a part of
<span class="emphasis">*create quad storage*</span> or
<span class="emphasis">*alter quad storage*</span> statement, so
initially it is used by exactly one storage. It can be imported to some
other storage using directive <span class="emphasis">*create map-id
using storage source-storage*</span> . E.g., declarations of many
storages create <span class="emphasis">*virtrdf:DefaultQuadMap*</span>
using storage <span class="emphasis">*virtrdf:DefaultQuadStorage*</span>
.

Only a "top-level" quad map pattern (standalone or a whole group with
descendants) can be imported, member of a group can not. The import
directive also can not be a part of some group declaration.

The directive <span class="emphasis">*drop quad map map-name*</span>
removes a map from one storage when it appears inside
<span class="emphasis">*alter quad storage*</span> statement. Otherwise
it removes the map from all storages. There exists garbage collection
for quad map patterns, so any unused map is immediately deleted. A group
is deleted with all its descendants.

</div>
