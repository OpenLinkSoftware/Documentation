<div>

<div>

</div>

<div>

## Name

json_parse — Takes json string and returns parse tree.

</div>

<div>

## Synopsis

<div>

|                                |                        |
|--------------------------------|------------------------|
| `integer `**`json_parse`**` (` | in `txt ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes json string and returns parse tree.

</div>

<div>

## Parameters

<div>

### txt

a json string

</div>

</div>

<div>

## Return Types

The function returns tree.

</div>

<div>

## Examples

<div>

**Example 24.181. Simple example**

<div>

``` programlisting
SQL>create procedure json_tree_example ()
{
  declare qr, url, cnt, tree, xt, hdr any;
  cnt := '
{ "head": { "link": [], "vars": ["s", "p", "o"] },
  "results": { "distinct": false, "ordered": true, "bindings": [
    { "s": { "type": "uri", "value": "http://example.org/node" }    , "p": { "type": "uri", "value": "http://www.w3.org/1999/02/22-rdf-syntax-ns#type" }    , "o": { "type": "uri", "value": "http://www.w3.org/1999/02/22-rdf-syntax-ns#type" }},
    { "s": { "type": "uri", "value": "http://example.org/node" }    , "p": { "type": "uri", "value": "http://www.w3.org/1999/02/22-rdf-syntax-ns#type" }    , "o": { "type": "uri", "value": "http://www.w3.org/1999/02/22-rdf-syntax-ns#type" }} ] } }';
  tree := json_parse (cnt);
  tree := get_keyword ('results', tree);
  tree := get_keyword ('bindings', tree);
  return tree[0][1];
}
;

Done. 
SQL> SELECT json_tree_example();
json_tree_example
VARCHAR
 structure
No. of rows in result: 1 
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http </code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a> ,
<a href="fn_http_url.html" class="link" title="http_url"><code
class="function">http_url</code></a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a> ,
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> ,

</div>

</div>
