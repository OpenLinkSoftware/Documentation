<div>

<div>

</div>

<div>

## Name

either — conditionally return one of specified parameters

</div>

<div>

## Synopsis

<div>

|                     |                     |
|---------------------|---------------------|
| ` `**`either`**` (` | in `cond ` any ,    |
|                     | in `arg1 ` any ,    |
|                     | in `arg2 ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

either returns a copy of arg1 if cond is something else than integer 0
(zero). Otherwise, a copy of arg2 is returned.

</div>

<div>

## Parameters

<div>

### cond

Anything

</div>

<div>

### arg1

Anything

</div>

<div>

### arg2

Anything

</div>

</div>

<div>

## Return values

A copy of arg1 or arg2, which could be of any type.

</div>

<div>

## Errors

<div>

**Table 24.25. Errors signalled by `either ` and `stringdate `**

<div>

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.97. Simple Example**

<div>

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
