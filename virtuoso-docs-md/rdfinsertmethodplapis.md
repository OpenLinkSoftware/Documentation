<div id="rdfinsertmethodplapis" class="section">

<div class="titlepage">

<div>

<div>

### 16.9.10. Using Virtuoso PL APIs

</div>

</div>

</div>

<div id="rdfinsertmethodplapissimpleexample" class="section">

<div class="titlepage">

<div>

<div>

#### Basic Sponger Cartridge Example

</div>

</div>

</div>

In the example script we implement a basic mapper which maps a
text/plain mime type to an imaginary ontology, which extends the class
Document from FOAF with properties 'txt:UniqueWords' and 'txt:Chars',
where the prefix 'txt:' we specify as 'urn:txt:v0.0:'.

``` programlisting
use DB;

create procedure DB.DBA.RDF_LOAD_TXT_META
    (
     in graph_iri varchar,
     in new_origin_uri varchar,
     in dest varchar,
         inout ret_body any,
     inout aq any,
     inout ps any,
     inout ser_key any
     )
{
  declare words, chars int;
  declare vtb, arr, subj, ses, str any;
  declare ses any;
  -- if any error we just say nothing can be done
  declare exit handler for sqlstate '*'
    {
      return 0;
    };
  subj := coalesce (dest, new_origin_uri);
  vtb := vt_batch ();
  chars := length (ret_body);
  -- using the text index procedures we get a list of words
  vt_batch_feed (vtb, ret_body, 1);
  arr := vt_batch_strings_array (vtb);
  -- the list has 'word' and positions array , so we must divide by 2
  words := length (arr) / 2;
  ses := string_output ();
  -- we compose a N3 literal
  http (sprintf ('<%s> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Document> .\n', subj), ses);
  http (sprintf ('<%s> <urn:txt:v0.0:UniqueWords> "%d" .\n', subj, words), ses);
  http (sprintf ('<%s> <urn:txt:v0.0:Chars> "%d" .\n', subj, chars), ses);
  str := string_output_string (ses);
  -- we push the N3 text into the local store
  DB.DBA.TTLP (str, new_origin_uri, subj);
  return 1;
}
;

--
DELETE FROM DB.DBA.SYS_RDF_MAPPERS WHERE RM_HOOK = 'DB.DBA.RDF_LOAD_TXT_META';

INSERT SOFT DB.DBA.SYS_RDF_MAPPERS (RM_PATTERN, RM_TYPE, RM_HOOK, RM_KEY, RM_DESCRIPTION)
    VALUES ('(text/plain)', 'MIME', 'DB.DBA.RDF_LOAD_TXT_META', null, 'Text Files (demo)');

-- here we set order to some large number so don't break existing mappers
update DB.DBA.SYS_RDF_MAPPERS set RM_ID = 2000 WHERE RM_HOOK = 'DB.DBA.RDF_LOAD_TXT_META';
```

<div class="orderedlist">

1.  Paste the whole of this code into Conductor's iSQL interface and
    execute it to define and register the cartridge.

2.  Create a simple text document with a .txt extension. For ex. with
    name: summary.txt

3.  The .txt file must now be made Web accessible. A simple way to do
    this is to expose it as a WebDAV resource using Virtuoso's built-in
    WebDAV support:

    <div class="orderedlist">

    1.  Log in to Virtuoso's ODS Briefcase application;

    2.  Navigate to your Public folder;

    3.  Upload your text document, ensuring that the file extension is
        .txt, the MIME type is set to text/plain and the file
        permissions are rw-r--r--.

    4.  As result the file would be Web accessible via the URL
        http://cname/DAV/home/username/Public/summary.txt .

    5.  Note: you can also check our <a
        href="http://demo.openlinksw.com/tutorial/hosting/ho_s_30/WebCalendar/tools/summary.txt"
        class="ulink" target="_top">live demo</a> .

    </div>

4.  To test the mapper we just use /sparql endpoint with option
    'Retrieve remote RDF data for all missing source graphs' to execute
    (for ex.):

    ``` programlisting
    SELECT *
    FROM <http://cname/DAV/home/username/Public/summary.txt>
    WHERE {?s ?p ?o}
    ```

5.  Click the "Run Query" button.

6.  As result should be shown the found triples, for ex.:

    ``` programlisting
    s                                                  p                                                o
    http://cname/DAV/home/username/Public/summary.txt  http://www.w3.org/1999/02/22-rdf-syntax-ns#type  http://xmlns.com/foaf/0.1/Document
    http://cname/DAV/home/username/Public/summary.txt  urn:txt:v0.0:UniqueWords                           47
    http://cname/DAV/home/username/Public/summary.txt  urn:txt:v0.0:Chars                               625
    ```

</div>

<span class="emphasis">*Important: Setting Sponger Permissions*</span>

In order to allow the Sponger to update the local RDF quad store with
triples constituting the fetched Network Resource structured data, the
role "SPARQL_SPONGE" must be granted to the account "SPARQL", i.e., to
the owner account of /sparql web service endpoint. This should normally
be the case. If not, you must manually grant this permission. As with
most Virtuoso DBA tasks, the Conductor provides the simplest means of
doing this.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p>The <a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML">DB.DBA.RDF_LOAD_RDFXML</a> function to
parse the content of RDF/XML text.</p></li>
<li><p>The <a href="fn_ttlp_mt.html" class="link"
title="DB.DBA.TTLP_MT">DB.DBA.TTLP_MT</a> function to parse TTL (TURTLE
or N3 resource).</p></li>
<li><p>The <a href="fn_gz_file_open.html" class="link"
title="gz_file_open">gz_file_open</a> function to retrieve content of a
gzipped file and example for loading gzipped N3 and Turtle
files.</p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>
