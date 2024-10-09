<div>

<div>

</div>

<div>

## Name

serialize , deserialize — convert any heterogeneous array or tree of
arrays into a binary string and back

</div>

<div>

## Synopsis

<div>

|                                     |                     |
|-------------------------------------|---------------------|
| `binary string `**`serialize`**` (` | in `tree ` any `)`; |

<div>

 

</div>

</div>

<div>

|                                       |                        |
|---------------------------------------|------------------------|
| `binary string `**`deserialize`**` (` | in `str ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

These functions will convert any heterogeneous array or tree of arrays
into a binary string and back. The format is platform independent.

``` programlisting
deserialize (serialize (x))
```

is the identity function.

These functions are useful for persisting heterogeneous arrays.

<div>

|                              |                                                                                                                                       |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                 |
|                              | The serialization can be stored as a blob, so that there is no practical length limit. The string length is however limited to 16 MB. |

</div>

</div>

</div>
