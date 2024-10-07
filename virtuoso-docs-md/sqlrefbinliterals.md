<div id="sqlrefbinliterals" class="section">

<div class="titlepage">

<div>

<div>

### 9.7.5. Binary Literals

</div>

</div>

</div>

Binary strings can be specified as literals prefixed with 'B' and
enclosed with single quotes. The string should not be empty and should
contain only 1's or 0's. Binary strings are read from the end to
beginning forming bytes on each 8-th bit:

``` programlisting
B'1'    = 0x01
B'1111'   = 0x0F
B'111111111'  = 0x01FF
B'100000001'  = 0x0101
B'', X'' and 0x return binary literals.
```

</div>
