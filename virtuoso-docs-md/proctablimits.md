<div id="proctablimits" class="section">

<div class="titlepage">

<div>

<div>

### 9.22.5. Limitations

</div>

</div>

</div>

There is no limitation to the number of rows in a procedure result set.
The temporary storage takes place in the database similarly to a sorted
ORDER BY. Number of columns is limited to the maximum number of columns
in a real table. Total row size limit for tables and ORDER BY
intermediate results applies. Blobs are allowed and do not count towards
the row length limit.

</div>
