<div id="fn_sys_stat" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sys_stat — Return statistical information about the Virtuoso server.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sys_stat" class="funcsynopsis">

|                          |                              |
|--------------------------|------------------------------|
| `any `**`sys_stat`**` (` | in `stat_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sys_stat" class="refsect1">

## Description

This function returns the statistic related to the requested statistic
name give as a parameter to the function.

</div>

<div id="params_sys_stat" class="refsect1">

## Parameters

<div id="id112884" class="refsect2">

### stat_name

The name of the statistic to look-up and return. This can be one of:

|                              |
|------------------------------|
| st_dbms_name                 |
| st_dbms_ver                  |
| st_build_thread_model        |
| st_build_opsys_id            |
| st_build_date                |
| st_lic_owner                 |
| st_lic_max_connections       |
| st_lic_current_use           |
| st_lic_granted_use           |
| st_lic_peak_use              |
| st_lic_times_exceeded        |
| st_lic_claims                |
| st_lic_clients               |
| st_lic_issuer                |
| st_lic_serial_number         |
| st_lic_release               |
| st_lic_platform              |
| st_lic_expiredate            |
| st_lic_ncpus                 |
| st_lic_nusers                |
| st_lic_modules               |
| st_lic_applications          |
| st_lic_availability          |
| st_lic_clients               |
| st_lic_nodename              |
| st_lic_wstype                |
| st_lic_notice                |
| st_lic_lmgr_version          |
| st_lic_lmgr_directory        |
| st_proc_served               |
| st_proc_active               |
| st_proc_running              |
| st_proc_queued_req           |
| st_proc_brk                  |
| st_db_file_size              |
| st_db_pages                  |
| st_db_free_pages             |
| st_db_buffers                |
| st_db_used_buffers           |
| st_db_dirty_buffers          |
| st_db_wired_buffers          |
| st_db_disk_read_avg          |
| st_db_disk_read_pct          |
| st_db_disk_read_last         |
| st_db_disk_read_aheads       |
| st_db_disk_read_ahead_batch  |
| st_db_disk_second_reads      |
| st_db_disk_in_while_read     |
| st_db_disk_mt_write          |
| st_db_log_name               |
| st_db_log_length             |
| st_cli_connects              |
| st_cli_max_connected         |
| st_cli_n_current_connections |
| st_cli_n_http_threads        |
| st_rpc_stat                  |
| st_inx_pages_changed         |
| st_inx_pages_new             |
| st_chkp_remap_pages          |
| st_chkp_mapback_pages        |
| st_chkp_atomic_time          |
| st_chkp_autocheckpoint       |
| st_chkp_last_checkpointed    |
| st_repl_serv_name            |
| st_host_name                 |
| st_os_user_name              |
| st_case_mode                 |

</div>

</div>

<div id="ret_sys_stat" class="refsect1">

## Return Types

Statistic to be returned. Can be a value such as the server version, or
a string such as the database name.

</div>

<div id="examples_sys_stat" class="refsect1">

## Examples

<div id="ex_sys_stat" class="example">

**Example 24.414. Returning simple statistics.**

<div class="example-contents">

``` screen
SQL> select concat(sys_stat('st_dbms_name'), ' - ', sys_stat('st_dbms_ver'));
callret
VARCHAR
_______________________________________________________________________________

OpenLink Virtuoso PHP4 Server - 03.00.2402
```

</div>

</div>

  

</div>

</div>
