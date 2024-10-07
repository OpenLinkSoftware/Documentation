<div id="mt_loglevels" class="section">

<div class="titlepage">

<div>

<div>

## 17.3. Broker Log Levels

</div>

</div>

</div>

The Request Broker reports various information and messages to the
foreground window, or the log file if selected. The amount of detail
that is shown is controlled by the loglevel parameter.

Define the required loglevel on the command line call. For example to
get loglevel 7, use:

``` programlisting
oplrqb +loglevel 7
```

or

``` programlisting
oplrqb -l 7
```

Alternatively set the loglevel default in the oplrqb.ini file.

``` screen
[Request Broker]
CommandLine = +loglevel 7
```

When a loglevel is specified, the messages from priority 0 up to that
level are shown. Thus using +loglevel 5 will produce messages from
levels 0, 1, 2, 3, 4 and 5. Specifying +loglevel 9 is the same as
+loglevel 7 as levels 8 and 9 are not defined.

Typical loglevels are 7 for troubleshooting, 3,4 or 5 for normal use,
and 0 or 1 for a limited report. The if a loglevel is not specified,
then a default of 5 is used.

The level of detailed for each log level is as follows:

<div id="id33924" class="decimalstyle">

**Table 17.13. Log Levels**

<div class="decimalstyle-contents">

| Level | Category | Comment                            |
|:-----:|----------|------------------------------------|
|   0   | EMERG    | System is unusable                 |
|   1   | ALERT    | Action must be taken immediately   |
|   2   | CRIT     | Critical conditions                |
|   3   | ERR      | Error conditions                   |
|   4   | WARNING  | Warning conditions                 |
|   5   | NOTICE   | Normal but signification condition |
|   6   | INFO     | Informational                      |
|   7   | DEBUG    | Debug-level messages               |

</div>

</div>

  

</div>
