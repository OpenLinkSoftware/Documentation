<div>

<div>

<div>

<div>

## 7.2. Interactive SQL Utility

</div>

</div>

</div>

ISQL/ISQLO/ISQLU/isql-iodbc/isql-udbc

The Virtuoso ISQL utility allows users to execute queries & scripts
against the Virtuoso or other SQL servers (depending on the suffix). It
also supports a large number of options and it's own commands.

ISQL parses it's input for CREATE (PROCEDURE\|TRIGGER\|FUNCTION), '{',
'}', ';', double and single quotes and comments to detect where the
current command starts and finishes. If it's in a
PROCEDURE\|TRIGGER\|FUNCTION declaration it changes it's command line
prompt to '\<procedure_name\>(\<curly_brace_nesting_level\>)' to help
the user enter the correct command. Otherwise it considers semicolon (;)
as the statement end and executes the statement.

ISQL also has a form of script language by itself.

<div>

<div>

<div>

<div>

### 7.2.1. Invoking ISQL

</div>

</div>

</div>

ISQL is invoked from the command line of the operating system. It is a
text-mode application with support of readline library (where
available).

Specify the --help or the -? option to view the usage:

``` programlisting
bash$ ./bin/isql --help
OpenLink Interactive SQL (Virtuoso), version 0.9849b.

   Usage :
isql <HOST>[:<PORT>] <UID> <PWD> file1 file2 ...

isql -H <server_IP> [-S <server_port>] [-U <UID>] [-P <PWD>]
     [-E] [-X <pkcs12_file>] [-K]
     [-u <name>=<val>]* [-i <param1> <param2>]

     isql -?
Connection options:

  -?                  - This help message
  -U username         - Specifies the login user ID
  -P password         - Specifies the login password
  -H server_addr      - Specifies the Server address (IP)
  -S server port      - Specifies the TCP port to connect to
  -E                  - Specifies that encryption will be used.
                        If no PK is specified, then anonymous connection is established.
  -C                  - Specifies that password will be sent in cleartext
  -X pkcs12_file      - Specifies that encryption & X509 certificates will
                        be used i.e the client PK <pksc12 file>
  -T server_cert      - Specifies the CA certificate(s) file to be used i.e. the list
                        of trusted issuers: a PEM (base64) file of all the X509 certificates
                        of the Certification Authorities (CA) which the client will use for
                        verifying the server's certificate. This is used on client side to
                        verify the server certificate.
  -b size             - Specifies the size of the command buffer to be used (in KBytes)
  -K                  - Shuts down the virtuoso on connecting to it

Parameter passing options:

  -u name1=val1... - Everything after -u is stored to associative array U,
                        until -i is encountered. If no equal sign then value
                        is NULL
  -i                  - Ignore everything after the -i option, after which
                        comes arbitrary input parameter(s) for isql procedure,
                        which can be referenced with $ARGV[$I] by the
                        ISQL-commands.
  <OPT>=<value>       - Sets the ISQL options

  Note that if none of the above matches then the non-options go as
  <HOST>[:<PORT>] <UID> <PWD> file1 file2 ...
```

If the command line option is not one of the above it is considered a
"non-option" parameter. If the non-option parameter contains the equal
sign ('=') then it's considered an ISQL option value assignment. For
example 'MAXROWS=10' limits the number of rows returned for a resultset
to 10 instead of the default 0.

Otherwise ISQL treats the "non-option" parameters (identified by their
position) as follows :

|                                                                                                     |
|-----------------------------------------------------------------------------------------------------|
| Position 1 - \<Host\> or \<port\> or \<Host:port\> (native), DSN (ISQLO/ISQLU/isql-iodbc/isql-udbc) |
| Position 2 - \<user_id\>                                                                            |
| Position 3 - \<password\>                                                                           |
| Position 4 and later - script file name to load                                                     |

Let us consider the following command line:

``` programlisting
isql 1111 dba dba VERBOSE=OFF 'EXEC=status()' test.sql test2.sql -i arg1 arg2
```

The '1111' is the first "non-option", so it represents the connection
host:port (This is all digits so the virtuoso CLI prepends this with
'localhost', i.e. this is an shortcut for 'localhost:1111').

The first 'dba' is the second "non-option", so it is used as User ID.

The second 'dba' is the third "non-option", so it is used as Password.

'VERBOSE=OFF' is a "non-option", but it has an equal sign in it, so this
becomes an ISQL option SET statement. In this particular case this
disables the output of "Done xxx msec" messages after each command.

'EXEC=status()' is a "non-option", but again has again an equal sign in
it. EXEC is a special option. Setting it to a value means executing that
value as an SQL command. The result of this is that status() gets
executed and it's results shown.

'test.sql' is the fourth "non-option" and it specifies a file name to
load a script from and execute.

'test2.sql' is the fifth "non-option" and it again specifies a file name
to load a script from and execute.

'-i' specifies that the script argument list starts. So every option
after the -i is filled in the ISQL \$ARGV\[\] array.

The order of execution is:

<div>

1.  Connect to 'localhost:1111' using UserID/Password dba/dba.

2.  Set the VERBOSE ISQL flag to OFF.

3.  Set the \$ARGV\[0\]=arg1 and \$ARGV\[1\]=arg2.

4.  Execute status() and display the results.

5.  Execute the script in test.sql and display the results.

6.  Execute the script in test2.sql and display the results.

7.  Disconnect and exit the ISQL

</div>

</div>

</div>
