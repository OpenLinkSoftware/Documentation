<div id="qstpublishbifs" class="section">

<div class="titlepage">

<div>

<div>

### 3.7.3. Publishing VSE's as Web Services

</div>

</div>

</div>

The Virtuoso distribution includes the sample VSE, bif_sample.c. It is
thus possible to create a function such as:

``` programlisting
.....
static caddr_t
bif_hello_world (caddr_t * qst, caddr_t * err_ret, state_slot_t ** args)
{
  return box_dv_short_string ("Hello world.");
}
....
```

Then declare it in the init_func() by adding the following code:

``` programlisting
...
  bif_define_typed ("hello_world", bif_hello_world, &bt_any);
...
```

The next step is creating a stored procedure that calls this function
and you are back to publishing a Virtuoso stored procedure again, as in
the above section.

``` programlisting
create procedure BIF_HELLO_WORLD () { return hello_world (); };
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                |
|                            | The <a href="cinterface.html" class="link"                               
                              title="18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)">C  
                              Interface</a> Chapter                                                     |

</div>

</div>
