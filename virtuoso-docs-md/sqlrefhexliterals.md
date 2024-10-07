<div id="sqlrefhexliterals" class="section">

<div class="titlepage">

<div>

<div>

### 9.7.4. Hexadecimal Literals

</div>

</div>

</div>

Hexadecimal values can be specified literally in two ways, prefixing the
plain value with '0x' or enclosed with single quotes prefixed with 'X'.
The case is not important. Hex characters should always be pairs,
representing a single byte, and should be at least on pair. Here are
some examples:

``` programlisting
X'beef'   - valid
0xbeef    - valid

X'abeef'  - not valid
X'0abeef' - valid
X''   - not valid
```

`X'<value>'` is equivalent to `0x<value>`

</div>
