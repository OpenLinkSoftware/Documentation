<div>

<div>

<div>

<div>

### 17.15.3. Process lifecycle

</div>

</div>

</div>

A BPEL process may have more than one version during development or
maintenance in production environment. This means the process may have a
more than one copy on the server where one of these copies is current
all others are either obsolete or in the process of being defined . We
will call these states further in this section as 'current', 'obsolete'
or 'edit' (versions). The link between these versions is the process
name which remains the same during process life-cycle.

When a process is compiled for the first time it becomes 'current'. The
current version of a process is the one that was most recently compiled
without errors. Only a current version of a process can make new
instances in response to receiving messages. For a single process name
only one version can be current at any one time. The other compiled
versions of the process are always obsolete, meaning that new instances
cannot be created but that old instances may proceed and complete.

The 'obsolete' version can not crate new process instances, it may only
receive messages for its instances which are still running or suspended.
In other words the old process instances will continue and any new
instances will be instances of the current version.

The 'edit' state means that a new copy of the process is created but it
is still not compiled. After successful compilation, a process in the
edit state is set into the current state and the formerly current
process is set to the the obsolete state.

All process versions may have only one endpoint corresponding to the
process. The BPEL administrator MUST take care about endpoints to make
sure that clients using the process are compatible with different
process versions. This means that if changes in new versions are for
example in the logic but not in the process' WSDL then new endpoint is
not needed in most cases; furthermore in this case clients will be
compatible with new input and output message structure; except in the
case where the same messages are used with logically different meaning.
So when a new process version involves significant change to messages
then the new process should have a new endpoint and WSDL description.

</div>
