<div id="virtuosofaq" class="section">

<div class="titlepage">

<div>

<div>

## 1.4. Virtuoso FAQ

</div>

</div>

</div>

We have received various inquiries on high-end metadata stores. We will
here go through some salient questions. The requested features include:

<div class="itemizedlist">

- Scaling to trillions of triples

- Running on clusters of commodity servers

- Running in federated environments, possibly over wide-area networks

- Built-in inference

- Transactions

- Security

- Support for extra triple level metadata, such as security attributes

</div>

<span class="emphasis">*Questions:*</span>

<div id="virtuosofaq1" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.1. What is the storage cost per triple?

</div>

</div>

</div>

This depends on the index scheme. If indexed 2 ways, assuming that the
graph will always be stated in queries, this is 31 bytes.

With 4 indices, supporting queries where the graph can be left
unspecified (i.e., triples from any graph will be considered in query
evaluation), this is 39 bytes. The numbers are measured with the LUBM
validation data set of 121K triples, with no full-text index on
literals.

With 4 indices and a full text index on all literals, the Billion
Triples Challenge data set, 1115M triples, is about 120 GB of database
pages. The database file size is larger due to space in reserve and
other factors. 120 GB is the number to use when assessing RAM-to-disk
ratio, i.e., how much RAM the system ought to have in order to provide
good response. This data set is a heterogeneous collection including
social network data, conversations harvested from the Web, DBpedia,
Freebase, etc., with relatively numerous and long text literals.

The numbers do not involve any database page stream compression such as
gzip. Using such compression does not save in terms of RAM because
cached pages must be kept uncompressed but will cut the disk usage to
about half.

</div>

</div>
