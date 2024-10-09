<div>

<div>

</div>

<div>

## Name

sprintf_iri — returns a formatted string that is marked as an IRI
string.

</div>

<div>

## Synopsis

<div>

|                          |                    |
|--------------------------|--------------------|
| ` `**`sprintf_iri`**` (` | `format ` string , |
|                          | `arg_1 ` any ,     |
|                          | `... ` ,           |
|                          | `arg_x ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

sprintf_iri is similar to sprintf and returns a new string formed by
"printing" a variable number of arguments arg_1 - arg_x according to the
format string format. The difference is that the returned string is
marked as being IRI string so some applications and clients may
distinguish between RDF reference string and RDF literal.

<div>

|                              |                                                                                                                                                                                                                                                                                              |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                         |
|                              | No matter what is the default server charset or default encoding of host OS, IRI strings are supposed to be in UTF-8 encoding so string arguments to print as well as the format itself are supposed to be UTF-8. Application may use calls of <a href="fn_charset_recode.html" class="link" 
                                title="charset_recode"><code class="function">charset_recode </code></a> as arguments.                                                                                                                                                                                                        |

</div>

</div>

<div>

## Examples

<div>

**Example 24.390. Simple Use**

<div>

``` screen
create function job_history(
  in EMPLOYEE_ID integer,
  in START_DATE date) returns varchar
{
return sprintf_iri
('http://demo.openlinksw.com:8890/hr/job_history#%d_%s',
EMPLOYEE_ID, cast (START_DATE as varchar) );
};
```

</div>

</div>

  

</div>

</div>
