<div>

<div>

<div>

<div>

### 19.3.3. Storing Email in Virtuoso

</div>

</div>

</div>

A generic mail delivery driver enables SMTP servers to deliver email to
be stored in either Virtuoso or non Virtuoso SQL database.

Mail storage can occur in a number of ways:

<div>

1.  Replacing the default generic SMTP mail handler ( the program
    "procmail")

2.  Replacing the mail storage settings for individual users Replacing
    Default SMTP Mail Handler Sendmail

</div>

<div>

<div>

<div>

<div>

#### Replacing procmail As Default Mail Handler In Sendmail Configurations

</div>

</div>

</div>

When this configuration is in use, the mails for all of your "sendmail"
mail recipients are written to a SQL Database table.

<div>

1.  Copy the file "odbc_mail.default.ini" to "/etc/odbc_mail.ini"

    <div class="important"
    style="margin-left: 0.5in; margin-right: 0.5in;">

    |                                        |                                                                                                     |
    |:--------------------------------------:|:----------------------------------------------------------------------------------------------------|
    | ![\[Important\]](images/important.png) | Important                                                                                           |
    |                                        | Make sure that /etc/odbc_mail.ini is NOT GROUP/WORLD writable. virt_mail will fail to run if it is. |

    </div>

2.  Copy or symbolically link the file "virt_mail" to
    "/usr/bin/virt_mail"

3.  Edit /etc/odbc_mail.ini and change the login settings to match your
    current database installation.

    Note: If you don't have or want to use procmail, comment out the
    "Fallback" setting in the "\[Deliver\]" section.

4.  Edit the file "/etc/sendmail.cf" as described below:

    Change

    ``` programlisting
    Mlocal, P=/usr/bin/procmail, F=lsDFMAw5:/|@qSPfhn9, S=10/30,
      R=20/40,T=DNS/RFC822/X-Unix, A=procmail -Y -a $h -d $u
    ```

    To:

    ``` programlisting
    Mlocal, P=/usr/bin/virt_mail, F=lsDFMA5:/|@qSPhn9, S=10/30,
      R=20/40, T=DNS/RFC822/X-Unix, A=virt_mail -c /etc/odbc_mail.ini -l $u -s $g
    ```

    NOTE: The changes to the F= setting involves removing both the 'w'
    and 'f' flags.

    The removal of the 'w' flag affects lookups in /etc/passwd, which
    are no longer required if all mail delivery goes into a SQL
    Database. The default ini file is set up to maildrop via procmail,
    which will perform the check correctly.

</div>

</div>

<div>

<div>

<div>

<div>

#### Replacing The Mail Storage Settings For Individual Users

</div>

</div>

</div>

<div>

<div>

<div>

<div>

##### Using Sendmail

</div>

</div>

</div>

<div>

1.  Copy odbc_mail.default.ini to ~the_user_name/odbc_mail.ini

    <div class="important"
    style="margin-left: 0.5in; margin-right: 0.5in;">

    |                                        |                                                                                                     |
    |:--------------------------------------:|:----------------------------------------------------------------------------------------------------|
    | ![\[Important\]](images/important.png) | Important                                                                                           |
    |                                        | Make sure that /etc/odbc_mail.ini is NOT GROUP/WORLD writable. virt_mail will fail to run if it is. |

    </div>

2.  At the end of the file ~the_user_name/.procmailrc put something
    like:

    ``` programlisting
    :0:
    | /usr/bin/virt_mail -c .odbc_mail.ini -l the_user_name
    ```

    replacing the_user_name with the user you are setting up.

    Note: the '-l ..' parameter is used to relate the local recipient to
    the database user for which the maildrop is done. See the remarks in
    the odbc_mail.default.ini file.

3.  Adjust the parameters in .odbc_mail.ini to match your configuration

    <div class="important"
    style="margin-left: 0.5in; margin-right: 0.5in;">

    |                                        |                                                       |
    |:--------------------------------------:|:------------------------------------------------------|
    | ![\[Important\]](images/important.png) | Important                                             |
    |                                        | disable Fallback delivery in the .odbc_mail.ini file. |

    </div>

    Comment out the "Fallback =" entry in the .odbc_mail.ini or set it
    to something that does not involve procmail. This may lead to drop
    loops, otherwise.

</div>

</div>

<div>

<div>

<div>

<div>

##### Using Qmail

</div>

</div>

</div>

<div>

1.  Copy odbc_mail.default.ini to ~the_user_name/.odbc_mail.ini

    <div class="important"
    style="margin-left: 0.5in; margin-right: 0.5in;">

    |                                        |                                                                                                          |
    |:--------------------------------------:|:---------------------------------------------------------------------------------------------------------|
    | ![\[Important\]](images/important.png) | Important                                                                                                |
    |                                        | Make sure that the .odbc_mail.ini file is NOT GROUP/WORLD writable. virt_mail will fail to run if it is. |

    </div>

2.  If you are setting up a .qmail, you can simply do the following:

    ``` programlisting
    | /usr/bin/virt_mail -m qmail -c .odbc_mail.ini
    ```

    If you are setting up .qmail-default or .qmail-\<some_alias_name\>,
    make sure you adjust the RemovePrefix accordingly in the
    odbc_mail.ini.

    This also works if a single user is receiving mail for an entire
    (virtual) domain.

    If you want to configure qmail so that user 'db' gets all mail for
    example.com, do the following:

    <div>

    1.  create a new user db in /etc/passwd etc.

    2.  remove example.com from /var/qmail/control/locals

    3.  add to /var/qmail/controls/virtualdomains:

        ``` programlisting
        example.com:db
        ```

    4.  adjust /var/qmail/users/assign accordingly:

        ``` programlisting
        =db:db:<uid>:<gid>:<home>:::
        ```

        ``` programlisting
        +db-:db:<uid>:<gid>:<home>:-::
        ```

        or run qmail-pw2u \< /etc/passwd \> /var/qmail/users/assign then
        run qmail-newu and restart qmail

    5.  in ~db/.qmail-default, put:

        ``` programlisting
        | /usr/bin/virt_mail -m qmail -c .odbc_mail.ini
        ```

    6.  in .odbc_mail.ini, set:

        ``` programlisting
        RemovePrefix=db-
        ```

        Now, mail to info@example.com will be delivered to the qmail
        alias db-info@example.com and is stored into the database for
        user 'info'.

    </div>

3.  Adjust the parameters in .odbc_mail.ini to match your configuration

</div>

</div>

<div>

<div>

<div>

<div>

##### Using Courier

</div>

</div>

</div>

<div>

1.  Copy odbc_mail.default.ini to ~the_user_name/.odbc_mail.ini

    <div class="important"
    style="margin-left: 0.5in; margin-right: 0.5in;">

    |                                        |                                                                                                          |
    |:--------------------------------------:|:---------------------------------------------------------------------------------------------------------|
    | ![\[Important\]](images/important.png) | Important                                                                                                |
    |                                        | Make sure that the .odbc_mail.ini file is NOT GROUP/WORLD writable. virt_mail will fail to run if it is. |

    </div>

2.  If you are setting up a .courier, you can simply do the following:

    ``` programlisting
    | /usr/bin/virt_mail -mcourier -c .odbc_mail.ini
    ```

    If you are setting up .courier-default or
    .courier-\<some_alias_name\>, make sure you adjust the RemovePrefix
    accordingly in the .odbc_mail.ini.

    Note: although courier is very similar to qmail in this respect, it
    is different from qmail in how it handles exit codes. If you use
    -mqmail while running under courier, you'll get the wrong exit
    codes, so mail is bounced instead of retried.

    Note also that if delivering to multiple recipients in a .courier
    file, make sure the virt_mail is specified first. This is because if
    the virt_mail fails with a temporary error, the other recipients
    will get another drop when courier re-attempts to deliver the mail.

    Right:

    \w

    ``` programlisting
    | /usr/bin/virt_mail -mcourier -c .odbc_mail.ini
    ./Maildir
    ```

    Wrong:

    ``` programlisting
    ./Maildir
    | /usr/bin/virt_mail -mcourier -c .odbc_mail.ini
    ```

3.  Adjust the parameters in .odbc_mail.ini to match your configuration

</div>

</div>

<div>

<div>

<div>

<div>

##### Using EXIM

</div>

</div>

</div>

Here are code snippets for Exim that perform maildrops into the odbc
database.

``` programlisting
## IN TRANSPORT SECTION

# Delivers into the database
odbc:
  driver = pipe
  command = /usr/bin/virt_mail \
    -c /etc/odbc_mail.ini \
    -s "${if def:return_path{$return_path}{MAILER-DAEMON}}" \
    -l "$local_part"
  user = USERNAME
  return_path_add
  delivery_date_add
  prefix =
  suffix =
  temp_errors = 73 : 74 : 75
  return_fail_output

# NOTE: Make sure the USERNAME in the 'user = USERNAME' setting matches
# the owner of /etc/odbc_mail.ini, because this file must have mode 0600.
# Consider creating a new user account for this delivery only.
# You should specify 'user = root' here only if Fallback delivery is
# configured in /etc/odbc_mail.ini (for procmail fallback delivery
# for instance)

## IN DIRECTORS SECTION

# Attempts delivery of all mail into the database
to_db:
  driver = smartuser
  transport = odbc
  require_files = /etc/odbc_mail.ini
  #
  # uncomment line below to deliver all mail to db-XXX into the database, for any
  # value of XXX. For this to work, set "RemovePrefix = db-" in
  # the [Translate] section in /etc/odbc_mail.ini
  #prefix = db-
```

</div>

</div>

<div>

<div>

<div>

<div>

#### Mail System Tables

</div>

</div>

</div>

The electronic mail accounts are regular SQL accounts.

Id (MM_ID) of the message is unique per account/folder (folder can be
'Inbox' etc.)

<div>

|                            |                                                               |
|:--------------------------:|:--------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                     |
|                            | <a href="smtptabledesc.html" class="link"                     
                              title="23.6.9. Mail Table Description">Mail system tables</a>  |

</div>

</div>

<div>

<div>

<div>

<div>

#### Pop3 Client

</div>

</div>

</div>

The Virtuoso POP3 Client implementation can retrieve messages from any
POP3 server.

<div>

<div>

<div>

<div>

##### pop3_get_dedup

</div>

</div>

</div>

For detailed description and example use of the function, see
<a href="fn_pop3_get.html" class="link" title="pop3_get">pop3_get</a> in
the <a href="ch-functions.html" class="link"
title="Chapter 24. Virtuoso Functions Guide &amp; Reference">Functions
Reference Guide</a>.

</div>

</div>

<div>

<div>

<div>

<div>

#### Commands

</div>

</div>

</div>

UIDL - get only UIDL's of messages.

DELETE - delete messages after downloading.

<div>

**Example 19.5. Examples**

<div>

1\. To get 10 KB. messages from the server 'openlinksw.com' POP3 port
110, user name 'user_1', password 'pass_1'

``` programlisting
    Pop3_get ('openlinksw.com:110', 'user_1', 'pass_1', 10000);
```

2\. To get and delete 5 KB. messages from the server 'openlinksw.com'
POP3 port 110, user name 'user_1', password 'pass_1'

``` programlisting
    Pop3_get ('openlinksw.com:110', 'user_1', 'pass_1', 5000, 'DELETE');
```

3\. To get UIDL's of 100 kb. messages from the server 'openlinksw.com'
POP3 port 110, user name 'user_1', password 'pass_1'

``` programlisting
    Pop3_get ('openlinksw.com:110', 'user_1', 'pass_1', 100000, 'UIDL');
```

</div>

</div>

  

</div>

</div>
