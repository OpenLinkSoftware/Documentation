<div>

<div>

<div>

<div>

## 13.4. Virtuoso scheduler

</div>

</div>

</div>

Virtuoso scheduler allows an arbitrary SQL command to be run at certain
intervals.

The scheduler process wakes up every n minutes, scans the
SYS_SCHEDULED_EVENT table and executes each command which applies to the
current time. Note that overdue commands are executed only once.

There is a virtuoso.ini parameter "SchedulerInterval" under
<a href="ch-server.html#ini_parameters" class="link"
title="[Parameters]">Parameters</a> section which defines the scheduler
wake-up interval. Set this to 0 (the default) to disable the scheduler.

<div>

<div>

<div>

<div>

### 13.4.1. SYS_SCHEDULED_EVENT

</div>

</div>

</div>

``` programlisting
CREATE TABLE SYS_SCHEDULED_EVENT(
    SE_NAME     varchar,
    SE_START        datetime,
    SE_SQL      varchar,
    SE_LAST_COMPLETED   datetime,
    SE_INTERVAL     integer,
    PRIMARY KEY(SE_NAME));
```

This table describes each scheduled SQL command. SE_NAME is the name of
the scheduled event. SE_START is the first schedule execution time.
SE_SQL is the text of the SQL command to be executed. SE_LAST_COMPLETED
is the last time when the SQL command was executed successfully.
SE_INTERVAL is the interval between the runs of the SQL command in
minutes.

Defining a new scheduled event means adding a row to the
SYS_SCHEDULED_EVENT with an insert statement like this:

``` programlisting
INSERT INTO SYS_SCHEDULED_EVENT (SE_NAME, SE_SQL, SE_START, SE_INTERVAL)
        VALUES (.....)
```

</div>

</div>
