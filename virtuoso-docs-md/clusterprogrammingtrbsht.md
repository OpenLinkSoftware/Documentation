<div>

<div>

<div>

<div>

## 10.9. Troubleshooting

</div>

</div>

</div>

If an operation seems to hang, see the output of status ().

Check for the presence of the following conditions:

<div>

- The cluster line shows 0% CPU, no message traffic and an unchanging
  number of buffers wired, this is probably a bug. To reset, restart the
  cluster or the offending process if found. Restart is done by
  executing raw_exit (); over an SQL connection to the process in
  question.

- The cluster line shows many threads waiting compared to total threads.
  If CPU is 0 and this does not change there could be a transaction that
  holds locks indefinitely. To clear, execute txn_killall (1); . Do this
  at a node that has local threads waiting. This is seen in the Lock
  Status paragraph of status ('') when connected to the node in
  question.

- The cluster line shows a changing number in the pfs field. The system
  is swapping and slowed down.

- If the status () itself hangs, try another process of the cluster. See
  that there is no temporary atomic activity like a long checkpoint. If
  the situation persists there is a bug. The checkpoint can be seen by
  the presence of the checkpinmt_in_progress file in each server's
  working directory.

- To check the integrity of database files, do
  <a href="fn_cl_exec.html" class="link" title="cl_exec">cl_exec()</a>
  ('backup ''/dev/null'''); If this returns, the databases are OK. If
  one is found to be corrupt the corresponding server exits.

</div>

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p><a href="clusterstcnf.html" class="link"
title="2.14. Cluster Installation and Configuration">Cluster
Installation and Config</a></p></li>
<li><p><a href="clusteroperation.html" class="link"
title="6.3. Virtuoso Cluster Operation">Cluster Operation</a></p></li>
<li><p><a href="fault.html" class="link"
title="6.4. Virtuoso Cluster Fault Tolerance">Virtuoso Cluster Fault
Tolerance.</a></p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>
