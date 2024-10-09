<div>

<div>

<div>

<div>

### 23.6.12. WS Trust

</div>

</div>

</div>

``` programlisting
create table WST_SERVER_ISSUER_TOKENS
(
  WSK_TOKEN_TYPE    varchar,
  WSK_REQUEST_TYPE  varchar,
  WSK_APPLIES_TO    varchar,
  WSK_FROM      varchar,
  WSK_SERVICE_NAME  varchar,
  WSK_PORT_TYPE     varchar,
  WSK_TOKEN     varchar,
  PRIMARY KEY (WSK_TOKEN_TYPE, WSK_FROM, WSK_TOKEN)
)
;
```

</div>
