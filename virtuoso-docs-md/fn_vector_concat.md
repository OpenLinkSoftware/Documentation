<div>

<div>

</div>

<div>

## Name

vector_concat — concatenate vectors

</div>

<div>

## Synopsis

<div>

|                                  |                      |
|----------------------------------|----------------------|
| `vector `**`vector_concat`**` (` | `vec1 ` vector ,     |
|                                  | `vec2 ` vector ,     |
|                                  | `... ` ,             |
|                                  | `vec-n ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`vector_concat ` takes a variable number of vectors (heterogeneous
arrays) and constructs a new vector containing copies of each (top
level) element in the arguments.

</div>

<div>

## Parameters

<div>

### *`vec1..n `*

<span class="type">vector </span> .

</div>

</div>

<div>

## Return Values

A vector made of copies of elements contained in vec1..n.

</div>

<div>

## Examples

<div>

**Example 24.441. Simple Use**

<div>

``` screen
dbg_obj_print (vector_concat (vector (now(), 'black', 'crow'),
                          vector ('said', 'nevermore')));

dbg_obj_print (vector_concat (vector ('a','b'),
                              vector (vector ('c', 'd'), 'e')));
```

Would output something like this on the Virtuoso console:

``` screen
({ts 2001-08-07 16:57:12.000000}  "black" "crow" "said" "nevermore" )
("a" "b" ("c" "d" ) "e" )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset() </code></a>
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref() </code></a>
<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector() </code></a>

</div>

</div>
