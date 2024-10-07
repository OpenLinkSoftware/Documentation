<div id="virtuosotipsandtricksdroprecrdefstrg" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.8. Can I drop and re-create the DefaultQuadStorage?

</div>

</div>

</div>

Currently system metadata consist of three "levels":

<div class="orderedlist">

1.  <span class="emphasis">*QuadMapFormats*</span>

    are used to describe transformations of individual SQL values (or
    types of SQL values),

2.  <span class="emphasis">*QuadMaps*</span>

    refers to

    <span class="emphasis">*QuadMapFormats*</span>

    (via

    <span class="emphasis">*QuadMapValues*</span>

    ) and describe some "minimal" independent RDB2RDF transformations,

3.  <span class="emphasis">*QuadStorages*</span>

    organizes

    <span class="emphasis">*QuadMaps*</span>

    .

</div>

<span class="emphasis">*QuadStorages*</span> contains only "symlinks" to
maps, if you drop a storage you don't drop all mappings inside. If you
drop the <span class="emphasis">*DefaultQuadStorage*</span> or some
other built-in thing, it can be safely recovered by
<a href="fn_rdf_audit_metadata.html" class="link"
title="DB.DBA.RDF_AUDIT_METADATA"><code
class="function">DB.DBA.RDF_AUDIT_METADATA</code></a> , with first
parameter set to 1. This will keep your own data intact. However we
recommend to write a script that declares all your formats, Linked Data
Views and storages, to be able to reproduce the configuration after any
failures.

</div>
