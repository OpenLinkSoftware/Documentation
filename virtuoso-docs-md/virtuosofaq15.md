<div>

<div>

<div>

<div>

### 1.4.15. How multithreaded is Virtuoso?

</div>

</div>

</div>

All server and client components are multithreaded, using pthreads on
Unix/Linux, Windows native on Windows. Multithread/multicore scalability
is good; see <a href="http://www.openlinksw.com/weblog/oerling/?id=1409"
class="ulink" target="_top">BSBM</a>

In the case of Virtuoso Cluster, in order to have the maximum number of
threads on a single query, we recommend that each server on the cluster
be running one Virtuoso process per 1.2 cores.

</div>
