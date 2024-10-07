<div id="tpccprocs" class="section">

<div class="titlepage">

<div>

<div>

## 21.7. TPC C Procedures

</div>

</div>

</div>

<div id="intro" class="section">

<div class="titlepage">

<div>

<div>

### 21.7.1. Introduction

</div>

</div>

</div>

This document goes through the TPC C sample and explains how and why the
transaction procedures are written as they are.

This describes the five transactions in the benchmark and points out how
the procedures are written and which features of the language are used
where. See the sample/tpcc.sql and sample/tpcctrx.c files along with
this commentary.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                                   |
|:--------------------------:|:----------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                         |
|                            | For a formal benchmark definition, see the documentation at <a href="http://www.tpc.org/" class="ulink" target="_top">the TPC Web 
                              Site</a> .                                                                                                                         |

</div>

</div>

</div>
