<div id="physicalstroverheads" class="section">

<div class="titlepage">

<div>

<div>

### 9.31.3. Physical Structure and Overheads

</div>

</div>

</div>

Bitmap indices divide the range of signed 64 bit integer values into
ranges holding 8192 (8K) values. Each such range where at least one bit
is set is represented by a compression entry (CE). Multiple CE's can be
on the same row. CE's having one bit set take 4 bytes, CE's with 512 or
less bits set take 4 bytes plus 2 bytes per bit, CE's with over 512 bits
set take 1K byte regardless of how many bits are set.

A bitmap index where the bitmap holds only one bit takes 6 bytes more
than the corresponding non-bitmap index entry. A second value, if it
falls in the same 8K range adds 2 bytes, 4 bytes if it does not fall
within in the same 8K range. If more than 512 values fall within the
same 8K range, the bits are represented as a 1K byte bitmap and adding
subsequent values takes no extra space.

Virtuoso supports bitmap indices since version 4.5.2919.

Bitmap Indices

</div>
