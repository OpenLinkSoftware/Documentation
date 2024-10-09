<div>

<div>

</div>

<div>

## Name

quote_dotted — Returns an quoted identifier.

</div>

<div>

## Synopsis

<div>

|                                  |                               |
|----------------------------------|-------------------------------|
| `varchar `**`quote_dotted`**` (` | in `dsn ` varchar ,           |
|                                  | in `identifier ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The `quote_dotted() ` function will return the identifier (table name or
column name) appropriately quoted for the remote data source. This
function will obtain the appropriate quote characters from the remote
data source. This function can be used in conjunction with rexecute
function.

</div>

<div>

## Parameters

<div>

### dsn

The remote DSN name.

</div>

<div>

### identifier

The string containing the identifier. The identifier can be a one, two
or three part name, separated with the dot, '.', character.

</div>

</div>

<div>

## Return Types

A string will be returned containing the quoted identifier.

</div>

<div>

## Errors

<div>

**Table 24.72. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                         | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">VD011 </span> | <span class="errortext">Supplied DSN \[name\] is not valid </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.250. Using the quote_dotted() function**

<div>

This simple example shows an identifier from a remote Oracle data source
being correctly quoted using the quote_dotted() function from ISQL.

``` screen
SQL> select quote_dotted ('oracle', 'DEMO.EMP');
callret
VARCHAR
_______________________________________________________________________________

"DEMO"."EMP"

1 Rows. -- 2 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute() </code></a>

</div>

</div>
