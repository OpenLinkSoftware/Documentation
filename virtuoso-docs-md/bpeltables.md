<div>

<div>

<div>

<div>

### 17.15.11. Tables

</div>

</div>

</div>

BPEL Engine Tables

``` programlisting
-- Scripts table, keeps one record per version
create table BPEL.BPEL.script (
    bs_id integer identity,     -- unique id identifying the process
    bs_uri varchar,         -- obsoleted: script source URI
    bs_name varchar,        -- process name, all versions have same name
    bs_state int,           -- 0 on, current version, 1 obsolete, 2 edit mode
    bs_date datetime,       -- date of registration
    bs_audit int default 0,     -- audit flag : 1 on, 0 off
    bs_debug int default 0,     -- debug flag
    bs_version int default 0,   -- process version
    bs_parent_id int default null,  -- fk to bs_id of previous process version
    bs_first_node_id int,       -- the first node id in the graph
    bs_pickup_bf varbinary default '\x0',   -- bitmask for resume nodes
    bs_act_num  int,        -- stores the total number of activities
    bs_lpath    varchar default null, -- virtual directory

    -- process statistics
    bs_n_completed int default 0,
    bs_n_errors int default 0,
    bs_n_create int default 0,
    bs_cum_wait int default 0,
    primary key (bs_id));

-- BPEL and WSDL sources
create table BPEL..script_source
    (
     bsrc_script_id int, -- script id, fk to bs_id of scripts table.
     bsrc_role varchar,  -- one of bpel, bpel-ext, wsdl, deploy, partner-1... partner-n
     bsrc_text long xml, -- source text
     bsrc_url varchar,   -- if this comes from an uri
     bsrc_temp varchar,  -- contains the namespaces info
     primary key (bsrc_script_id, bsrc_role)
)
;

-- Process instances
create table BPEL.BPEL.instance (
    bi_id int identity,         -- global immutable id of instance
    bi_script int,          -- fk to bs_id from BPEL.BPEL.script
    bi_scope_no int default 0,      -- sequence counter for scope numbers in instance
    bi_state int default 0,
        -- 0, started
        -- 1, suspended (wait for signal)
        -- 2, finished
        -- 3, aborted
    bi_error any,           -- error
    bi_lerror_handled int,
    bi_last_act datetime,   -- last activity execution
    bi_started  datetime,   -- start time
    bi_init_oper    varchar,    -- operation that made the instance
    bi_wsa      long xml,   -- WS-Addressing headers
    bi_activities_bf varbinary default '\x0\x0', -- bitmask for each activity is completed or not
    bi_link_status_bf varbinary default '\x0\x0', -- bitmask for link status
    bi_prefix_info varchar default '', -- xpath prefix string
    primary key (bi_id));

-- Initial values (URL etc.) for partner links
create table BPEL.BPEL.partner_link_init (
    bpl_script int,     -- script instance id
    bpl_name varchar,   -- partner link name
    bpl_partner any,    -- url, end point etc serialized
    bpl_role varchar,
    bpl_myrole varchar,
    bpl_type varchar,
    bpl_endpoint varchar,   -- partner service endpoint URL
    bpl_backup_endpoint varchar,
    bpl_wsdl_uri varchar,
    bpl_debug int default 0,-- debug flag
    bpl_opts long xml,  -- partner link options (WS-Security, WS-RM etc.)
    primary key (bpl_script,bpl_name));

-- Runtime values for partner links (run time copy of partner_link_init table)
create table BPEL..partner_link (
    pl_inst int,        -- instance id
    pl_name varchar,    -- partner link name
    pl_scope_inst int,  -- scope instance id
    pl_role int,        -- flag 0 - myRole, 1 - partnerRole
    pl_endpoint varchar,    -- current URL to the partner service
    pl_backup_endpoint varchar, -- second URL to the service for connection error
    pl_debug int default 0, -- debug flag
    pl_opts long xml,   -- partner link options (WS-Security, WS-RM etc.)
    primary key (pl_inst, pl_name, pl_scope_inst, pl_role));

-- Script compilation
create table BPEL.BPEL.graph (
    bg_script_id int,   -- FK to bs_id of BPEL.BPEL.script
    bg_node_id int ,    -- running id in the script, referenced from BPEL.BPEL.waits etc.
    bg_activity BPEL.BPEL.activity, -- UDT representing activity
    bg_childs any,
    bg_parent int,
        bg_src_id varchar,  -- internal use
    primary key (bg_script_id, bg_node_id));

-- Receive activities waiting for incoming message
create table BPEL.BPEL.wait (
    bw_uid varchar,
    bw_instance integer,  -- instance id
    bw_script varchar,    -- FK reference to bs_name of script table
    bw_script_id int,     -- FK reference to bs_id of script table
    bw_node int,          -- FK reference to bg_node_id of the graph table
    bw_scope  int,
    bw_partner_link varchar, -- the party from which instance waiting a message
    bw_port varchar,     -- the name of the operation which instance wait to receive
    bw_deadline datetime,
    bw_message long varchar default null, -- if instance is occupied and message is already arrived
    bw_state int default 0,           -- flag that bw_message is not null (0 or 1)
    bw_correlation_exp varchar,           -- XPath expression for computing the correlation value from message
    bw_expected_value long varbinary,     -- value of the expected correlation
    bw_message_type int default 0,        -- where to expect the data : 0 - SOAP:Body 1 - SOAP:Header
    bw_start_date datetime,
    primary key (bw_instance, bw_node));

-- Messages which have been arrived but not correlated yet
create table BPEL.BPEL.queue (
    bq_id int identity, -- unique id
    bq_script int,      -- FK references bs_id from the script table
    bq_ts timestamp,
    bq_state int,       -- state of the Queue item; 0 - not processed
    bq_endpoint varchar,    -- not used
    bq_op varchar,      -- Operation name
    bq_mid varchar,     -- mot used
    bq_message long varchar, -- The incoming message text
    bq_header long varchar,  -- SOAP:Header
    primary key (bq_op, bq_ts)
    );

-- Initial values for SOAP Messages and XMLSchema types
create table BPEL..types_init (
    vi_script int,     -- FK reference to bs_id to the script table
    vi_name   varchar, -- message name, element name etc.
    vi_type   int,     -- 0 - message, 1 - element, 2 - XMLSchema type
    vi_value  long xml,-- Initial value
    primary key (vi_script, vi_name, vi_type)
)
;

-- Matching XPath expressions for the SOAP message parts
create table BPEL.BPEL.message_parts
    (
    mp_script int,      -- FK reference to bs_id to the script table
    mp_message varchar, -- message name
    mp_part varchar,    -- part name
    mp_xp   varchar,    -- location XPath expression
    primary key (mp_script, mp_message, mp_part)
    )
;

-- Operations which are invoked by process (used in invoke activities)
create table BPEL.BPEL.remote_operation (
    ro_script int,      -- FK reference to bs_id to the script table
    ro_partner_link varchar,-- name of the partner link
    ro_role varchar,    -- not used
    ro_operation varchar,   -- operation name
    ro_port_type varchar,   -- port type
    ro_input varchar,   -- input message name
    ro_output varchar,  -- output message name
    ro_endpoint_uri varchar,-- not used
    ro_style int,       -- messages encoding style : 1 - literal, 0 - RPC like
    ro_action varchar default '', -- SOAP Action value
    ro_target_namespace varchar,  -- for RPC encoding the namespace to be used for wrapper elements
    ro_use_wsa int default 0, -- WS-Addressing capabilities flag
    ro_reply_service varchar, -- for one-way operations: reply service name
    ro_reply_port varchar,    -- for one-way operations: reply port type
    primary key (ro_script, ro_partner_link, ro_operation)
)
;

-- Operations which process defines (can receive and reply)
create table BPEL.BPEL.operation (
    bo_script int,      -- FK reference to bs_id to the script table
    bo_name varchar,    -- operation name
    bo_action varchar,  -- SOAP Action value
    bo_port_type    varchar,-- port type
    bo_partner_link varchar,-- name of the partner link
    bo_input    varchar,-- input message name
    bo_input_xp varchar,-- XPath expression to match the input message
    bo_small_input  varchar,-- not used
    bo_output   varchar,-- output message name
    bo_style    int default 0,-- messages encoding style : 1 - literal, 0 - RPC like
    bo_init     int,    -- process instantiation flag: 1 - can make new instances
    primary key (bo_script, bo_name, bo_partner_link)
);

-- Predefined endpoint URLs for partner links
create table BPEL.BPEL.partner_link_conf (
    plc_name    varchar,
    plc_endpoint    varchar,
    primary key (plc_name)
)
;

-- Properties
create table BPEL.BPEL.property
(
  bpr_script int,   -- FK reference to bs_id to the script table
  bpr_name varchar, -- property name
  bpr_type varchar, -- property type
  primary key (bpr_script, bpr_name)
)
;

-- Aliases
create table BPEL.BPEL.property_alias (
    pa_script   int,        -- FK reference to bs_id to the script table
    pa_prop_id  int identity,
    pa_prop_name    varchar,    -- property name
    pa_message  varchar,    -- message name
    pa_part     varchar,    -- part name
    pa_query    varchar,    -- XPath query to set the property value
    pa_type     varchar,
    primary key (pa_script, pa_prop_name, pa_message))
;

-- Correlation properties
create table BPEL.BPEL.correlation_props (
    cpp_id      int identity (start with 1),
    cpp_script  int,        -- FK reference to bs_id to the script table
    cpp_corr    varchar,    -- correlation name
    cpp_prop_name   varchar,    -- property name
    primary key (cpp_id, cpp_script, cpp_corr, cpp_prop_name))
;

-- Variables
create table BPEL..variables (
    v_inst      int,        -- instance id, FK reference bi_id of the instance table
    v_scope_inst    int,        -- scope instance id; different than 0 for compensation scope
    v_name      varchar,    -- variable name
    v_type      varchar,    -- variable type
    v_s1_value  any,        -- string, numeric
    v_s2_value  varchar,    -- XML entities
    v_b1_value  long varchar,   -- long strings
    v_b2_value  long varchar,   -- XML entities
    primary key (v_inst, v_scope_inst, v_name))
;

-- Links
create table BPEL..links
    (
      bl_script int,    -- FK reference to bs_id to the script table
      bl_name   varchar,    -- link name
      bl_act_id int,    -- corresponding link activity bit number
      primary key (bl_act_id, bl_script)
    )
;

-- Compensation scopes
create table BPEL..compensation_scope
    (tc_inst int,
     tc_seq  int identity (start with 1),
     tc_scopes long varbinary,
     tc_head_node int,
     tc_head_node_bit int,
     tc_compensating_from int default null,
     primary key (tc_inst, tc_seq)
    )
;

-- Messages are correlated via WS-Addressing
create table BPEL..wsa_messages
    (
    wa_inst int,
    wa_pl   varchar,
    wa_mid  varchar,
    primary key (wa_inst, wa_pl, wa_mid)
    )
;

create table BPEL..lock
    (
    lck int primary key
    )
;

-- Accepted connections which are waiting for reply
create table BPEL..reply_wait
    (
    rw_inst int,
    rw_id int, -- identity (start with 1),
    rw_partner varchar,
    rw_port varchar,
    rw_operation varchar,
    rw_query varchar,
    rw_expect varchar,
    rw_started datetime,
    primary key (rw_inst, rw_id)
    )
;

-- Registered alarm events
create table BPEL..time_wait
    (
      tw_inst   int,
      tw_node   int,
      tw_scope_inst int,
      tw_script varchar,
      tw_script_id  int,
      tw_sec    int,
      tw_until  datetime,
      primary key (tw_inst, tw_node)
    )
;

-- BPEL message debugging queue
create table BPEL..dbg_message (
    bdm_text long varchar,      -- message text
    bdm_id int identity (start with 1),
    bdm_ts datetime,
    bdm_inout int,          -- 1 for in, 0 for out
    bdm_sender_inst int,        -- instance id of sender if outbound message
    bdm_receiver int,       -- if inbound, inst id of receiving inst
    bdm_plink varchar,      -- name of partner link in the script in question
    bdm_recipient varchar,      -- partner link value for outbound message, URL.
    bdm_activity int,       -- activity id of activity that either sent the message or would receive the message in the sender/receiver instance.
    bdm_oper varchar,       -- operation name
    bdm_script int,         -- process id, FK reference bs_id from script table
    bdm_action varchar,     -- SOAP Action value
    bdm_conn int,           -- client connection id
    primary key (bdm_id)
)
;

-- BPEL engine configuration
create table BPEL..configuration (
    conf_name   varchar not null,
    conf_desc   varchar,
    conf_value  any, -- not blob
    conf_long_value long varchar,
    primary key (conf_name)
)
;

create table BPEL.BPEL.op_stat
    (
     bos_process int,
     bos_plink varchar,
     bos_op varchar,
     bos_n_invokes int default 0,
     bos_n_receives int default 0,
     bos_cum_wait numeric default 0, -- milliseconds total time wait at the partner link/operation
     bos_data_in numeric default 0,
     bos_data_out numeric default 0,
     bos_n_errors int default 0,
     primary key (bos_process, bos_plink, bos_op)
)
;

create table BPEL.BPEL.error_log
    (
     bel_ts timestamp,
     bel_seq int identity,
     bel_level int, -- bel_level is 1. fatal 2. network, 3 instance.
     bel_notice_sent datetime,  -- time the email was sent, null if none
     bel_text varchar,
     primary key (bel_ts, bel_seq)
)
;

create table BPEL.BPEL.hosted_classes
    (
     hc_script  int,
     hc_type    varchar default 'java',
     hc_name    varchar,
     hc_text    long varbinary, -- compiled class
     hc_path    varchar, -- path to class if it is stored in file system
     hc_load_method varchar,
     primary key (hc_script, hc_type,  hc_name)
)
;

    
```

</div>
