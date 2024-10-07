<div id="spasviewsandtablespl" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.3. Stored Procedures as Views & Derived Tables

</div>

</div>

</div>

Virtuoso allows using a stored procedure result set in place of a table.
A view may also be defined as a stored procedure. This provides smooth
integration to external procedural logic in queries.

When a procedure appears as a table, the procedure is called and its
result set is inserted into a temporary space. Processing continues from
that point on as if the data came from a table.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                      |
|                            | For more information about Store Procedures as Views & Derived Tables go to the <a href="spasviewsandtables.html" class="link" 
                              title="9.22. Stored Procedures as Views &amp; Derived Tables">SQL                                                               
                              Reference Chapter</a>                                                                                                           |

</div>

</div>
