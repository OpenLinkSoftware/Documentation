<div id="xpf_text_contains" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

text_contains — Returns true if the text value of some node in the given
node-set contains the text matching the given free-text query, otherwise
returns false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_text_contains" class="funcsynopsis">

|                                   |                      |
|-----------------------------------|----------------------|
| `boolean `**`text_contains`**` (` | `scope ` node-set ,  |
|                                   | `query ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_text_contains" class="refsect1">

## Description

This function calculates text values of nodes from the *`scope`* , and
checks whether the current text value contains any fragment that matches
the *`query`* . When the first match is found, the rest of the node-set
is ignored the boolean 'true' is returned. If the node-set ends before
any match is found, 'false' is returned.

The `text_contains()` function may be used only in XPath expressions
that are arguments of `xcontains()` . This restriction is for
optimization purposes. When Virtuoso executes an SQL statement that uses
`xcontains()` , it performs some sophisticated free-text search, and it
applies the XPath expression not to all available documents but only to
documents that satisfied the free-text search criterion. Moreover, the
server uses the intermediate free-text data to optimize the search
inside a selected document.

</div>

<div id="xpf_params_text_contains" class="refsect1">

## Parameters

<div id="id129465" class="refsect2">

### scope

The node-set where the text search is performed.

</div>

<div id="id129468" class="refsect2">

### query

The text of the query.

</div>

</div>

<div id="xpf_ret_text_contains" class="refsect1">

## Return Types

Returns a boolean: True or False.

When the first match is found, the rest of the node-set is ignored the
boolean 'true' is returned. If the node-set ends before any match is
found, 'false' is returned.

</div>

<div id="xpf_errors_text_contains" class="refsect1">

## Errors

<div id="id129477" class="table">

**Table 24.152. Errors signalled by text-contains()**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                          | Description                                                                                                  |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP370 </span> | <span class="errorcode">XPF11 </span> | <span class="errortext">XPATH function text-contains() is allowed only in special SQL predicate xcontains() </span> | The XPath processor is called not by xcontains() but by some other way so it has no suitable free-text data. |
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF13 </span> | <span class="errortext">Unsupported combination of arguments in XPATH function text-contains() </span>              | The XPath processor has failed to built an execution plan for the free-text search.                          |

</div>

</div>

  

</div>

<div id="xpf_examples_text_contains" class="refsect1">

## Examples

<div id="xpf_ex_text_contains" class="example">

**Example 24.632. **

<div class="example-contents">

``` screen
```

</div>

</div>

  

</div>

<div id="xpf_seealso_text_contains" class="refsect1">

## See Also

<a href="xcontainspredicate.html" class="link"
title="15.4.6. XCONTAINS predicate">xcontains predicate</a>

</div>

</div>
