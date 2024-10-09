<div>

<div>

<div>

<div>

### 16.14.6. Implementation

</div>

</div>

</div>

Triples entailed by subclass or subproperty statements in an inference
context are not physically stored. Such triples are added to the result
set by the query run time as needed. Also queries involving subclass or
subproperty rules are not rewritten into unions of all the possible
triple patterns that might imply the pattern that is requested. Instead,
the SQL compiler adds special nodes that iterate over subclasses or
subproperties at run time. The cost model also takes subclasses and
subproperties into account when determining the approximate cardinality
of triple patterns.

In essence, Virtuoso's support for subclasses and subproperties is
backward chaining, i.e. it does not materialize all implied triples but
rather looks for the basic facts implying these triples at query
evaluation time.

</div>
