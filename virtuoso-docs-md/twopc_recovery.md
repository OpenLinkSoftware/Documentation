<div id="twopc_recovery" class="section">

<div class="titlepage">

<div>

<div>

### 11.15.3. 2PC Log & Recovery

</div>

</div>

</div>

If one branch of a distributed transaction crashes during the second
phase of a commit, the recovery cycle will be performed during the next
start up of the server. Information about a distributed transaction is
stored in the transaction log file.

When Virtuoso connects to MS DTC, it creates a guid.bin file in the
working directory. This file contains a unique ID of the server and is
require for the recovery cycle.

</div>
