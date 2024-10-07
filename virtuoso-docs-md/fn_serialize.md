<div id="fn_serialize" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

serialize , deserialize — convert any heterogeneous array or tree of
arrays into a binary string and back

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_serialize" class="funcsynopsis">

|                                     |                     |
|-------------------------------------|---------------------|
| `binary string `**`serialize`**` (` | in `tree ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

<div id="fsyn_deserialize" class="funcsynopsis">

|                                       |                        |
|---------------------------------------|------------------------|
| `binary string `**`deserialize`**` (` | in `str ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_17" class="refsect1">

## Description

These functions will convert any heterogeneous array or tree of arrays
into a binary string and back. The format is platform independent.

``` programlisting
deserialize (serialize (x))
```

is the identity function.

These functions are useful for persisting heterogeneous arrays.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                       |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                 |
|                              | The serialization can be stored as a blob, so that there is no practical length limit. The string length is however limited to 16 MB. |

</div>

</div>

</div>
