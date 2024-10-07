<div id="virtuosofaq31" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.31. Do you provide the ability to atomically add a set of triples, where either all are added or none are added?

</div>

</div>

</div>

Yes. Doing this with millions of triples per transaction may run out of
rollback space. Also, there is risk of deadlock if multiple such inserts
run at the same time. For good concurrency, the inserts should be of
moderate size. As usual, deadlocks are resolved by aborting one of the
conflicting transactions.

</div>
