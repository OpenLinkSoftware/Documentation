<div id="signalsandexitcodes" class="section">

<div class="titlepage">

<div>

<div>

## 23.3. Signals and Exit codes

</div>

</div>

</div>

This section presents the most important exit codes and signals for
Virtuoso on Unix/Linux.

<div id="signalsandexitcodesc" class="section">

<div class="titlepage">

<div>

<div>

### 23.3.1. Exit codes

</div>

</div>

</div>

<div id="id76841" class="decimalstyle">

**Table 23.2. Exit codes**

<div class="decimalstyle-contents">

| Exit Code | Category | Comment                                                                                |
|:----------|----------|----------------------------------------------------------------------------------------|
| -1        | FATAL    | Unrecoverable condition detected like disk or memory full                              |
| 0         | NORMAL   | Normal exit with success                                                               |
| 1         | WARNING  | Some kind of failure at startup/shutdown, typically shown with a reason for this error |
| \>1       | UNKNOWN  | Not used under normal operations                                                       |
| \>128     | SIGNAL   | Virtuoso was killed by a signal it could not process. (error code = signal + 128)      |

</div>

</div>

  

</div>

</div>
