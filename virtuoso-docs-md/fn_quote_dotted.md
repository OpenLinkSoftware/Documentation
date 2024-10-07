<div id="fn_quote_dotted" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

quote_dotted — Returns an quoted identifier.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_quote_dotted" class="funcsynopsis">

|                                  |                               |
|----------------------------------|-------------------------------|
| `varchar `**`quote_dotted`**` (` | in `dsn ` varchar ,           |
|                                  | in `identifier ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_quote_dotted" class="refsect1">

## Description

The `quote_dotted() ` function will return the identifier (table name or
column name) appropriately quoted for the remote data source. This
function will obtain the appropriate quote characters from the remote
data source. This function can be used in conjunction with rexecute
function.

</div>

<div id="params_quote_dotted" class="refsect1">

## Parameters

<div id="id99835" class="refsect2">

### dsn

The remote DSN name.

</div>

<div id="id99838" class="refsect2">

### identifier

The string containing the identifier. The identifier can be a one, two
or three part name, separated with the dot, '.', character.

</div>

</div>

<div id="ret_quote_dotted" class="refsect1">

## Return Types

A string will be returned containing the quoted identifier.

</div>

<div id="errors_quote_dotted" class="refsect1">

## Errors

<div id="id99846" class="table">

**Table 24.73. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                         | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">VD011 </span> | <span class="errortext">Supplied DSN \[name\] is not valid </span> |             |

</div>

</div>

  

</div>

<div id="examples_quote_dotted" class="refsect1">

## Examples

<div id="ex_quote_dotted" class="example">

**Example 24.250. Using the quote_dotted() function**

<div class="example-contents">

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

<div id="seealso_quote_dotted" class="refsect1">

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute"><code
class="function">rexecute() </code></a>

</div>

</div>
