<div>

<div>

</div>

<div>

## Name

txn_killall — kill all pending transactions

</div>

<div>

## Synopsis

<div>

|                          |                         |
|--------------------------|-------------------------|
| ` `**`txn_killall`**` (` | in `code ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function will terminate all pending transactions. This can be used
for resetting infinite loops in stored procedures etc.

The code determines the error reported to the client. Number 6 is
preferable, corresponding to the 'transaction rolled back due to
previous SQL error'. See
<a href="fn_txn_error.html" class="link" title="txn_error"><code
class="function">txn_error</code></a> for all supported codes.

Once any SQL statement or procedure notices that its transaction is
dead, e.g. deadlocked, it signals the error and takes appropriate
action, which is typically to signal the error to the caller and
ultimately to the client.

</div>

<div>

## Examples

``` programlisting
txn_killall (1);
```

-- kills all transactions with the S1T00 'timed out' error.

</div>

</div>
