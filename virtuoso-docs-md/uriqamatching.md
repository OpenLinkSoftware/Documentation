<div id="uriqamatching" class="section">

<div class="titlepage">

<div>

<div>

### 19.2.4. URI Matching Rules

</div>

</div>

</div>

A simple installation does not require any special configuration of
URIQA except specifying server names in the \[URIQA\] section of
configuration file (virtuoso.ini). However complex applications may need
from URIQA more than simple retrieval of metadata of DAV resources. Like
HTTP virtual hosts, URIQA may require different processing for different
URIs, so Virtuoso offers appropriate tools.

When the URIQA server gets an URI to process, it reads the system table
WS.WS.URIQA_HANDLER to find out the procedure that can access metadata
about some range of URIs. This table is defined as follows:

``` programlisting
create table WS.WS.URIQA_HANDLER
(
  UH_ID integer not null primary key,
  UH_ORDER integer not null,
  UH_NAME varchar not null unique,
  UH_MATCH_COND varchar not null,
  UH_MATCH_ENV any,
  UH_HANDLER varchar not null,
  UH_HANDLER_ENV any
)
create index URIQA_HANDLER_ORDER_NAME on WS.WS.URIQA_HANDLER (UH_ORDER, UH_NAME)
;
```

The server scans the table in order of ascending values in UH_ORDER
column, and checks whether the request URI matches the condition
specified by UH_MATCH_COND and UH_MATCH_ENV. As soon as an appropriate
row is found, a function with name specified by UH_HANDLER is called
with parameters that describe the request plus any extra
application-specific data as stored in UH_HANDLER_ENV. The function
should either compose a response and set a flag to 1 or do nothing and
set a flag to 0. If 1 is set then the processing of the request is
complete, otherwise the server resumes table scan.

At server startup, up to three records are automatically added into
WS.WS.URIQA_HANDLER.

|                                                                                                                                                                                                                                                                                                        |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| First record has UH_ORDER equal to 100. It tells the server that if an URI has server name equal to one of names listed in "LocalHostNames" configuration parameter then metadata should be retrieved from local DAV of the server.                                                                    |
| Second record is very similar, it also has UH_ORDER equal to 100, but uses SQL 'like' operator instead of '='. It tells the server that if an URI has server name like one of masks listed in "LocalHostMasks" configuration parameter then metadata should be retrieved from local DAV of the server. |
| The third record has UH_ORDER equal to 999, and tells the server to act as URIQA proxy if the requested URI starts with "http" protocol name.                                                                                                                                                          |

Applications can add more lines to the table to handle different sorts
of URIs via different application specific functions. The name of
function should begin with "WS.WS.URIQA_HANDLER\_", the rest is as
specified by UH_HANDLER of the row. The signature of function should be

``` programlisting
function WS.WS.URIQA_HANDLER_myexample (
  inout op varchar,   -- operation name, 'MGET', 'MPUT' or 'MDELETE';
  inout uri varchar,  -- request URI;
  inout split any,    -- request URI split by WS.WS.PARSE_URI into parts;
  inout body any,     -- the body of the request;
  inout params any,   -- get_keyword style vector of parameters of the request;
  inout lines any,    -- vector of lines of HTTP request header;
  inout app_env any,  -- any application-specific data from UH_HANDLER_ENV;
  inout is_final integer -- status flag. Function sets the flag to 1 to report that the request response is prepared.
  ) re0turns any          -- returns a status vector, see below.
```

Status vector describes either the reason why the request has failed, or
the success status. It consists of four elements:

|                                                                                                                       |
|-----------------------------------------------------------------------------------------------------------------------|
| SQL_STATE as five-char string, "00000" if success;                                                                    |
| DAV error code as an integer, if the operation has failed due to DAV error, 0 if success or an error other than DAV;  |
| HTTP status as three-digit string, such as "200" for "OK" or "404" for "not found";                                   |
| Brief description of an error, such as HTTP response status ("OK", "not found" etc.) or SQL_MESSAGE, "OK" if success; |

In case of DAV error, elements 3 and 4 can be set to NULL to generate
proper values automatically.

Examples are:

``` programlisting
vector ('00000', 0, '200', 'OK');
vector ('URIQA', 0, '500', 'The remote URIQA server returned an invalid header');
vector ('URIQA', -1, '404', 'Invalid URI; Ill formed or missing path to the resource');
vector ('URIQA', -12, null, null);
```

The current version of Virtuoso supports the following names of matching
operations for use in UH_MATCH_COND:

|                                                                                                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------|
| "schema =" -- URI schema name should be equal to UH_MATCH_ENV;                                                                           |
| "server =" -- URI server name (including port, if specified) should be equal to UH_MATCH_ENV;                                            |
| "server like" -- URI server name (including port, if specified) should be "like" to UH_MATCH_ENV;                                        |
| "server in" -- URI server name (including port, if specified) should be member of UH_MATCH_ENV vector of strings;                        |
| "server like in" -- URI server name (including port, if specified) should be "like" to one of members of UH_MATCH_ENV vector of strings; |
| "default" -- Any URI will match so any request is passed to the handler if not handled before.                                           |

</div>
