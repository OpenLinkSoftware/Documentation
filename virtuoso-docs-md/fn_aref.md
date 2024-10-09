<div>

<div>

</div>

<div>

## Name

aref — returns specific element of an array or string

</div>

<div>

## Synopsis

<div>

|                   |                     |
|-------------------|---------------------|
| ` `**`aref`**` (` | `arg ` any ,        |
|                   | `nth ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`aref ` returns the *`nth `* element of an
<span class="type">array</span> , <span class="type">string</span> or
<span class="type">string_session</span> , where *`nth`* is a zero-based
index. If the first argument is a <span class="type">string</span> or
<span class="type">string_session</span> , the
<span class="type">integer</span> ASCII value of the *`nth`* character
is returned. If the first argument is an array of <span class="type">any
</span> , then the corresponding element is returned.

</div>

<div>

## Parameters

<div>

### *`arg `*

<span class="type">array </span> , <span class="type">vector </span> or
<span class="type">string </span> .

</div>

<div>

### *`nth `*

<span class="type">integer </span> zero-based index.

</div>

</div>

<div>

## Return Values

An <span class="type">integer </span> character code or *`nth `* element
as whatever type the element is if *`arg `* is an array or vector
(heterogeneous array.)

</div>

<div>

## Errors

<div>

**Table 24.2. Errors signalled by aref**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                          | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR017 </span> | <span class="errortext">aref: Bad array subscript (zero-based) %d for an arg of type %s (%d) and length %d. </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR000 </span> | <span class="errortext">aref expects an array or vector, not an arg of type %d. </span>                             |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.13. Simple examples**

<div>

``` screen
SQL> select aref ('Abacus', 0);
callret
VARCHAR
_______________________________________________________________________________

65

1 Rows. -- 3 msec.
SQL> select aref (vector ('Primero', 2, 3.333), 2);
callret
VARCHAR
_______________________________________________________________________________

3.333

1 Rows. -- 4 msec.
SQL>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector </code></a>
<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset </code></a>
<a href="fn_ascii.html" class="link" title="ascii"><code
class="function">ascii </code></a>

</div>

</div>
