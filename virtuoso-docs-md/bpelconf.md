<div id="bpelconf" class="section">

<div class="titlepage">

<div>

<div>

### 17.15.6. Configuration parameters

</div>

</div>

</div>

The BPEL engine has global configuration parameters settable via the
configuration settings page of its web user interface. These are global
and are kept in the BPEL..configuration table as name/value pairs.

<div class="itemizedlist">

- EngineMailAddress - e-mail address to whom will be sent error alerts
  and reports.

- ErrorAlertSkeleton - e-mail template for error alerts

- ErrorReportSkeleton - e-mail template for error reports

- AlertSubject - Subject for error alert e-mail

- CommonEmailHeader - Header for all BPEL e-mail notifications

- ErrorSubject - Subject for error report e-mail

- InstanceExpiryDelay - how long (hours a completed instance will be
  kept in the database before purging.

- MailServer - if specified this will be used to send the error alerts
  and reports. If this is not specified the default (from INI file) mail
  server will be used.

- Statistics - process statistics flag, if 0 (default) the statistics
  collection is disabled. When this is 1 the engine will start
  collecting statistics for new process instances .

</div>

</div>
