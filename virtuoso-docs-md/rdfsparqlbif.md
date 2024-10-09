<div>

<div>

<div>

<div>

### 16.2.13. Built-in bif functions

</div>

</div>

</div>

<div>

- <span class="emphasis">*bif:\_\_rdf_long_from_batch_params(i_nt
  integer, st_value, st2_value)*</span>

  <div>

  - For value URI, the params values should be: 1, value.stringValue(),
    NULL

  - For value BNODE, the params values should be: 1,
    "\_:"+((BNode)value).getID(), NULL

  - For value Literal with Language!=NULL, the params values should be:
    5, lit.stringValue(), lit.getLanguage()

  - For value Literal with Datatype!=NULL, the params values should be:
    4, lit.stringValue(), lit.getDatatype().toString()

  - For value Literal with Datatype==NULL && Language==NULL, the params
    values should be: 3, lit.stringValue(), NULL

  - For value any value exclude above, the params values should be: 3,
    value.stringValue(), NULL

  - For string value (without Datatype and Language), the params values
    should be: 3, value.stringValue(), NULL

  </div>

  <span class="emphasis">*Example:*</span>

  ``` programlisting
  SPARQL SELECT *
  WHERE
    { graph ?g { `iri(??)` `iri(??)`
      `bif:__rdf_long_from_batch_params(3,value.stringValue(),NULL)` }
    }
  ```

</div>

</div>
