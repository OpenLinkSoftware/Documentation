<div>

<div>

<div>

<div>

## 12.3. Database Logins

</div>

</div>

</div>

`DB.DBA.DBEV_LOGIN (inout user_name varchar, in digest varchar, in session_random varchar, ) `

This function, if defined, will always be called by Virtuoso just before
a client is authenticated against the Virtuoso Server. Three parameters
are available for audit purposes or any other pre-processing purpose
totally user definable.

<div>

1.  <span class="emphasis">*user_name:*</span>

    |                                                                                          |
    |------------------------------------------------------------------------------------------|
    | <span class="emphasis">*IN*</span> : the user name from the login data                   |
    | <span class="emphasis">*OUT*</span> : the user name used by Virtuoso for this connection |

2.  <span class="emphasis">*digest*</span> : the password digest
    calculated by the client (or the password itself for older clients)

3.  <span class="emphasis">*session_random*</span> : the random key used
    to calculate the digest

</div>

This hook can be used to control how Virtuoso proceeds with the client
login by responding to 3 possible return values:

|                                                                                   |
|-----------------------------------------------------------------------------------|
| -1 - continue with normal verification                                            |
| 0 - reject the login                                                              |
| 1 - allow the login (the user returned should be a valid Virtuoso local user name |

<div>

**Example 12.4. Sample Database Login Hook**

<div>

``` programlisting
create procedure "DB"."DBA"."DBEV_LOGIN" (
    inout user_name varchar,
    in digest varchar,
    in session_random varchar)
{
  -- the hook runs as DBA
  dbg_obj_print ('user=', user);

  -- and is compiled as DBA
  declare uid_cnt integer;
  uid_cnt := 0;
  select count (*) into uid_cnt from SYS_USERS where U_NAME = user_name;
  dbg_printf ('%ld local users found with this name', uid_cnt);

  if (user_name = 'masterdba')
    {
      -- 'masterdba' is a valid remotely defined user
      -- it's password is 'masterdbapwd'
      -- we're going to check it's password and then map it to dba

      declare md5_ctx any;
      declare my_digest varchar;
      declare pwd varchar;

      -- this is our assumption for the user's password
      -- this can come from an external source as well
      pwd := 'masterdbapwd';

      -- calculate the MD5 digest for checking the password that the client supplied.
      -- note that it uses the 'masterdba'/'masterdbapwd' to calculate it since we
      -- assume that these are the data the client supplied as user id and password
      --
      -- The way to calculate this is FIXED.
      -- The ONLY variables are the user id and the password

      -- START of the FIXED digest calculation sequence
      md5_ctx := md5_init();
      md5_ctx := md5_update(md5_ctx, session_random);
      md5_ctx := md5_update(md5_ctx, user_name);
      md5_ctx := md5_update(md5_ctx, pwd);
      -- the 0 parameter to the md5_final causes it to return the bytes
      -- instead of representing it as hexadecimal characters
      my_digest := md5_final (md5_ctx, 0);
      -- END of the FIXED digest calculation sequence

      -- now compare the calculated digest with the one supplied by the client
      -- note the OR here - some older clients MAY supply the password in plain text
      if (my_digest = digest or pwd = digest)
        {
      -- the match says that the client indeed supplied 'masterdbapwd' as a password
          dbg_obj_print ('masterdba validated');

      -- so map it to the local 'dba' user
      user_name := 'dba';

          -- and skip further verification
          return 1;
    }
      else
    {
      -- the password is not the one that we verify against
          dbg_obj_print ('masterdba pwd wrong');

          -- not allow the login at all
      return 0;
    }
    }
  else if (user_name = 'nobody')
    {
      -- the hook can signal :
      -- this is equal to returning -1, but has the additional benefit of an error message printed into the log
      signal ('28000', 'we don''t map nobody');
    }
  else if (user_name = 'attacker')
    {
      -- that's a way to print a message to the log and reject the login
      log_message ('trying invalid user');
      return 0;
    }
  else
    {
      -- all local user_name/pwd are subject to normal verification
      dbg_obj_print (user_name);
      return -1;
    }
  -- note that not returning value causes the Virtuoso to print an appropriate message to the log
  -- and then continue with the normal verification
  -- same happens if the value returned is not 0, -1 or 1
};
```

</div>

</div>

  

`DB.DBA.USER_FIND (in name varchar, ) `

This is a user-defined PL function hook which, if it exists, will be
executed before doing the SQL/ODBC login. In this hook the user can find
a user account from some other server and register it in the local
database. Or, this can be used to perform some pre-login actions. It is
similar to the DBEV_LOGIN, but it does not change any account validation
rule, it is purely for pre-processing.

</div>
