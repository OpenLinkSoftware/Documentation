<div>

<div>

<div>

<div>

### 7.3.9. Extensions

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Virtuoso ODBC RDF Extensions for SPASQL

</div>

</div>

</div>

The Virtuoso ODBC Driver adds a number of defines to the ODBC API to
allow an ODBC compliant application to query meta information on SPASQL
queries.

If the application uses the iODBC Driver Manager V3.52.7 or higher, it
can simply include the iodbcext.h header file, which contains
information on extensions of many ODBC drivers like DB2, SQL Server and
Virtuoso.

If however the application is compiled against another Driver Manager,
like the Microsoft Driver Manager on Windows, the following construction
should to be used:

``` programlisting
#ifdef WIN32
# include <windows.h>
#endif

#include <sql.h>
#include <sqlext.h>

#if defined (HAVE_IODBC)
#include <iodbcext.h>
#endif

/*
 *  Include Virtuoso ODBC extensions for SPASQL result set
 */
#if !defined (SQL_DESC_COL_DV_TYPE)

/*
 *  ODBC extensions for SQLGetDescField
 */
# define SQL_DESC_COL_DV_TYPE               1057L
# define SQL_DESC_COL_DT_DT_TYPE            1058L
# define SQL_DESC_COL_LITERAL_ATTR          1059L
# define SQL_DESC_COL_BOX_FLAGS             1060L
# define SQL_DESC_COL_LITERAL_LANG          1061L
# define SQL_DESC_COL_LITERAL_TYPE          1062L

/*
 *  Virtuoso - ODBC SQL_DESC_COL_DV_TYPE
 */
# define VIRTUOSO_DV_DATE                   129
# define VIRTUOSO_DV_DATETIME               211
# define VIRTUOSO_DV_DOUBLE_FLOAT           191
# define VIRTUOSO_DV_IRI_ID                 243
# define VIRTUOSO_DV_LONG_INT               189
# define VIRTUOSO_DV_NUMERIC                219
# define VIRTUOSO_DV_RDF                    246
# define VIRTUOSO_DV_SINGLE_FLOAT           190
# define VIRTUOSO_DV_STRING                 182
# define VIRTUOSO_DV_TIME                   210
# define VIRTUOSO_DV_TIMESTAMP              128
# define VIRTUOSO_DV_TIMESTAMP_OBJ          208

/*
 *  Virtuoso - ODBC SQL_DESC_COL_DT_DT_TYPE
 */
# define VIRTUOSO_DT_TYPE_DATETIME          1
# define VIRTUOSO_DT_TYPE_DATE              2
# define VIRTUOSO_DT_TYPE_TIME              3

/*
 *  Virtuoso - ODBC SQL_DESC_COL_BOX_FLAGS
 */
#define VIRTUOSO_BF_IRI                     0x1
#define VIRTUOSO_BF_UTF8                    0x2
#define VIRTUOSO_BF_DEFAULT_ENC             0x4

#endif
```

<div>

<div>

<div>

<div>

##### API

</div>

</div>

</div>

<div>

<div>

<div>

<div>

###### SQLGetDescField

</div>

</div>

</div>

Before the application can retrieve the column meta data using
`SQLGetDescField` , it first needs to retrieve the correct descriptor
handle attached to the statement handle:

``` programlisting
    SQLHDESC hdesc = NULL;
    SQLRETURN rc;

    rc = SQLGetStmtAttr (hstmt, SQL_ATTR_IMP_ROW_DESC, &hdesc, SQL_IS_POINTER, NULL);
    if (!SQL_SUCCEEDED(rc))
      {
        /* Handle error */
      }
```

**SQLGetDescField - SQL_DESC_COL_DV_TYPE. ** Retrieves the datatype of a
field.

``` programlisting
    SQLINTEGER dvtype;
    SQLRETURN rc;

    rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_DV_TYPE, &dvtype, SQL_IS_INTEGER, NULL);
```

``` programlisting
    #define VIRTUOSO_DV_DATE                    129
    #define VIRTUOSO_DV_DATETIME                211
    #define VIRTUOSO_DV_DOUBLE_FLOAT            191
    #define VIRTUOSO_DV_IRI_ID                  243
    #define VIRTUOSO_DV_LONG_INT                189
    #define VIRTUOSO_DV_NUMERIC                 219
    #define VIRTUOSO_DV_RDF                     246
    #define VIRTUOSO_DV_SINGLE_FLOAT            190
    #define VIRTUOSO_DV_STRING                  182
    #define VIRTUOSO_DV_TIME                    210
    #define VIRTUOSO_DV_TIMESTAMP               128
    #define VIRTUOSO_DV_TIMESTAMP_OBJ           208
```

If this call returns `SQL_SUCCESS` or `SQL_SUCCESS_WITH_INFO` , the
dvtype variable will contain the underlying Virtuoso datatype as
indicated in the following table:

**SQLGetDescField - SQL_DESC_COL_DT_DT_TYPE. ** Retrieves the date
subtype of a field.

``` programlisting
    SQLINTEGER dv_dt_type;
    SQLRETURN rc;

    rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_DT_DT_TYPE, &dv_dt_type, SQL_IS_INTEGER, NULL);
```

``` programlisting
    #define VIRTUOSO_DT_TYPE_DATETIME           1
    #define VIRTUOSO_DT_TYPE_DATE               2
    #define VIRTUOSO_DT_TYPE_TIME               3
```

If this call returns `SQL_SUCCESS` or `SQL_SUCCESS_WITH_INFO` , the
dttype variable will contain the underlying Virtuoso date subtype as
indicated in the following table:

**SQLGetDescField - SQL_DESC_COL_LITERAL_ATTR. ** Retrieves the literal
attributes associated with the field.

``` programlisting
    SQLINTEGER littype;
    SQLINTEGER lang, type;
    SQLRETURN rc;

    rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_DT_DT_TYPE, &littype, SQL_IS_INTEGER, NULL);

    lang = (littype >> 16) & 0xFFFF;
    type = littype & 0xFFFF;
```

``` programlisting
select RL_ID from DB.DBA.RDF_LANGUAGE where RL_TWOBYTE = ?
```

``` programlisting
select RDT_QNAME from DB.DBA.RDF_DATATYPE where RDT_TWOBYTE = ?
```

<div>

|                              |                                                                                                                                                                                                |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                          |
|                              | This call is deprecated in favor of using the `SQL_DESC_COL_LITERAL_LANG` and `SQL_DESC_LITERAL_TYPE` options of `SQLGetDescField` which caches these lookups to speed up describe operations. |

</div>

If this call returns `SQL_SUCCESS` or `SQL_SUCCESS_WITH_INFO` , the
littype variable will contain the encoded language and rdf type
information of the field.

These numbers are uniq to the database the client has connected to, and
correspond to information in the `DB.DBA.RDF_LANGUAGE` and
`DB.DBA.RDF_DATATYPE` tables:

and

**SQLGetDescField - SQL_DESC_COL_BOX_FLAGS. ** Retrieves the flags
associated with the field:

``` programlisting
    SQLINTEGER flags;
    SQLRETURN rc;

    rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_BOX_FLAGS, &flags, SQL_IS_INTEGER, NULL);
```

``` programlisting
    #define VIRTUOSO_BF_IRI                     0x1
    #define VIRTUOSO_BF_UTF8                    0x2
    #define VIRTUOSO_BF_DEFAULT_ENC             0x4

    for example:

    flags    description

    0        field contains a Latin1 encoded literal string
    1        field contains an IRI (always UTF-8 encoded)
    2        field contains an UTF-8 encoded literal string
    3        field contains an UTF-8 encoded IRI (should not happen)
```

If this call returns `SQL_SUCCESS` or `SQL_SUCCESS_WITH_INFO` , the
following bitmasks can be used to determine the representation of the
field:

**SQLGetDescField - SQL_DESC_COL_LITERAL_LANG. ** Retrieves the language
string for this field:

``` programlisting
    SQLCHAR langbuf[100];
    SQLINTEGER len1;
    SQLRETURN rc;

    rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_LITERAL_LANG, langbuf, sizeof (langbuf), &len1);
```

If this call returns `SQL_SUCCESS` or `SQL_SUCCESS_WITH_INFO,` , the
langbuf variable will contain the language of the field.

**SQLGetDescField - SQL_DESC_COL_LITERAL_TYPE. ** Retrieves the data
type string for this field:

``` programlisting
    SQLCHAR typebuf[100];
    SQLINTEGER len2;
    SQLRETURN rc;

    rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_LITERAL_TYPE, typebuf, sizeof (typebuf), &len2);
```

If this call returns `SQL_SUCCESS` or `SQL_SUCCESS_WITH_INFO` , the
typebuf variable will contain the rdf type of the field.

</div>

</div>

<div>

<div>

<div>

<div>

##### Evaluating Nodes

</div>

</div>

</div>

The following pseudo code evaluates the various type and flag
information retrieved using the above API calls and shows what kind of
node a field is.

``` programlisting
    switch (dvtype)
      {
      case VIRTUOSO_DV_STRING:
        {
          if (flag == 1)
            {
              if (strncmp ((char *) data, "_:", 2) == 0)
                {
                  /* node is a Turtle style named BNode */
                }
              else
                {
                  /* node is an URI string */
                }
            }
          else
            {
              if (strncmp ((char *) data, "nodeID://", 9) == 0)
                {
                  /* node is a BNode */
                }
              else
                {
                  /* node is a string literal */
                }
            }
          break;
        }

      case VIRTUOSO_DV_RDF:
        /* node is a typed literal with possible lang and type */
        break;

      case VIRTUOSO_DV_LONG_INT:
        /* node is a literal http://www.w3.org/2001/XMLSchema#integer */
        break;

      case VIRTUOSO_DV_SINGLE_FLOAT:
        /* node is a literal http://www.w3.org/2001/XMLSchema#float */
        break;

      case VIRTUOSO_DV_DOUBLE_FLOAT:
        /* node is a literal http://www.w3.org/2001/XMLSchema#double */
        break;

      case VIRTUOSO_DV_NUMERIC:
        /* node is a literal http://www.w3.org/2001/XMLSchema#decimal */
        break;

      case VIRTUOSO_DV_TIMESTAMP:
      case VIRTUOSO_DV_DATE:
      case VIRTUOSO_DV_TIME:
      case VIRTUOSO_DV_DATETIME:
        switch (dv_dt_type)
          {
          case VIRTUOSO_DT_TYPE_DATE:
            /* node is a literal http://www.w3.org/2001/XMLSchema#date */
            break;
          case VIRTUOSO_DT_TYPE_TIME:
            /* node is a literal http://www.w3.org/2001/XMLSchema#time */
            break;
          default:
            /* node is a literal http://www.w3.org/2001/XMLSchema#dateTime */
            break;
          }
        break;

      case VIRTUOSO_DV_IRI_ID:
        /*
         * node is an IRI ID
         *
         * This type is only returned in output:valmode "LONG"
         * It needs to be translated into a literal string using the
         * ID_TO_IRI() function as the value is database specific.
         */
        break;

      default:
        /* unhandled type */
        return NULL;
      }
```

</div>

<div>

<div>

<div>

<div>

##### Examples

</div>

</div>

</div>

The following program performs a SPARQL query against a Virtuoso
Database using SPASQL. Note that the connection parameters and the
sparql query are compiled into the executable.

To compile it on Linux against iODBC the following command can be used:

``` programlisting
gcc -o odbc_iri -I/usr/local/iODBC odbc_iri.c -L/usr/local/iODBC/lib -liodbc -ldl
```

It can then be called as:

``` programlisting
   ./odbc_iri
```

which will print out the first 50 triples from the database in N3
format.

Here it is the source code:

``` programlisting
    /*
     *  odbc_iri.c
     *
     *  This file is part of the OpenLink Software Virtuoso Open-Source (VOS)
     *  project.
     *
     *  Copyright (C) 1998-2024 OpenLink Software
     *
     *  This project is free software; you can redistribute it and/or modify it
     *  under the terms of the GNU General Public License as published by the
     *  Free Software Foundation; only version 2 of the License, dated June 1991.
     *
     *  This program is distributed in the hope that it will be useful, but
     *  WITHOUT ANY WARRANTY; without even the implied warranty of
     *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
     *  General Public License for more details.
     *
     *  You should have received a copy of the GNU General Public License along
     *  with this program; if not, write to the Free Software Foundation, Inc.,
     *  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
     *
     */

    #include <stdio.h>
    #include <string.h>

    #ifdef WIN32
    # include <windows.h>
    #endif

    #include <sql.h>
    #include <sqlext.h>

    #if defined (HAVE_IODBC)
    #include <iodbcext.h>
    #endif

    /*
     *  Include Virtuoso ODBC extensions for SPASQL result set
     */
    #if !defined (SQL_DESC_COL_DV_TYPE)

    /*
     *  ODBC extensions for SQLGetDescField
     */
    # define SQL_DESC_COL_DV_TYPE               1057L
    # define SQL_DESC_COL_DT_DT_TYPE            1058L
    # define SQL_DESC_COL_LITERAL_ATTR          1059L
    # define SQL_DESC_COL_BOX_FLAGS             1060L
    # define SQL_DESC_COL_LITERAL_LANG          1061L
    # define SQL_DESC_COL_LITERAL_TYPE          1062L

    /*
     *  Virtuoso - ODBC SQL_DESC_COL_DV_TYPE
     */
    # define VIRTUOSO_DV_DATE                   129
    # define VIRTUOSO_DV_DATETIME               211
    # define VIRTUOSO_DV_DOUBLE_FLOAT           191
    # define VIRTUOSO_DV_IRI_ID                 243
    # define VIRTUOSO_DV_LONG_INT               189
    # define VIRTUOSO_DV_NUMERIC                219
    # define VIRTUOSO_DV_RDF                    246
    # define VIRTUOSO_DV_SINGLE_FLOAT           190
    # define VIRTUOSO_DV_STRING                 182
    # define VIRTUOSO_DV_TIME                   210
    # define VIRTUOSO_DV_TIMESTAMP              128
    # define VIRTUOSO_DV_TIMESTAMP_OBJ          208

    /*
     *  Virtuoso - ODBC SQL_DESC_COL_DT_DT_TYPE
     */
    # define VIRTUOSO_DT_TYPE_DATETIME          1
    # define VIRTUOSO_DT_TYPE_DATE              2
    # define VIRTUOSO_DT_TYPE_TIME              3

    /*
     *  Virtuoso - ODBC SQL_DESC_COL_BOX_FLAGS
     */
    #define VIRTUOSO_BF_IRI         0x1
    #define VIRTUOSO_BF_UTF8                    0x2
    #define VIRTUOSO_BF_DEFAULT_ENC             0x4

    #endif

    SQLHANDLE henv = SQL_NULL_HANDLE;
    SQLHANDLE hdbc = SQL_NULL_HANDLE;
    SQLHANDLE hstmt = SQL_NULL_HANDLE;

    #define MAXCOLS                             25

    int
    ODBC_Errors (char *where)
    {
      unsigned char buf[250];
      unsigned char sqlstate[15];

      /*
       *  Get statement errors
       */
      while (SQLError (henv, hdbc, hstmt, sqlstate, NULL, buf, sizeof (buf), NULL) == SQL_SUCCESS)
        {
          fprintf (stdout, "STMT: %s || %s, SQLSTATE=%s\n", where, buf, sqlstate);
        }

      /*
       *  Get connection errors
       */
      while (SQLError (henv, hdbc, SQL_NULL_HSTMT, sqlstate, NULL, buf, sizeof (buf), NULL) == SQL_SUCCESS)
        {
          fprintf (stdout, "CONN:%s || %s, SQLSTATE=%s\n", where, buf, sqlstate);
        }

      /*
       *  Get environment errors
       */
      while (SQLError (henv, SQL_NULL_HDBC, SQL_NULL_HSTMT, sqlstate, NULL, buf, sizeof (buf), NULL) == SQL_SUCCESS)
        {
          fprintf (stdout, "ENV:%s || %s, SQLSTATE=%s\n", where, buf, sqlstate);
        }

      return -1;
    }

    int
    ODBC_Disconnect (void)
    {
      if (hstmt)
        SQLFreeHandle (SQL_HANDLE_STMT, hstmt);
      hstmt = SQL_NULL_HANDLE;

      if (hdbc)
        SQLDisconnect (hdbc);

      if (hdbc)
        SQLFreeHandle (SQL_HANDLE_DBC, hdbc);
      hdbc = SQL_NULL_HANDLE;

      if (henv)
        SQLFreeHandle (SQL_HANDLE_ENV, henv);
      henv = SQL_NULL_HANDLE;

      return 0;
    }

    int
    ODBC_Connect (char *dsn, char *usr, char *pwd)
    {
      SQLRETURN rc;

      /* Allocate environment handle */
      rc = SQLAllocHandle (SQL_HANDLE_ENV, SQL_NULL_HANDLE, &henv);
      if (!SQL_SUCCEEDED (rc))
        goto error;

      /* Set the ODBC version environment attribute */
      rc = SQLSetEnvAttr (henv, SQL_ATTR_ODBC_VERSION, (void *) SQL_OV_ODBC3, 0);
      if (!SQL_SUCCEEDED (rc))
        goto error;

      /* Allocate connection handle */
      rc = SQLAllocHandle (SQL_HANDLE_DBC, henv, &hdbc);
      if (!SQL_SUCCEEDED (rc))
        goto error;

      /* Connect to data source */
      rc = SQLConnect (hdbc, (SQLCHAR *) dsn, SQL_NTS, (SQLCHAR *) usr, SQL_NTS, (SQLCHAR *) pwd, SQL_NTS);
      if (!SQL_SUCCEEDED (rc))
        goto error;

      /* Allocate statement handle */
      rc = SQLAllocHandle (SQL_HANDLE_STMT, hdbc, &hstmt);
      if (!SQL_SUCCEEDED (rc))
        goto error;

      /* Successful connection */
      return 0;

    error:
      /* Failed connection */
      ODBC_Errors ("ODBC_Connect");

      ODBC_Disconnect ();

      return -1;
    }

    int
    ODBC_PrintResult ()
    {
      char fetchBuffer[1000];
      short numCols = 0;
      short colNum;
      SDWORD colIndicator;
      UDWORD totalRows;
      UDWORD totalSets;
      SQLHANDLE hdesc = SQL_NULL_HANDLE;
      SQLRETURN rc;

      totalSets = 0;
      do
        {
          /*
           *  Get the number of result columns for this cursor.
           *  If it is 0, then the statement was probably not a select
           */
          rc = SQLNumResultCols (hstmt, &numCols);
          if (!SQL_SUCCEEDED (rc))
            {
              ODBC_Errors ("SQLNumResultCols");
              goto endCursor;
            }
          if (numCols == 0)
            {
              printf ("Statement executed.\n");
              goto endCursor;
            }
          if (numCols > MAXCOLS)
            numCols = MAXCOLS;

          /*
           *  Print all the fields
           */
          totalRows = 0;
          while (1)
            {
              /*
               *  Fetch next record
               */
              rc = SQLFetch (hstmt);
              if (rc == SQL_NO_DATA_FOUND)
                break;
              if (!SQL_SUCCEEDED (rc))
                {
                  ODBC_Errors ("Fetch");
                  break;
                }

              for (colNum = 1; colNum <= numCols; colNum++)
                {
                  char buf[1000];
                  SQLINTEGER len;
                  int flag, dvtype;

                  /*
                   *  Fetch this column as character
                   */
                  rc = SQLGetData (hstmt, colNum, SQL_C_CHAR, fetchBuffer, sizeof (fetchBuffer), &colIndicator);
                  if (!SQL_SUCCEEDED (rc))
                    {
                      ODBC_Errors ("SQLGetData");
                      goto endCursor;
                    }

                  /*
                   *  Get descriptor handle for this statement
                   */
                  rc = SQLGetStmtAttr (hstmt, SQL_ATTR_IMP_ROW_DESC, &hdesc, SQL_IS_POINTER, NULL);
                  if (!SQL_SUCCEEDED (rc))
                    {
                      ODBC_Errors ("SQLGetStmtAttr");
                      goto endCursor;
                    }

                  /*
                   *  Get data type of column
                   */
                  rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_DV_TYPE, &dvtype, SQL_IS_INTEGER, NULL);
                  if (!SQL_SUCCEEDED (rc))
                    {
                      ODBC_Errors ("SQLGetDescField");
                      goto endCursor;
                    }

                  /*
                   *  Get flags
                   */
                  rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_BOX_FLAGS, &flag, SQL_IS_INTEGER, NULL);
                  if (!SQL_SUCCEEDED (rc))
                    {
                      ODBC_Errors ("SQLGetDescField");
                      goto endCursor;
                    }

                  /*
                   *  Show NULL fields as ****
                   */
                  if (colIndicator == SQL_NULL_DATA)
                    {
                      printf ("NULL");
                    }
                  else
                    {
                      if (flag & VIRTUOSO_BF_IRI)
                        printf ("<%s>", fetchBuffer); /* IRI */
                      else if (dvtype == VIRTUOSO_DV_STRING || dvtype == VIRTUOSO_DV_RDF)
                        printf ("\"%s\"", fetchBuffer); /* literal string */
                      else
                        printf ("%s", fetchBuffer); /* value */

                      if (dvtype == VIRTUOSO_DV_RDF)
                        {
                          rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_LITERAL_LANG, buf, sizeof (buf), &len);
                          if (!SQL_SUCCEEDED (rc))
                            {
                              ODBC_Errors ("SQLGetDescField");
                              goto endCursor;
                            }
                          if (len)
                            printf ("@%.*s", (int) len, buf);

                          rc = SQLGetDescField (hdesc, colNum, SQL_DESC_COL_LITERAL_TYPE, buf, sizeof (buf), &len);
                          if (!SQL_SUCCEEDED (rc))
                            {
                              ODBC_Errors ("SQLGetDescField");
                              goto endCursor;
                            }
                          if (len)
                            printf ("^^<%.*s>", (int) len, buf);
                        }

                      if (colNum < numCols)
                        putchar (' ');
                    }
                }
              printf (" .\n");
              totalRows++;
            }

          printf ("\n\nStatement returned %lu rows.\n", totalRows);
          totalSets++;
        }
      while (SQLMoreResults (hstmt) == SQL_SUCCESS);

    endCursor:
      SQLCloseCursor (hstmt);

      return 0;
    }

    int
    ODBC_Execute (char *qr)
    {
      int rc;
      SQLCHAR *Statement = (SQLCHAR *) qr;

      if ((rc = SQLExecDirect (hstmt, Statement, SQL_NTS)) != SQL_SUCCESS)
        {
          ODBC_Errors ("ODBC_Execute");
          if (rc != SQL_SUCCESS_WITH_INFO)
            return -1;
        }
      return 0;
    }

    char dsn[] = "Local Virtuoso";
    char uid[] = "dba";
    char pwd[] = "dba";
    char txt[] = "sparql SELECT * WHERE {?s ?p ?o} LIMIT 50";

    int
    main (int argc, char *argv[])
    {
      if (ODBC_Connect (dsn, uid, pwd))
        exit (1);

      if (ODBC_Execute (txt) == 0)
        ODBC_PrintResult ();

      ODBC_Disconnect ();

      exit (0);
    }
```

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><div
class="itemizedlist">
<ul>
<li><p>RDF Data Access and Data Management</p></li>
</ul>
</div></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

</div>
