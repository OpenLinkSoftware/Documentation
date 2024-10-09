<div>

<div>

</div>

<div>

## Name

length — Get length of argument

</div>

<div>

## Synopsis

<div>

|                            |                    |
|----------------------------|--------------------|
| `integer `**`length`**` (` | in `arg ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the length of its argument.

<div>

**Table 24.50. Value returned by `length ` by argument datatype**

<div>

| Argument type                             | Value returned                                           |
|-------------------------------------------|----------------------------------------------------------|
| <span class="type">string </span>         | number of characters                                     |
| <span class="type">array </span>          | number of elements                                       |
| NULL                                      | zero                                                     |
| <span class="type">LOB </span>            | length if known (see below)                              |
| <span class="type">string_session </span> | number of bytes written into the session                 |
| <span class="type">composite </span>      | sum of byte lengths of elements consisting the composite |

</div>

</div>

  

<div>

|                              |                                                                                                                                                 |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                            |
|                              | In case of a LOB that does not have a length as in the case of one supplied by a client with SQLPutData and not yet stored, a zero is returned. |

</div>

</div>

<div>

## Parameters

<div>

### arg

Any type that can be tested for length.

</div>

</div>

<div>

## Return Values

Integer length of the argument

</div>

<div>

## Errors

<div>

**Table 24.51. Errors signalled by `length `**

<div>

| sqlstate                              | error code                            | error text                                                                           |                                                                      |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR015 </span> | <span class="errortext">Function length is not applicable to XML tree entity </span> | `Length ` cannot calculate a length for a non-persistent XML entity. |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR016 </span> | <span class="errortext">Function length does not handle arguments of type x </span>  | An invalid data type was passed as an argument to `length `          |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.205. Some uses of length()**

<div>

``` screen
SQL> select length('abacus'), length (NULL);
callret   callret
INTEGER   INTEGER
_______________________________________________________________________________

6         0

1 Rows. -- 11 msec.
SQL> select max (length (ProductName)) from Demo.demo.Products;
flag
INTEGER
_______________________________________________________________________________

32

1 Rows. -- 61 msec.
    
```

</div>

</div>

  

</div>

</div>
