<div>

<div>

</div>

<div>

## Name

sprintf_or_null — returns a formatted string or null if any of the
arguments except the first is null.

</div>

<div>

## Synopsis

<div>

|                              |                    |
|------------------------------|--------------------|
| ` `**`sprintf_or_null`**` (` | `format ` string , |
|                              | `arg_1 ` any ,     |
|                              | `... ` ,           |
|                              | `arg_x ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

sprintf_or_null is similar to sprintf and returns a new string formed by
"printing" a variable number of arguments arg_1 - arg_x according to the
format string format. The difference is that the function can return
null if any of the arguments except the first one is null.

</div>

<div>

## Examples

<div>

**Example 24.392. Simple Use**

<div>

``` screen
create function job_history(
  in EMPLOYEE_ID integer,
  in START_DATE date) returns varchar
{
return sprintf_or_null
('http://demo.openlinksw.com:8890/hr/job_history#%d_%s',
EMPLOYEE_ID, cast (START_DATE as varchar) );
};
```

</div>

</div>

  

</div>

</div>
