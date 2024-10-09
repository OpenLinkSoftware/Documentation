<div>

<div>

<div>

<div>

### 6.4.10. Fault Tolerance Programming

</div>

</div>

</div>

This section describes aspects of fault tolerance in writing cluster
aware SQL applications. Specifically, partitioned functions, which are a
way of explicitly dividing procedural execution among hosts of a
cluster, have issues and features that are specific to fault tolerance
and must be treated separately.

In using a daq or dpipe, one can specify whether the function is to be
partitioned like:

<div>

1.  Read committed read - low bits not used for partition can be used
    for intra partition balancing, as described in the schema
    optimization section.

2.  The function is called on all replicas, as an update.

3.  The function is called on the first replica, like a read for update

4.  The function is called on all but the first copy of the partition.

</div>

Combinations of 3 and 4 can be used if the function, for example,
allocates sequence numbers which must be then replicated over the
remaining copies. Thus the function that allocates the new sequence
number is called with in mode 3 and another function that uses this
number is called in mode 4.

For a daq_call call, these options are specified in the 5th argument,
flags.

<div>

- 0 - read committed

- 1 - write all

- 2 - write first

- 3 - write all but first

</div>

For dpipes, this is stated in the dpipe_define call's flags argument.
The values to be or'ed over the flags are:

<div>

- 0 - read committed

- 1 - update all

- 4 - update first copy

- 8 - update all but first copy.

</div>

</div>
