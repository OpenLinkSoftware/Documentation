<div id="asyncexecmultithread" class="section">

<div class="titlepage">

<div>

<div>

## 11.12. Asynchronous Execution and Multithreading in Virtuoso/PL

</div>

</div>

</div>

Many application tasks benefit from parallel execution. This is
specially true of I/O intensive workloads where each thread spends a
large amount of time waiting for the network or disks. Typical tasks
include crawling the web and importing large data sets. The whole
process must not stop just because there is a file cache miss or because
there is round trip latency or a name resolution delay on the net.

To this effect, Virtuoso/PL provides the async_queue object. A stored
procedure may create an async_queue that will be served by a pool of
worker threads. The size of this pool can be set when creating the
queue.

The thread which made the queue can use the queue to pass
procedure/parameter list pairs to the threads. If a thread is available,
the thread will execute the request, if not, the next thread of the pool
to become free will take the oldest queued item and execute it. Thus the
queue is served in a FIFO fashion multiplexed over n threads.

The owner of the queue can check on the results of execution either
collectively or individually. Each worker thread has its own transaction
and worker threads may end up waiting for each other own database locks
and can deadlock. The worker thread code is responsible for committing
its own transaction and handling any deadlock retries or such.

When the thread owning the queue makes a request, a request number is
returned. This number can be used to later request the return value and
error status of the request. A queue cannot be persisted in a database
table and cannot be passed between threads. A queue can be passed
between procedures and kept in data structures such as arrays. Queue are
internally reference counted and when the last reference drops the queue
is freed. If a queue is freed while there is still activity on behalf of
the queue, the activities that are ongoing are finished, all requests
that are not started are discarded and all values and error states are
discarded. The queue and associated resources are thereafter freed.

There is a pool of 20 threads that are shared among all async_queues on
the system. Thus, the count of threads given for the queue is a maximum
and does not guarantee that this quantity of threads be used in reality.
If no thread is available in the pool, i.e. other async queues have
exhausted the entire pool, the thread making the request ends up
executing the item synchronously. One should take this possibility into
account when deciding transaction boundaries, otherwise this is
transparent and the calling thread still gets a request handle and can
later check for its completion.

Queues take procedures and argument lists instead of texts of SQL
statements in order to save the time of compiling the text. It is
desirable for best performance to supply the name of the procedure in
its full form, with full qualification and matching case.

Consider the following code samples:

``` programlisting
create table aqi (n int);

-- The worker procedure. Insert one row and commit.

create procedure INS1 (in n int)
{
  --dbg_obj_print ('ins1 ', n);
  insert into AQI (N) values (n);
  commit work;
  return '22';
}

create procedure taq1 (in x int, in thrs int := 1)
{
  declare aq, res, err any;
  declare n int;
  aq := async_queue (thrs);
  for (n:= 0; n < x; n:=n+1)
    {
      res := aq_request (aq, 'DB.DBA.INS1', vector (n));
    }
  return (aq_wait (aq, res, 1, err));
}

-- This procedure makes a queue with a given number of worker threads, then makes a set of requests and waits for the result
of the last one. Note that this is not necessarily the last to complete if there are multiple threads serving the queue.
```

<div id="synchronization" class="section">

<div class="titlepage">

<div>

<div>

### 11.12.1. Synchronization

</div>

</div>

</div>

It is possible to add requests to a queue at all times. It is also
possible to check for the result of any request made so far, by either
blocking to wait for it or just checking its status.

``` programlisting
aq_wait (in aq any, in req_no int, in block int, out err any) returns any
```

The aq_wait function takes the queue, a request number returned by
aq_request, a blocking flag and an output parameter for the error state.

If there was no error, the error state is set to 0. If the procedure was
undefined, the error state is set to 2. If there was a SQL state
signalled from the procedure called on the worker thread, the error
state is set to an array of three elements: The integer 3, the SQL state
string and the text of the message. If aq_wait is terminated by an
external event, then an error indicating this is signalled and the state
waited for is lost. This can only happen when all transactions are
killed by shutdown or going to a single user state.

If the blocking flag was zero and the request was not complete, then the
error output parameter is set to 1 and 1 is returned.

Once aq_wait has retrieved a state, the state is no longer retained in
the queue.

The aq_wait_all function allows waiting for all activity to complete but
discards individual return states. If some of running activities is
terminated by sql error, this error will be raised in the thread
executing aq_wait_all function call.

Note that it is possible to get a deadlock between the requesting thread
and a worker thread and that this deadlock cannot be detected by the
database engine since this does not involve a cycle in database locks
themselves. Thus, aq_wait signals an error if the thread calling it
holds database locks. Manually committing or rolling back before calling
aq_wait is necessary if the thread can belong to a transaction that
holds locks.

Thus, it is most practical to explicitly commit all work on the
requesting thread before calling aq_wait or aq_wait_all.

``` programlisting
create procedure taq_all (in x int, in thrs int := 1)
{
  declare aq, res, err any;
  declare n int;
  aq := async_queue (thrs);
  for (n:= 0; n < x; n:=n+1)
    {
      res := aq_request (aq, 'DB.DBA.INS1', vector (n));
    }
  aq_wait_all (aq);
}

-- This procedure is guaranteed to wait for all requests to be completed but will discard individual error states.
```

</div>

</div>
