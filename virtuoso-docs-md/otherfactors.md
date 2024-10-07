<div id="otherfactors" class="section">

<div class="titlepage">

<div>

<div>

## 21.6. Other Factors

</div>

</div>

</div>

Benchmarks are run with a transaction monitor, usually Tuxedo. This has
not been discussed here. Multiprocessor questions have not been
addressed either. Virtuoso off the box should scale to about 4 CPU's on
any appropriate multithreaded, multiprocessor OS. Past 4 CPU's the
returns will diminish.

Operating systems have different caching policies which must be taken
into account. If an OS does read ahead, that's OK. Generally OS
intelligence is harmful and should be turned off. For example, AIX
reacts to its disk write queue being full by turning off the writing
process until it has flushed enough of its own file cache. This instead
of blocking the writing thread and leaving the rest of the process to
run.

We may release more information on OS tuning in the future.

</div>
