<div>

<div>

<div>

<div>

### 1.4.25. How many concurrent queries can Virtuoso handle?

</div>

</div>

</div>

There is no set limit. As with any DBMS, response times get longer if
there is severe congestion.

For example, having 2 or 3 concurrent queries per core is a good
performance point which will keep all parts of the system busy. Having
more than this is possible but will not increase overall throughput.

With a cluster, each server has both HTTP and SQL listeners, so clients
can be evenly spread across all nodes. In a heavy traffic Web
application, it is best to have a load balancer in front of the HTTP
endpoints to divide the connections among the servers and to keep some
cap on the number of concurrently running requests, enforcing a maximum
request-rate per client IP address, etc.

</div>
