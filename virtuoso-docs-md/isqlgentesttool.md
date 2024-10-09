<div>

<div>

<div>

<div>

### 7.2.5. Using isql as a General Purpose Test Driver

</div>

</div>

</div>

isql can be used to automatically run SQL scripts which execute
statements, perform simple tests on the results and generate a report.
This can be used to automate tests of stored procedures or to benchmark
them.

Also note the use of & at the end of a command to spawn multiple isql
instances on the background. This is useful for automatically creating
concurrency situations for testing.

Consider the script:

``` programlisting
drop table tt;
create table tt (id int identity not null primary key, ctr int);
create procedure tt_fill (in n int)
{
  declare ctr int;
  ctr := 0;
  while (ctr < n){
    insert into tt (ctr) values (ctr);
    ctr := ctr + 1;
  }
}

tt_fill (10000) &
tt_fill (10000) &
tt_fill (10000) &
tt_fill (10000) &

wait_for_children;
select count (*), count (distinct ctr)  from tt;

echo both $if $equ $last[1] 40000 "PASSED" "***FAILED";
echo both " Inserted " $last[1] " rows\n";
echo both $if $equ $last[2] 10000 "PASSED" "***FAILED";
echo both " Inserted " $last[2] " distinct ctr values\n";
```

Now suppose the above text were in the file test.sql. The command

``` programlisting
isql 1111 errors=stdout <test.sql >test.out
```

would print the diagnostics to the standard error and the full trace to
test.out. Note the errors=stdout would direct the error message for no
table in the initial drop table to the text.out file, so the console
would just print:

``` programlisting
PASSED Inserted 40000 rows
PASSED Inserted 10000 distinct ctr values
```

</div>
