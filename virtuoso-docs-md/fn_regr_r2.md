<div>

<div>

</div>

<div>

## Name

REGR_R2 — Returns the coefficient of determination (R-squared) of the
regression line.

</div>

<div>

## Synopsis

<div>

|                             |                      |
|-----------------------------|----------------------|
| `numeric `**`REGR_R2`**` (` | in `expr1 ` any ,    |
|                             | in `expr2 ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

REGR_R2 returns the coefficient of determination (also called
"R-squared" or "goodness of fit") for the regression. `VAR_POP(expr1)`
and `VAR_POP(expr2)` are evaluated after the elimination of null pairs.
The return values are:

|                                                                                          |
|------------------------------------------------------------------------------------------|
| NULL if VAR_POP(expr2) = 0                                                               |
| 1 if VAR_POP(expr1) = 0 and VAR_POP(expr2) != 0                                          |
| (CORR(expr1,expr2) \* CORR(expt1, expr2)) if VAR_POP(expr1) \> 0 and VAR_POP(expr2) != 0 |

</div>

<div>

## Parameters

<div>

### expr1

Number expression.

</div>

<div>

### expr2

Number expression.

</div>

</div>

<div>

## Return Types

The function returns a value of type NUMERIC. If the function is applied
to an empty set, then it returns null.

</div>

<div>

## See Also

<a href="fn_var.html" class="link" title="VAR"><code
class="function">VAR() </code></a>

<a href="fn_var_samp.html" class="link" title="VAR_SAMP"><code
class="function">VAR_SAMP() </code></a>

<a href="fn_var_pop.html" class="link" title="VAR_POP"><code
class="function">VAR_POP() </code></a>

<a href="fn_stddev.html" class="link" title="STDDEV"><code
class="function">STDDEV() </code></a>

<a href="fn_stddev_samp.html" class="link" title="STDDEV_SAMP"><code
class="function">STDDEV_SAMP() </code></a>

<a href="fn_stddev_pop.html" class="link" title="STDDEV_POP"><code
class="function">STDDEV_POP() </code></a>

<a href="fn_regr_syy.html" class="link" title="REGR_SYY"><code
class="function">REGR_SYY() </code></a>

<a href="fn_regr_sxx.html" class="link" title="REGR_SXX"><code
class="function">REGR_SXX() </code></a>

<a href="fn_regr_sxy.html" class="link" title="REGR_SXY"><code
class="function">REGR_SXY() </code></a>

<a href="fn_regr_avgx.html" class="link" title="REGR_AVGX"><code
class="function">REGR_AVGX() </code></a>

<a href="fn_regr_avgy.html" class="link" title="REGR_AVGY"><code
class="function">REGR_AVGY() </code></a>

<a href="fn_regr_r2.html" class="link" title="REGR_R2"><code
class="function">REGR_R2() </code></a>

<a href="fn_regr_count.html" class="link" title="REGR_COUNT"><code
class="function">REGR_COUNT() </code></a>

<a href="fn_regr_intercept.html" class="link"
title="REGR_INTERCEPT"><code
class="function">REGR_INTERCEPT() </code></a>

<a href="fn_regr_slope.html" class="link" title="REGR_SLOPE"><code
class="function">REGR_SLOPE() </code></a>

<a href="fn_covar_samp.html" class="link" title="COVAR_SAMP"><code
class="function">COVAR_SAMP() </code></a>

<a href="fn_covar_pop.html" class="link" title="COVAR_POP"><code
class="function">COVAR_POP() </code></a>

<a href="fn_corr.html" class="link" title="CORR"><code
class="function">CORR() </code></a>

</div>

</div>
