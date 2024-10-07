<div id="rdfviewsrcur" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.13. Linked Data Views and recursive FK relationships

</div>

</div>

</div>

Here is sample example of a script to include an additional table alias
for a table:

``` programlisting
alter quad storage virtrdf:DefaultQuadStorage
  :
  FROM isports_rdf.prs10_isports_rdf.VRef_Call      as Ref_Call_tbl
  FROM isports_rdf.prs10_isports_rdf.VRef_Call      as Ref_Call_tbl_1
  :
{
  :
  refcall:ref-call_iri (Ref_Call_tbl.Call_Num) a refcall:Ref-Call as
virtrdf:ref-call_pk ;
  :
  refcall:has_parent  refcall:ref-call_iri (Ref_Call_tbl_1.Call_Num)
where  ( ^{Ref_Call_tbl.}^.Parent    = ^{Ref_Call_tbl_1.}^.Call_Num )   as
virtrdf:Ref-Call_has_parent .
```

This demonstrates the way to self-join the table VRef_Call with itself.
Like in SQL, are needed two different aliases for one table if you want
to join it with itself.

</div>
