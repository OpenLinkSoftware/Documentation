<div>

<div>

<div>

<div>

## 20.7. Removing A Text Trigger

</div>

</div>

</div>

Used to drop text trigger definition on text indexed table. The
operation also drop all tables created by create text trigger statement.

Syntax:

``` programlisting
DROP TEXT TRIGGER ON <table> [(<data_column>)]
```

<div>

**Example 20.7. Removing A Text Trigger**

<div>

``` programlisting
drop text trigger on ftt;
```

will drop the text trigger definition from table ftt.

</div>

</div>

  

Or using the stored procedure:

<div>

<div>

<div>

<div>

### 20.7.1. vt_drop_ftt_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="fn_vt_drop_ftt.html" class="link"
title="VT_DROP_FTT">vt_drop_ftt</a> in the
<a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

</div>
