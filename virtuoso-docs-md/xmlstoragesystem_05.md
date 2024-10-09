<div>

<div>

<div>

<div>

### 14.7.17. Blog Post Upstreaming (bridging)

</div>

</div>

</div>

The blog upstreaming allows bloggers to keep in sync their blogs on
different servers. It is possible for blogger to define a routing
target, where his/her posts will be sent after local post is made,
updated or deleted. This feature using blogger APIs (Blogger,
MetaWeblog, MovableType) to pass messages to the remote. Therefore the
target server must support one of these APIs.

The upstreaming works in following manner:

The blogger defines a routing job, which is of type "Upstream". To do
this can be used Weblog Bridge UI following the steps: enter the XML-RPC
endpoint, username and password valid there; hit "Fetch" to retrieve
blogs on that host where the account can post; select desired account ;
specify a time interval for update and which categories of posts to
exclude; press "add" button.

This is is a equivalent of executing a simple insert statement :

``` programlisting
SQL> INSERT INTO DB.DBA.SYS_ROUTING
    (
    R_JOB_ID,
    R_TYPE_ID,
    R_PROTOCOL_ID,
    R_DESTINATION,
    R_DESTINATION_ID,
    R_AUTH_USER,
    R_AUTH_PWD,
    R_ITEM_ID,
    R_FREQUENCY,
    R_EXCEPTION_ID)
    VALUES
    (
    1,  -- unique for job
    1,  -- Upstreaming job
    1,  -- Blogger API (2 for metaWeblog, 3 from mt)
    'http://example.com/RPC2', -- target endpoint
    'home', -- target BlogID
    'visitor', -- user
    'secret',  -- secret
    '128',     -- local Blog ID (which to replicate)
    60,    -- hourly update
    '0;1;'     -- exclude posts within categories with ID 0 and 1
    );
```

This will make so when post is added/edited/deleted to make entry(es) in
SYS_BLOGS_ROUTING_LOG table. Then on specified R_FREQUENCY a scheduled
job will make blogger XML-RPC requests to the target server using API as
specified in R_PROTOCOL_ID field. If target server is down the entries
will be kept for next job round.

The upstreaming feature can be extended easily to make another form of
routing. The e-mail notification services in blogging is just one of
them.

The following shows how this feature can be triggered with simple insert
command:

``` programlisting
INSERT INTO DB.DBA.SYS_ROUTING
    (R_JOB_ID,R_TYPE_ID,R_PROTOCOL_ID,R_DESTINATION,R_ITEM_ID,R_FREQUENCY,R_EXCEPTION_ID)
    VALUES(
    2,  -- unique for job
    2,  -- Email notification
    4,  -- STMP protocol
    'mail.domain.com:25', -- mail server
    '128', -- local Blog ID
    10,     -- scan every 10 minutes
    '0;1;'  -- exclude posts within categories with ID 0 and 1
    );
```

The same can be done via Weblog UI - Notification setup

</div>
