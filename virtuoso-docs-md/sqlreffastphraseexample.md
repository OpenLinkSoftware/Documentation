<div>

<div>

<div>

<div>

### 9.33.4. Example

</div>

</div>

</div>

The following example demonstrates managing phrases sets and data
associated with them:

``` programlisting
SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_CLASS (APC_ID, APC_NAME, APC_OWNER_UID, APC_READER_GID, APC_CALLBACK, APC_APP_ENV)
values (3, 'Debug apc #3', http_dav_uid(), http_admin_gid(), 'DB.DBA.AP_DEBUG_CALLBACK', 'Debug apc #3 env')
;

Done. -- 0 msec.

SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
values (5, 'Debug aps #5', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Debug aps #5 env', 10000, 0)
;

Done. -- 0 msec.

SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
values (7, 'Debug aps #7', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Debug aps #7 env', 10000, 0)
;

Done. -- 0 msec.

SQL>ap_add_phrases (5,
  vector (
    vector ('Debug5', 'Debug5 env'),
    vector ('Debug5 one', 'Debug5 one env'),
    vector ('Debug5 two', 'Debug5 two env'),
    vector ('Debug5 three', 'Debug5 three env'),
    vector ('Debug5 twenty one', 'Debug5 twenty one env'),
    vector ('Debug5 twenty two', 'Debug5 twenty two env'),
    vector ('Debug5 twenty three', 'Debug5 twenty three env')
    ) )
;
Done. -- 0 msec.

SQL>ap_add_phrases (7,
  vector (
    vector ('Debug7', 'Debug7 env'),
    vector ('Debug7 one', 'Debug7 one env'),
    vector ('Debug7 two', 'Debug7 two env'),
    vector ('Debug7 three', 'Debug7 three env'),
    vector ('Debug7 twenty one', 'Debug7 twenty one env'),
    vector ('Debug7 twenty two', 'Debug7 twenty two env'),
    vector ('Debug7 twenty three', 'Debug7 twenty three env')
    ) )
;

Done. -- 0 msec.

SQL>ap_add_phrases (5,
  vector (
    vector ('Debug5 thirty one', 'Debug5 thirty one BAD env'),
    vector ('Debug5 thirty two', 'Debug5 thirty two BAD env'),
    vector ('Debug5 thirty three', 'Debug5 thirty three BAD env'),
    vector ('Debug5 one hundred', 'Debug5 one hundred BAD env')
    ) )
;

Done. -- 0 msec.

SQL>ap_add_phrases (5,
  vector (
    vector ('Debug5', 'Debug5 UPDATED env'),
    vector ('Debug5 thirty one', 'Debug5 thirty one NEW env'),
    vector ('Debug5 thirty two', 'Debug5 thirty two NEW env'),
    vector ('Debug5 thirty three', 'Debug5 thirty three NEW env'),
    vector ('Debug5 one hundred')
    ) )
;
Done. -- 0 msec.

SQL>create function ptext_1 ()
{
  return '
    vector ''Debug5'', ''Debug5 env'',
    vector ''Debug5 one'', ''Debug5 one env'',
    vector ''Debug5 two'', ''Debug5 two env'',
    vector ''Debug5 three'', ''Debug5 three env'',
    vector ''Debug5 twenty one'', ''Debug5 twenty one env'',
    vector ''Debug5 twenty two'', ''Debug5 twenty two env'',
    vector ''Debug5 twenty three'', ''Debug5 twenty three env''
ap_add_phrases 7,
  vector
    vector ''Debug7'', ''Debug7 env'',
    vector ''Debug7 one'', ''Debug7 one env'',
    vector ''Debug7 two'', ''Debug7 two env'',
    vector ''Debug7 three'', ''Debug7 three env'',
    vector ''Debug7 twenty one'', ''Debug7 twenty one env'',
    vector ''Debug7 twenty two'', ''Debug7 twenty two env'',
    vector ''Debug7 twenty three'', ''Debug7 twenty three env''
ap_add_phrases 5,
  vector
    vector ''Debug5 thirty one'', ''Debug5 thirty one BAD env'',
    vector ''Debug5 thirty two'', ''Debug5 thirty two BAD env'',
    vector ''Debug5 thirty three'', ''Debug5 thirty three BAD env'',
    vector ''Debug5 one hundred'', ''Debug5 one hundred BAD env''
ap_add_phrases 5,
  vector
    vector ''Debug5'', ''Debug5 UPDATED env'',
    vector ''Debug5 thirty one'', ''Debug5 thirty one NEW env'',
    vector ''Debug5 thirty two'', ''Debug5 thirty two NEW env'',
    vector ''Debug5 thirty three'', ''Debug5 thirty three NEW env'',
    vector ''Debug5 one hundred''
    ';
}
;

Done. -- 20 msec.

SQL>create function ptext_2 ()
{
  return '
    vector ''Debug5 twenty one''
    vector ''Debug7 twenty one''
    vector ''Debug5 thirty one''
    vector ''Debug5 thirty one''
    vector ''Debug5 one hundred''
    ';
}
;
Done. -- 10 msec.

SQL>create function test_ptext_1()
{
  declare ses any;
  ses := string_output();
  ap_debug_langhandler (ptext_1 (), 'x-any', vector (5, 7), ses );
  return string_output_string (ses);
}
;
Done. -- 10 msec.

SQL>create procedure dump_match_list (in vect any, in path varchar := null)
{
  declare VDATA varchar;
  if (path is null)
    {
      result_names (VDATA);
      path := '';
    }
  if (vect is null)
    {
      result (path || ' NULL');
      return;
    }
  if (193 <> __tag (vect))
    {
      result (path || ' ' || (cast (vect as varchar)));
      return;
    }
  declare l, ctr integer;
  l := length (vect);
  if (0 = l)
    {
      result (path || ' (empty vector)');
      return;
    }
  if (isinteger (vect [l - 1]))
    {
      declare ses any;
      ses := string_output ();
      for (ctr := 0; ctr < l; ctr := ctr + 1)
        {
      http (sprintf (' [%d]=%s', ctr, cast (vect[ctr] as varchar)), ses);
    }
      result (path || string_output_string (ses));
      return;
    }
  for (ctr := 0; ctr < l; ctr := ctr + 1)
    {
      dump_match_list (vect[ctr], sprintf ('%s[%d]', path, ctr));
    }
}
;

Done. -- 10 msec.

SQL>select test_ptext_1();
callret
VARCHAR
_______________________________________________________________________________

    (vector) '[[Debug5 UPDATED env]Debug5]]', '[[Debug5 UPDATED env]Debug5]] (env)', (vector) '[[Debug5 UPDATED env ; Debug5 one env]Debug5]] [[Debug5 one env]one]]', '[[Debug5 UPDATED env ; Debug5 one env]Debug5]] [[Debug5 one env ]one]] (env)',
    (vector) '[[Debug5 UPDATED env ; Debug5 two env]Debug5]] [[Debug5 two env]two]]', '[[Debug5 UPDATED env ; Debug5 two env]Debug5]] [[Debug5 two env ]two]] (env)', (vector) '[[Debug5 UPDATED env ; Debug5 three env]Debug5]] [[Debug5 three env]three]]', '[[Debug5 UPDATED env ; Debug5 three env]Debug5]] [[Debug5 three env]three]] (env)',
    (vector) '[[Debug5 UPDATED env ; Debug5 twenty one env]Debug5]] [[Debug5 twenty one env]twenty]] [[Debug5 twenty one env]one]]', '[[Debug5 UPDATED env ; Debug5 twenty one env]Debug5]] [[Debug5 twenty one env]twenty]] [[Debug5 twenty one env]one]] (env)',
    (vector) '[[Debug5 UPDATED env ; Debug5 twenty two env]Debug5]] [[Debug5 twenty two env]twenty]] [[Debug5 twenty two env]two]]', '[[Debug5 UPDATED env ; Debug5 twenty two env]Debug5]] [[Debug5 twenty two env]twenty]] [[Debug5 twenty two env]two]] (env)',
    (vector) '[[Debug5 UPDATED env ; Debug5 twenty three env]Debug5]] [[Debug5 twenty three env]twenty]] [[Debug5 twenty three env]three]]', '[[Debug5 UPDATED env ; Debug5 twenty three env]Debug5]] [[Debug5 twenty three env]twenty]] [[Debug5 twenty three env]three]] (env)' (ap)_(add)_(phrases) (7), (vector)
    (vector) '[[Debug7 env]Debug7]]', '[[Debug7 env]Debug7]] (env)', (vector) '[[Debug7 one env ; Debug7 env]Debug7]] [[Debug7 one env]one]]', '[[Debug7 one env ; Debug7 env]Debug7]] [[Debug7 one env]one]] (env)',
    (vector) '[[Debug7 two env ; Debug7 env]Debug7]] [[Debug7 two env]two]]', '[[Debug7 two env ; Debug7 env]Debug7]] [[Debug7 two env]two]] (env)',
    (vector) '[[Debug7 three env ; Debug7 env]Debug7]] [[Debug7 three env]three]]', '[[Debug7 three env ; Debug7 env]Debug7]] [[Debug7 three env]three ]] (env)',
    (vector) '[[Debug7 twenty one env ; Debug7 env

1 Rows. -- 50 msec.

SQL>dump_match_list (ap_build_match_list (vector (5, 7), ptext_2 (), 'x-any', 0, 0 ) );
VDATA
VARCHAR
_______________________________________________________________________________

[0][0] 3
[0][1][0] Debug apc #3
[0][1][1] DB.DBA.AP_DEBUG_CALLBACK
[0][1][2] Debug apc #3 env
[1][0] 5
[1][1][0] Debug aps #5
[1][1][1] 3
[1][1][2] 1
[1][1][3] Debug aps #5 env
[1][2] 7
.....
139 Rows. -- 231 msec.

SQL>dump_match_list (ap_build_match_list (vector (5, 7), ptext_2 (), 'x-any', 0, 3 ) );
VDATA
VARCHAR
_______________________________________________________________________________

[0][0] 3
[0][1][0] Debug apc #3
[0][1][1] DB.DBA.AP_DEBUG_CALLBACK
[0][1][2] Debug apc #3 env
[1][0] 5
[1][1][0] Debug aps #5
[1][1][1] 3
[1][1][2] 1
.....
133 Rows. -- 231 msec.

SQL>create procedure ap_make_js_menus (
  in ap_set_ids any, in source_UTF8 varchar, in lang_name varchar, in is_html integer)
{
  declare res_out, script_out, match_list any;
  declare m_apc, m_aps, m_app, m_apa, m_apa_w, m_aph any;
  declare apa_w_ctr, apa_w_count integer;
  declare app_ctr, app_count integer;
  declare prev_end integer;

  match_list := ap_build_match_list ( ap_set_ids, source_UTF8, lang_name, is_html, 3); -- 3 is to have less garbage, hence better speed.
  m_apc := aref_set_0 (match_list, 0);
  m_aps := aref_set_0 (match_list, 1);
  m_app := aref_set_0 (match_list, 2);
  m_apa := aref_set_0 (match_list, 3);
  m_apa_w := aref_set_0 (match_list, 4);
  m_aph := aref_set_0 (match_list, 5);
  apa_w_count := length (m_apa_w);
  app_count := length (m_app);
  if (0 = app_count)
    {
      return source_UTF8;
    }
  res_out := string_output ();
  script_out := string_output ();
  http ('<script DEFER language="javescript"><!--', script_out);
  http ('\n  var v_descs = [', script_out);
  for (apa_w_ctr := 0; apa_w_ctr < apa_w_count; apa_w_ctr := apa_w_ctr + 1)
    {
      declare apa_idx integer;
      declare apa any;
      apa_idx := m_apa_w [apa_w_ctr];
      apa := aref_set_0 (m_apa, apa_idx);
      if (5 = length (apa))
        {
          declare apa_beg, apa_end, apa_hpctr, apa_hpcount integer;
          apa_beg := apa [1];
      apa_end := apa [2];
      apa_hpcount := length (apa[4]);
      http (subseq (source_UTF8, prev_end, apa_beg), res_out);
      http (sprintf ('<span
xml:id="apjsm%d">', apa_idx), res_out);
      http (subseq (source_UTF8, apa_beg, apa_end), res_out);
      http ('</span>', res_out);
          prev_end := apa_end;
      if (apa_w_ctr > 0)
        http(',', script_out);
      http (sprintf ('\n\t["apjsm%d"\t, [', apa_idx), script_out);
      for (apa_hpctr := 0; apa_hpctr < apa_hpcount; apa_hpctr := apa_hpctr + 1)
            {
              if (apa_hpctr > 0)
            http (',', script_out);
          http (cast (apa[4][apa_hpctr] as varchar), script_out);
            }
      http (']\t, [', script_out);
    -- todo: list service indexes. Do we need this in such a form?
      http ('\t]', script_out);
        }
    }
  http (subseq (source_UTF8, prev_end), res_out);
  http (' ];', script_out);
  http ('\n  var v_descs = [', script_out);
  -- todo list services. Do we need this in such a form?
  http (' ];', script_out);
  http ('\n  var v_links = [', script_out);
  for (app_ctr := 0; app_ctr < app_count; app_ctr := app_ctr + 1)
    {
      declare app any;
      app := m_app [app_ctr];
      if (app_ctr > 0)
        http(',', script_out);
      http (sprintf ('\n\t["%s"\t, "%s"\t, "%s"\t, "%s"\t]', app[3][0], app[3][1], app[3][2], app[3][3]), script_out);
    }
  http (' ];', script_out);
  http ('\n-->

</script><script DEFER language="javascript" src="lookup.js"></script>', script_out);
  return
    replace (
      replace (
        string_output_string (res_out),
        '<body', '<body onload="makePopupDivs (v_descs, v_services, v_links)"' ),
      '</html>', string_output_string (script_out) || '</html>' );
}
;

Done. -- 0 msec.

SQL>create function ptext_3 ()
{
  return '<html>
  <head>
  <link href="gogo.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
  <p>The OpenLink Virtuoso team has developers based in Bulgaria</p>
  </body>
</html>';
}
;

Done. -- 10 msec.

SQL>create function ptext_3 ()
{
  return '<html>
  <head>
  <link href="gogo.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
  <p>The OpenLink <strong>Virtuoso</strong> team has developers based in Bulgaria</p>
  </body>
</html>';
}
;

Done. -- 0 msec.

SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
values (9, 'Gogo aps', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Gogo aps env', 10000, 0);

Done. -- 0 msec.

SQL>ap_add_phrases (9,
    vector (
      vector ('OpenLink'              , vector ('OpenLink'            , 'http://www.openlinksw.com'     , 'OpenLink Software'   , ' The industry leading provider of High Performance drivers'  )),
      vector ('OpenLink Virtuoso'   , vector ('OpenLink Virtuoso'   , 'http://virtuoso.openlinksw.com'  , 'OpenLink Virtuoso'   , ' OpenLink Universal Integration Middleware'          )),
    ) )
;

Done. -- 0 msec.

SQL>select ap_make_js_menus (vector (9), ptext_3(), 'x-any', 1);

callret
VARCHAR
_______________________________________________________________________________

<html>
  <head>
  <link href="gogo.css" rel="stylesheet" type="text/css" />
  </head>
  <body onload="makePopupDivs (v_descs, v_services, v_links)">
  <p>The OpenLink <strong>Virtuoso</strong> team has developers based in Bulgaria</p>
  </body>
<script DEFER language="javescript"><!--
  var v_descs = [ ];
  var v_descs = [ ];
  var v_links = [
        ["OpenLink Virtuoso"    , "http://virtuoso.openlinksw.com"  , "OpenLink Virtuoso"   , " OpenLink Universal Integration Middleware"  ],
        ["OpenLink"     , "http://www.openlinksw.com"   , "OpenLink Software"   , " The industry leading provider of High Performance drivers"  ] ];
-->

</script><script DEFER language="javascript" src="lookup.js"></script></html>

1 Rows. -- 0 msec.
```

</div>
