<div>

<div>

</div>

<div>

## Name

bif_arg , bif_array_arg , bif_array_or_null_arg , bif_bin_arg ,
bif_double_arg , bif_entity_arg , bif_float_arg , bif_long_arg ,
bif_long_or_char_arg , bif_string_arg , bif_string_or_null_arg ,
bif_string_or_wide_or_null_arg , bif_strses_arg — Get parameters for
built in function

</div>

<div>

## Synopsis

<div>

|                             |                             |
|-----------------------------|-----------------------------|
| `caddr_t `**`bif_arg`**` (` | caddr_t \* `qst ` ,         |
|                             | state_slot_t \*\* `args ` , |
|                             | int `nth ` ,                |
|                             | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                   |                             |
|-----------------------------------|-----------------------------|
| `caddr_t `**`bif_array_arg`**` (` | caddr_t \* `qst ` ,         |
|                                   | state_slot_t \*\* `args ` , |
|                                   | int `nth ` ,                |
|                                   | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                           |                             |
|-------------------------------------------|-----------------------------|
| `caddr_t `**`bif_array_or_null_arg`**` (` | caddr_t \* `qst ` ,         |
|                                           | state_slot_t \*\* `args ` , |
|                                           | int `nth ` ,                |
|                                           | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                 |                             |
|---------------------------------|-----------------------------|
| `caddr_t `**`bif_bin_arg`**` (` | caddr_t \* `qst ` ,         |
|                                 | state_slot_t \*\* `args ` , |
|                                 | int `nth ` ,                |
|                                 | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| `caddr_t `**`bif_double_arg`**` (` | caddr_t \* `qst ` ,         |
|                                    | state_slot_t \*\* `args ` , |
|                                    | int `nth ` ,                |
|                                    | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| `caddr_t `**`bif_entity_arg`**` (` | caddr_t \* `qst ` ,         |
|                                    | state_slot_t \*\* `args ` , |
|                                    | int `nth ` ,                |
|                                    | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                   |                             |
|-----------------------------------|-----------------------------|
| `caddr_t `**`bif_float_arg`**` (` | caddr_t \* `qst ` ,         |
|                                   | state_slot_t \*\* `args ` , |
|                                   | int `nth ` ,                |
|                                   | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                  |                             |
|----------------------------------|-----------------------------|
| `caddr_t `**`bif_long_arg`**` (` | caddr_t \* `qst ` ,         |
|                                  | state_slot_t \*\* `args ` , |
|                                  | int `nth ` ,                |
|                                  | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                          |                             |
|------------------------------------------|-----------------------------|
| `caddr_t `**`bif_long_or_char_arg`**` (` | caddr_t \* `qst ` ,         |
|                                          | state_slot_t \*\* `args ` , |
|                                          | int `nth ` ,                |
|                                          | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| `caddr_t `**`bif_string_arg`**` (` | state_slot_t \*\* `args ` , |
|                                    | int `nth ` ,                |
|                                    | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                            |                             |
|--------------------------------------------|-----------------------------|
| `caddr_t `**`bif_string_or_null_arg`**` (` | caddr_t \* `qst ` ,         |
|                                            | state_slot_t \*\* `args ` , |
|                                            | int `nth ` ,                |
|                                            | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                                    |                             |
|----------------------------------------------------|-----------------------------|
| `caddr_t `**`bif_string_or_wide_or_null_arg`**` (` | caddr_t \* `qst ` ,         |
|                                                    | state_slot_t \*\* `args ` , |
|                                                    | int `nth ` ,                |
|                                                    | char \* `func ` `)`;        |

<div>

 

</div>

</div>

<div>

|                                    |                             |
|------------------------------------|-----------------------------|
| `caddr_t `**`bif_strses_arg`**` (` | caddr_t \* `qst ` ,         |
|                                    | state_slot_t \*\* `args ` , |
|                                    | int `nth ` ,                |
|                                    | char \* `func ` `)`;        |

<div>

 

</div>

</div>

</div>

<div>

## Description

The bif\_....\_arg functions are used in the Virtuoso shared object.
They allow customization of the Virtuoso server. They are written in C
code, and linked with the Virtuoso shared object.

The \_or_null\_ variants of these functions represent the SQL null value
as a 00 pointer, even though getting the same argument with bif_arg()
would return a box with the DV_DB_NULL tag. All number functions will
coerce other types of numbers to the result type. All array argument
functions will accept any type of array. It is up to the VSE itself to
distinguish.

Virtuoso Server Extensions (VSEs) were formally referred to as Built-In
Functions (BIFs).

</div>

<div>

## Parameters

<div>

### qst

Query instance.

</div>

<div>

### args

input arguments.

</div>

<div>

### nth

which argument to retrieve (zero indexed).

</div>

<div>

### func

name of calling function. This will be printed in the SQL error message.

</div>

</div>

<div>

## Return Values

On success, return a valid pointer to the data retrieved, or NULL. A SQL
error is generated if the datatype is not valid. The bif_arg is the only
function not to have validation of a data type.

The values returned by any of these belong to the query instance, and
the bif is not authorized to modify or free them.

<div>

**Table 24.5. Return types**

<div>

| Function                       | Type validated and returned            |
|--------------------------------|----------------------------------------|
| bif_arg                        | Any type of data. (no data type check) |
| bif_array_arg                  | string or array data                   |
| bif_array_or_null_arg          | string or array or NULL data           |
| bif_bin_arg                    | binary data                            |
| bif_double_arg                 | double data                            |
| bif_entity_arg                 | XML entity data                        |
| bif_float_arg                  | float data                             |
| bif_long_arg                   | long data                              |
| bif_long_or_char_arg           | long or character data                 |
| bif_string_arg                 | string data                            |
| bif_string_or_null_arg         | string or null data                    |
| bif_string_or_wide_or_null_arg | strings, widestrings or null data      |
| bif_strses_arg                 | string session data                    |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.22. Creating a function my_length()**

<div>

A function called `my_length ` written by developers, may process a
string argument by making a call to `bif_string_arg` .

</div>

</div>

  

</div>

</div>
