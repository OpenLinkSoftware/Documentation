<div id="xpf_generate_id" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

generate-id — Returns a string that uniquely identifies the node.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_generate_id" class="funcsynopsis">

|                                |                        |
|--------------------------------|------------------------|
| `string `**`generate-id`**` (` | `place ` node_set `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_generate_id" class="refsect1">

## Description

The function returns a string that uniquely identifies the first node in
the *`place`* argument node-set. The unique identifier will consist of
ASCII alphanumeric characters and will start with an alphabetic
character. Thus, the string is syntactically an XML name. It always
generates the same identifier for the same node. It always generates
different identifiers from different nodes. This function is under no
obligation to generate the same identifiers each time a document is
transformed. There is no guarantee that a generated unique identifier
will be distinct from any unique IDs specified in the source document.

If the argument node-set is empty, the empty string is returned.

If the argument is omitted, it defaults to the context node.

</div>

<div id="xpf_params_generate_id" class="refsect1">

## Parameters

<div id="id127575" class="refsect2">

### place

Node-set whose first node is used as a key to generate a resulting ID

</div>

</div>

<div id="xpf_ret_generate_id" class="refsect1">

## Return Types

String which is syntactically an XML name.

</div>

<div id="xpf_examples_generate_id" class="refsect1">

## Examples

<div id="xpf_ex_generate_id" class="example">

**Example 24.591. **

<div class="example-contents">

``` screen
generate_id(.)
```

</div>

</div>

  

</div>

</div>
