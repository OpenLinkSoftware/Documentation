<div>

<div>

<div>

<div>

### 3.12.3. Simple Tutorial

</div>

</div>

</div>

The following example prints the result from executing explain:

``` programlisting
<?vsp
  declare meta, data any;
  exec ('explain (?)', null, null, vector ('select * from sys_users'),  0, meta, data);
  foreach (any row in data) do
  {
     http_value (row[0], 'p');
  }
?>
```

The vsp can be also written like this:

``` programlisting
<?vsp
  declare meta, data any;
  exec ('explain (?)', null, null, vector ('select * from sys_users'), 0, meta, data);
  for (declare i,l int, i := 0, l := length (data); i < l; i := i + 1)
   {
     http_value (data[i][0], 'p');
   }

?>
```

</div>
