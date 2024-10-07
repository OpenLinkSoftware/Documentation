<div id="perftips" class="section">

<div class="titlepage">

<div>

<div>

## 11.13. Performance Tips

</div>

</div>

</div>

<div id="remember" class="section">

<div class="titlepage">

<div>

<div>

### 11.13.1. Remember the following:

</div>

</div>

</div>

<div class="itemizedlist">

- Reference parameters (inout and out) are faster then value parameters
  (in).

- Use cursors and positioned delete/update (where current of) for
  read-modify transactions instead of a select .. into and searched
  update.

- Make an EXCLUSIVE read in read-modify transactions.

- When using ORDER BY and wishing to use a particular index, specify ALL
  key parts of the index, including those that have a '=' condition. If
  you want to have descending order using an index, specify DESC on ALL
  key parts.

</div>

</div>

</div>
