<div id="createaggrsam" class="section">

<div class="titlepage">

<div>

<div>

### 9.27.3. Examples of User-Defined Aggregates

</div>

</div>

</div>

<div id="createaggruri" class="section">

<div class="titlepage">

<div>

<div>

#### Aggregate for Composing URIs

</div>

</div>

</div>

Consider a table USER_ATTRIBUTES that contains configuration data for
users of some remote web-service. Every user have a number of parameters
that should be passed to that service as a part of URI when HTTP PUT is
used. Every row of USER_ATTRIBUTES contain a name and a value of some
parameter for some type of users.

``` programlisting
create table USER_ATTRIBUTES    (
    ID      integer not null primary key,
    ATTR_NAME   varchar,
    USER_TYPE   char(4),
    ATTR_VALUE  varchar );

insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (1, 'key1', 't1', 'val1');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (2, 'key3', 't1', 'val3');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (3, 'key4', 't1', 'val4');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (4, 'key5', 't2', 'val5');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (5, 'key6', 't2', 'val6');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (6, 'key2', 't1', 'val2');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (7, 'key8', 't3', 'val8');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (8, 'key7', 't2', 'val7');
insert into USER_ATTRIBUTES (ID, ATTR_NAME, USER_TYPE, ATTR_VALUE) values (9, 'key9', 't4', 'val9');
```

The application contains number of places where the resulting URI for a
user should be calculated. The URI is either an empty string (if no
attributes are set) or a string that starts from '?' char and consists
of tokens like "attribute_name=attribute_value" delimited by "&"
character.

``` programlisting
create function ATTR_URI_INIT (inout _env any)
{
  _env := string_output(); -- The "accumulator" is a string session. Initially it is empty.
}

create function ATTR_URI_ACC (
  inout _env any,       -- The first parameter is used for passing "accumulator" value.
  in _attrname varchar,     -- Second parameter gets the value passed by first parameter of aggregate call.
  in _attrvalue varchar )   -- Third parameter gets the value passed by second parameter of aggregate call.
{
  if (_attrname is null)    -- Attributes with NULL names should not affect the result.
    return;
  -- The non-NULL name of attribute is appended to "accumulator"
  http ('&', _env);
  http_url (_attrname, null, _env);
  http ('=', _env);
  if (_attrvalue is null)   -- NULL values of attributes are not printed.
    return;
  -- The non-null value of attribute is appended to "accumulator"
  http_url (_attrvalue, null, _env);
}

create function ATTR_URI_FINAL (inout _env any) returns varchar
{
  declare _res varchar;
-- For empty groups in the resultset,  the initialization may be bypassed
-- so the value of "accumulator" remains NULL.
-- Finalization function should always handle such case
-- by signalling an error (like built-in AVG function) or
-- by returning some default value (like this function)
  if (_env is null)
    return '';
  _res := string_output_string (_env);
  if (_res = '')
    return '';
-- In nonempty lists of URI attributes, the first '&' should be replace with '?'
  aset (_res, 0, 63);
  return _res;
}

create aggregate ATTR_URI (in _key varchar, in _val varchar) returns varchar
  from ATTR_URI_INIT, ATTR_URI_ACC, ATTR_URI_FINAL;
```

Now we are ready to run some tests. Let's try the typical case:

``` programlisting
select ATTR_URI (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES where USER_TYPE='t1';
URI
VARCHAR
_______________________________________________________________________________
?key1=val1&key2=val2&key3=val3&key4=val4
1 Rows. -- 0 msec.
```

Now let's try the case of empty set of rows to aggregate:

``` programlisting
select ATTR_URI (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES where USER_TYPE='nosuchtype';
URI
VARCHAR
_______________________________________________________________________________

1 Rows. -- 0 msec.
```

OK, we've got an empty string. Now let's try the final case:

``` programlisting

select ATTR_URI (ATTR_NAME, NULL) as URI from USER_ATTRIBUTES;
URI
VARCHAR
_______________________________________________________________________________
?key1=&key2=&key3=&key4=&key5=&key6=&key7=&key8=&key9=
1 Rows. -- 0 msec.
```

The created aggregate is very fast but unusable if intermediate results
should be saved in a temporary table. It may happen if the SQL statement
contains clauses such as DISTINCT, ORDER BY, GROUP BY, especially if the
grouping columns are not the first columns of the primary key, or if SQL
optimizer thinks that it is the fastest way to calculate a join. The
following version produces the same results and may work with grouping,
but may be a bit slower because concatenation of long strings is slower
than writing to a string session:

``` programlisting
create procedure ATTR_URI2_INIT (inout _env varchar)
{
  _env := ''; -- The "accumulator" is a string. Initially it is empty.
}

create procedure ATTR_URI2_ACC (
  inout _env varchar,  in _attrname varchar,  in _attrvalue varchar ){
  if (_attrname is null)-- Attributes with NULL names should not affect the result.
    return;
  if (_attrvalue is null)-- NULL values of attributes are not printed.
    _env := concat (_env, sprintf('&amp;%U', _attrname));
  else -- The non-null value of attribute is appended to "accumulator"
    _env := concat (_env, sprintf('&amp;%U=%U', _attrname, _attrvalue));
}

create function ATTR_URI2_FINAL (inout _env any) returns varchar
{
-- For empty groups in the result set,  the initialization may be bypassed
-- so the value of "accumulator" remains NULL.
-- Finalization function should always handle such case
-- by signaling an error (like built-in AVG function) or
-- by returning some default value (like this function)
  if (_env is null)
    return '';
  if (_env = '')
    return '';
-- In nonempty lists of URI attributes, the first '&amp;' should be replace with '?'
  aset (_env, 0, 63);
  return _env;
}

create aggregate ATTR_URI2 (in _key varchar, in _val varchar) returns varchar
  from ATTR_URI2_INIT, ATTR_URI2_ACC, ATTR_URI2_FINAL;

select ATTR_URI2 (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES where USER_TYPE='t1'
URI
VARCHAR
_______________________________________________________________________________
?key1=val1&key3=val3&key4=val4&key2=val2
1 Rows. -- 0 msec.

select USER_TYPE, ATTR_URI2 (ATTR_NAME, ATTR_VALUE) as URI from USER_ATTRIBUTES group by USER_TYPE
USER_TYPE  URI
VARCHAR  VARCHAR
_______________________________________________________________________________
t2       ?key5=val5&key6=val6&key7=val7
t1       ?key1=val1&key3=val3&key4=val4&key2=val2
t4       ?key9=val9
t3       ?key8=val8
4 Rows. -- 0 msec.
```

</div>

<div id="createaggrxml" class="section">

<div class="titlepage">

<div>

<div>

#### Aggregate for Composing XMLs

</div>

</div>

</div>

Virtuoso offers variety of ways to place relational data into XML
documents, and two best of them are select statements with FOR XML
clause and XML views. But in some rare cases you may prefer to compose
XML as an output of plain select statement, e.g. to get a few percent
faster code.

Among other things, the CREATE XML VIEW statement creates set of
Virtuoso/PL functions that return various XML trees. Those functions use
special 'node building' vectors to store intermediate results. NODEBLD
(which stands for 'Node Building vector') stores a partially built XML
tree. A xte_nodebld() function returns a new empty NODEBLD that may be
converted into an element of XML tree in the future. xte_nodebld_acc()
appends new children to an existing NODEBLD. xte_node_from_nodebld()
converts NODEBLD into ready-to-use XML tree. xte_nodebld_final() may
work either as xte_node_from_nodebld() or as a finalization function of
user defined aggregate.

``` programlisting
create aggregate XTE_NODEBLD (in _child any) returns any
  from xte_nodebld_init, xte_nodebld_acc, xte_nodebld_final;
```

The use of this aggregate is not as easy as creating XML views, but it
avoids creating persistent objects:

``` programlisting
select
  xml_tree_doc (
    xte_node_from_nodebld (
      xte_head ('UserAttributes'),
      XTE_NODEBLD (
    xte_node (xte_head ('Row', 'Id', ID, 'UserType', USER_TYPE),
      xte_node (xte_head ('Attr', 'Name', ATTR_NAME),
        ATTR_VALUE ) )
      ) ) )
  from USER_ATTRIBUTES;
callret
VARCHAR
_______________________________________________________________________________
<UserAttributes>
<Row
xml:id="1" UserType="t1"><Attr Name="key1">val1</Attr></Row>
<Row
xml:id="2" UserType="t1"><Attr Name="key2">val2</Attr></Row>
<Row
xml:id="3" UserType="t1"><Attr Name="key3">val3</Attr></Row>
<Row
xml:id="4" UserType="t1"><Attr Name="key4">val4</Attr></Row>
<Row
xml:id="5" UserType="t2"><Attr Name="key5">val5</Attr></Row>
<Row
xml:id="6" UserType="t2"><Attr Name="key6">val6</Attr></Row>
<Row
xml:id="7" UserType="t2"><Attr Name="key7">val7</Attr></Row>
<Row
xml:id="8" UserType="t3"><Attr Name="key8">val8</Attr></Row>
<Row
xml:id="9" UserType="t4"><Attr Name="key9">val9</Attr></Row>
</UserAttributes>
1 Rows. -- 0 msec.
```

The function xml_tree_doc() is used because there is no standard way to
print an XML tree without making a complete XML entity whose underlying
XML document consists of the given XML tree.

``` programlisting
select
  xml_tree_doc (
    xte_node_from_nodebld (
      xte_head ('AttrStatistics'),
      XTE_NODEBLD (
    xte_node (xte_head ('Row', 'UserType', groups.type, 'AttrCount', groups.cnt))
  ) ) )
  from
    (select USER_TYPE as type, COUNT (*) as cnt from USER_ATTRIBUTES group by USER_TYPE) groups;
callret
VARCHAR
_______________________________________________________________________________
<AttrStatistics>
<Row UserType="t2" AttrCount="3" />
<Row UserType="t1" AttrCount="4" />
<Row UserType="t4" AttrCount="1" />
<Row UserType="t3" AttrCount="1" />
</AttrStatistics>
1 Rows. -- 0 msec.
```

</div>

</div>
