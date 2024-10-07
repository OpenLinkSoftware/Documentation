<div id="vexqrparlconfp" class="section">

<div class="titlepage">

<div>

<div>

### 11.23.2. Configuration Parameters for Vectoring and Parallelization

</div>

</div>

</div>

The following virtuoso.ini \[Parameters\] section entries concern query
parallelization and vectoring:

Note: These settings only apply to Virtuoso 7.0 and later.

<div class="itemizedlist">

- <a href="ch-server.html#ini_parameters" class="link"
  title="[Parameters]">AsyncQueueMaxThreads</a> :

  Sets the number of threads in a pool that is used for getting extra
  threads for running queries and for aq_request. Each running statement
  has at least one thread that is not allocated from this pool plus zero
  or more threads from this pool.

  Setting the pool size to the number of cores plus a few is a
  reasonable default. On platforms with core multithreading, one can
  count a core thread as a core for purposes of this parameter.

  If one expects to run many slow `aq_requests()` (see `async_queue()` ,
  `aq_request()` , etc.), then the number of threads should be increased
  by the number of slow threads one expects.

  Slow threads are typically I/O bound threads used for web crawling or
  similar long-latency, low-CPU activity.

  Note: Only effective with Virtuoso 7.0 and later.

- <a href="ch-server.html#ini_parameters" class="link"
  title="[Parameters]">ThreadsPerQuery</a> :

  This is maximum number of threads that can be claimed from the thread
  pool by a single query. A value of one means that no query
  parallelization will take place, and all queries will run single
  threaded.

  The number of cores on the machine is a reasonable default if running
  large queries.

  Note that since every query is served by at least one thread, a single
  query taking all the extra threads will not prevent other queries from
  progressing.

  Note: Only effective with Virtuoso 7.0 and later.

- <a href="ch-server.html#ini_parameters" class="link"
  title="[Parameters]">VectorSize</a> This the number of simultaneous
  sets of query variable bindings processed at one time. The default is
  10,000, which is good for most cases.

  If we are evaluating the query:

  ``` programlisting
  SELECT COUNT (*)
  FROM t1 a
  NATURAL JOIN t2 b
  WHERE a.row_no + 1 = b.row_no
  OPTION (LOOP, ORDER)
  ```

  with vector size of 10,000, then 10,000 rows of t1 a will be fetched
  first; 1 will be added to the 10,000 row_no values; and then the
  corresponding row of t1 b will be fetched for the 10,000 row_no of
  t1 a. This process will repeat until enough batches of t1 a have been
  fetched to come to its end.

  Note: Only effective with Virtuoso 7.0 and later.

- <a href="ch-server.html#ini_parameters" class="link"
  title="[Parameters]">AdjustVectorSize</a> :

  Using a larger vector size when evaluating large queries with indexed
  random-access can yield up to a 3x speed-up relative to using the
  default vector size. However, always using a large vector size will
  prohibitively increase the overhead of running small queries. For this
  reason, there is the option to adaptively select the vector size. Set
  AdjustVectorSize = 1 to enable this feature. The SQL execution engine
  will increase the vector size when it sees an index lookup that does
  not get good locality, (e.g., after sorting the keys to look for, too
  few consecutive lookups fall on the same page). Having more keys to
  look up increases the chance that consecutive keys should be found on
  the same page, thus eliminating much of the index lookup cost.

  Note: Only effective with Virtuoso 7.0 and later.

- <a href="ch-server.html#ini_parameters" class="link"
  title="[Parameters]">MaxVectorSize</a> :

  When AdjustVectorSize is on, this setting gives the maximum vector
  size. The default is 1,000,000 and the largest allowed value is about
  3,500,000.

  Note: Only effective with Virtuoso 7.0 and later.

</div>

</div>
