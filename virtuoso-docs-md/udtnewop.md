<div id="udtnewop" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.7. NEW Operator

</div>

</div>

</div>

``` programlisting
[ NEW ] type_name ( [ parameter_value, .... ] )
```

This returns an instance (or reference to an instance) of the user
defined type type_name. It will try to match a constructor by
calculating the parameter types at compile time and matching the so
produced signature to the closest constructor signature (see below:
<a href="udtfindingmethods.html" class="link"
title="9.2.8. Finding Methods - Method Signatures Generation &amp; Comparison">finding
methods</a> ). The SQL types have an implicit constructor with no
parameters that assigns the DEFAULT values to the type members (if any,
otherwise NULL). When a SQL constructor is called it will have the
`SELF` set-up to the result of calling the implicit constructor. The NEW
operator is a scalar expression and can be used wherever the SQL syntax
allows scalar expressions.

</div>
