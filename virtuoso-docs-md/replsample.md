<div>

<div>

<div>

<div>

## 13.6. Replication Logger Sample

</div>

</div>

</div>

The logger directory in the samples in the distribution contains a
simple load balancing sample. It implements a simplified web site hit
log where there is a count of hits maintained per user name and origin
IP of each hit.

Thus the transaction being replicated between the servers consists of
incrementing an IP's hit count and then incrementing a user's hit count.
If either IP or user do not have a count, a row is added with a count
of 1. The transaction is then logged for replication, so that all
servers get all hits, no matter which of the replicating servers
processes the hit.

``` programlisting
create table wl_ip_cnt (ic_ip varchar, ic_cnt integer,
       primary key (ic_ip));
```

``` programlisting
create table wl_user (wu_user varchar, wu_cnt integer,
       primary key (wu_user));
```

``` programlisting
create procedure wl_hit_repl (in ip varchar, in usr varchar)
{
  set isolation = 'serializable';
  update wl_ip_cnt set ic_cnt = ic_cnt + 1 where ic_ip = ip;
  if (0 = row_count ())
    insert into wl_ip_cnt (ic_ip, ic_cnt) values (ip, 1);
  update wl_user set wu_cnt = wu_cnt + 1 where wu_user = usr;
  if (0 = row_count ())
    insert into wl_user (wu_user, wu_cnt) values (usr, 1);
}
```

``` programlisting
create procedure wl_hit (in ip varchar, in usr varchar)
{
  wl_hit_repl (ip, usr);
  repl_text ('hits', 'wl_hit_repl (?, ?)', ip, usr);
}
```

The application client calls wl_hit on one of the mutually replicating
servers to log an event. The event's trace will then be propagated to
all other servers. The wl_hit_repl function does the actual work. The
top level function calls this plus logs the call with its arguments on
the local server's hits publication for distribution to other servers.

<div>

<div>

<div>

<div>

### 13.6.1. Configuration of the Sample

</div>

</div>

</div>

The following sequence of calls can be used to define a network of four
servers, each replicating every other server. For the sake of example,
they are all on localhost and listen at ports 2001 through 2004.

``` programlisting
repl_server ('log1', 'localhost:2001');
repl_server ('log2', 'localhost:2002');
repl_server ('log3', 'localhost:2003');
repl_server ('log4', 'localhost:2004');
```

``` programlisting
repl_publish ('hits', 'hits.log');
```

``` programlisting
repl_subscribe ('log1', 'hits');
repl_subscribe ('log2', 'hits');
repl_subscribe ('log3', 'hits');
repl_subscribe ('log4', 'hits');
```

First all the servers are identified. Next the local server declares
that it has a publication 'hits'. Next it subscribes to the hits
publications of all other servers. In the process it also subscribes to
itself, which signals an error and has no other effect.

In this way all servers share one configuration. Each server knows which
of the servers it is based on the DBName setting in its virtuoso.ini
file.

</div>

</div>
