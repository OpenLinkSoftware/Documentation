<div>

<div>

<div>

<div>

### 1.5.4. How Can I configure parameters to avoid out of memory error?

</div>

</div>

</div>

In order to avoid out of memory error, you should make sure the values
for the paramaters <span class="emphasis">*NumberOfBuffers*</span> and
<span class="emphasis">*MaxCheckpointRemap*</span> are not set with the
same values.

For example, the following configuration will cause an error out of
memory:

``` programlisting
# virtuoso.ini

...
[Parameters]
NumberOfBuffers = 246837
MaxDirtyBuffers = 18517
MaxCheckpointRemap = 246837
...
```

Changing the value of the parameter
<span class="emphasis">*MaxCheckpointRemap*</span> with let's say 1/4 of
the DB size will resolve the issue.

</div>
