<div>

<div>

</div>

<div>

## Name

set_row_count — sets the affected rows counter in the current context or
in the context of the caller

</div>

<div>

## Synopsis

<div>

|                                   |                           |
|-----------------------------------|---------------------------|
| `integer `**`set_row_count`**` (` | in `increment ` integer , |
|                                   | in `what ` integer `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function set_row_count () is used to set the affected rows counter
in the current context or in the context of the caller. Therefore it can
be used to set the affected rows counter (returned by `row_count()` ) in
places where an instead of trigger is used. If result of decrement of
the affected rows counter is an negative integer it will be set to zero.

</div>

<div>

## Parameters

<div>

### increment

An integer to be added to the affected rors counter, can be negative
also

</div>

<div>

### what

The what have to be 0 or 1, 0 is the default. 0 - for update in current
context the counter, 1 - to update the counter in context of the caller.

</div>

</div>

<div>

## Return Types

The function returns new value of the affected rows , or -1 if action is
not applicable.

</div>

<div>

## Examples

<div>

**Example 24.372. Setting the affected rows counter in instead of
trigger**

<div>

The following SQL script will make two instead of triggers on atable
"hid" and inside them will are called set_row_count to set the rows
inserted or updated in the second table. Also there are two procedures
which are used to demonstrate the return value of row_count.

``` programlisting
      create table hid (id integer primary key, dt varchar);
      create table sho (id1 integer primary key, dt1 varchar);

      create trigger i_hid instead of insert on hid  
      {
        insert into sho values (id, dt);
        set_row_count (row_count(), 1);
      };

      create trigger u_hid instead of update on hid 
      {
        update sho set dt1 = dt where id1 = id;
        set_row_count (row_count(), 1);
      };

      create procedure test_ins ()
      {
        insert into hid select * from chid;
        return row_count();
      };

      create procedure test_upd ()
      {
        update hid set dt = '';
        return row_count ();
      };

      
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_row_count.html" class="link" title="row_count"><code
class="function">row_count() </code></a>

</div>

</div>
