<div id="mt_errorcodes" class="section">

<div class="titlepage">

<div>

<div>

## 17.2. Error Codes

</div>

</div>

</div>

When a Broker or agent is terminated, the exit code can be seen in the
log file (for example oplrqb.log) or in the foreground window.

The exits codes are shown below:

<div id="id33824" class="decimalstyle">

**Table 17.11. Log Levels**

<div class="decimalstyle-contents">

| Exit Code | Category | Comment                                                                                                                                                                                                             |
|:---------:|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     0     | NORMAL   | Normal exit with success                                                                                                                                                                                            |
|     1     | WARNING  | some kind of failure at startup/shutdown, typically shown with a reason for this error                                                                                                                              |
|    \>1    | UNKNOWN  | When the exit code is not in the range of 0-15 then it is typically an uninitialised exit value taken from the stack. This can occur when an error in some database code is returned to the OpenLink code (Broker). |

</div>

</div>

  

The agent or broker may be terminated with a signal:

<div id="id33847" class="decimalstyle">

**Table 17.12. Reported Signals**

<div class="decimalstyle-contents">

| Signal | Name    | Category | Comment                                                                   |
|:------:|---------|----------|---------------------------------------------------------------------------|
|   2    | SIGINT  | NORMAL   | user pressed CTRL-C on oplrqb -fd                                         |
|   3    | SIGQUIT | NORMAL   | user pressed CTRL-\\ on oplrqb -fd                                        |
|   4    | SIGILL  | FAULT    | illegal instruction resulting in a program crash                          |
|   7    | SIGBUS  | FAULT    | misaligned mem read/write resulting in a program crash                    |
|   8    | SIGFPE  | FAULT    | divide by 0 or other arithmetical error                                   |
|   9    | SIGKILL | NORMAL   | sent by the broker to kill an agent which has ignored multiple SIGTERMs   |
|   11   | SIGSEGV | FAULT    | buffer/stack overrun resulting in a program crash                         |
|   13   | SIGPIPE | NORMAL   | other side of a pipe was killed while this side tried to write data to it |
|   15   | SIGTERM | NORMAL   | sent by the broker to an agent to ask it to terminate                     |

</div>

</div>

  

On the Windows platform, severe errors are reported in the following
way:

``` screen
pid ... died with status code 0x....
```

The hex number may be looked up in the winnt.h file. All errors reported
in this way are considered severe, and should be reported to OpenLink
Support.

</div>
