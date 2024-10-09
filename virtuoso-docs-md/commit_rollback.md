<div>

<div>

<div>

<div>

## 9.20. COMMIT WORK, ROLLBACK WORK Statement

</div>

</div>

</div>

These statements reset the current transaction. COMMIT WORK leaves all
the changes made by the current transaction in effect whereas ROLLBACK
work reverses them.

In both cases, the transaction will be in a fresh state, having no locks
and no changes that could be rolled back. The rollback operation always
succeeds, as any change is always reversible until committed. COMMIT
WORK may fail if the transaction had been marked to be canceled before
the COMMIT WORK operation started. A failed commit has the effect of a
rollback but it will signal a SQL STATE descriptive of the error, e.g.
40001 (deadlock).

These operations are typically not needed, since the SQLTransact ODBC
call and the ODBC autocommit mode are used instead for transaction
control. The only use for these statements is within stored procedures,
where it may be practical to break a long sequence of operations into
several transactions to reduce lock contention.

These can also be used together with the WHENEVER declaration to
automate retry upon deadlock inside stored procedures.

Triggers should not normally use these statements. The exception is the
case where a trigger detects a state violating application consistency
rules and decides to abort the transaction. This can be done by ROLLBACK
WORK, typically followed by a call to the signal function for notifying
the application.

<div>

**Example 9.37. Examples:**

<div>

``` programlisting
create procedure retry (in x integer)
{
  whenever sql state '40001' goto deal;
 again:
  -- action
  return;
 deadl:
   rollback work;
   goto again;
}

create trigger sal_negative on "Employee" after update ("Salary")
{
  if ("Salary" < 0) {
    rollback work;
    signal ('A0001', 'Salary cannot be negative');
  }
}
```

</div>

</div>

  

<div>

|                            |                                                                                                                       |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                             |
|                            | <a href="fn_txn_error.html" class="link" title="txn_error">txn_error</a> , <a href="fn_txn_killall.html" class="link" 
                              title="txn_killall">txn_killall</a> , <a href="fn_signal.html" class="link" title="signal">signal</a>                  |

</div>

</div>
