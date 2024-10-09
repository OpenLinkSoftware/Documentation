<div>

<div>

<div>

<div>

### 16.17.10. RDF dumps from Virtuoso Quad store hosted data into NQuad dumps

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### What?

</div>

</div>

</div>

How to export RDF model data from Virtuoso's Quad Store in NQuad format.

</div>

<div>

<div>

<div>

<div>

#### Why?

</div>

</div>

</div>

When exporting RDF model data from Virtuoso's Quad Store, having the
ability to retain and reflect Named Graph IRI based data partitioning is
provide significant value to a variety of application profiles.

</div>

<div>

<div>

<div>

<div>

#### How?

</div>

</div>

</div>

We have created stored procedures for the task. The dump procedure
<span class="emphasis">*dump_nquads*</span> leverage SPARQL to
facilitate data dump(s) for all graphs excluding the predefined
"virtrdf:" one.

<div>

<div>

<div>

<div>

##### Dump NQuads

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### Parameters

</div>

</div>

</div>

The procedure <span class="emphasis">*dump_nquads*</span> has the
following parameters:

<div>

- IN

  <span class="emphasis">*dir*</span>

  VARCHAR -- folder where the dumps will be stored

- IN

  <span class="emphasis">*outstart_fromfile*</span>

  INTEGER -- output start from number n

- IN

  <span class="emphasis">*file_length_limit*</span>

  INTEGER -- maximum length of dump files

- IN

  <span class="emphasis">*comp*</span>

  INTEGER -- when set to 0, then no gzip will be done. By default is set
  to 1.

</div>

</div>

<div>

<div>

<div>

<div>

###### Source

</div>

</div>

</div>

The procedure <span class="emphasis">*dump_nquads*</span> has the
following source:

``` programlisting
create procedure dump_nquads (in dir varchar := 'dumps', in start_from int := 1, in file_length_limit integer := 100000000, in comp int := 1)
{
  declare inx, ses_len int;
  declare file_name varchar;
  declare env, ses any;

  inx := start_from;
  set isolation = 'uncommitted';
  env := vector (0,0,0);
  ses := string_output (10000000);
  for (select * from (sparql define input:storage "" select ?s ?p ?o ?g { graph ?g { ?s ?p ?o } . filter ( ?g != virtrdf: ) } ) as sub option (loop)) do
    {
      declare exit handler for sqlstate '22023'
    {
      goto next;
    };
      http_nquad (env, "s", "p", "o", "g", ses);
      ses_len := length (ses);
      if (ses_len >= file_length_limit)
    {
      file_name := sprintf ('%s/output%06d.nq', dir, inx);
      string_to_file (file_name, ses, -2);
      if (comp)
        {
          gz_compress_file (file_name, file_name||'.gz');
          file_delete (file_name);
        }
      inx := inx + 1;
      env := vector (0,0,0);
      ses := string_output (10000000);
    }
      next:;
    }
  if (length (ses))
    {
      file_name := sprintf ('%s/output%06d.nq', dir, inx);
      string_to_file (file_name, ses, -2);
      if (comp)
    {
      gz_compress_file (file_name, file_name||'.gz');
      file_delete (file_name);
    }
      inx := inx + 1;
      env := vector (0,0,0);
    }
}
;
```

</div>

<div>

<div>

<div>

<div>

###### Example

</div>

</div>

</div>

This example demonstrates calling the
<span class="emphasis">*dump_nquads*</span> procedure in order to dump
all graphs in a compressed nquad dumps, each uncompressed with length
10Mb (./dumps/output000001.nq.gz) :

``` programlisting
SQL> dump_nquads ('dumps', 1, 10000000, 1);
```

</div>

</div>

</div>

</div>
