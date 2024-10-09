<div>

<div>

<div>

<div>

### 1.4.28. What performance metrics does Virtuoso offer?

</div>

</div>

</div>

There is an extensive array of performance metrics. This includes:

<div>

- Cluster status summary with thread counts, CPU utilization,
  interconnect traffic, clean and dirty cache pages, virtual memory
  swapping warning, etc. This is either a cluster total or a total with
  breakdown per cluster node.

- Disk access, lock contention, general concurrency, and access count
  per index

- Statistics on memory usage for disk caching index-by-index, cache
  replacement statistics, disk random and sequential read times

- Count of random, sequential index access, disk access, lock
  contention, cluster interconnect traffic per query/client

- Detailed query-execution plans are available through the
  <a href="ch-overview.html" class="link"
  title="Chapter 1. Overview"><code class="function">explain</code></a>
  function

</div>

</div>
