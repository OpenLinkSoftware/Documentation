<div>

<div>

</div>

<div>

## Name

replace — This replaces every occurrence of the second argument in the
first argument with the third argument.

</div>

<div>

## Synopsis

<div>

|                            |                              |
|----------------------------|------------------------------|
| `string `**`replace`**` (` | in `string ` varchar ,       |
|                            | in `what ` varchar ,         |
|                            | in `repl_with ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This replaces every occurrence of the second argument in the first
argument with the third argument. The arguments can be narrow or wide
strings.

<div>

**Example 24.317. Example:**

<div>

``` programlisting
SQL> select replace ('12345512345', '23', '-----');
  =   1-----4551-----45
```

</div>

</div>

  

</div>

</div>
