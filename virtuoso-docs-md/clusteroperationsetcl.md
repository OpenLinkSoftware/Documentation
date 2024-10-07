<div id="clusteroperationsetcl" class="section">

<div class="titlepage">

<div>

<div>

### 6.3.2. Setting up a Cluster

</div>

</div>

</div>

To make a new empty clustered Virtuoso database, set up the individual
instances. The processes must be of exactly the same version, the
operating systems, byte orders or word lengths of the participating
machines do not have to match.

Each individual database is assigned its database files and other
configuration by editing its virtuoso.ini file. No installation besides
having the Virtuoso executable and the virtuoso.ini file is needed.

If there is a Virtuoso installation on the machine, use the executable
from that and set up an empty directory with the virtuoso.ini file.

Once the individual database directories are set up, write the
cluster.ini file as shown above. Copy this into each running directory
beside the virtuoso.ini file. Edit each to specify which host the file
belongs to. Set ThisHost to point to the host which the this file
belongs. Set Master to point to one of the hosts and make sure each file
has the same master and a distinct ThisHost.

Start the server processes. This will initialize the empty databases.

Connect to the master host's SQL port with a SQL client to continue. The
initial default user and password is dba. To verify that the cluster
nodes can connect to each other, do status (''); twice. The second
status should have a line beginning with Cluster xx nodes.

</div>
