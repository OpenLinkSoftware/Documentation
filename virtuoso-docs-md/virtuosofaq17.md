<div id="virtuosofaq17" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.17. Can Virtuoso run on a SAN?

</div>

</div>

</div>

Yes. Unlike Oracle RAC, for example, Virtuoso Cluster does not require a
SAN. Each server has its own database files and is solely responsible
for these. In this way, having shared disk among all servers is not
required. Running on a SAN may still be desirable for administration
reasons. If using a SAN, the connection to the SAN should be high
performance, such as Infiniband.

</div>
