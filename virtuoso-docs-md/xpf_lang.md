<div id="xpf_lang" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

lang — Returns true if the language of context node matches given
language name.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_lang" class="funcsynopsis">

|                          |                          |
|--------------------------|--------------------------|
| `boolean `**`lang`**` (` | `lang_name ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_lang" class="refsect1">

## Description

The lang function returns true or false depending on whether the
language of the context node as specified by xml:lang attributes is the
same as or is a sublanguage of the language specified by the argument
string. The language of the context node is determined by the value of
the xml:lang attribute on the context node, or, if the context node has
no xml:lang attribute, by the value of the xml:lang attribute on the
nearest ancestor of the context node that has an xml:lang attribute. If
there is no such attribute, then lang returns false. If there is such an
attribute, then lang returns true if the attribute value is equal to the
argument ignoring case, or if there is some suffix starting with "-"
such that the attribute value is equal to the argument ignoring that
suffix of the attribute value and ignoring case.

</div>

<div id="xpf_params_lang" class="refsect1">

## Parameters

<div id="id127909" class="refsect2">

### lang_name

Name of the language

</div>

</div>

<div id="xpf_ret_lang" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_lang" class="refsect1">

## Examples

<div id="xpf_ex_lang" class="example">

**Example 24.596. **

<div class="example-contents">

The expression lang("en") would return true if the context node is any
of these five elements:

``` screen
<para xml:lang="en"/>
<div xml:lang="en"><para/></div>
<para xml:lang="EN"/>
<para xml:lang="en-us"/>
```

</div>

</div>

  

</div>

<div id="xpf_seealso_lang" class="refsect1">

## See Also

</div>

</div>
