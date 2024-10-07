<div id="fn_sprintf_or_null" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sprintf_or_null — returns a formatted string or null if any of the
arguments except the first is null.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sprintf_or_null" class="funcsynopsis">

|                              |                    |
|------------------------------|--------------------|
| ` `**`sprintf_or_null`**` (` | `format ` string , |
|                              | `arg_1 ` any ,     |
|                              | `... ` ,           |
|                              | `arg_x ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_28" class="refsect1">

## Description

sprintf_or_null is similar to sprintf and returns a new string formed by
"printing" a variable number of arguments arg_1 - arg_x according to the
format string format. The difference is that the function can return
null if any of the arguments except the first one is null.

</div>

<div id="examples_sprintf_or_null" class="refsect1">

## Examples

<div id="ex_sprintf_or_null" class="example">

**Example 24.392. Simple Use**

<div class="example-contents">

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
