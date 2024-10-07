<div id="udtserilizingtypeinst" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.12. Serializing & Deserializing Type Instances

</div>

</div>

</div>

Virtuoso allows serializing and deserializing of non TEMPORARY type
instances. This means that the instances can be saved as a column value
and can be used with the serialize/deserialize SQL functions.

<div id="ex_serializetypeinst" class="example">

**Example 9.11. Storing User Defined Types**

<div class="example-contents">

This creates a type SER_UDT, a table UDT_TABLE with a DATA column
capable of storing SER_UDT instances, stores an instance of SER_UDT into
the table and demonstrates some selects using the stored instance.

``` programlisting
create type SER_UDT as (A integer default 12)
  method NEGATE () returns integer;

create method NEGATE () returns integer for SER_UDT
{
  return SELF.A * -1;
}

create table UDT_TABLE (ID integer primary key, DATA SER_UDT);

insert into UDT_TABLE (ID, DATA) values (1, new SER_UDT ());

select C.DATA.A from UDT_TABLE C where C.ID = 1;

select C.ID from UDT_TABLE C where C.DATA.A > 10;

select C.ID from UDT_TABLE C where C.DATA.NEGATE() < -10;
```

Note that the table alias is mandatory here.

``` programlisting
select ID from UDT_TABLE where DATA.A > 10;
```

and

``` programlisting
select ID from UDT_TABLE where DATA.NEGATE() < -10;
```

will both yield a syntax error.

</div>

</div>

  

The columns of a certain type allow storing subtype instances as well.
The subtype instances will not be converted to the their supertype when
stored.

If we define the type `SER_UDT_SUB` as:

``` programlisting
create type SER_UDT_SUB under SER_UDT
  as (B integer default 13);
```

then we can do:

``` programlisting
insert into UDT_TABLE (ID, DATA) values (2, new SER_UDT_SUB ());

select (C.DATA as SER_UDT_SUB).B from UDT_TABLE C where C.ID = 2;
```

Type instances can be stored into an ANY column:

``` programlisting
create table ANY_TABLE (ID integer primary key, DATA any);

insert into ANY_TABLE (ID, DATA) values (1, new SER_UDT());

select (C.DATA as SER_UDT).A from ANY_TABLE C where C.ID = 1;
```

<div id="ex_serializebifs" class="example">

**Example 9.12. SERIALIZE/DESERIALIZE VSEs example**

<div class="example-contents">

``` programlisting
select (DESERIALIZE (SERIALIZE (new SER_UDT ())) as SER_UDT).A;
```

The SERIALIZE VSE can be used to store larger type instances into LONG
VARCHAR columns. For example:

``` programlisting
create table LOB_TABLE (ID integer primary key, LOB_DATA LONG VARCHAR);

insert into LOB_TABLE (ID, LOB_DATA) values (1, SERIALIZE (new SER_UDT()));

select (DESERIALIZE (BLOB_TO_STRING (LOB_DATA)) as SER_UDT).A
  from LOB_TABLE where ID = 1;
```

</div>

</div>

  

The serialization/deserialization for the non-SQL type instances is done
by the means of the hosted language (Java Object serialization API and
CLR Binary serialization API). So to be serialized/deserialized
correctly the Java classes must implement the java.io.Serializable
interface and the CLR classes should have the \[Serializable\] attribute
set. For details refer to the respective API documentation.

</div>
