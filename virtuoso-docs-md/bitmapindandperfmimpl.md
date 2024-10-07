<div id="bitmapindandperfmimpl" class="section">

<div class="titlepage">

<div>

<div>

### 9.31.2. Performance Implications

</div>

</div>

</div>

The main advantage of a bitmap index is more compact size, reflected in
less I/O. Inserting an entry takes on the average 10% longer than for
another type of index, likewise for random lookups with exact key
values. Sequential access is usually faster. Space savings and thereby
improved working set behavior can produce dramatic gains for large
tables.

</div>
