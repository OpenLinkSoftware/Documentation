<div id="usinginparams" class="section">

<div class="titlepage">

<div>

<div>

### 15.5.4. Using Input Parameters

</div>

</div>

</div>

Parameters declarations should be described in the \<header\> section of
the updategram. There should be one *`<param>`* row for each parameter.

General syntax:

``` programlisting
<sql:header xmlns:sql="xml-sql">
  <sql:param name="PARAM_NAME" [default="DEFAULT_VALUE"]/>
  ...
</sql:header>
```

Where *`PARAM_NAME`* is the name of the parameter and *`DEFAULT_VALUE`*
is optional default of parameter Parameters in updategram should have
*`$PARAM_NAME`* instead of a value. On processing, Virtuoso replaces
*`$PARAM_NAME`* with the corresponding value from the
*`<input_parameters>`* given to the function `xmlsql_update()` .

</div>
