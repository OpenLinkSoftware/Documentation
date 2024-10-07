<div id="numbers" class="section">

<div class="titlepage">

<div>

<div>

### 9.7.2. Numbers

</div>

</div>

</div>

An integer constant consist of an optional minus sign followed by
decimal digits. Integer literals are of the C type long, 32 bit.

Numeric literals with a decimal point literal are internally of the
DECIMAL SQL type, a variable length decimal floating point type. The
Following are examples of decimal literals:

``` screen
123.456
-16.0
```

Numeric literals which specify an exponent, e.g. 1.2e11 or 2e-3 are read
as C doubles, (64 bit IEEE binary floating point). This is potentially
less precise than the DECIMAL SQL type.

Integer literals outside of the 32-bit range are interpreted as DECIMAL.

</div>
