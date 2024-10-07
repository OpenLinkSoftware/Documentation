<div id="triggers_on_views" class="section">

<div class="titlepage">

<div>

<div>

### 11.16.2. Triggers on Views

</div>

</div>

</div>

In virtuoso you can create a trigger on a view. To accomplish this there
is only one condition: The first trigger for a given type of event
(INSERT/DELETE/UPDATE) must be an INSTEAD OF trigger. After such a
trigger is defined then any type of triggers (AFTER/BEFORE) can be
added.

<div id="ex_createtriggeronview" class="example">

**Example 11.10. Creating a trigger on view**

<div class="example-contents">

We will make two tables and an union view for them. Then we will create
a trigger which inserts a new record in one of the tables according to
values.

First lets create the tables and the view.

``` programlisting
create table first_table(
  id integer not null primary key,
  txt varchar
);

create table second_table(
  id integer not null primary key,
  txt varchar
);

create view all_tables (id,from_table,txt)
as select id,'first',txt from first_table
union all
select id,'second',txt from second_table;
```

Now lets create a trigger instead of insert for the view and insert some
data.

``` programlisting
create trigger insert_all_tables
  instead of insert on all_tables referencing new as N{
    if(N.from_table = 'first' or N.from_table = 'all')
      insert into first_table (id,txt) values(N.id,N.txt);

    if(N.from_table = 'second' or N.from_table = 'all')
      insert into second_table (id,txt) values(N.id,N.txt);
  };

  insert into all_tables (id,from_table,txt) values (1,'first','into first');
  insert into all_tables (id,from_table,txt) values (2,'second','into second');
  insert into all_tables (id,from_table,txt) values (3,'all','into all');

  select * from all_tables;

  id       from_table  txt
  INTEGER  VARCHAR  VARCHAR
  _______________________________________________________________________________

  1        first    into first
  3        first    into all
  2        second   into second
  3        second   into all
```

</div>

</div>

  

You can see that the trigger inserted the data in the two tables
according the value of from_table.

</div>
