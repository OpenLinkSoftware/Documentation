<div>

<div>

<div>

<div>

### 9.35.2. Parallel Insert With File Tables and Transactions

</div>

</div>

</div>

A file table is copied into a database resident table with an INSERT...
SELECT statement. Such a statement executes in parallel if the session
is in auto commit mode, i.e. log_enable (2) or log_enable (3) has been
previously executed on the session.

A file can be loaded inside a transaction if the connection is not in
auto commit log_enable (2) or 3. This will be multithreaded if
enable_mt_txn is 1 in the \[Flags\] section of the ini file or
\_\_dbf_set ('enable_mt_txn', 1) has been executed previously. The
setting is global. Defaults vary according to server version. Use
sys_stat ('enable_nt_txn') to read the value of the setting.

For long files the transaction is liable to run out of rollback space.
File table operations as such do not affect the transaction context.
Explicit commits may be interspersed in a select statement from a file
or other tables.

For example, the history keeping dimension updates from TPC DS can be
implemented as follows. The item table is a history keeping dimension
that has an index on the i_item_id business key and has a primary key of
item surrogate key, with a new value for each version of the item
record. The item record has a start and end date (i_rec_start_date,
i_rec_end_date) to mark the period of validity of the information. A
null value in item_rec_end_date marks the currently applicable record.
When the item data is updated, the, a new item is inserted and the
previously current item record has its end date set to the current date.
These operations must occur atomically. Otherwise the implementation may
choose whether to update many item records in the same transaction.

In the below listing most columns have been left out for brevity:

``` programlisting
CREATE PROCEDURE item_update (in i_id varchar,...)
{
  vectored;

  UPDATE item
     SET i_rec_end_date = curdate
   WHERE i_id = i_id
     AND i_rec_end_date IS NULL;

  INSERT INTO item (i_ietm_sk, i_item_id, i_rec_end_date,...)
            VALUES (sequence_next ('item_sk_seq'), i_id, NULL,... )
  not vectored { COMMIT WORK};
}

SELECT COUNT (item_update (i_item_id,....)
  FROM item_f....;
```

The select statement call the item_update procedure on a vector of item
ids and other columns. The procedure marks the expired record and
inserts the new record, assigning new surrogate keys from a sequence.
After each batch it performs one commit. The next batch of items are
updated in a separate transaction.

This should be run on a single thread. In a multithreaded transaction
the threads may not issue individual commits. The code could be
multithreaded by leaving out the commit from the stored procedure. Then
the commit would have to be after the completion of the select
statement.

The following isql script bulk loads a whole TPC-H database. We leave
out the create tables and ft_set_files for brevity, they are all as in
the part example above.

``` programlisting
log_enable (2); INSERT INTO lineitem SELECT * FROM lineitem_f &
log_enable (2); INSERT INTO orders   SELECT * FROM orders_f &
log_enable (2); INSERT INTO customer SELECT * FROM customer_f &
log_enable (2); INSERT INTO part     SELECT * FROM part_f &
log_enable (2); INSERT INTO partsupp SELECT * FROM partsupp_f &
log_enable (2); INSERT INTO supplier SELECT * FROM supplier_f &
log_enable (2); INSERT INTO nation   SELECT * FROM nation_f &
log_enable (2); INSERT INTO region   SELECT * FROM region_f &

wait_for_children;
checkpoint;
```

A multithreaded, non-logged, non-transactional insert is started for
each table-file pair as a background task. The wait_for_children isql
command waits for all the background tasks to complete. The checkpoint
statement makes the state durable. Killing the server in before the
checkpoint would result in the server starting in a state with none of
the effects of the bulk load present, since the log_enable(2) turns off
logging. The database is online during the bulk load and the progress
may be followed by periodically counting the tables, for example.

</div>
