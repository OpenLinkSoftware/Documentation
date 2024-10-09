<div>

<div>

</div>

<div>

## Name

lang — Returns true if the language of context node matches given
language name.

</div>

<div>

## Synopsis

<div>

|                          |                          |
|--------------------------|--------------------------|
| `boolean `**`lang`**` (` | `lang_name ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### lang_name

Name of the language

</div>

</div>

<div>

## Return Types

Boolean

</div>

<div>

## Examples

<div>

**Example 24.596. **

<div>

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

<div>

## See Also

</div>

</div>
