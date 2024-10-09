<div>

<div>

</div>

<div>

## Name

HS_Resolve — Returns URL that represents the given DOI

</div>

<div>

## Synopsis

<div>

|                               |                           |
|-------------------------------|---------------------------|
| `string `**`HS_Resolve`**` (` | in `doi_val ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### doi_val

DOI value

</div>

</div>

<div>

## Return Values

A string of URL that represents the given DOI.

</div>

<div>

## Examples

<div>

**Example 24.424. Simple example**

<div>

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
