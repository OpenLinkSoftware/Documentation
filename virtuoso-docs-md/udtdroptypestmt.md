<div id="udtdroptypestmt" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.3. DROP TYPE Statement

</div>

</div>

</div>

``` programlisting
DROP TYPE type_name
```

This statement reverses the effect of CREATE TYPE statement. If the type
has methods defined they are deleted as well. Note that forward
references cannot be dropped by a DROP TYPE.

The DROP TYPE statement can be used only for dropping types that are not
referenced in another type's UNDER statement.

<div id="ex_udtdroptype" class="example">

**Example 9.5. Dropping a user-defined type**

<div class="example-contents">

Dropping the subtype from the previous section.

``` programlisting
drop type UDT_TEST_SUB;
```

</div>

</div>

  

</div>
