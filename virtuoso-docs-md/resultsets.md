<div>

<div>

<div>

<div>

## 11.4. Handling Result Sets

</div>

</div>

</div>

A single Virtuoso procedure may produce multiple result sets, each with
different result columns. A normal procedure produces one empty result
set, only returning a possible return value and values of output
parameters to the application.

The `result_names()` predefines variables to be used in a result set to
follow. The variables must be previously declared, from which the column
data types are ascertained. This assigns the meta data but does not send
any results. The `result()` function sends its parameters as a single
row of results. These parameters should be compatible with those in the
previous `result_names()` . The `end_results()` function can be used to
separate multiple result sets. The `result_names()` can then be used to
alter the structure of the next result set.

The `result_names()` call can be omitted if the application already
knows what columns and their types are to be returned.

<div>

|                            |                                                                                                                 |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                       |
|                            | <a href="fn_result.html" class="link" title="result"><code                                                      
                              class="function">result()</code></a> , <a href="fn_result_names.html" class="link" title="result_names"><code    
                              class="function">result_names()</code></a> , <a href="fn_end_result.html" class="link" title="end_result"><code  
                              class="function">end_result()</code></a>                                                                         |

</div>

</div>
