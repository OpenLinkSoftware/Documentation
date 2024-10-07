<div id="fn_rdf_64bit_upgrade" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_64BIT_UPGRADE — Alters IRI_ID columns to get IRI_ID_8.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_64bit_upgrade" class="funcsynopsis">

|                                       |      |
|---------------------------------------|------|
| ` `**`DB.DBA.RDF_64BIT_UPGRADE`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_64bit_upgrade" class="refsect1">

## Description

There are two data types. IRI_ID is 4-byte and IRI_ID_8 is 8-byte.
Initially, IRI_ID columns are created. DB.DBA.RDF_64BIT_UPGRADE() alters
them to get IRI_ID_8.

Note that this is to hold more that 4G of distinct IRIs, number of
distinct quads is not limited by 4G even without the upgrade.

The function should be called once.

It shutdowns the server at completion upgrade so it should not be called
from web-application.

Then the server should be restarted manually.

The server log should be checked for diagnostics before restart.

</div>

</div>
