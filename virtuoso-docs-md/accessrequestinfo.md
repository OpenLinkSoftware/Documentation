<div>

<div>

<div>

<div>

### 14.3.2. Access Request Information

</div>

</div>

</div>

Request information, resulting from an HTTP POST, is available via the
*`params`* vector. The params vector is always available for the purpose
in a VSP context. Similarly the *`lines`* and *`path`* vectors are
available for the HTTP headers and URL path respectively.

Parameters stored in the params vector are stored in keyword-value
pairs, such that keywords are stored in the even elements, values in the
odd numbered elements. Vectors and arrays can be accessed using the
`aref()` and `aset()` functions, however, the exact position of
parameters is seldom known. The `get_keyword()` function can be used to
return the value of a given parameter. You can specify a default value
to return in case the parameter you are looking for is not found.

`get_keyword (`*`'param_name'`*` , `*`vector`*` [, `*`opt_default_value'`*` ]);`

If a default value other than '' (empty-string) is not required then a
short-hand can be used instead.

``` programlisting
{?'param_name'}
```

is equivalent to `get_keyword (`*`'param_name'`*` , `*`'params'`*` );`

Since `get_keyword()` returns only strings, you will find that `cast`
ing or conversion functions such as `atoi()` are very useful here.

<div>

**Example 14.8. Reading the params Vector**

<div>

Consider retrieving the following page by means of the URL:

``` programlisting
http://myvirtuoso/test.vsp?arg1=1&arg2=test
```

``` programlisting
<html>
 <body>
  <h1>Test Params</h1>
  <?vsp
  declare _arg1 integer; --   the underscore helps to differentiate from
  declare _arg2 varchar; --   the keyword name, whereas the variable names
  declare _arg3 varchar; --   help use remember which is which.

  _arg1 := atoi(get_keyword('arg1', params));
  _arg2 := {?'arg2'};
  _arg3 := get_keyword('arg3', params, 'was empty'};

  ?>
  <p>values returned:</p>
  <p>arg1: <?=_arg1?></p>
  <p>arg2: <?=_arg2?></p>
  <p>arg3: <?=_arg3?></p>
 </body>
</html>
```

</div>

</div>

  

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_get_keyword.html" class="link" shape="rect"
title="get_keyword"><code class="function">get_keyword()</code></a></p>
<p><a href="fn_atoi.html" class="link" shape="rect" title="atoi"><code
class="function">atoi()</code></a></p>
<p><a href="fn_aref.html" class="link" shape="rect" title="aref"><code
class="function">aref()</code></a></p>
<p><a href="fn_aset.html" class="link" shape="rect" title="aset"><code
class="function">aset()</code></a></p>
<p><a href="ch-sqlreference.html#dtcasting" class="link" shape="rect"
title="9.1.2. Casting">cast</a></p></td>
</tr>
</tbody>
</table>

</div>

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|                              | Sometimes a POST can supply a large amount of data, such as from an \<INPUT type="file"\>. When the length of the parameter data exceeds 5,000,000 octets the result is stored as a string session in the params array. In these cases the value should not be copied or converted to a string, it is likely to be truncated. The value should be stored as a BLOB or an external file. When processing possibly large input fields in a form either the fourth parameter to `get_keyword()/get_keyword_ucase()` should be set to 1 or they should be accessed through `aref_set_0()` . |

</div>

</div>
