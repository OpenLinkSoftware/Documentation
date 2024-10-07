<div id="faultfaulttolerrdfspecf" class="section">

<div class="titlepage">

<div>

<div>

### 6.4.9. RDF Specifics

</div>

</div>

</div>

To set up fault tolerant RDF storage, one can use the template provided
in the clrdfdup.sql file in the distribution.

The below applies to testing with prerelease 06.00.3116.The fault
tolerance function in 6.00.3116 is provided as a demonstration of
concept exclusively and is not intended for production use and has not
been tested in production. The below steps will demonstrate the basic
capability but one should not try things not explicitly mentioned.

The test starts with an empty database. Edit the create cluster
statement in the clrdfdup.sql file to correspond to the setup at hand.
Then load the file:

``` programlisting
SQL> load clrdfdup.sql;
SQL> cl_exec ('checkpoint');
```

Now load data. The load will be non-transactional but now will keep two
copies of each partition. Use log_enable (2) and ttlp or
rdf_load_db..rdfxml as described in the relevant documentation.

After some data is loaded, do another checkpoint.

``` programlisting
SQL> cl_exec ('checkpoint');
```

You may query the data. Now shut down one of the servers. Querying
should remain possible as long as one host in each group is online.
Start the previously stopped host and stop of another from the same
group. Querying remains possible.

Do not try non-transactional loading when all hosts are not online. This
produces incorrect results. Do not stop hosts during non-transactional
loading. This also produces inconsistent results.

Transactional loading is safe for stopping servers during loading but
will stop the loading with an error. The removed host must be either
brought back online or removed with cl_host_enable for the loading to
proceed.

Do not test transactional RDF loading with 6.00.3116. This version is
tested for duplicate partitions with SQL data but incompletely with RDF.

</div>
