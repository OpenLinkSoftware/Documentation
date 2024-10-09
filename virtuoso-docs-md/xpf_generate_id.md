<div>

<div>

</div>

<div>

## Name

generate-id — Returns a string that uniquely identifies the node.

</div>

<div>

## Synopsis

<div>

|                                |                        |
|--------------------------------|------------------------|
| `string `**`generate-id`**` (` | `place ` node_set `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### place

Node-set whose first node is used as a key to generate a resulting ID

</div>

</div>

<div>

## Return Types

String which is syntactically an XML name.

</div>

<div>

## Examples

<div>

**Example 24.591. **

<div>

``` screen
generate_id(.)
```

</div>

</div>

  

</div>

</div>
