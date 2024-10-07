<div id="fn_xper_right_sibling" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xper_right_sibling , xper_left_sibling , xper_parent , xper_root_entity
, xper_tell , xper_length — low-level navigation functions for
persistent XMLs, useful for import of huge amounts of XML data

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xper_right_sibling" class="funcsynopsis">

|                                 |                                   |
|---------------------------------|-----------------------------------|
| ` `**`xper_right_sibling`**` (` | in `xper_entity ` XML_entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_xper_left_sibling" class="funcsynopsis">

|                                |                                   |
|--------------------------------|-----------------------------------|
| ` `**`xper_left_sibling`**` (` | in `xper_entity ` XML_entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_xper_parent" class="funcsynopsis">

|                          |                                   |
|--------------------------|-----------------------------------|
| ` `**`xper_parent`**` (` | in `xper_entity ` XML_entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_xper_root_entity" class="funcsynopsis">

|                               |                                   |
|-------------------------------|-----------------------------------|
| ` `**`xper_root_entity`**` (` | in `xper_entity ` XML_entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_xper_tell" class="funcsynopsis">

|                        |                                   |
|------------------------|-----------------------------------|
| ` `**`xper_tell`**` (` | in `xper_entity ` XML_entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_xper_length" class="funcsynopsis">

|                          |                                   |
|--------------------------|-----------------------------------|
| ` `**`xper_length`**` (` | in `xper_entity ` XML_entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_78" class="refsect1">

## Description

All these functions work with "persistent XML" (XPER) entities only,
signalling errors if given entity points to "XML tree". They are useful
when applications need to read a huge XML document, especially something
like a datasheet dump or event log with a large number of uniform
records, and is required to process all records of the document, e.g.
import them into the database.

Consider a real sample of import all data from ODP's content.xml dump
which contains more than 2,000,000 descriptions of various Web-sites,
and the length of the file is more than 600Mb. The file has root element
named 'RDF' and all descriptions are their children named either 'Topic'
or 'ExternalPage'. This code looks suitable for importing these
children:

``` programlisting
create procedure
  import_content_xml ()
  {
    for select _frag, xpath_eval('local_name()', _frag) as _tag from SOURCE_XML
      where NAME='content.xml' and xpath_contains(XPER,'/RDF/*',_frag)
    do
    {
      if (_tag='Topic') import_topic (_frag);
      else
      {
        if (_tag='ExternalPage') import_external (_frag);
        else log_import_error (_frag, "Unknown type of record");
      }
    }
  };
  -- This should load files like content.xml, and place XPERs into SOURCE_XML table

read_source_xmls();
  -- Now SOURCE_XML is filled and data should be imported.

import_content_xml();
import_structure_xml();
import_profiles_xml();
 ...
```

It looks fine and it passes small tests but it will not work on real
data!

First problem is regular checkpoints (every 1 hour by default), so
import_content_xml has no chance to be completed if it takes 1.5 hours
of CPU time; the function checkpoint_interval should be used to
temporarily disable these checkpoints. Then, the length of transaction
log become extremely large after switching checkpoints off, and it is
better to insert explicit checkpoints between calls of these functions.
Finally, import_content_xml will change more than 4 gigabytes of data in
one transaction. This would be impossible on any 32-bit platform,
because both memory available and address space become insufficient.
Adding intermediate 'commit work' statements inside the loop's body will
not help because both 'commit work' and 'rollback work' statements will
close all opened cursors. Loop 'for select ... from ... do' uses an
implicit cursor to iterate the resultset, but the 'commit work' operator
will close this cursor and abort the loop.

Function xper_right_sibling is designed specially to solve the last
problem. It allows you to iterate children of some element without using
any cursor at all. It returns the right child of the entity passed as
its argument. If the given entity is the last child of its parent, the
function will return NULL. Similarly, xper_left_sibling will return the
previous child or NULL for the first child, xper_parent will return
parent of entity or NULL for the document's root and xper_root_entity
will return the root for any entity. Using these functions, it is
possible to scan the document forward (from left to right), backward and
to "climb up" toward the root of the elements' tree. These functions are
called <span class="emphasis">*XML Navigation Functions*</span> because
they are like the statements "next record", "prev record" etc., used in
cursor like navigation of databases.

There are no special functions to "go down", e.g. to find first children
of given element, because xpath_eval can do any such movement very
quickly.

Sometimes data import is controlled from some client application. If one
operation takes hours, some sort of "progress bar" becomes very useful,
at least to see whether application works or hangs. xper_length takes an
XPER entity and returns whole length of XPER disk image in bytes.
xper_tell takes an XPER entity and returns something like entity's
offset inside the document. Their results may be used by the client
application to monitor the progress and estimate the time until
completion. They may be especially useful for debugging purposes, e.g.
to report position of error. Unfortunately "xper_seek" is not possible
for XPERs, unlike typical random access to files.

Ultimately, the working version of the procedure described above will
look like this:

``` programlisting
create procedure
  import_content_xml ()
  {
    declare _frag any;
    declare _tag any;
    declare _nodeid any;
    declare _r_id varchar;
    declare _about, _title, _description varchar;
    declare CurTime varchar;
    declare Frags, Inserts, Pos, Length integer;

    select _frag1 into _frag from SOURCE_XML
      where NAME = 'content.xml' and xpath_contains (XPER, '/RDF/*', _frag1);

    if (not isentity(_frag)) signal('42ODP', 'XML source "Content" is empty');

    Frags := 0;
    Inserts := 0;
    Length := xper_length(_frag);
    result_names (CurTime, Frags, Pos, Length);
    -- It's not the best way to process deadlocks, but it may be better than nothing.

    whenever sqlstate '40001' goto next_frag;

    next_frag:

    -- Server will inform client application about progress after every 10000 records.
    if (mod(Frags,10000) = 0)
    {
      -- Note that if it needs to estimate the time to completion, time should be measured
      -- on server side, because results may be returned on batches to reduce network
      -- traffic, and it may be a significant delay between call of result function on
      -- server and fetch on client side.
      CurTime := cast(now() as varchar);
      Pos := xper_tell(_frag);
      result (CurTime, Frags, Inserts, Pos, Length);
    }
    _tag := xpath_eval('local-name()', _frag);
    if (_tag = 'Topic')
    {
      import_topic(_frag);
      goto advance;
    }
    if (_tag = 'ExternalPage')
    {
      import_external(_frag);
      goto advance;
    }
    log_import_error (_frag, "Unknown type of record");
    goto nocommit_advance;

    advance:
    Inserts := Inserts + 1;
    -- Note that it may be faster to have 1 commit per 100 or 1000 records in some cases.

    commit work;

    nocommit_advance:
    Frags := Frags + 1;

    _frag := xper_right_sibling(_frag);
    if (isentity(_frag)) goto next_frag; -- If _frag is NULL, we've completed the import.

    CurTime := cast(now() as varchar);
    result (CurTime, Frags, Inserts, Length, Length);
  };

  checkpoint_interval(0);
  checkpoint;

  read_source_xmls();
  checkpoint;

  import_content_xml();
  checkpoint;

  import_structure_xml();
  checkpoint;

  import_profiles_xml();
  checkpoint;
  ...

  checkpoint_interval(60);
```

</div>

<div id="params_41" class="refsect1">

## Parameters

<div id="id124366" class="refsect2">

### xper_entity

Persistent XML entity to operate on.

</div>

</div>

<div id="seealso_03_01" class="refsect1">

## See Also

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc()</a>

<a href="fn_xper_cut.html" class="link" title="xper_cut">xper_cut()</a>

</div>

</div>
