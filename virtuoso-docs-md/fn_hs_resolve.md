<div id="fn_hs_resolve" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

HS_Resolve — Returns URL that represents the given DOI

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_hs_resolve" class="funcsynopsis">

|                               |                           |
|-------------------------------|---------------------------|
| `string `**`HS_Resolve`**` (` | in `doi_val ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_hs_resolve" class="refsect1">

## Description

Returns URL that represents the given DOI. The function is installed
from the hslookup plugin which uses http://www.handle.net/.

Note that you need to have in your Virtuoso database ini file in section
Plugins added the hslookup.dll file, which location should be in the
plugins folder under your Virtuoso server installation. For ex:

``` screen
[Plugins]
LoadPath = ./plugin
...
Load6    = plain,hslookup
```

</div>

<div id="params_hs_resolve" class="refsect1">

## Parameters

<div id="id114098" class="refsect2">

### doi_val

DOI value

</div>

</div>

<div id="ret_hs_resolve" class="refsect1">

## Return Values

A string of URL that represents the given DOI.

</div>

<div id="examples_hs_resolve" class="refsect1">

## Examples

<div id="ex_hs_resolve" class="example">

**Example 24.424. Simple example**

<div class="example-contents">

``` screen
SQL> select HS_Resolve('10.1038/35057062');
callret
VARCHAR
_______________________________________________________________________________

http://www.nature.com/doifinder/10.1038/35057062

1 Rows. -- 22 msec.
      
```

</div>

</div>

  

</div>

</div>
