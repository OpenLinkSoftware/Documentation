<div id="ch-functions" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 24. Virtuoso Functions Guide & Reference

</div>

<div>

<div class="abstract">

**Abstract**

The Virtuoso SQL Functions Guide contains reference manual entries for
built-in SQL functions and procedures.

The Virtuoso XPATH & XQUERY Functions Guide contains reference manual
entries of the built-in functions of the Virtuoso XPATH Processor. These
can be used in XPATH, XSLT, XQuery.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

#### Administration

- [cfg_item_count](fn_cfg_item_count.html "return number of items in a section in configuration file
  ") ()
- [cfg_item_name](fn_cfg_item_name.html "get nth item name from ini file
  ") ()
- [cfg_item_value](fn_cfg_item_value.html "returns the value of an item from the ini file
  ") ()
- [cfg_section_count](fn_cfg_section_count.html "get number of sections in an INI file
  ") ()
- [cfg_section_name](fn_cfg_section_name.html "returns INI file section name
  ") ()
- [cfg_write](fn_cfg_write.html "Writes the item=value to an INI file
  ") ()
- [checkpoint_interval](fn_checkpoint_interval.html "Configure database checkpointing
  ") ()
- [DB.DBA.VACUUM](fn_vacuum.html "Compact index structures in the database (deprecated since v6)
      ") ()
- [disconnect_user](fn_disconnect_user.html "Disconnect client connections of a given user
  ") ()
- [fk_check_input_values](fn_fk_check_input_values.html "alter default foreign key checking behavior
  ") ()
- [log_enable](fn_log_enable.html "controls transaction logging and in-statement autocommit
      ") ()
- [log_text](fn_log_text.html "inserts statements into the roll forward log
  ") ()
- [read_log](fn_read_log.html "reads Virtuoso log
  ") ()
- [\_\_dbf_set](fn_dbf_set.html "Sets vector execution parameters.
  ") ()
- [stat_import](fn_stat_import.html "Imports database statistics
  ") ()
- [stat_export](fn_stat_export.html "Produces a statistics summary.
  ") ()
- [prof_enable](fn_prof_enable.html "Control virtuoso profiling
  ") ()
- [prof_sample](fn_prof_sample.html "Adds a profiling sample to a profile being accumulated.
  ") ()
- [status](fn_status.html "Returns  statistics for a running server as a result set
  ") ()
- [key_estimate](fn_key_estimate.html "Get an estimate of row count for a given set of leading index key parts
  ") ()
- [system](fn_system.html "runs a shell command from SQL
  ") ()
- [uptime](fn_uptime.html "returns a string result set with how much time server have been up.
  ") ()
- [sys_lockdown](fn_sys_lockdown.html "Set virtuoso in lockdown state and back.
  ") ()
- [sys_stat](fn_sys_stat.html "Return statistical information about the Virtuoso server.
  ") ()
- [trace_status](fn_trace_status.html "show current trace settings
  ") ()
- [USER_CHANGE_PASSWORD](fn_user_change_password.html "Change the password of an existing user account.
  ") ()
- [USER_CREATE](fn_user_create.html "create a new user account
  ") ()
- [USER_DROP](fn_user_drop.html "This deletes a user ccount, optionally including schema objects, DAV resources and other possible resources  owned by the user.

  ") ()
- [USER_GET_OPTION](fn_user_get_option.html "Retrieve a user option for a given user account.
  ") ()
- [USER_GRANT_ROLE](fn_user_grant_role.html "Assign an existing role to an existing security object.
  ") ()
- [USER_REVOKE_ROLE](fn_user_revoke_role.html "Removes a role from an existing security object.
  ") ()
- [USER_ROLE_CREATE](fn_user_role_create.html "Creates a new SQL role. Same as the create role statement.
  ") ()
- [USER_ROLE_DROP](fn_user_role_drop.html "Remove an existing role (group).
  ") ()
- [USER_SET_QUALIFIER](fn_user_set_qualifier.html "Change the default catalog (qualifier/database) of a user
      account.
  ") ()
- [USER_SET_OPTION](fn_user_set_option.html "Set a user option for a given user account.
  ") ()
- [user_set_password](fn_user_set_password.html "Allows dba to change a user's password.
  ") ()
- [USER_KEY_STORE](fn_user_key_store.html "Saves a key in the database and in case the database is restarted, the key will be loaded again.
  ") ()
- [virtuoso_ini_path](fn_virtuoso_ini_path.html "Return full name of configuration INI file
  ") ()
- [server_root](fn_server_root.html "Returns server working directory.
  ") ()

#### Aggregate Functions

- [VAR](fn_var.html "Returns the variance.
  ") ()
- [VAR_SAMP](fn_var_samp.html "Returns the sample variance.
  ") ()
- [VAR_POP](fn_var_pop.html "Returns the population variance.
  ") ()
- [STDDEV](fn_stddev.html "Returns the standard deviation.
  ") ()
- [STDDEV_SAMP](fn_stddev_samp.html "Returns the cumulative sample standard deviation.
  ") ()
- [STDDEV_POP](fn_stddev_pop.html "Returns the population standard deviation.
  ") ()
- [REGR_SYY](fn_regr_syy.html "Auxiliary function used to compute various diagnostic statistics.
  ") ()
- [REGR_SXX](fn_regr_sxx.html "Auxiliary function used to compute various diagnostic statistics.
  ") ()
- [REGR_SXY](fn_regr_sxy.html "Auxiliary function used to compute various diagnostic statistics.
  ") ()
- [REGR_AVGX](fn_regr_avgx.html "Evaluates the average of the independent variable (expr2) of the regression line.
  ") ()
- [REGR_AVGY](fn_regr_avgy.html "Evaluates the average of the independent variable (expr1) of the regression line.
  ") ()
- [REGR_R2](fn_regr_r2.html "Returns the coefficient of determination (R-squared) of the regression line.
  ") ()
- [REGR_COUNT](fn_regr_count.html "Returns the number of non-null numbers used to fit the regression line.
  ") ()
- [REGR_INTERCEPT](fn_regr_intercept.html "Returns the y-intercept of the regression line.
  ") ()
- [REGR_SLOPE](fn_regr_slope.html "Returns the slope of the line.
  ") ()
- [COVAR_SAMP](fn_covar_samp.html "Returns the sample covariance of a set of number pairs.
  ") ()
- [COVAR_POP](fn_covar_pop.html "Returns the population covariance of a set of number pairs.
  ") ()
- [CORR](fn_corr.html "Returns the coefficient of correlation of a set of number pairs.
  ") ()
- [DB.DBA.XQ_SEQUENCE_AGG](fn_xq_sequence_agg.html "Creates an XQuery sequence object that consists of all values passed the the aggregate.
  ") ()
- [DB.DBA.VECTOR_AGG](fn_vector_agg.html "Returns a vector of passed values.
  ") ()
- [DB.DBA.VECTOR_OF_NONNULLS_AGG](fn_vector_of_nonnulls_agg.html "Returns a vector of passed values ingoring NULL arguments.
  ") ()
- [DB.DBA.VECTOR_OR_NULL_AGG](fn_vector_or_null_agg.html "Returns a vector of passed values.
  ") ()
- [DB.DBA.VECTOR_OF_NONNULLS_OR_NULL_AGG](fn_vector_of_nonnulls_or_null_agg.html "Returns a vector of passed values ingoring NULL arguments.
  ") ()
- [DB.DBA.VECTOR_CONCAT_AGG](fn_vector_concat_agg.html "Expects SQL vectors as arguments and the result is a concatenation
  of all passed vectors.
  ") ()
- [DB.DBA.BAG_AGG](fn_bag_agg.html "Returns a vector of passed values.
  ") ()
- [DB.DBA.BAG_OF_NONNULLS_AGG](fn_bag_of_nonnulls_agg.html "Returns a vector of passed values ingoring NULL arguments.
  ") ()
- [DB.DBA.BAG_OR_NULL_AGG](fn_bag_or_null_agg.html "Returns a vector of passed values.
  ") ()
- [DB.DBA.BAG_OF_NONNULLS_OR_NULL_AGG](fn_bag_of_nonnulls_or_null_agg.html "Returns a vector of passed values ingoring NULL arguments.
  ") ()
- [DB.DBA.BAG_CONCAT_AGG](fn_bag_concat_agg.html "Expects SQL vectors as arguments and the result is a concatenation
  of all passed vectors.
  ") ()

#### AMI APIs

- [DB.DBA.AMAZON_START_INSTANCE](fn_amazon_start_instance.html "Starts an existing AMI instance that user has previously stopped.
  ") ()
- [DB.DBA.AMAZON_RUN_INSTANCE](fn_amazon_run_instance.html "Runs new AMI instance of image.
  ") ()
- [DB.DBA.AMAZON_STOP_INSTANCE](fn_amazon_stop_instance.html "Stops an existing AMI instance.
  ") ()
- [DB.DBA.AMAZON_TERMINATE_INSTANCE](fn_amazon_terminate_instance.html "Terminates (shuts down) an already created AMI instance.
  ") ()
- [DB.DBA.AMAZON_CREATE_VOLUME](fn_amazon_create_volume.html "Creates an Amazon EBS volume that can be attached to any Amazon EC2 instance in the same Availability Zone.
  ") ()
- [DB.DBA.AMAZON_DEREGISTER_IMAGE](fn_amazon_deregister_image.html "Deregisters the specified AMI.
  ") ()
- [DB.DBA.AMAZON_CREATE_IMAGE](fn_amazon_create_image.html "Creates an Amazon EBS-backed AMI from an Amazon EBS-backed instance that is either running or stopped.
  ") ()
- [DB.DBA.AMAZON_CREATE_SNAPSHOT](fn_amazon_create_snapshot.html "Creates a snapshot of an Amazon EBS volume and stores it in Amazon S3.
  ") ()
- [DB.DBA.AMAZON_DELETE_SNAPSHOT](fn_amazon_delete_snapshot.html "Deletes a snapshot of an Amazon EBS volume.
  ") ()
- [DB.DBA.AMAZON_DELETE_VOLUME](fn_amazon_delete_volume.html "Deletes an Amazon EBS volume.
  ") ()
- [DB.DBA.AMAZON_DESCRIBE_IMAGES](fn_amazon_describe_images.html "Describes one or more of the images (AMIs, AKIs, and ARIs) available to you.
  ") ()
- [DB.DBA.AMAZON_DESCRIBE_INSTANCES](fn_amazon_describe_instances.html "Describes one or more of your instances.
  ") ()
- [DB.DBA.AMAZON_IMPORT_KEY_PAIR](fn_amazon_import_key_pair.html "Uploads public key to Amazon.
  ") ()

#### Array Manipulation

- [aref](fn_aref.html "returns specific element of an array or string
  ") ()
- [aset](fn_aset.html "set array element
  ") ()
- [concat](fn_concat.html "Concatenate strings
  ") ()
- [concatenate](fn_concatenate.html "concatenate strings
  ") ()
- [dvector](fn_dvector.html "return an array of either long, float or double
  ") ()
- [get_keyword](fn_get_keyword.html "Find a value in keyword vector
  ") ()
- [get_keyword_ucase](fn_get_keyword_ucase.html "Find a value in keyword vector (search uppercase)
  ") ()
- [gvector_sort](fn_gvector_sort.html "Performs quicksort of a given array.
  ") ()
- [gvector_digit_sort](fn_gvector_digit_sort.html "Performs a stable "digit" sort of a given array.
  ") ()
- [isarray](fn_isarray.html "Check for a valid array
  ") ()
- [make_array](fn_make_array.html "returns a new array
  ") ()
- [position](fn_position.html "returns the index of an element within an array or string
  ") ()
- [rowvector_digit_sort](fn_rowvector_digit_sort.html "Performs a stable "digit" sort of a given array of arrays.
  ") ()
- [vector](fn_vector.html "make a vector
  ") ()
- [vector_concat](fn_vector_concat.html "concatenate vectors
  ") ()

#### Backup

- [backup](fn_backup.html "Write data into transaction log format for backup purposes.  Deprecated. 
  ") ()
- [backup_online](fn_backup_online.html "perform online backup of database
  ") ()
- [backup_context_clear](fn_backup_context_clear.html "Clears the backup context and marks all pages in checkpoint
      space as ready for online backup
  ") ()
- [replay](fn_replay.html "starts the roll forward of the given log
  ") ()

#### BPEL APIs

- [BPEL.BPEL.compile_script](fn_bpel_compile_script.html "Compile a BPEL script source
  ") ()
- [BPEL.BPEL.copy_script](fn_bpel_copy_script.html "Makes a copy of an existing script
  ") ()
- [BPEL.BPEL.get_partner_links](fn_bpel_get_partner_links.html "Returns a list of partner links used in the BPEL script
  ") ()
- [BPEL.BPEL.instance_delete](fn_bpel_instance_delete.html "delete a BPEL process instance
  ") ()
- [BPEL.BPEL.purge_instance](fn_bpel_purge.html "removes old BPEL process instances
  ") ()
- [BPEL.BPEL.script_delete](fn_bpel_script_delete.html "Remove a BPEL process
  ") ()
- [BPEL.BPEL.script_obsolete](fn_bpel_script_obsolete.html "mark a BPEL script as obsoleted
  ") ()
- [BPEL.BPEL.script_source_update](fn_bpel_script_source_update.html "Updates an existing script in BPEL repository
  ") ()
- [BPEL.BPEL.script_upload](fn_bpel_script_upload.html "Upload a new BPEL script source
  ") ()
- [BPEL.BPEL.wsdl_upload](fn_bpel_wsdl_upload.html "Uploads a WSDL description for a given BPEL script
  ") ()
- [BPEL.BPEL.getVariableData](fn_bpel_get_var.html "gets BPEL variable data within <bpelv:exec binding="SQL"> activity
  ") ()
- [BPEL.BPEL.setVariableData](fn_bpel_set_var.html "sets BPEL variable data within code invoked from <bpelv:exec binding="SQL"> activity
  ") ()
- [BPEL.BPEL.plink_get_option](fn_plink_get_option.html "retrieving a partner link option
  ") ()
- [BPEL.BPEL.plink_set_option](fn_plink_set_option.html "set value of a partner link option
  ") ()
- [BPEL.BPEL.import_script](fn_bpel_import_script.html "Import a new BPEL process
  ") ()

#### Virtuoso Server Extension Interface (VSEI)

- [Virtuoso Server Extension Interface (VSEI)
  functions](fn_bif_arg.html "Get parameters for built in function
  ") ()

#### Compression

- [gz_compress](fn_gz_compress.html "Compress data using gzip algorithm
  ") ()
- [gz_uncompress](fn_gz_uncompress.html "Uncompress a string using gzip algorithm
  ") ()
- [string_output_gz_compress](fn_string_output_gz_compress.html "compress a string_output with gzip algorithm
  ") ()

#### Cursor

- [bookmark](fn_bookmark.html "Return the bookmark for current row of a scrollable cursor
  ") ()

#### Date & Time Manipulation

- [curdate](fn_curdate.html "get current date and time
  ") ()
- [forget_timezone](fn_forget_timezone.html "returns its first argument as a timezoned value
  ") ()
- [is_timezoneless](fn_is_timezoneless.html "returns 1 for timezoneless arguments, zero for timezoned
  ") ()
- [adjust_timezone](fn_adjust_timezone.html "returns its first argument with unchanged GMT value but new timezone offset, as it is specified by the
      second argument
  ") ()
- [rdf_now_impl](fn_rdf_now_impl.html "returns the current transaction timestamp
  ") ()
- [current_timestamp](fn_current_timestamp.html "returns the current transaction timestamp
  ") ()
- [curdatetime](fn_curdatetime.html "returns current datetime with adjusted fractional part of seconds
  ") ()
- [curdatetimeoffset](fn_curdatetimeoffset.html "returns current datetime in GMT timezone with adjusted fractional part of seconds
  ") ()
- [curutcdatetime](fn_curutcdatetime.html "returns current datetime in GMT timezone with adjusted fractional part of seconds
  ") ()
- [sysutcdatetime](fn_sysutcdatetime.html "returns current datetime in GMT timezone with adjusted fractional part of seconds
  ") ()
- [dateadd](fn_dateadd.html "arithmetic add to a date
  ") ()
- [datediff](fn_datediff.html "get difference of 2 dates
  ") ()
- [datestring , datestring_gmt
  ,](fn_datestring.html "convert a datetime from internal to external
      date-time representation
  ") ()
- [datestring_GMT](fn_datestring_gmt.html "convert a timestamp to external format string in GMT
  ") ()
- [dayname](fn_dayname.html "decompose a datetime to its components
  ") ()
- [dt_set_tz](fn_dt_set_tz.html "modifies the timezone component of a datetime
  ") ()
- [get_timestamp](fn_get_timestamp.html "returns the timestamp of the current transaction
  ") ()
- [getdate](fn_getdate.html "returns the current transaction timestamp, alias of 
  now


  ") ()
- [msec_time](fn_msec_time.html "Get number of milliseconds from system epoch
  ") ()
- [now](fn_now.html "returns the current transaction timestamp
  ") ()
- [stringdate](fn_stringdate.html " Convert a string to a datetime
  ") ()
- [stringtime](fn_stringtime.html "converts string to a time
  ") ()

#### Debug

- [cov_load](fn_cov_load.html "Load test coverage data from file.
  ") ()
- [cov_report](fn_cov_report.html "Produce a text coverage report.
  ") ()
- [cov_store](fn_cov_store.html "Writes a test coverage to a file.
  ") ()
- [dbg_obj_print](fn_dbg_obj_print.html "print to the Virtuoso system console
  ") ()
- [dbg_printf](fn_dbg_printf.html "print formatted output onto the system console
          ") ()
- [explain](fn_explain.html "describe SQL statement compilation
  ") ()
- [log_message](fn_log_message.html "print output into the system log file
          ") ()
- [pldbg_stats](fn_pldbg_stats.html "Makes an array of line/count information based on current coverage.
  ") ()
- [pldbg_stats_load](fn_pldbg_stats_load.html "Used to load a coverage of a single procedure record as an array.
  ") ()
- [trace_off](fn_trace_off.html "Disable extra logging for Virtuoso server
  ") ()
- [trace_on](fn_trace_on.html "Enable extra debug logging
  ") ()

#### Dictionary Manipulation

- [dict_dec_or_remove](fn_dict_dec_or_remove.html "Decrement a counter in a dictionary of counters or deletes it if it becomes zero or negative.
  ") ()
- [dict_duplicate](fn_dict_duplicate.html "Creates a copy of the given dictionary.
  ") ()
- [dict_get](fn_dict_get.html "Returns the dependent part that corresponds to the given key in the given dictionary.
  ") ()
- [dict_inc_or_put](fn_dict_inc_or_put.html "Creates or increments an integer counter for a given key and a dictionary.
  ") ()
- [dict_iter_next](fn_dict_iter_next.html "Fetches a pair of key and value from a dictionary iterator and moves the iterator to the next pair.
  ") ()
- [dict_iter_rewind](fn_dict_iter_rewind.html "Resets the iterator before fetching keys and values by dict_iter_next()
  ") ()
- [dict_list_keys](fn_dict_list_keys.html "Returns an array of all keys stored in the given dictionary.
  ") ()
- [dict_destructive_list_rnd_keys](fn_dict_destructive_list_rnd_keys.html "Returns all or some keys from the given dictionary
  ") ()
- [dict_new](fn_dict_new.html "Creates a new dictionary to store key-value pairs.
  ") ()
- [dict_put](fn_dict_put.html "Adds a key-value pair to a dictionary
  ") ()
- [dict_remove](fn_dict_remove.html "Removes the given key and associated dependent value from the given dictionary.
  ") ()
- [dict_size](fn_dict_size.html "Returns the number of items in the given dictionary.
  ") ()
- [dict_to_vector](fn_dict_to_vector.html "Returns a get_keyword style vector of all items stored in the given dictionary.
  ") ()
- [dict_zap](fn_dict_zap.html "Removes all data from the given dictionary
  ") ()

#### Encoding & Decoding

- [encode_base64](fn_encode_base64.html "base64-encode/decode a string
  ") ()
- [split_and_decode](fn_split_and_decode.html "converts escaped var=val pairs to a vector of strings
  ") ()
- [uudecode](fn_uudecode.html "Decodes a string previously encoded by uuencode
  ") ()
- [uuencode](fn_uuencode.html "Encodes string or string session into sequence of printable characters, suitable for transfer via "ASCII-only" data channels
  ") ()

#### File Manipulation

- [file_delete](fn_file_delete.html "Delete a file from the file system
  ") ()
- [file_open](fn_file_open.html "returns the contents of a file.
  ") ()
- [ft_set_file](fn_ft_set_file.html "associates table with tabular data structure represented by CSV document content with external CSV file.
  ") ()
- [file_dirlist](fn_file_dirlist.html "Returns list with content of file system directory
  ") ()
- [file_mkdir](fn_file_mkdir.html "Creates a directory in the file system
  ") ()
- [file_mkpath](fn_file_mkpath.html "Make a directory chain
  ") ()
- [file_stat](fn_file_stat.html "get various OS statistics about a file
  ") ()
- [file_to_string](fn_file_to_string.html "returns the contents of a file as a varchar
  ") ()
- [file_to_string_output](fn_file_to_string_output.html "get contents of a file as a string output stream
  ") ()
- [file_unlink](fn_file_unlink.html "Delete a file from the file system
  ") ()
- [gz_file_open](fn_gz_file_open.html "returns the contents of a gzipped file
  ") ()
- [get_csv_row](fn_get_csv_row.html "This function takes a string_session containing CSV data, parses a row
  and returns a vector with field values.

  ") ()
- [csv_load_file](fn_csv_load_file.html "Imports a CSV file into table.
  ") ()
- [attach_from_csv](fn_attach_from_csv.html "Attaches CSV files as virtual tables in Virtuoso.
  ") ()
- [csv_load](fn_csv_load.html "Import CSV file from string session.
  ") ()
- [csv_parse](fn_csv_parse.html "Parses a CSV file.
  ") ()
- [csv_cols_def](fn_csv_cols_def.html "Guess columns and column types from CSV file.
  ") ()
- [csv_table_def](fn_csv_table_def.html "Guess table definition from CSV file.
  ") ()
- [os_chmod](fn_os_chmod.html "changes the file access mode of a file
  ") ()
- [os_chown](fn_os_chown.html "changes the owning group/user of a file
  ") ()

#### Free Text

- [composite](fn_composite.html "create a composite object
  ") ()
- [composite_ref](fn_composite_ref.html "get member of a composite object
  ") ()
- [contains](fn_contains.html "A text contains predicate
  ") ()
- [vt_batch](fn_vt_batch.html "Returns a vt batch object.
  ") ()
- [vt_batch_d_id](fn_vt_batch_d_id.html "Specify a document to update in a vt batch.
  ") ()
- [vt_batch_feed](fn_vt_batch_feed.html "Add words to a free text update batch.
  ") ()
- [vt_batch_feed_offband](fn_vt_batch_feed_offband.html "Add offband information to a free text update batch.
  ") ()
- [VT_BATCH_UPDATE](fn_vt_batch_update.html "Set  batch mode update of free text indexing.
  ") ()
- [vt_create_text_index](fn_vt_create_text_index.html "Add text index to an existing table
  ") ()
- [VT_DROP_FTT](fn_vt_drop_ftt.html "drop free text trigger
  ") ()
- [vt_is_noise](fn_vt_is_noise.html "determines whether input is a noise word
  ") ()

#### Hashing / Cryptographic

- [md5](fn_md5.html "returns the md5 checksum of its argument
  ") ()
- [md5_init](fn_md5_init.html "returns the string serialization of a new md5 context
  ") ()
- [md5_update](fn_md5_update.html "returns the updated md5 context serialized as varchar
  ") ()
- [md5_final](fn_md5_final.html "returns the md5 checksum given an initialized md5 context
  ") ()
- [sha1_digest](fn_sha1_digest.html "returns string containing sha1 digest encoded in base64
  ") ()
- [tree_md5](fn_tree_md5.html "returns MD5 checksum of array argument
  ") ()
- [dsig_template_ext](fn_dsig_template_ext.html "Generates a Digital signature template based on a XML document.
  ") ()
- [x509_certificate_verify](fn_x509_certificate_verify.html "Verifies X.509 certificate
  ") ()
- [xenc_X509_certificate_serialize](fn_xenc_x509_certificate_serialize.html "Exports a X.509 certificate from user's repository
  ") ()
- [xenc_decrypt_soap](fn_xenc_decrypt_soap.html "Decrypt and verify a SOAP message
  ") ()
- [xenc_delete_temp_keys](fn_xenc_delete_temp_keys.html "Remove the temporary keys from user's space
  ") ()
- [xenc_encrypt](fn_xenc_encrypt.html "Encrypt and optionally sign a SOAP message
  ") ()
- [encrypt](fn_encrypt.html "Encrypt content in base64 encoding
  ") ()
- [decrypt](fn_decrypt.html "Encrypt content in base64 encoding
  ") ()
- [TOTP_generate](fn_totp_generate.html "Returns TOTP string Time-based One-time Password Generator (rfc6238)
  ") ()
- [xenc_get_key_algo](fn_xenc_get_key_algo.html "Determine XML signature algorithm of a key
  ") ()
- [xenc_get_key_identifier](fn_xenc_get_key_identifier.html "Determine a key identifier
  ") ()
- [xenc_key_3DES_read](fn_xenc_key_3des_read.html "Importing a triple-des key into user's repository
  ") ()
- [xenc_key_3DES_create](fn_xenc_key_3des_create.html "Used to make a symmetric key.
  ") ()
- [xenc_key_3DES_rand_create](fn_xenc_key_3des_rand_create.html "Used to make a temporary session key.
  ") ()
- [xenc_key_DSA_read](fn_xenc_key_dsa_read.html "Importing a DSA key into user's repository
  ") ()
- [xenc_key_RSA_read](fn_xenc_key_rsa_read.html "Importing a RSA key into user's repository
  ") ()
- [xenc_key_AES_create](fn_xenc_key_aes_create.html "Used to make a symmetric key.
  ") ()
- [xenc_key_AES_rand_create](fn_xenc_key_aes_rand_create.html "Used to make a temporary session key.
  ") ()
- [xenc_key_create_cert](fn_xenc_key_create_cert.html "Import a key from a certificate
  ") ()
- [xenc_key_DSA_create](fn_xenc_key_dsa_create.html "Used to make asymmetric DSA key.
  ") ()
- [xenc_key_exists](fn_xenc_key_exists.html "Check if named encryption key is in the  user's repository
  ") ()
- [xenc_key_inst_create](fn_xenc_key_inst_create.html "Key instance generation
  ") ()
- [xenc_key_remove](fn_xenc_key_remove.html "This will delete a key from current user's space.
  ") ()
- [xenc_key_serialize](fn_xenc_key_serialize.html "Extracts a key from user's repository
  ") ()
- [xenc_set_primary_key](fn_xenc_set_primary_key.html "Associate a X.509 certificate with a key
  ") ()
- [xenc_x509_ss_generate](fn_xenc_x509_ss_generate.html "Creates a self-signed X.509v3 certificate
  ") ()
- [xenc_x509_generate](fn_xenc_x509_generate.html "Generates a X.509v3 certificate using client's public key
  ") ()
- [xenc_pkcs12_export](fn_xenc_pkcs12_export.html "Generates a secure Public-Key Cryptography Standards (PKCS#12) file from a PEM (base64 encoded DER) file comprised of an X.509 certificate and an associated Private Key.
  ") ()
- [xenc_pem_export](fn_xenc_pem_export.html "Export of a certificate and optionally private key in PEM format
  ") ()
- [xenc_SPKI_read](fn_xenc_spki_read.html "Imports a public key from simple public key infrastructure (SPKI)
  ") ()
- [xenc_bn2dec](fn_xenc_bn2dec.html "Prints as a string a big number serialized as binary using base64 encoding.
  ") ()
- [xenc_key_RSA_create](fn_xenc_key_rsa_create.html "Used to make RSA key.
  ") ()
- [xenc_x509_csr_generate](fn_xenc_x509_csr_generate.html "Generate Certificate Signing Request (CSR)
  ") ()
- [xenc_x509_from_csr](fn_xenc_x509_from_csr.html "Generate x509 certificate from CSR.
  ") ()

#### Virtuoso Java PL API

- [java_call_method](fn_java_call_method.html) ()
- [java_set_property](fn_java_set_property.html "Sets a Java class property
  ") ()
- [java_get_property](fn_java_get_property.html "Gets a property value from a Java class instance.
  ") ()
- [java_load_class](fn_java_load_class.html "Declares a Java class to a Java VM
  ") ()
- [java_new_object](fn_java_new_object.html "Creates and instance of a Java class.
  ") ()
- [java_vm_attach](fn_java_vm_attach.html) ()
- [java_vm_detach](fn_java_vm_detach.html "Detaches the current Virtuoso working thread from the Java VM.
  ") ()

#### LDAP

- [ldap_search](fn_ldap_search.html "Search in an LDAP server.
  ") ()
- [ldap_delete](fn_ldap_delete.html "Remove a leaf entry in the LDAP Directory Information Tree.
  ") ()
- [ldap_add](fn_ldap_add.html "Adds a new entry to an LDAP directory.
  ") ()
- [ldap_modify](fn_ldap_modify.html "Modifies an existing LDAP directory.
  ") ()

#### Locale

- [charset_define](fn_charset_define.html "Define a character set.
  ") ()
- [charset_recode](fn_charset_recode.html "Translate a string to another character set
  ") ()
- [charsets_list](fn_charsets_list.html "List known character set names and aliases.
  ") ()
- [current_charset](fn_current_charset.html "Get name of current charset.
  ") ()
- [elh_get_handler](fn_elh_get_handler.html "get localization function handler
  ") ()
- [elh_load_handler](fn_elh_load_handler.html "load encoding handler into system
  ") ()
- [lh_get_handler](fn_lh_get_handler.html "Returns language handler
  ") ()
- [lh_load_handler](fn_lh_load_handler.html "Loads given handler in global table of the server
  ") ()

#### Mail

- [mime_body](fn_mime_body.html "used to compose multipart/mixed MIME message body
  ") ()
- [mime_part](fn_mime_part.html "used to compose a MIME message body part.
  ") ()
- [mime_tree](fn_mime_tree.html "parses MIME messages into an array structure
  ") ()
- [nntp_auth_get](fn_nntp_auth_get.html "returns information about an NNTP server with authorization
  ") ()
- [nntp_auth_post](fn_nntp_auth_post.html "Post message to NNTP server with authorization
  ") ()
- [nntp_get](fn_nntp_get.html "Returns information about an NNTP server.
  ") ()
- [nntp_post](fn_nntp_post.html "Post message to NNTP server
  ") ()
- [pem_certificates_to_array](fn_pem_certificates_to_array.html "converts a PEM file to an array of PEM strings
  ") ()
- [pop3_get](fn_pop3_get.html "get messages from a POP3 server
  ") ()
- [imap_get](fn_imap_get.html "get messages from a IMAP4 mail server.
  ") ()
- [smime_sign](fn_smime_sign.html "Converts a MIME message to a signed S/MIME message
  ") ()
- [smime_verify](fn_smime_verify.html "Verifies signature of signed MIME message
  ") ()
- [smime_encrypt](fn_smime_encrypt.html "Performs encryption of a (signed) e-mail msg
  ") ()
- [smime_decrypt](fn_smime_decrypt.html "Decryption of a PKCS7 encrypted smime msg
  ") ()
- [smtp_send](fn_smtp_send.html "send message to SMTP server
  ") ()
- [uuvalidate](fn_uuvalidate.html "Encodes string or string session into sequence of printable characters, suitable for transfer via "ASCII-only" data channels
  ") ()

#### Number

- [abs](fn_abs.html "Return the absolute value of a number
  ") ()
- [atof](fn_atof.html "Convert a string to single precision float
  ") ()
- [atoi](fn_atoi.html "Convert a string to an integer
  ") ()
- [bit_and](fn_bit_and.html "Returns bitwise AND of two 32-bit integers.
  ") ()
- [bit_or](fn_bit_or.html "Returns bitwise OR of two 32-bit integers.
  ") ()
- [bit_not](fn_bit_not.html "Returns bitwise NOT of a 32-bit integer.
  ") ()
- [bit_shift](fn_bit_shift.html "Returns the result of bitwise shift operation over two 32-bit integers.
  ") ()
- [bit_xor](fn_bit_xor.html "Returns bitwise XOR (exclusive "or") of two 32-bit integers.
  ") ()
- [ceiling](fn_ceiling.html "Round a number to positive infinity.
  ") ()
- [either](fn_either.html "conditionally return one of specified parameters
  ") ()
- [equ](fn_equ.html "comparison functions
  ") ()
- [exp](fn_exp.html "calculate exponent
  ") ()
- [floor](fn_floor.html "Round a number to negative infinity.
  ") ()
- [isdouble](fn_isdouble.html "returns true is argument is a double
  ") ()
- [\_\_min](fn_nm_min.html "Returns minimum value among all its arguments.
  ") ()
- [\_\_max](fn_nm_max.html "Returns maximum value among all its arguments.
  ") ()
- [\_\_max_notnull](fn_nm_max_notnull.html "Returns maximum value among all its arguments, ignoring NULLs entirely.
  ") ()
- [\_\_min_notnull](fn_nm_min_notnull.html "Returns minimum value among all its arguments, ignoring NULLs entirely.
  ") ()
- [log](fn_log.html "calculate natural logarithm of an expression
  ") ()
- [log10](fn_log10.html "Calculate 10-based logarithms
  ") ()
- [lower](fn_lower.html "returns a lower case version of its argument
  ") ()
- [mod](fn_mod.html "returns the modulus of its arguments
  ") ()
- [power](fn_power.html "return value of expression raised to specified
      power.
  ") ()
- [randomize](fn_randomize.html "initializes the random number generator
  ") ()
- [rnd](fn_rnd.html "returns a random number between 0 and n - 1 inclusive
  ") ()
- [sqrt](fn_sqrt.html "calculate square root
  ") ()
- [trigonometric](fn_acos.html "trigonometric functions
  ") ()

#### Phrases

- [DB.DBA.ANN_PHRASE_CLASS_ADD](fn_ann_phrase_class_add.html "Returns APC_ID of a phrase class.
  ") ()
- [DB.DBA.ANN_PHRASE_CLASS_DEL](fn_ann_phrase_class_del.html "Deletes phrase set.
  ") ()
- [AP_BUILD_MATCH_LIST](fn_ap_build_match_list.html "Returns report of all occurrences of phrases from the specified sets in the text.
  ") ()
- [AP_ADD_PHRASES](fn_ap_add_phrases.html "Adds phrases to given set.
  ") ()

#### Replication

- [repl_disconnect](fn_repl_disconnect.html "terminates communication with a replication publisher
  ") ()
- [REPL_GRANT](fn_repl_grant.html "grant privileges for subscription to a publication
  ") ()
- [REPL_INIT_COPY](fn_repl_init_copy.html "create initial subscription state
  ") ()
- [repl_new_log](fn_repl_new_log.html "create new publication log
  ") ()
- [REPL_PUBLISH](fn_repl_publish.html "create publication on publisher
  ") ()
- [REPL_PUB_ADD](fn_repl_pub_add.html "add item to a publication
  ") ()
- [REPL_PUB_INIT_IMAGE](fn_repl_pub_init_image.html "create initial image of publication on publisher
  ") ()
- [REPL_PUB_REMOVE](fn_repl_pub_remove.html "remove item from publication.
  ") ()
- [REPL_REVOKE](fn_repl_revoke.html "revoke privileges for subscription
  ") ()
- [REPL_SCHED_INIT](fn_repl_sched_init.html "adds scheduled job to synchronize subscriptions
  ") ()
- [REPL_SERVER](fn_repl_server.html "defines a server that will participate in replication
  ") ()
- [repl_server_rename](fn_repl_server_rename.html "rename the publishing server instance
  ") ()
- [REPL_STAT](fn_repl_stat.html "retrieve status of all subscriptions and publications
  ") ()
- [repl_status](fn_repl_status.html "returns status of a published or subscribed publication
  ") ()
- [REPL_SUBSCRIBE](fn_repl_subscribe.html "add a subscription
  ") ()
- [repl_sync](fn_repl_sync.html "starts the syncing process against an existing subscription
  ") ()
- [repl_sync_all](fn_repl_sync_all.html "synchronize all subscriptions
  ") ()
- [repl_text](fn_repl_text.html "adds a SQL statement to the log of the replication
  ") ()
- [repl_this_server](fn_repl_this_server.html "returns calling servers name
  ") ()
- [REPL_UNPUBLISH](fn_repl_unpublish.html "drop publication on publisher
  ") ()
- [REPL_UNSUBSCRIBE](fn_repl_unsubscribe.html "drop subscription
  ") ()
- [repl_purge](fn_repl_purge.html "purges transactional replication logs for specified account
  ") ()
- [REPL_CREATE_SNAPSHOT_PUB](fn_repl_create_snapshot_pub.html "Create bi-directional snapshot publication
  ") ()
- [REPL_CREATE_SNAPSHOT_SUB](fn_repl_create_snapshot_sub.html "Create bi-directional snapshot subscription to an existing publication.
  ") ()
- [REPL_DROP_SNAPSHOT_SUB](fn_repl_drop_snapshot_sub.html "Drops a subscription to a bi-directional snapshot publication
  ") ()
- [REPL_DROP_SNAPSHOT_PUB](fn_repl_drop_snapshot_pub.html "Drop bi-directional snapshot publication
  ") ()
- [REPL_INIT_SNAPSHOT](fn_repl_init_snapshot.html "Initializes a bi-directional snapshot publication
  ") ()
- [REPL_UPDATE_SNAPSHOT](fn_repl_update_snapshot.html "Updates a bi-directional snapshot publication
  ") ()
- [REPL_SNP_SERVER](fn_repl_snp_server.html "Define bi-directional snapshot replication server name
  ") ()
- [REPL_SERVER_NAME](fn_repl_server_name.html "Return bi-directional snapshot replication server name for specified DSN
  ") ()
- [REPL_ADD_CR](fn_repl_add_cr.html "Creates conflict resolver for bi-directional transactional replication
  ") ()
- [REPL_ADD_DAV_CR](fn_repl_add_dav_cr.html "Creates conflict resolver for bi-directional replication in DAV
  ") ()
- [REPL_ADD_SNAPSHOT_CR](fn_repl_add_snapshot_cr.html "Creates conflict resolver for bi-directional replication
  ") ()
- [RDF_REPL_START](fn_rdf_repl_start.html "Enables RDF Replication.
  ") ()
- [RDF_REPL_STOP](fn_rdf_repl_stop.html "Stops the RDF replication at the publishing side
  ") ()
- [RDF_REPL_SYNC](fn_rdf_repl_sync.html "Starts the syncing process against an existing RDF subscription
  ") ()
- [RDF_REPL_GRAPH_INS](fn_rdf_repl_graph_ins.html "Inserts graph to RDF publication.
  ") ()
- [RDF_REPL_GRAPH_DEL](fn_rdf_repl_graph_del.html "Deletes graph from RDF publication.
  ") ()
- [sub_schedule](fn_sub_schedule.html "add scheduled job for periodic synchronization of a subscription
  ") ()

#### Remote SQL Data Source

- [att_local_name](fn_att_local_name.html "Compose a fully qualified table name based on DSN and remote table name.
  ") ()
- [quote_dotted](fn_quote_dotted.html "Returns an quoted identifier.
  ") ()
- [rclose](fn_rclose.html "Closes cursor created by rexecute()
  ") ()
- [rexecute](fn_rexecute.html "execute a SQL statement on a remote DSN
  ") ()
- [rstmtexec](fn_rstmtexec.html "execute a SQL statement on a remote DSN, provides a result set where applicable.
  ") ()
- [rmoreresults](fn_rmoreresults.html "move to next result set of rexecute()
  ") ()
- [rnext](fn_rnext.html "Get next result from a remote result set
  ") ()
- [sql_columns](fn_sql_columns.html "get column information from table on a remote DSN
  ") ()
- [sql_data_sources](fn_sql_data_sources.html "get list of available DSNs
  ") ()
- [sql_gettypeinfo](fn_sql_gettypeinfo.html "return type information from a remote DSN
  ") ()
- [sql_primary_keys](fn_sql_primary_keys.html "get primary key information about a table on a remote DSN
  ") ()
- [sql_statistics](fn_sql_statistics.html "retrieve statistics information on remote DSN
  ") ()
- [sql_tables](fn_sql_tables.html "get list of tables from remote DSN
  ") ()
- [sql_special_columns](fn_sql_special_columns.html "get special column information from table on a remote DSN
  ") ()
- [sql_procedures](fn_sql_procedures.html "get procedures information for a remote DSN
  ") ()
- [sql_write_private_profile_string](fn_sql_write_private_profile_string.html "Sets a DSN's attribute value
  ") ()
- [sql_get_private_profile_string](fn_sql_get_private_profile_string.html "Gets the DSN's attributes list
  ") ()
- [sql_config_data_sources](fn_sql_config_data_sources.html "Configures a remote DSN as in the DSN attribute string
  ") ()
- [sql_get_installed_drivers](fn_sql_get_installed_drivers.html "get column information from table on a remote DSN
  ") ()
- [sql_remove_dsn_from_ini](fn_sql_remove_dsn_from_ini.html "removes a DSN from the ODBC registry
  ") ()
- [sql_transact](fn_sql_transact.html "get list of available DSNs
  ") ()
- [sql_write_file_dsn](fn_sql_write_file_dsn.html "Creates a new file DSN
  ") ()
- [sql_driver_connect](fn_sql_driver_connect.html "Tries connecting using supplied connection string
  ") ()
- [vd_remote_data_source](fn_vd_remote_data_source.html "prepares a remote DSN  for use
  ") ()
- [vd_remote_proc_wrapper](fn_vd_remote_proc_wrapper.html "Creating a PL wrapper for remote procedure execution
  ") ()
- [vd_remote_table](fn_vd_remote_table.html "declares an existing table as resident on a DSN previously declared with vd_remote_data_source
  ") ()
- [vd_statistics](fn_vd_statistics.html "Update VDB RPC cost statistics for given DSN
  ") ()
- [vdd_disconnect_data_source](fn_vdd_disconnect_data_source.html "Disconnects a data source if no active transactions are using resources from it.
  ") ()
- [vdd_measure_rpc_time](fn_vdd_measure_rpc_time.html "Estimate VDB RPC round-trip for a given DSN in milliseconds
  ") ()

#### RDF data

- [sparql_to_sql_text](fn_sparql_to_sql_text.html "Converts a sparql query directly to SQL.
  ") ()
- [DB.DBA.RDF_AUDIT_METADATA](fn_rdf_audit_metadata.html "Fix RDF metadata corruption.
  ") ()
- [DB.DBA.RDF_GRAPH_SECURITY_AUDIT](fn_rdf_graph_security_audit.html "Fix graph-level security errors.
  ") ()
- [DB.DBA.RDF_DEFAULT_USER_PERMS_SET](fn_rdf_default_user_perms_set.html "Sets default permissions of user.
  ") ()
- [DB.DBA.RDF_DEFAULT_USER_PERMS_DEL](fn_rdf_default_user_perms_del.html "Removes the setting of default permissions of user.
  ") ()
- [DB.DBA.RDF_BACKUP_METADATA](fn_rdf_backup_metadata.html "Makes a backup copy of RDF metadata (i.e., descriptions of Linked Data Views and the like).
  ") ()
- [DB.DBA.RDF_VOID_STORE](fn_rdf_void_store.html "Collects statistics for a given graph and saves it.
  ") ()
- [rdf_load_stop](fn_rdf_load_stop.html "Stops RDF Loader threads.
  ") ()
- [rdf_loader_run](fn_rdf_loader_run.html "Performs bulk load.
  ") ()
- [ld_dir_all](fn_ld_dir_all.html "Loads from the specified directory, including any and all subdirectories.
  ") ()
- [DB.DBA.RDF_RESTORE_METADATA](fn_rdf_restore_metadata.html "Restores RDF metadata (descriptions of Linked Data Views and the like) from previously saved backup.
  ") ()
- [DB.DBA.RDF_LOAD_RDFXML_MT](fn_rdf_load_rdfxml_mt.html "Parses the content of large RDF/XML text as a sequence of separate RDF triples.
  ") ()
- [DB.DBA.RDF_LOAD_RDFXML](fn_rdf_load_rdfxml.html "Parses the content of RDF/XML text as a sequence of separate RDF triples.
  ") ()
- [DB.DBA.RDF_LOAD_RDFA](fn_rdf_load_rdfa.html "Parses the content of RDF embedded as RDFa text as a sequence of separate RDF triples.
  ") ()
- [ld_dir](fn_ld_dir.html "Adds files to control list set up in the virtuoso.ini file.
  ") ()
- [DB.DBA.TTLP](fn_ttlp.html "parses TTL (TURTLE or N3 resource) and places its triples into DB.DBA.RDF_QUAD.
  ") ()
- [DB.DBA.TTLP_MT](fn_ttlp_mt.html "parses TTL (TURTLE), TTL(N-Triple) or NQ (N-quad) resources, and places its triples into DB.DBA.RDF_QUAD on multiple threads.
  ") ()
- [DB.DBA.TTLP_MT_LOCAL_FILE](fn_ttlp_mt_local_file.html "parses TTL (TURTLE or N3 resource) and places its triples into DB.DBA.RDF_QUAD on multiple threads.
  ") ()
- [DB.DBA.RDF_DATATYPE_OF_OBJ](fn_rdf_datatype_of_obj.html "Returns the datatype of a given argument.
  ") ()
- [DB.DBA.RDF_TRIPLES_TO_RDF_XML_TEXT](fn_rdf_triples_to_rdf_xml_text.html "Serializes vector of triples into a session, in RDF/XML syntax.
  ") ()
- [DB.DBA.RDF_TRIPLES_TO_TTL](fn_rdf_triples_to_ttl.html "Serializes vector of triples into a session, in TURTLE syntax.
  ") ()
- [DB.DBA.RDF_64BIT_UPGRADE](fn_rdf_64bit_upgrade.html "Alters IRI_ID columns to get IRI_ID_8.
  ") ()
- [RDF_VIEW_SYNC_TO_PHYSICAL](fn_rdf_view_sync_to_physical.html "This function generates data synchronization triggers and/or actual RDF quad store data
      	from transient Linked Data views. Basically, it enables you share physical and transient Linked
      	Data views typically generated from 3rd party ODBC/JDBC accessible data sources.
  ") ()
- [DB.DBA.RDF_CONVERT_RDFXML_TO_TTL](fn_rdf_convert_rdfxml_to_ttl.html "Converts rdf xml to ttl.
  ") ()
- [DB.DBA.RDF_GRAPH_GROUP_CREATE](fn_rdf_graph_group_create.html "Creates graph group.
  ") ()
- [DB.DBA.RDF_GRAPH_GROUP_INS](fn_rdf_graph_group_ins.html "Inserts graph into group.
  ") ()
- [DB.DBA.RDF_GRAPH_USER_PERMS_SET](fn_rdf_graph_user_perms_set.html "Sets permissions of an the user on a graph.
  ") ()
- [DB.DBA.RDF_GRAPH_USER_PERMS_GET](fn_rdf_graph_user_perms_get.html "Gets permissions of an the user on a graph.
  ") ()
- [DB.DBA.RDF_GRAPH_USER_PERMS_DEL](fn_rdf_graph_user_perms_del.html "Removes the setting of permissions of an user named uname on a given graph.
  ") ()
- [DB.DBA.RDF_ALL_USER_PERMS_DEL](fn_rdf_all_user_perms_del.html "Removes all the setting of permissions of an user, both default permissions 
      	and permissions on specific graphs.
  ") ()
- [rdfs_rule_set](fn_rdfs_rule_set.html "Adds the applicable facts of the graph into a rule set.
  ") ()
- [DB.DBA.RDF_GEO_FILL](fn_rdf_geo_fill.html "Converts geo:lat and geo:long properties properties into geometries.
  ") ()
- [DB.DBA.RDF_GEO_ADD](fn_rdf_geo_add.html "Translates a geometry into a RDF box
  ") ()
- [DB.DBA.RDF_GRAPH_COLLECT_FP_LIST](fn_rdf_graph_collect_fp_list.html "Gets inverse / functional properties for given graphs.
  ") ()
- [DB.DBA.RDF_GRAPH_DIFF](fn_rdf_graph_diff.html "performs the core operation of preparing graph diff.
  ") ()
- [DB.DBA.RDF_SUO_APPLY_PATCH](fn_rdf_suo_apply_patch.html "Modifies either the target graph specified in the patch via

  guo:target_graph


     or the graph specified by default_target_graph argument.
  ") ()
- [DB.DBA.RDF_SUO_DIFF_TTL](fn_rdf_suo_diff_ttl.html "performs the core operation of preparing graph diff.
  ") ()
- [DB.DBA.SPARQL_RDB2RDF_CODEGEN](fn_sparql_rdb2rdf_codegen.html "Creates an SQL text for a given table and an operation specified by an opcode
  ") ()
- [DB.DBA.SPARQL_RDB2RDF_LIST_TABLES](fn_sparql_rdb2rdf_list_tables.html "Returns a vector of names of tables that are used as sources for Linked Data Views.
  ") ()
- [DB.DBA.SPARQL_SELECT_KNOWN_GRAPHS](fn_sparql_select_known_graphs.html "returns all explicitly created graphs.
  ") ()
- [IsRef](fn_isref.html "Returns true if non-blank IRI
  ") ()
- [DB.DBA.SAMPLE](fn_sample.html "returns an arbitrary value from the multiset passed to it.
  ") ()
- [DB.DBA.GROUP_CONCAT](fn_group_concat.html "returns an arbitrary value from the multiset passed to it.
  ") ()
- [DB.DBA.GROUP_CONCAT_DISTINCT](fn_group_concat_distinct.html "returns a string that is concatenation of token strings delimited with delimiter
  ") ()
- [DB.DBA.GROUP_DIGEST](fn_group_digest.html "returns an arbitrary value from the multiset passed to it.
  ") ()
- [http_nt_triple](fn_http_nt_triple.html "outputs next triple to ses in NT serialization.
  ") ()
- [http_ttl_triple](fn_http_ttl_triple.html "outputs next triple to ses in TTL serialization.
  ") ()
- [iri_split](fn_iri_split.html "Splits into the namespace prefix and the local part according to the TTL rules.
  ") ()
- [\_\_xml_get_ns_prefix](fn___xml_get_ns_prefix.html "Returns prefix by given URI.
  ") ()
- [\_\_xml_get_ns_uri](fn___xml_get_ns_uri.html "Returns URI by given namespace prefix.
  ") ()
- [\_\_xml_ns_uname](fn___xml_ns_uname.html "Returns an UNAME that is IRI --- concatenation of the expanded namespace IRI and the local part.
  ") ()
- [\_\_xml_ns_iristr](fn___xml_ns_iristr.html "Returns an varchar with box flag set to BF_IRI.
  ") ()
- [\_\_xml_nsexpand_iristr](fn___xml_nsexpand_iristr.html "Checks if the string is QName and if it is so then replaces namespace prefix to the
      	full namespace IRI.
  ") ()
- [DB.DBA.SPARQL_EVAL](fn_sparql_eval.html "Local execution of SPARQL via SPARQL protocol, produces a result set of SQL values.
  ") ()
- [DB.DBA.SPARQL_EVAL_TO_ARRAY](fn_sparql_eval_to_array.html "Local execution of SPARQL via SPARQL protocol, produces a vector of vectors of SQL values.
  ") ()
- [DB.DBA.SPARQL_REXEC](fn_sparql_rexec.html "Remote execution of SPARQL via SPARQL protocol, produces a result set of SQL values.
  ") ()
- [DB.DBA.SPARQL_REXEC_TO_ARRAY](fn_sparql_rexec_to_array.html "Remote execution of SPARQL via SPARQL protocol, produces a vector of vectors of SQL value.
  ") ()
- [DB.DBA.SPARQL_REXEC_WITH_META](fn_sparql_rexec_with_meta.html "Remote execution of SPARQL via SPARQL protocol. Fills in output parameters with metadata (like exec metadata) and a vector of vector s of 'long valmode' values.
  ") ()
- [DB.DBA.RDF_REGEX](fn_rdf_regex.html "Returns 1 if string s matches pattern p, 0 otherwise.
  ") ()
- [DB.DBA.RDF_LANGMATCHES](fn_rdf_langmatches.html "Returns 1 if language identifier r matches lang pattern t.
  ") ()
- [DB.DBA.RDF_TTL2HASH](fn_rdf_ttl2hash.html "Returns a dict of triples in 'long valmode'.
  ") ()
- [DB.DBA.RDF_QUAD_URI](fn_rdf_quad_uri.html "Performs simple insertion of a quad where object is a node.
  ") ()
- [DB.DBA.RDF_QUAD_URI_L](fn_rdf_quad_uri_l.html "Performs simple insertion of a quad where object is a literal value in 'SQL valmode'.
  ") ()
- [DB.DBA.RDF_QUAD_URI_L_TYPED](fn_rdf_quad_uri_l_typed.html "Performs simple insertion of a quad where object is a literal value in 'SQL valmode' and can be specified datatype and language.
  ") ()

#### SOAP

- [http_body_read](fn_http_body_read.html "Reads the HTTP body from the client HTTP connection and returns it as a string.
  ") ()
- [soap_box_xml_entity](fn_soap_box_xml_entity.html "Converts an XML entity to an SQL value given the desired SQL type.
  ") ()
- [soap_dt_define](fn_soap_dt_define.html "define re-define or erase the complex datatype definition for SOAP calls
  ") ()
- [soap_call](fn_soap_call.html "calls a function from a SOAP server and returns the result. value; deprecated, use SOAP_CLIENT () instead
  ") ()
- [soap_client](fn_soap_client.html "Invoke a SOAP service and returns result value.
  ") ()
- [soap_make_error](fn_soap_make_error.html "Creates a SOAP error reply XML message based on its parameters.
  ") ()
- [soap_print_box](fn_soap_print_box.html "Formats an SQL value and returns it as a generated XML fragment.
  ") ()
- [soap_sdl](fn_soap_sdl.html "Generate SDL document for a PL module and return it as a varchar.
  ") ()
- [soap_server](fn_soap_server.html "Execute SOAP request and return XML reply as a varchar.
  ") ()
- [soap_wsdl](fn_soap_wsdl.html "Generate WSDL document for a PL module and return it as a varchar.
  ") ()
- [soap_wsdl_import](fn_soap_wsdl_import.html) ()
- [soap_box_structure](fn_soap_box_structure.html) ()
- [soap_current_url](fn_soap_current_url.html "Returns URL used to access particular HTTP resource.
  ") ()
- [wst_cli](fn_wst_cli.html "Request a security token from WST endpoint
  ") ()

#### SQL

- [\_\_any_grants](fn___any_grants.html "Checks a table for grants.
  ") ()
- [collation_define](fn_collation_define.html "define a new collation
  ") ()
- [complete_table_name](fn_complete_table_name.html "Returns a fully qualified table name.
  ") ()
- [delay](fn_delay.html "sleep for n seconds
  ") ()
- [cl_exec](fn_cl_exec.html "executes things on all nodes of a cluster
  ") ()
- [end_result](fn_end_result.html "End the current result set.
  ") ()
- [exec](fn_exec.html "dynamic execution of SQL returning state and result set
  ") ()
- [close](fn_exec_close.html "Closes cursor created by exec()
  ") ()
- [exec_next](fn_exec_next.html "Get next result from a result set
  ") ()
- [exec_result](fn_exec_result.html "Returns a result set row to the calling procedure context
  ") ()
- [exec_result_names](fn_exec_result_names.html "Supplies column details for procedure result set output.
  ") ()
- [exec_metadata](fn_exec_metadata.html "Compiles a SQL statement and returns the metadata
  ") ()
- [exec_score](fn_exec_score.html "Compiles a SQL statement and returns the estimate time cost
  ") ()
- [identity_value](fn_identity_value.html "returns the last assigned identity column value
  ") ()
- [name_part](fn_name_part.html "Returns portion of dotted name such as a fully qualified table name.
  ") ()
- [registry_get](fn_registry_get.html "Returns a current value of a registry setting
  ") ()
- [registry_get_all](fn_registry_get_all.html "Returns a vector of all registry settings
  ") ()
- [registry_name_is_protected](fn_registry_name_is_protected.html "The function checks if a given registry variable is read-only or protected from occasional changes.
  ") ()
- [registry_set](fn_registry_set.html "Associates a value to the name in the Database registry
  ") ()
- [registry_remove](fn_registry_remove.html "Remove a variable from registry
  ") ()
- [result](fn_result.html "Sends one row of results to the calling client.
  ") ()
- [result_names](fn_result_names.html) ()
- [row_count](fn_row_count.html "returns number of rows affected by the previous DML statement in a procedure body
  ") ()
- [sequence_get_all](fn_sequence_get_all.html "Returns a vector of states of all sequence objects
  ") ()
- [sequence_next](fn_sequence_next.html "Returns the current state of the specified sequence and increments it by one.
  ") ()
- [sequence_remove](fn_sequence_remove.html "Removes a sequence object
  ") ()
- [sequence_set](fn_sequence_set.html "Sets and returns the state of a sequence object.
  ") ()
- [set_row_count](fn_set_row_count.html "sets the affected rows counter in the current context or in the context of the caller
  ") ()
- [set_user_id](fn_set_user_id.html "sets the current user for execution
  ") ()
- [set_identity_column](fn_set_identity_column.html "sets the sequence starting value for an identity column
  ") ()
- [signal](fn_signal.html "Signal an exception   in the calling procedure
  ") ()
- [sinv_create_key_mapping](fn_sinv_create_key_mapping.html "Creates a key mapping function & table.
  ") ()
- [sinv_create_inverse](fn_sinv_create_inverse.html "Creates inverse mapping for the mentioned functions.
  ") ()
- [sinv_drop_inverse](fn_sinv_drop_inverse.html "Reverses the effect of 
  sinv_create_inverse


     procedure.
  ") ()
- [sys_stat_analyze](fn_sys_stat_analyze.html "Collects statistics on a table and its columns for use in SQL optimization
  ") ()
- [sys_stat_histogram](fn_sys_stat_histogram.html "Collects a column value histogram for use in SQL optimization 
  ") ()
- [table_set_policy](fn_table_set_policy.html "Sets policy function to table.
  ") ()
- [table_drop_policy](fn_table_drop_policy.html "Drops policy function from table.
  ") ()
- [username](fn_username.html "returns the login name of the current user
  ") ()

#### String

- [ascii](fn_ascii.html "Get ASCII value of a character
  ") ()
- [blob_to_string](fn_blob_to_string.html "Convert a blob to string
  ") ()
- [blob_to_string_output](fn_blob_to_string_output.html "Convert a blob to string session
  ") ()
- [chr](fn_chr.html "Convert a 
  long


     character code to a character or wide character
  ") ()
- [initcap](fn_initcap.html "returns its argument with the first letter capitalized
  ") ()
- [isblob](fn_isblob.html "returns true if its argument is of type long varchar
  ") ()
- [lcase](fn_lcase.html "Converts string argument to lower case
  ") ()
- [left](fn_left.html "returns substring taken from left of string argument
  ") ()
- [length](fn_length.html "Get length of argument
  ") ()
- [locate](fn_locate.html "returns the starting position of the first occurrence of an substring in a string
  ") ()
- [ltrim](fn_ltrim.html "removes specific characters from a string
  ") ()
- [make_string](fn_make_string.html "make a string
  ") ()
- [regexp_match](fn_regexp_match.html "returns a substring matching the regular expression to the supplied string
  ") ()
- [regexp_parse](fn_regexp_parse.html "returns substrings that match the regular expression
  	in supplied string after an offset
  ") ()
- [regexp_substr](fn_regexp_substr.html "returns a single captured substring from matched substring
  ") ()
- [regexp_replace](fn_regexp_replace.html "Replaces occurrence(s) of the matching pattern in the source_string with a specified replace_string.
  ") ()
- [regexp_instr](fn_regexp_instr.html "Returns the first position of the occurrence of a regular-expression pattern in a given string.
  ") ()
- [regexp_like](fn_regexp_like.html "Allows a like comparison using regular-expression.
  ") ()
- [repeat](fn_repeat.html "returns a new string consisting of its string argument repeated a given number of times
  ") ()
- [replace](fn_replace.html "This replaces every occurrence of the second argument in the first argument
  with the third argument.
  ") ()
- [right](fn_right.html "get n rightmost characters of a string
  ") ()
- [rtrim](fn_rtrim.html "trims given characters from right of given string
  ") ()
- [search_excerpt](fn_search_excerpt.html "Returns excerpts with hit words from text
  ") ()
- [serialize](fn_serialize.html "convert any heterogeneous array or tree of arrays into a binary string and back
  ") ()
- [space](fn_space.html "returns a new string of count spaces
  ") ()
- [sprintf](fn_sprintf.html "returns a formatted string
  ") ()
- [sprintf_inverse](fn_sprintf_inverse.html "returns vector on a specified pattern.
  ") ()
- [sprintf_iri](fn_sprintf_iri.html "returns a formatted string that is marked as an IRI string.
  ") ()
- [sprintf_iri_or_null](fn_sprintf_iri_or_null.html "returns a formatted IRI string or null if any of the arguments except the first is null.
  ") ()
- [sprintf_or_null](fn_sprintf_or_null.html "returns a formatted string or null if any of the arguments except the first is null.
  ") ()
- [strcasestr](fn_strcasestr.html "case-insensitive substring search
  ") ()
- [strchr](fn_strchr.html "strchr returns a zero-based index to the first occurrence of the character.
  ") ()
- [string_output](fn_string_output.html "make a string output stream
  ") ()
- [string_output_flush](fn_string_output_flush.html "resets the state of the string_output object
  ") ()
- [string_output_string](fn_string_output_string.html "produce a string out of a string output stream
  ") ()
- [string_to_file](fn_string_to_file.html "writes a varchar to a file
  ") ()
- [strrchr](fn_strrchr.html "returns a zero-based index to the last occurrence of the char in str.
  ") ()
- [strstr](fn_strstr.html "substring search
  ") ()
- [subseq](fn_subseq.html "returns substring of a string or sub-vector of a vector
  ") ()
- [substring](fn_substring.html "returns a substring of a string  
  ") ()
- [strcontains](fn_strcontains.html "Performs substring search
  ") ()
- [starts_with](fn_starts_with.html "Checks whether string X begins with Y
  ") ()
- [ends_with](fn_ends_with.html "Checks whether string X ends with Y
  ") ()
- [tmp_file_name](fn_tmp_file_name.html "returns the unique file name within temporary directory of the operating system
  ") ()
- [trim](fn_trim.html "removes characters from both ends of string argument
  ") ()
- [ucase](fn_ucase.html "returns upper case version of string argument
  ") ()
- [upper](fn_upper.html "returns upper case version of string argument
  ") ()

#### Transaction

- [mts_connect](fn_mts_connect.html " connects Virtuoso server to MS DTC. 
  ") ()
- [mts_get_timeout](fn_mts_get_timeout.html " returns timeout of distributed transaction in milliseconds.

  ") ()
- [mts_set_timeout](fn_mts_set_timeout.html " sets timeout of distributed transaction. 
  ") ()
- [mts_status](fn_mts_status.html " checks status of current transaction or server. 
  ") ()
- [txn_error](fn_txn_error.html "poison current transaction forcing rollback
  ") ()
- [txn_killall](fn_txn_killall.html "kill all pending transactions
  ") ()

#### Type Mapping

- [import_jar](fn_import_jar.html "Creates SQL wrapper types of selected Java classes
  ") ()
- [internal_to_sql_type](fn_internal_to_sql_type.html "returns the integer standard SQL type of its argument
  ") ()
- [internal_type](fn_internal_type.html "returns internal integer datatype of its argument
  ") ()
- [internal_type_name](fn_internal_type_name.html "returns the internal type name of the argument
  ") ()
- [isbinary](fn_isbinary.html "returns true if its argument is of type varbinary
  ") ()
- [isentity](fn_isentity.html "returns true if its argument is an XML entity
  ") ()
- [isfloat](fn_isfloat.html "returns true if its argument is a float
  ") ()
- [isinteger](fn_isinteger.html "returns true if its argument is of type integer
  ") ()
- [isnull](fn_isnull.html "returns true if its argument is NULL
  ") ()
- [isnumeric](fn_isnumeric.html "returns true if argument is of numeric type
  ") ()
- [isfinitenumeric](fn_isfinitenumeric.html "returns 1 if its argument is of numeric type and
  its value is plain valid numeric value.
  ") ()
- [isstring](fn_isstring.html "returns true if its argument is of type varchar
  ") ()
- [iszero](fn_iszero.html "returns true if argument is numeric zero
  ") ()
- [jvm_ref_import](fn_jvm_ref_import.html "Creates XML description of Java class
  ") ()
- [sign](fn_sign.html "returns -1, 0, or 1 depending on the sign of its numerical
  ") ()
- [udt_defines_field](fn_udt_defines_field.html "Determines whether a user defined type contains a specified member.
  ") ()
- [udt_get](fn_udt_get.html "Retrieves a copy of the requested member from a user defined type instance
  ") ()
- [udt_implements_method](fn_udt_implements_method.html "provides a handle to the first method with specific name in a
      user defined type.
  ") ()
- [udt_instance_of](fn_udt_instance_of.html "returns the type name of supplied type or compares two input
      types.
  ") ()
- [udt_set](fn_udt_set.html) ()
- [unimport_jar](fn_unimport_jar.html "Drops SQL wrapper types of selected Java classes
  ") ()

#### UDDI

- [uddi_delete_binding](me_uddi_delete_binding.html "Causes one or more 
  bindingTemplate


  structures to be deleted.
  ") ()
- [uddi_delete_business](me_uddi_delete_business.html "Remove one or more 
  businessEntity


     structures.
  ") ()
- [uddi_delete_service](me_uddi_delete_service.html "Remove one or more 
  businessService


     structures.
  ") ()
- [uddi_delete_tModel](me_uddi_delete_tmodel.html "Remove or retire one or more 
  tModel


     structures.
  ") ()
- [uddi_discard_authToken](me_uddi_discard_authtoken.html "Inform a UDDI server that the authentication token can be discarded.
  ") ()
- [uddi_find_binding](me_uddi_find_binding.html "Retrieves matching bindings
  ") ()
- [uddi_find_business](me_uddi_find_business.html "Retrieves a 
  businessList


     message matching supplied criteria.
  ") ()
- [uddi_find_service](me_uddi_find_service.html "Retrieves 
  serviceList


     message matching search criteria
  ") ()
- [uddi_find_tModel](me_uddi_find_tmodel.html "locate list of tModel entries matching supplied criteria
  ") ()
- [uddi_get_authToken](me_uddi_get_authtoken.html "Obtain authentication token.
  ") ()
- [uddi_get_bindingDetail](me_uddi_get_bindingdetail.html "Request run-time 
  bindingTemplate


     location information.
  ") ()
- [uddi_get_businessDetail](me_uddi_get_businessdetail.html "returns complete 
  businessEntity


     information for one or more specified 
  businessEntities


  ") ()
- [uddi_get_businessDetailExt](me_uddi_get_businessdetailext.html "Returns extended 
  businessEntity


     information for one or more specified 
  businessEntities


    .
  ") ()
- [uddi_get_registeredInfo](me_uddi_get_registeredinfo.html "Retrieve an abbreviated list of all 
  businessEntity


     keys.
  ") ()
- [uddi_get_serviceDetail](me_uddi_get_servicedetail.html "request full information about a known 
  businessService


     structure
  ") ()
- [uddi_get_tModelDetail](me_uddi_get_tmodeldetail.html "Request full information about a known 
  tModel


     structure.
  ") ()
- [uddi_save_binding](me_uddi_save_binding.html "save or update a complete 
  bindingTemplate


     structure
  ") ()
- [uddi_save_business](me_uddi_save_business.html "Save or update information about a complete 
  businessEntity


     structure.
  ") ()
- [uddi_save_service](me_uddi_save_service.html "Adds or updates one or more 
  businessService


     structures.
  ") ()
- [uddi_save_tModel](me_uddi_save_tmodel.html "Adds or updates one or more 
  tModel


     structures.
  ") ()

#### User Defined Types & The CLR

- [import_clr](fn_import_clr.html "This function automatically creates the SQL Type wrappers based on 
      the CLR Reflection API.
  ") ()
- [unimport_clr](fn_unimport_clr.html "This function automatically drops the SQL Type wrappers based on 
      the CLR Reflection API.
  ") ()

#### Web & Internet

- [client_attr](fn_client_attr.html "returns a varchar containing the requested information from the connection
  ") ()
- [connection_get](fn_connection_get.html "Get connection variable
  ") ()
- [connection_id](fn_connection_id.html "get connection identifier
  ") ()
- [connection_is_dirty](fn_connection_is_dirty.html "check if current session connection variables have been altered
  ") ()
- [connection_set](fn_connection_set.html "Associates a value to the name in the context of the present connection
  ") ()
- [connection_vars](fn_connection_vars.html "Retrieve all connection variables
  ") ()
- [connection_vars_set](fn_connection_vars_set.html "set all connection variables
  ") ()
- [DAV add & update
  functions](fn_dav_api_add.html "functions for adding, updating, deleting of DAV collections or resources
  ") ()
- [DAV manipulation
  functions](fn_dav_api_change.html "Functions for manipulating an existing DAV
      collection or resource
  ") ()
- [DAV lock manipulation
  functions](fn_dav_api_lock.html "Operations on locks of DAV collections and resources
  ") ()
- [DAV search
  functions](fn_dav_api_search.html "Functions for searching a DAV collection or resource
  ") ()
- [WebDAV Users & Groups
  administration](fn_dav_api_user.html "Functions for manipulating an existing DAV
      collection or resource
  ") ()
- [DAV_EXP](fn_dav_exp.html "Export a retrieved Web site to another WebDAV enabled server
  ") ()
- [dbname](fn_dbname.html "get current catalog
  ") ()
- [ftp_get](fn_ftp_get.html "FTP get command; Virtuoso FTP client
  ") ()
- [ftp_ls](fn_ftp_ls.html "FTP dir command; Virtuoso FTP client
  ") ()
- [ftp_put](fn_ftp_put.html "FTP put command; Virtuoso FTP client
  ") ()
- [get_certificate_info](fn_get_certificate_info.html "Returns information about the current client X509 certificate
  ") ()
- [http](fn_http.html "write to HTTP client or a string output stream
  ") ()
- [http_lock](fn_http_lock.html "Locks the HTTP Web Server port
  ") ()
- [http_unlock](fn_http_unlock.html "Unlocks the HTTP Web Server port
  ") ()
- [http_acl_set](fn_http_acl_set.html "Set conditions against web server ACL's
  ") ()
- [http_acl_get](fn_http_acl_get.html "Test conditions against web server ACL's
  ") ()
- [http_acl_remove](fn_http_acl_remove.html "Removes conditions against web server ACL's
  ") ()
- [http_client](fn_http_client.html "returns a varchar containing the body of the request uri
  ") ()
- [http_client_ext](fn_http_client_ext.html "returns a varchar containing the body of the request uri
  ") ()
- [http_client_ip](fn_http_client_ip.html "Returns the IP address of the calling client.
  ") ()
- [dns_txt_get](fn_dns_txt_get.html "Use for DNS text record retrieval.
  ") ()
- [http_debug_log](fn_http_debug_log.html "set WebDAV HTTP request logging
  ") ()
- [http_enable_gz](fn_http_enable_gz.html "Enable / Disable "Content-Encoding: gzip" for HTTP server
  ") ()
- [http_file](fn_http_file.html "Send a file to the HTTP client
  ") ()
- [http_flush](fn_http_flush.html "Flush internal HTTP stream and disconnect client; Flush HTTP stream and try sending data in chunked mode.
  ") ()
- [http_internal_redirect](fn_http_internal_redirect.html "Performs internal redirect.
  ") ()
- [http_get](fn_http_get.html "returns a varchar containing the body of the request uri
  ") ()
- [http_header](fn_http_header.html " Specifies non-default HTTP response headers
  ") ()
- [http_header_get](fn_http_header_get.html "returns header of current HTTP request
  ") ()
- [http_kill](fn_http_kill.html "Kill VSP process whose details match parameter inputs
  ") ()
- [http_listen_host](fn_http_listen_host.html "Starts, stops and retrieves the state of a user-defined HTTP listener
  ") ()
- [http_map_table](fn_http_map_table.html "Update internal HTTP mapping table
  ") ()
- [http_map_get](fn_http_map_get.html "get values from HTTP virtual host path mapping table
  ") ()
- [http_param](fn_http_param.html "returns value of a HTML form parameter in VSP context
  ") ()
- [http_path](fn_http_path.html "returns the absolute path to the logical path location of the current http request
  ") ()
- [http_pending_req](fn_http_pending_req.html "return array describing running  VSP threads
  ") ()
- [http_physical_path](fn_http_physical_path.html "returns the physical path location of the requested URL
  ") ()
- [http_proxy](fn_http_proxy.html "proxy request to another host and return content to calling client
  ") ()
- [http_request_header](fn_http_request_header.html "returns array of HTTP request header lines
  ") ()
- [http_request_header_full](fn_http_request_header_full.html "returns array of HTTP request header lines
  ") ()
- [http_request_status](fn_http_request_status.html "set the status sent to the client in an HTTP response
  ") ()
- [http_request_get](fn_http_request_get.html "Access to the HTTP request line
  ") ()
- [http_rewrite](fn_http_rewrite.html "Clears output written to  a string output or to an HTTP    
  ") ()
- [http_root](fn_http_root.html "Returns the absolute path of the server root directory.
  ") ()
- [http_value](fn_http_value.html "write to HTTP client or string output stream with HTML
      escapes
  ") ()
- [json_parse](fn_json_parse.html "Takes json string and returns parse tree.
  ") ()
- [http_url](fn_http_url.html "write to HTTP client or string output stream with URL escapes
  ") ()
- [http_xslt](fn_http_xslt.html "applies an XSLT stylesheet to the output of a VSP page
  ") ()
- [URLREWRITE_CREATE_REGEX_RULE](fn_urlrewrite_create_regex_rule.html "Creates regex rules.
  ") ()
- [LFS_EXP](fn_lfs_exp.html "Export retrieved web site to the local file system
  ") ()
- [SERV_QUEUE_TOP](fn_serv_queue_top.html "Retrieve target website and store within Virtuoso
  ") ()
- [ses_connect](fn_ses_connect.html "Opens a TCP session and returns its handle.
  ") ()
- [ses_disconnect](fn_ses_disconnect.html "Disconnections a TCP session.
  ") ()
- [ses_read_line](fn_ses_read_line.html "Read a line of character data from a TCP session.
  ") ()
- [ses_write](fn_ses_write.html "Write character data to an open TCP session.
  ") ()
- [tcpip_gethostbyname](fn_tcpip_gethostbyname.html "Returns IP address by host domain name
  ") ()
- [tcpip_gethostbyaddr](fn_tcpip_gethostbyaddr.html "Returns fully qualified DNS name of the host associated with given IP address
  ") ()
- [VHOST_DEFINE](fn_vhost_define.html "define a virtual host or virtual directory
  ") ()
- [VHOST_REMOVE](fn_vhost_remove.html "remove a virtual host or virtual directory
  ") ()
- [vsp_calculate_digest](fn_vsp_calculate_digest.html "calculate on server-side a digest to perform a HTTP digest authentication
  ") ()
- [wsdl_import_udt](fn_wsdl_import_udt.html "Returns a string containing a UDT definition
  ") ()
- [USER_KEY_LOAD](fn_user_key_load.html "Register and existing key.
  ") ()

#### XML

- [createXML](fn_createxml.html) ()
- [serialize_to_UTF8_xml](fn_serialize_to_utf8_xml.html "Converts argument to its UTF-8 string representation.
  ") ()
- [tidy_html](fn_tidy_html.html "Invoke built-in version of HTML Tidy utility to fix typical errors in  HTML text
  ") ()
- [tidy_list_errors](fn_tidy_list_errors.html "Invoke built-in version of HTML Tidy utility to get list of errors in given input HTML text
  ") ()
- [updateXML](fn_updatexml.html "Create a changed copy of given document by replacing some nodes.
  ") ()
- [xte_head](fn_xte_head.html "Returns the vector corresponding to a head of a XML element 
  ") ()
- [xte_node](fn_xte_node.html "Returns the vector corresponding to a XML element 
  ") ()
- [xte_node_from_nodebld](fn_xte_node_from_nodebld.html "Returns the vector corresponding to a XML element 
  ") ()
- [xte_nodebld_acc](fn_xte_nodebld_acc.html "Adds to the first arguments all remaining arguments 
  ") ()
- [xte_nodebld_final](fn_xte_nodebld_final.html "Corrects input vector
  ") ()
- [xte_nodebld_init](fn_xte_nodebld_init.html "Creates the empty vector
  ") ()
- [XMLAGG](fn_xmlagg.html "Produces a forest of elements from a collection of XML values
  ") ()
- [XMLATTRIBUTES](fn_xmlattributes.html "Creates a list of attributes and their values
  ") ()
- [XMLAddAttribute](fn_xmladdattribute.html "Add an attribute to the given node of an XML tree document
  ") ()
- [XMLAppendChildren](fn_xmlappendchildren.html "Modify an XML document by adding new children to the given entity.
  ") ()
- [XMLCONCAT](fn_xmlconcat.html "Creates a forest of elements by concatenating a list of XML values
  ") ()
- [XMLELEMENT](fn_xmlelement.html "Creates XML element
  ") ()
- [XMLFOREST](fn_xmlforest.html "Produces a forest of XML elements
  ") ()
- [XMLInsertAfter](fn_xmlinsertafter.html "Modify an XML document by inserting new children after the node specified by given entity.
  ") ()
- [XMLInsertBefore](fn_xmlinsertbefore.html "Modify an XML document by inserting new children before the node specified by given entity.
  ") ()
- [XMLReplace](fn_xmlreplace.html "Modify a given XML document by replacing some nodes.
  ") ()
- [xml_auto](fn_xml_auto.html "prepares and executes given SQL for XML string output
  ") ()
- [xml_auto_dtd](fn_xml_auto_dtd.html "returns an XML DTD for the result of a SQL query with a FOR XML clause
  ") ()
- [xml_auto_schema](fn_xml_auto_schema.html "returns an XML schema for the result of an SQL query with a FOR XML clause
  ") ()
- [xml_create_tables_from_mapping_schema_decl](fn_xml_create_tables_from_mapping_schema_decl.html " returns a vector containing strings. Each string is a command to drop
                  a table or a foreign key or to create table.

  ") ()
- [xml_cut](fn_xml_cut.html "creates a new XML document which contains a copy of data pointed by given XML tree- or XPER- entity
  ") ()
- [xml_doc_output_option](fn_xml_doc_output_option.html) ()
- [xml_load_schema_decl](fn_xml_load_schema_decl.html "returns a string with list of errors detected by XML Schema processor on reading given XML Schema
      	definition document.
  ") ()
- [xml_load_mapping_schema_decl](fn_xml_load_mapping_schema_decl.html "creates a xml view from mapping schema.

  ") ()
- [xml_namespace_scope](fn_xml_namespace_scope.html "Returns a vector of all namespace declarations in all ancestors of the given XML entity.
  ") ()
- [xml_add_system_path](fn_xml_add_system_path.html "Adds path to the internal list of system paths.
  ") ()
- [xml_get_system_paths](fn_xml_get_system_paths.html "Returns vector of all system paths.
  ") ()
- [xml_persistent](fn_xml_persistent.html "returns an entity object ('XPER entity') created from given XML document
  ") ()
- [xml_template](fn_xml_template.html "Execute XML template from Virtuoso PL
  ") ()
- [xml_tree](fn_xml_tree.html "Parses an XML fragment and returns the parse tree as nested vectors.
  ") ()
- [xml_tree_doc](fn_xml_tree_doc.html "returns an entity object given a tree from xml_tree
  ") ()
- [xml_tree_doc_media_type](fn_xml_tree_doc_media_type.html) ()
- [xml_uri_get](fn_xml_uri_get.html "Retrieve a resource based on a URI
  ") ()
- [xml_validate_dtd](fn_xml_validate_dtd.html "returns a string with list of errors detected by DTD validator on reading given XML document
  ") ()
- [xml_validate_schema](fn_xml_validate_schema.html "returns a string with list of errors detected by DTD and XML
      Schema validator on reading given XML document.
  ") ()
- [xml_view_dtd](fn_xml_view_dtd.html "returns an XML DTD for the output of given XML VIEW
  ") ()
- [xml_set_ns_decl](fn_xml_set_ns_decl.html "Registers the XML NS prefix as persistent or keeps it in properties of client
  connection depending on the persistance bits input value.
  ") ()
- [xml_view_schema](fn_xml_view_schema.html "returns an XML schema for the output of given XML VIEW
  ") ()
- [xmlsql_update](fn_xmlsql_update.html "Performs insert/update/delete operations
      based on an XML updategram.
  ") ()
- [XMLUpdate](fn_xmlupdate.html "Create a changed copy of given document by replacing some nodes.
  ") ()
- [xpath_eval](fn_xpath_eval.html "Applies an XPATH expression to a context node and returns result(s).
  ") ()
- [xper_cut](fn_xper_cut.html "creates a new "persistent XML"document which contains a copy of data pointed by given XPER entity
  ") ()
- [xper_doc](fn_xper_doc.html "returns an entity object ('XPER entity') created from an XML document
  ") ()
- [xper_locate_words](fn_xper_locate_words.html "returns a smallest fragment of persistent XML entity object ('XPER entity') such that it contains some range of words in its text
  ") ()
- [XPER
  navigation](fn_xper_right_sibling.html "low-level navigation functions for persistent XMLs, useful for import of huge amounts of XML data
  ") ()
- [xpf_extension](fn_xpf_extension.html "declare an XPath extension function 
  ") ()
- [xpf_extension_remove](fn_xpf_extension_remove.html "discards an XPath extension function
  ") ()
- [xquery_eval](fn_xquery_eval.html "Applies an XQUERY expression to a context node and returns result(s).
  ") ()
- [xslt](fn_xslt.html "returns an XML document transformed by an XSLT stylesheet
  ") ()
- [xslt_format_number](fn_xslt_format_number.html "returns formatted string representation of a numeric value
  ") ()
- [xslt_sheet](fn_xslt_sheet.html "declares an XSL stylesheet for use
  ") ()
- [xslt_stale](fn_xslt_stale.html "force reload of XSL stylesheet
  ") ()
- [xtree_doc](fn_xtree_doc.html "returns an entity object created from an XML document
  ") ()
- [XMLType.XMLType](fn_xmltype.xmltype.html) ()
- [XMLType.createNonSchemaBasedXML](fn_xmltype.createnonschemabasedxml.html "Returns a copy of the given instance with the schema reference removed.
  ") ()
- [XMLType.createSchemaBasedXML](fn_xmltype.createschemabasedxml.html "Returns a copy of the given instance with new schema reference.
  ") ()
- [XMLType.createXML](fn_xmltype.createxml.html "Creates an XML Type instance.
  ") ()
- [XMLType.existsNode](fn_xmltype.existsnode.html "Tests node existence having evaluated given XPATH expression.
  ") ()
- [XMLType.extract](fn_xmltype.extract.html "Evaluates given XPATH expression.
  ") ()
- [XMLType.getClobVal](fn_xmltype.getclobval.html "This function returns the serialization of the current node like XPATH function 'serialize()', i.e. a text in XML syntax.
  ") ()
- [XMLType.getNamespace](fn_xmltype.getnamespace.html "Returns the namespace of the top level element providing the instance
  	is schema-based rather than a fragment.
  ") ()
- [XMLType.getNumVal](fn_xmltype.getnumval.html "This function returns the integer-value of the current node like XPATH function 'number()'.
  ") ()
- [XMLType.getRootElement](fn_xmltype.getrootelement.html "Returns top-level element of the given instance (NULL for fragment)
  ") ()
- [XMLType.getSchemaURL](fn_xmltype.getschemaurl.html "Returns the URL of the XML schema definition for schema based instances, NULL for non-schema based.
  ") ()
- [XMLType.getStringVal](fn_xmltype.getstringval.html "The function returns the string-value of the current node like XPATH function 'string()'.
  ") ()
- [XMLType.isFragment](fn_xmltype.isfragment.html "The function returns 1 if the instance is an XML generic entity or 0 if it is a plain document.
  ") ()
- [XMLType.isSchemaBased](fn_xmltype.isschemabased.html "Returns 1 if the given XMLType instance is schema-based, otherwise returns 0.
  ") ()
- [XMLType.isSchemaValid](fn_xmltype.isschemavalid.html "Validates the given XMLType instance against an arbitrary XML schema, returns 1 if successful, 0 if errors are detected.
  ") ()
- [XMLType.isSchemaValidated](fn_xmltype.isschemavalidated.html "Returns 1 or 0 indicating if the XML entity has been validated against the associated schema.
  ") ()
- [XMLType.schemaValidate](fn_xmltype.schemavalidate.html "Validates the schema based XMLType instance against its schema and signals an error in case of failed validation.
  ") ()
- [XMLType.setSchemaValidated](fn_xmltype.setschemavalidated.html "Changes the internal "is validated" flag of the given XMLType instance.
  ") ()
- [XMLType.toObject](fn_xmltype.toobject.html) ()
- [XMLType.transform](fn_xmltype.transform.html) ()

#### XPATH & XQUERY

#### Miscellaneous

- [HS_Resolve](fn_hs_resolve.html "Returns URL that represents the given DOI
  ") ()

#### Geo Spatial

- [ST_Affine](fn_st_affine.html "performs standard 2d affine transformation
  ") ()
- [st_point](fn_st_point.html "Returns a point geometry.
  ") ()
- [st_x](fn_st_x.html "Retrieves the x coordinate of a geometry.
  ") ()
- [st_y](fn_st_y.html "Retrieves the y coordinate of a geometry.
  ") ()
- [st_distance](fn_st_distance.html "Returns the shortest distance between two points.
  ") ()
- [ST_SRID](fn_st_srid.html "returns SRID of shape's spatial reference system or 0 for shape on plane.
  ") ()
- [ST_SetSRID](fn_st_setsrid.html "replaces the SRID of a shape but does not transform the shape or its coordinates from old SRID to a new one.
  ") ()
- [st_astext](fn_st_astext.html "Returns the well known text (WKT) representation of the geometry.
  ") ()
- [st_geomfromtext](fn_st_geomfromtext.html "Parses the string and returns the corresponding geometry.
  ") ()
- [st_intersects](fn_st_intersects.html "Returns intersects between two geometries.
  ") ()
- [st_contains](fn_st_contains.html "Returns true if all points of a given geometry g2 are in another geometry g1.
  ") ()
- [st_within](fn_st_within.html "Returns true if all points
  of a given geometry g1 are in another geometry g2.
  ") ()
- [isgeometry](fn_isgeometry.html "Returns 1 if the argument is a geometry.
  ") ()
- [geo_insert](fn_geo_insert.html "Inserts a geometry from an R tree index.
  ") ()
- [geo_delete](fn_geo_delete.html "Deletes a geometry from an R tree index.
  ") ()
- [GeometryType](fn_geometrytype.html "returns EWKT type name of a shape.
  ") ()
- [http_st_dxf_entity](fn_http_st_dxf_entity.html "writes a DXF (Data Exchange Format) representation of shape into the given output session.
  ") ()
- [http_st_ewkt](fn_http_st_ewkt.html "Writes a EWKT representation of a shape to the given session.
  ") ()
- [st_ewkt_read](fn_st_ewkt_read.html "Parses the given text as a EWKT and returns the parsed shape.
  ") ()
- [postgis_proj_version](fn_postgis_proj_version.html "Returns the version of v7proj4 plugin in use, as a string, for compatibility with PostGIS.
  ") ()
- [dist_from_point_to_line_segment](fn_dist_from_point_to_line_segment.html "returns the distance between a point and a segment on a plane.
  ") ()
- [earth_radius](fn_earth_radius.html "returns geom.mean of radius of Earth
  ") ()
- [ST_ExteriorRing](fn_st_exteriorring.html "Returns an external (the very first) ring of a polygon.
  ") ()
- [ST_GeometryN](fn_st_geometryn.html "Given a 1-based index of a member of a MULTI... or ...COLLECTION shape, returns the member. 
  ") ()
- [st_get_bounding_box](fn_st_get_bounding_box.html "returns BOX2D that is a bounding box of a shape.
  ") ()
- [st_get_bounding_box_n](fn_st_get_bounding_box_n.html "Given a 1-based index of a member of a MULTI... or ...COLLECTION shape, returns the bounding box of a member.
  ") ()
- [haversine_deg_km](fn_haversine_deg_km.html "Given latitudes and longitudes of two points in degrees, calculates the approximate distance between
      	that points in kilometers
  ") ()
- [ST_InteriorRingN](fn_st_interiorringn.html "Given a 1-based index of an interior ring of a polygon, returns the ring. Wrong index is not reported as an error
      	and NULL is returned. 
  ") ()
- [st_linestring](fn_st_linestring.html "returns a linestring in default SRID
  ") ()
- [ST_M](fn_st_m.html "returns the M coordinate.
  ") ()
- [st_may_intersect](fn_st_may_intersect.html "checks whether bounding boxes of two shapes intersect or some of its points are
      	within the specified proximity.
  ") ()
- [ST_MMax](fn_st_mmax.html "returns boundaries of a bounding box around a shape in cordinates.
  ") ()
- [ST_MMin](fn_st_mmin.html "returns boundaries of a bounding box around a shape in cordinates.
  ") ()
- [ST_NumGeometries](fn_st_numgeometries.html "returns number of members of a MULTI... or ...COLLECTION shape, 1 for other sorts of shapes. 
  ") ()
- [ST_NumInteriorRings](fn_st_numinteriorrings.html "returns number of interior rings of the given polygon, NULL if shape is not a polygon. 
  ") ()
- [ST_Transform](fn_st_transform.html "Transforms the given shape from its current spatial reference system to one specified by dest_srid.
  ") ()
- [st_transform_by_custom_projection](fn_st_transform_by_custom_projection.html "Performs a custom projection of shape, using the specified algorithm and algorithm-specific arguments.
  ") ()
- [ST_Translate](fn_st_translate.html "returns a copy of a shape with all coordinates shifted by the provided dX, dY and dZ.
  ") ()
- [ST_TransScale](fn_st_transscale.html "returns a copy of a shape with all coordinates shifted by the provided dX, dY and then
      	multiplied by Xfactor and Yfactor.
  ") ()
- [ST_XMax](fn_st_xmax.html "returns maximum x boundaries of a bounding box around a shape.
  ") ()
- [ST_XMin](fn_st_xmin.html "returns minimum x boundaries of a bounding box around a shape.
  ") ()
- [ST_YMax](fn_st_ymax.html "returns maximum y boundaries of a bounding box around a shape.
  ") ()
- [ST_YMin](fn_st_ymin.html "returns minimum y boundaries of a bounding box around a shape.
  ") ()
- [ST_Z](fn_st_z.html "Retrieves the z coordinate of a geometry.
  ") ()
- [ST_ZMax](fn_st_zmax.html "returns maximum z boundaries of a bounding box around a shape.
  ") ()
- [ST_Zmflag](fn_st_zmflag.html "returns bits indicating presence of Z and/or M coordinates.
  ") ()
- [ST_ZMin](fn_st_zmin.html "returns minimum z boundaries of a bounding box around a shape.
  ") ()

#### VAD

- [VAD_CHECK](fn_vad_check.html "Checks the package has not been altered since installation
  ") ()
- [VAD_CHECK_INSTALLABILITY](fn_vad_check_installability.html "Checks the presence and correct versions of required packages and of the Virtuoso platform
  ") ()
- [VAD_CHECK_UNINSTALLABILITY](fn_vad_check_uninstallability.html "Checks if the package can be uninstalled.
  ") ()
- [VAD_FAIL_CHECK](fn_vad_fail_check.html "Signals package check failure
  ") ()
- [VAD_INSTALL](fn_vad_install.html "Invoke VAD installation process
  ") ()
- [VAD_LOAD_FILE](fn_vad_load_file.html "executes statements of a SQL file
  ") ()
- [VAD_LOAD_SQL_FILE](fn_vad_load_sql_file.html "Loads SQL file and executes its content's statements.
  ") ()
- [VAD_PACK](fn_vad_pack.html "get VAD resource
  ") ()
- [VAD_SAFE_EXEC](fn_vad_safe_exec.html "execute without signalling errors
  ") ()
- [VAD_UNINSTALL](fn_vad_uninstall.html "Vad package uninstallation
  ") ()

</div>

</div>
