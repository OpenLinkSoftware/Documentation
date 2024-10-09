<div>

<div>

</div>

<div>

## Name

shallow — Returns a shallow copy of the given XML entity

</div>

<div>

## Synopsis

<div>

|                            |                    |
|----------------------------|--------------------|
| `entity `**`shallow`**` (` | `ent ` entity `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns a shallow copy of the given XML entity, i.e. a root
of a new document that consists of only one node that is a copy of the
given entity but have no children.

</div>

<div>

## Parameters

<div>

### ent

The XML entity to copy

</div>

</div>

<div>

## Return Types

The function returns an XML entity.

</div>

<div>

## Errors

<div>

**Table 24.150. Errors signalled by shallow()**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                            | Description                                                                             |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFD6 </span> | <span class="errortext">The argument of XPATH function shallow() is not an entity </span>             | To match XQuery standard, the function signal an error if *`ent `* is not an entity.    |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFD7 </span> | <span class="errortext">Persistent XML entities are not supported by XPATH function shallow() </span> | This is an artificial restriction that is to be removed in future versions of Virtuoso. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.618. Find Martha's spouse**

<div>

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

<div>

## See Also

<a href="xpf_filter.html" class="link" title="filter">filter()</a>

</div>

</div>
