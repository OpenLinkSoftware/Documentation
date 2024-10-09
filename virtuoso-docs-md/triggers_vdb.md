<div>

<div>

<div>

<div>

### 11.16.4. Triggers and Virtual Database

</div>

</div>

</div>

Triggers may be defined on tables residing on remote databases. The
semantic of triggers is identical but will of course only take place
when the manipulation takes place through the Virtuoso defining the
triggers. Trigger bodies may reference remote tables just as any other
procedure bodies can. Note that triggers can be used for replication,
i.e. one may define a local change to be mirrored to a remote table
using a trigger.

Consider an application with a warehouse supplying orders. There is a
total value of all orders kept at the warehouse level and there is the
total value of all order lines kept at the order level. When an order
line is added, both the order value and consequently the total order
value are updates. These values are maintained for insert, update and
delete of order line. On the other have, when an order is deleted, all
corresponding order lines must be deleted.

These rules are maintained with the below set of triggers.

``` screen
drop table T_WAREHOUSE;

drop table T_ORDER;

drop table T_ORDER_LINE;

create table T_WAREHOUSE (W_ID integer default 1,
              W_ORDER_VALUE float default 0,
              W_DATA varchar,
              primary key (W_ID));

create table T_ORDER (O_ID integer not null primary key, O_C_ID integer,
              O_W_ID integer default 1,
              O_VALUE numeric default 0,
              O_MODIFIED datetime);

create table T_ORDER_LINE (OL_O_ID integer,
               OL_I_ID integer,
               OL_QTY integer,
               OL_MODIFIED timestamp,
               OL_I_PRICE float default 1,
               primary key (OL_O_ID, OL_I_ID));

create index OL_I_ID on T_ORDER_LINE (OL_I_ID);

create trigger AMT_INS after insert on T_ORDER_LINE
{
  update T_ORDER
    set O_VALUE = O_VALUE + OL_QTY * OL_I_PRICE
    where O_ID = OL_O_ID;
}

create trigger AMT_DEL after delete on T_ORDER_LINE
{
  update T_ORDER
    set O_VALUE = O_VALUE - OL_QTY * OL_I_PRICE
    where O_ID = OL_O_ID;
}

create trigger AMT before update on T_ORDER_LINE referencing old as O
{
  update T_ORDER
    set O_VALUE = O_VALUE - O.OL_QTY * O.OL_I_PRICE + OL_QTY * OL_I_PRICE
    where O_ID = OL_O_ID;
}

create trigger W_VALUE before update (O_VALUE) on T_ORDER
     referencing old as O, new as N
{
  update T_WAREHOUSE
    set W_ORDER_VALUE = W_ORDER_VALUE - O.O_VALUE + N.O_VALUE
    where W_ID = O.O_W_ID;
}

create trigger O_DEL_OL after delete on T_ORDER order 2
{
  set triggers off;
  delete from T_ORDER_LINE where OL_O_ID = O_ID;
}

create trigger O_DEL_W  after delete on T_ORDER order 1
{
  update T_WAREHOUSE
    set W_ORDER_VALUE = W_ORDER_VALUE - O_VALUE
    where W_ID = O_W_ID;
}

create procedure ol_reprice_1 (in i_id integer, in i_price float)
{
  declare id integer;
  declare cr cursor for
    select OL_I_ID from T_ORDER_LINE;
  whenever not found goto done;
  open cr;
  while (1) {
    fetch cr into id;
    if (id = i_id)
      update T_ORDER_LINE set OL_I_PRICE = i_price where current of cr;
  }
 done:
  return;
}

create procedure ol_reprice_2 (in i_id integer, in i_price float)
{
  declare id integer;
  declare cr cursor for
    select OL_I_ID from T_ORDER_LINE order by OL_I_ID;
  whenever not found goto done;
  open cr;
  while (1) {
    fetch cr into id;
    if (id = i_id)
      update T_ORDER_LINE set OL_I_PRICE = i_price where current of cr;
  }
 done:
  return;
}

create procedure ol_del_i_id_2 (in i_id integer)
{
  declare id integer;
  declare cr cursor for
    select OL_I_ID from T_ORDER_LINE order by OL_I_ID;
  whenever not found goto done;
  open cr;
  while (1) {
    fetch cr into id;
    if (id = i_id)
      delete from T_ORDER_LINE where current of cr;
  }
 done:
  return;
}
```

<div>

|                              |                                                                                                                                                                                                   |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Compatibility:                                                                                                                                                                                    |
|                              | Virtuoso triggers are modeled after SQL 3. Omitted are the FOR EACH STATEMENT and related OLD TABLE AS phrases as well as the WHEN in the trigger body. The implementation is otherwise complete. |

</div>

</div>
