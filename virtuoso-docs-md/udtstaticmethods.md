<div id="udtstaticmethods" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.10. Calling Static Methods

</div>

</div>

</div>

Let `T` be a user defined type that has a static method `SM` .

``` programlisting
T::SM ( [ parameter, .... ] )
```

This will call the static method of `SM` of `T` and will return whatever
the static method returns.

<div id="ex_callstaticmethod" class="example">

**Example 9.9. Calling A Static Method**

<div class="example-contents">

``` programlisting
select UDT_TEST::_ADD (1, 2);
```

</div>

</div>

  

</div>
