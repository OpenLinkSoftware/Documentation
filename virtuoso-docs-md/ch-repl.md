<div>

<div>

<div>

<div>

# Chapter 13. Data Replication, Synchronization and Transformation Services

</div>

<div>

<div>

**Abstract**

This chapter describes how to replicate data between Virtuoso and
non-Virtuoso servers.

The material in this chapter covers the programmatic means of performing
these operations. You can also use the graphical interface to do
replication and synchronization. This is covered in the Replication &
Synchronization section of the Visual Server Administration Interface
chapter.

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">13.1.
[Introduction](ch-repl.html#replintro)</span>

<span class="section">13.1.1. [Snapshot
replication](ch-repl.html#preface_snapshot)</span>

<span class="section">13.1.2. [Transactional
replication](ch-repl.html#preface_trx)</span>

<span class="section">13.2. [Snapshot Replication](snapshot.html)</span>

<span class="section">13.2.1. [Non incremental snapshot
replication](snapshot.html#noninc)</span>

<span class="section">13.2.2. [Incremental snapshot
replication](inc.html)</span>

<span class="section">13.2.3. [Command reference](commands.html)</span>

<span class="section">13.2.4. [Bi-Directional Snapshot
Replication](bidirrepl.html)</span>

<span class="section">13.2.5. [Registry variables](snpreg.html)</span>

<span class="section">13.2.6. [Heterogeneous snapshot
replication](snpheter.html)</span>

<span class="section">13.2.7. [Data type mappings](snpmap.html)</span>

<span class="section">13.2.8. [Objects created by incremental snapshot
replication](snpincobj.html)</span>

<span class="section">13.2.9. [Objects created by bi-directional
snapshot replication](snpbidirobj.html)</span>

<span class="section">13.2.10. [Replication system
tables](replsystables.html)</span>

<span class="section">13.2.11. [Table snapshot logs](snlog.html)</span>

<span class="section">13.3. [Transactional
Replication](proctransrepl.html)</span>

<span class="section">13.3.1. [Publishable
Items](proctransrepl.html#pubitems)</span>

<span class="section">13.3.2. [Errors in
Replication](errorsinreplication.html)</span>

<span class="section">13.3.3. [Publisher Transactional Replication
Functions](transreplpublishfunctions.html)</span>

<span class="section">13.3.4. [Subscriber
Functions](subscriberfunctions.html)</span>

<span class="section">13.3.5. [Common Status
Functions](replstatusfunctions.html)</span>

<span class="section">13.3.6. [Bi-Directional Transactional
Replication](bidirtransrepl.html)</span>

<span class="section">13.3.7. [Purging replication
logs](trxlogpurger.html)</span>

<span class="section">13.3.8. [Objects created by transactional
replication](trxobj.html)</span>

<span class="section">13.4. [Virtuoso scheduler](scheduler.html)</span>

<span class="section">13.4.1.
[SYS_SCHEDULED_EVENT](scheduler.html#replschsystables)</span>

<span class="section">13.5. [Transactional Replication
Example](replexamples.html)</span>

<span class="section">13.5.1. [Transactional Replication Objects
Example](replexamples.html#objectsexample)</span>

<span class="section">13.6. [Replication Logger
Sample](replsample.html)</span>

<span class="section">13.6.1. [Configuration of the
Sample](replsample.html#loggercfg)</span>

<span class="section">13.6.2. [Synchronization](loggersync.html)</span>

<span class="section">13.6.3. [Running the
Sample](runninglogger.html)</span>

<span class="section">13.6.4. [Notes on the Sample's
Dynamics](loggerdynamics.html)</span>

</div>

<div>

<div>

<div>

<div>

## 13.1. Introduction

</div>

</div>

</div>

Virtuoso provides several replication methods:

<div>

<div>

<div>

<div>

### 13.1.1. Snapshot replication

</div>

</div>

</div>

Virtuoso provides the following flavors of snapshot replication:

|                                                                                                                                                                                                   |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Non-incremental snapshot replicationNon-incremental snapshot replication is useful when the data is changed infrequently or when data is modified in large portions at a time.                    |
| Incremental snapshot replication Incremental snapshot replication is useful when the data is changed frequently and implements incremental updates using a snapshot log.                          |
| Bi-directional snapshot replication Bi-directional snapshot replication allows data to be modified on both publisher and subscribers. This is useful read-write access to the replicas is needed. |

<div>

|                              |                                                                                                                      |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                |
|                              | Snapshot replication can be used in heterogeneous environments to set up replication between non-Virtuoso databases. |

</div>

</div>

<div>

<div>

<div>

<div>

### 13.1.2. Transactional replication

</div>

</div>

</div>

Transactional replication allows subscribers to receive data in
near-real time. ACID properties of transactions are maintained in
transactional replication as well. Virtuoso implements the following
flavors of transactional replication:

|                                                                                                                                                                                                                                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ordinary transactional replicationOrdinary transactional replication flavor implements one-way data replication and is useful when data can be modified on only one server with other servers participating in replication providing read-only data access. |
| Bi-directional transactional replication Bi-directional transactional replication is useful when there is a requirement to allow data updates on multiple servers.                                                                                          |

</div>

</div>

</div>
