<div>

<div>

<div>

<div>

### 20.5.2. The procedures are:

</div>

</div>

</div>

``` programlisting
VT_INDEX_<qualifier>_<owner>_<table>  (in flag integer)
```

This re-indexes the table. A flag of 0 makes the index, a flag of 1
deletes data found in the table from the index.

``` programlisting
VT_INC_INDEX_<qualifier>_<owner>_<table>  (in flag integer) ()
```

This function refreshes the index using the change tracking information
in the VTLOG\_ table.

</div>
