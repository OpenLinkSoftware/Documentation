<div id="mt_getagntinfo" class="section">

<div class="titlepage">

<div>

<div>

## 8.4. Obtaining Agent Information

</div>

</div>

</div>

OpenLink Database agents have a specific naming convention, reflecting
the identification of a particular database engine, and in some case
specific versions of a given database engine.

The OpenLink executable binary file naming convention consists of three
distinctive logical parts:

\<db_engine\>\[\<db_ver\>\]\_\<\[sv\|mv\]\>\[.exe\]

|                                                                                                                    |
|--------------------------------------------------------------------------------------------------------------------|
| Database Engine - first three or four characters                                                                   |
| Database Version - next two or three characters (depending on database engine version number-functionality issues) |
| OpenLink Service Provider Identifier - the characters "\_sv" for single threaded or "\_mv" for multi-threaded.     |

On a Windows system, the file extension is .exe which is shown as
optional in this description but omitted in the table below.

The table below shows you how the current pool of OpenLink agents are
identified based on the convention described above:

<div id="id9745" class="decimalstyle">

**Table 8.18. OpenLink Service providers**

<div class="decimalstyle-contents">

| Executable Binary File | Database Engine & Version      |
|:-----------------------|--------------------------------|
| virt_mv                | OpenLink Virtuoso              |
| inf7_mv                | Informix 7.x (Windows)         |
| inf71_sv               | Informix 7.1 (not Windows)     |
| inf72_sv               | Informix 7.2 (not Windows)     |
| inf73_mv               | Informix 7.3 (not Windows)     |
| mys3_mv                | MySQL 3.x                      |
| oig1_sv                | OpenIngres 1.x                 |
| oig2_sv                | Ingres II                      |
| pgr7_mv                | PostgreSQL 7                   |
| pro73c_sv              | Progress 7.3C                  |
| pro73e_sv              | Progress 7.3E                  |
| pro82a_sv              | Progress 8.2A                  |
| pro82c_sv              | Progress 8.2C                  |
| pro83a_sv              | Progress 8.3A                  |
| pro83b_sv              | Progress 8.3B                  |
| pro90b_sv              | Progress 9.0B                  |
| pro91a_sv              | Progress 9.1A                  |
| pro91b_sv              | Progress 9.1B                  |
| prs91_sv               | Progress 91 SQL-92             |
| pro81as_sv             | Progress 8.1A small (Windows)  |
| pro82as_sv             | Progress 8.2A small (Windows)  |
| pro82cs_sv             | Progress 8.2C small (Windows)  |
| pro83as_sv             | Progress 8.3A small (Windows)  |
| pro83bs_sv             | Progress 8.3B small (Windows)  |
| pro90bs_sv             | Progress 9.0B small (Windows)  |
| pro91as_sv             | Progress 9.1A small (Windows)  |
| pro91bs_sv             | Progress 9.1B small (Windows)  |
| ora7_sv                | Oracle 7.x                     |
| ora803_mv              | Oracle 8.0.3                   |
| ora805_mv              | Oracle 8.0.5                   |
| ora81_mv               | Oracle 8.1.x (8i windows)      |
| ora8i_mv               | Oracle 8i (not windows)        |
| ora9i_mv               | Oracle 9i (windows)            |
| sybc10_mv              | Sybase 10.x (CTLib)            |
| sybc11_mv              | Sybase 11.x (CTLib)            |
| sql6_mv                | Microsoft SQL Server 6.x & 7.x |
| sql2k_mv               | Microsoft SQL Server 2000      |
| db2_mv                 | DB2                            |

</div>

</div>

  

<div id="mt_verrelfuncinfo" class="section">

<div class="titlepage">

<div>

<div>

### 8.4.1. Specific Agent Information

</div>

</div>

</div>

In a manner similar to the Request Broker, you can obtain component
version, release, and functionality related information about your
database agent through your operating system's command line interface.

To obtain the information about your database agent simply type in the
name of the binary executable file for the relevant agent and the --help
switch. The example below shows how this is done assuming you are
seeking information about the OpenLink Virtuoso database agent:

``` programlisting
virt_sv --help
```

The output returned is depicted below:

``` programlisting
        OpenLink Virtuoso Database Agent
        Version 1.2 (Release 4.0) as of Mon Jul 31 2000 (cvsid 00051).
        Compiled for Linux 2.4.0-test1 (i686-pc-linux-gnu)
        Copyright (C) OpenLink Software.
        Usage:
        virt_sv [-CmijrlLd] [+noautocommit] [+maxrows num] [+initsql arg] [+jetfix] 
    [+norowsetlimit] [+loglevel num] [+logfile arg] [+debug]
        +noautocommit       turn autocommit off by default
        +maxrows        maximum allowed rows to fetch
        +initsql        execute SQL from this file for every connection made
        +jetfix         Jet Engine Compatibility Features
        +norowset       disable the limit rowsetsize
      
```

Version - relates to the actual source code archive from which a
database agent has been assembled.

Binary Platform - indicates what platform the database agent has been
built to run on.

Usage - describes the command line options that are to be used with a
particular database agent, these can be database agent specific. The
command line options are to be used within the Database Agent
configuration section of "Session Rules Book" (the file oplrqb.ini),
this is the section that handles database agent specific items. You can
add these entries as required to the rule book, you do so by manually
editing the rule book file or via the Web based Admin Assistant (see
section on Configuring Database Agents).

</div>

</div>
