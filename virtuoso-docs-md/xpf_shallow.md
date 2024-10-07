<div id="xpf_shallow" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

shallow — Returns a shallow copy of the given XML entity

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_shallow" class="funcsynopsis">

|                            |                    |
|----------------------------|--------------------|
| `entity `**`shallow`**` (` | `ent ` entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_shallow" class="refsect1">

## Description

The function returns a shallow copy of the given XML entity, i.e. a root
of a new document that consists of only one node that is a copy of the
given entity but have no children.

</div>

<div id="xpf_params_shallow" class="refsect1">

## Parameters

<div id="id128943" class="refsect2">

### ent

The XML entity to copy

</div>

</div>

<div id="xpf_ret_shallow" class="refsect1">

## Return Types

The function returns an XML entity.

</div>

<div id="xpf_errors_shallow" class="refsect1">

## Errors

<div id="id128951" class="table">

**Table 24.151. Errors signalled by shallow()**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                            | Description                                                                             |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFD6 </span> | <span class="errortext">The argument of XPATH function shallow() is not an entity </span>             | To match XQuery standard, the function signal an error if *`ent `* is not an entity.    |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFD7 </span> | <span class="errortext">Persistent XML entities are not supported by XPATH function shallow() </span> | This is an artificial restriction that is to be removed in future versions of Virtuoso. |

</div>

</div>

  

</div>

<div id="xpf_examples_shallow" class="refsect1">

## Examples

<div id="xpf_ex_shallow" class="example">

**Example 24.618. Find Martha's spouse**

<div class="example-contents">

The idea of the following sample is from W3C's XQuery Use Cases (case
1.9.4.1.). The query should find all persons whose name is "Marta" and
return entities that describes their spouses, with removed information
about children.

``` screen
-- read the document, then...
    let $doc := document("census.xml")
-- for every person named "Martha"...
      for $m in $doc//person[@name="Martha"]
-- for all (i.e. 0 or 1) her spouses...
        for $s in $m/@spouse => person
-- return <person> element with attributes preserved but with children removed
          return shallow($s)
```

</div>

</div>

  

</div>

<div id="xpf_seealso_shallow" class="refsect1">

## See Also

<a href="xpf_filter.html" class="link" title="filter">filter()</a>

</div>

</div>
