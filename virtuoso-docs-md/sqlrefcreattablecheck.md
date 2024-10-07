<div id="sqlrefcreattablecheck" class="section">

<div class="titlepage">

<div>

<div>

### 9.8.8. The CHECK Constraint

</div>

</div>

</div>

The CHECK constraint allows you specify and wide range of rules that
will dictate whether an insert of update will be permitted. The syntax
is as follows:

``` programlisting
CHECK (search-condition)
```

The search condition can be simple and comparative, or quite complicated
involving regular expressions.

<div id="ex_sqlrefcreatecheck" class="example">

**Example 9.25. Creating a table with the CHECK constraint**

<div class="example-contents">

Here a simple table will be created with two CHECK constraints. One the
check constraints is a simple comparison ensuring participants are over
18, the other complicated constraint verifies that the email address is
correct using a regular expression. Samples SQL statements follow that
will demonstrate the effectiveness of the check constraints.

``` programlisting
CREATE TABLE test_check (
  name VARCHAR,
  age INTEGER
    CHECK (age > 18),
  email VARCHAR
    CHECK (regexp_like(email, '^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+\$'))
  )
  ;

INSERT INTO test_check (name, age, email) VALUES ('Jack', 18, 'jack@foo.bar');
  -- will cause: *** Error 22023: ... SR363: CHECK constraint violated

INSERT INTO test_check (name, age, email) VALUES ('Jill', 19, 'up@thehill.com');
  -- will be insert correctly.

INSERT INTO test_check (name, age, email) VALUES ('Jack and Jill', 37, 'ouch/!^^!!@@');
  -- will cause: *** Error 22023: ... SR363: CHECK constraint violated, also.
```

</div>

</div>

  

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                      |
|:--------------------------:|:---------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                            |
|                            | <a href="fn_regexp_like.html" class="link" title="regexp_like"><code 
                              class="function">regexp_like()</code></a>                             |

</div>

</div>
