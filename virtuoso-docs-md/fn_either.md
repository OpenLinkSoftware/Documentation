<div id="fn_either" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

either — conditionally return one of specified parameters

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_either" class="funcsynopsis">

|                     |                     |
|---------------------|---------------------|
| ` `**`either`**` (` | in `cond ` any ,    |
|                     | in `arg1 ` any ,    |
|                     | in `arg2 ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_either" class="refsect1">

## Description

either returns a copy of arg1 if cond is something else than integer 0
(zero). Otherwise, a copy of arg2 is returned.

</div>

<div id="params_either" class="refsect1">

## Parameters

<div id="id87490" class="refsect2">

### cond

Anything

</div>

<div id="id87493" class="refsect2">

### arg1

Anything

</div>

<div id="id87496" class="refsect2">

### arg2

Anything

</div>

</div>

<div id="ret_either" class="refsect1">

## Return values

A copy of arg1 or arg2, which could be of any type.

</div>

<div id="errors_either" class="refsect1">

## Errors

<div id="id87504" class="table">

**Table 24.26. Errors signalled by `either ` and `stringdate `**

<div class="table-contents">

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="examples_either" class="refsect1">

## Examples

<div id="ex_either_1" class="example">

**Example 24.97. Simple Example**

<div class="example-contents">

``` screen
SQL> select either (mod (1, 2), 'odd', 'even');
callret
VARCHAR
_______________________________________________________________________________

odd

1 Rows. -- 33 msec.
SQL> select either (isnull (strstr ('Simurg', 'imu')), 'imu not found', 'imu found');
callret
VARCHAR
_______________________________________________________________________________

imu found

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

</div>
