<div>

<div>

<div>

<div>

### 23.6.4. SYS_CHARSETS

</div>

</div>

</div>

``` programlisting
CREATE TABLE SYS_CHARSETS (
    CS_NAME varchar,            -- The "preferred" charset name
    CS_TABLE long nvarchar,     -- the mapping table of length 255 Wide chars
    CS_ALIASES long varchar     -- serialized vector of aliases
);
```

</div>
