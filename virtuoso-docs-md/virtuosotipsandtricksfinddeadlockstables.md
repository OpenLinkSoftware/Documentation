<div id="virtuosotipsandtricksfinddeadlockstables" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.3. How can I find on which table deadlocks occur?

</div>

</div>

</div>

One possible way to find on which table deadlocks occur is to execute
the following statement:

``` programlisting
SELECT TOP 10 *
FROM SYS_L_STAT
ORDER BY deadlocks DESC
```

</div>
