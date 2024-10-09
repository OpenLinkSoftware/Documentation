<div>

<div>

</div>

<div>

## Name

get_keyword — Find a value in keyword vector

</div>

<div>

## Synopsis

<div>

|                          |                            |
|--------------------------|----------------------------|
| ` `**`get_keyword`**` (` | `keyword ` any ,           |
|                          | `searched_array ` vector , |
|                          | `default ` any ,           |
|                          | `no_copy ` integer `)`;    |

<div>

 

</div>

</div>

</div>

<div>

## Description

`get_keyword ` performs a case sensitive seek for the occurrence of
*`keyword`* from each even position of *`searched_array`* . If
found,this returns the element following the occurrence of the keyword.
If the keyword is not found this returns the default argument or NULL if
the default is not supplied.

</div>

<div>

## Parameters

<div>

### keyword

String key value to be searched in the searched_array at even positions.

</div>

<div>

### searched_array

An array of even length to be searched. Each even position is a string
to search. Each odd position can be any value that may then be returned.

</div>

<div>

### default

Any data to be returned if keyword is not matched in the searched_array.

</div>

<div>

### no_copy

By default no_copy is false (0). If passed as true (non-zero integer)
then the element to return is the original content of the array and the
place in the array from which the element came gets set to 0.

This must in some cases be true, for example when the data being
retrieved is not copyable, as in the case of a string output. While the
default behavior is to return a copy of the element get_keyword will
return the element itself and then set the place from which the element
was retrieved to 0 if this argument is true.

</div>

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

<div>

**Table 24.36. Errors signalled by `openxml `**

<div>

| SQL Code                              | Error Message                                                    | Virtuoso Code |
|---------------------------------------|------------------------------------------------------------------|---------------|
| <span class="errorcode">22023 </span> | get_keyword expects a vector of even length, not of length \<n\> | SR057         |

</div>

</div>

  

</div>

<div>

## Return Values

`get_keyword ` returns the matched data if it is found. Otherwise it
returns the *`default`* . When no *`default `* is defined, NULL is
returned.

</div>

<div>

## Examples

<div>

**Example 24.133. Sample calls**

<div>

``` programlisting
get_keyword(2,vector(1,'primero',2,'segundo',
    3,'tercero'),NULL)      -> segundo
get_keyword('tercero',vector('primero',1,'segundo',
    2,'tercero',3), 'NOT FOUND!'))  -> 3

x := vector ('a', 2);
y := get_keyword ('a', x, -1, 1);
The first call returns 2
y := get_keyword ('a', x, -1, 1);
the second call returns 0 as the data was set to 0 by the previous call.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_get_keyword_ucase.html" class="link"
title="get_keyword_ucase">get_keyword_ucase</a>

</div>

</div>
