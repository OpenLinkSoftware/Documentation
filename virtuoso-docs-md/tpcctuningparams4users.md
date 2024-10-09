<div>

<div>

<div>

<div>

## 21.3. Tuning Parameters and Number of Users

</div>

</div>

</div>

You may run several instances of tpcc, each representing one user. You
will see CPU utilization improve as users are added since there are more
possibilities of interleaving I/O and CPU.

The amount of RAM (number_of_buffers: in wi.cfg) is the single most
important factor influencing throughput. Setting this to about half the
system RAM is usually good. One will remember that each buffer takes
8.5K of actual RAM. One should be careful not to cause the server
process to swap.

Striping should be used if there are multiple independent disks, one
stripe per physically independent volume. Each stripe should have its
own I/O queue. If there is a RAID, then striping is less beneficial.
Also one should have multiple handles per files, see FDSPerFile in the
configuration file.

</div>
