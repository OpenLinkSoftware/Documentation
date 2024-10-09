<div>

<div>

<div>

<div>

### 1.5.26. How can I insert binary data to Virtuoso RDF storage in plain queries and with parameter binding via ADO.NET calls?

</div>

</div>

</div>

The following example shows different methods for insert binary data to
Virtuoso RDF storage in plain queries and with parameter binding via
ADO.NET calls:

``` programlisting
# Test_Bin.cs

using System;
using System.Runtime.InteropServices;
using System.Text;
using System.Data;
using OpenLink.Data.Virtuoso;

#if ODBC_CLIENT
namespace OpenLink.Data.VirtuosoOdbcClient
#elif CLIENT
namespace OpenLink.Data.VirtuosoClient
#else
namespace OpenLink.Data.VirtuosoTest
#endif
{
    class Test_Bin
    {
        [STAThread]
        static void Main(string[] args)
        {
            IDataReader myread = null;
            IDbConnection c;

            c = new VirtuosoConnection("HOST=localhost:1111;UID=dba;PWD=dba;");

            IDbCommand cmd = c.CreateCommand();
            int ros;

            try
            {
                c.Open();

                cmd.CommandText = "sparql clear graph <ado.bin>";
                cmd.ExecuteNonQuery();

//insert binary as base64Binary
                cmd.CommandText = "sparql insert into graph <ado.bin> { <res1> <attr> \"GpM7\"^^<http://www.w3.org/2001/XMLSchema#base64Binary> }";
                cmd.ExecuteNonQuery();

//insert binary as hexBinary
                cmd.CommandText = "sparql insert into graph <ado.bin> { <res2> <attr> \"0FB7\"^^<http://www.w3.org/2001/XMLSchema#hexBinary> }";
                cmd.ExecuteNonQuery();

//prepare for insert with parameter binding
                cmd.CommandText = "sparql define output:format '_JAVA_' insert into graph <ado.bin> { `iri($?)` <attr> `bif:__rdf_long_from_batch_params($?,$?,$?)` }";

//bind parameters for insert binary as base64Binary
                IDbDataParameter param = cmd.CreateParameter();
                param.ParameterName = "p1";
                param.DbType = DbType.AnsiString;
                param.Value = "res3";
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p2";
                param.DbType = DbType.Int32;
                param.Value = 4;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p3";
                param.DbType = DbType.AnsiString;
                param.Value = "GpM7";
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p4";
                param.DbType = DbType.AnsiString;
                param.Value = "http://www.w3.org/2001/XMLSchema#base64Binary";
                cmd.Parameters.Add(param);

                cmd.ExecuteNonQuery();

                cmd.Parameters.Clear();

//bind parameters for insert binary as hexBinary
                param = cmd.CreateParameter();
                param.ParameterName = "p1";
                param.DbType = DbType.AnsiString;
                param.Value = "res4";
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p2";
                param.DbType = DbType.Int32;
                param.Value = 4;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p3";
                param.DbType = DbType.AnsiString;
                param.Value = "0FB7";
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p4";
                param.DbType = DbType.AnsiString;
                param.Value = "http://www.w3.org/2001/XMLSchema#hexBinary";
                cmd.Parameters.Add(param);

                cmd.ExecuteNonQuery();

                cmd.Parameters.Clear();

//bind parameters for insert binary as byte[]
                param = cmd.CreateParameter();
                param.ParameterName = "p1";
                param.DbType = DbType.AnsiString;
                param.Value = "res5";
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p2";
                param.DbType = DbType.Int32;
                param.Value = 3;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p3";
                param.DbType = DbType.Binary;
                byte[] bin_val = {0x01, 0x02, 0x03, 0x04, 0x05};
                param.Value = bin_val;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p4";
                param.DbType = DbType.AnsiString;
                param.Value = System.DBNull.Value;
                cmd.Parameters.Add(param);

                cmd.ExecuteNonQuery();

                cmd.Parameters.Clear();

//execute select and check the results
                cmd.CommandText = "sparql SELECT ?s ?o FROM <ado.bin> WHERE {?s ?p ?o}"; ;
                myread = cmd.ExecuteReader();
                int r = 0;

                while (myread.Read())
                {
                    Console.WriteLine("=== ROW === "+r);
                    for (int i = 0; i < myread.FieldCount; i++)
                    {
                        string s;
                        if (myread.IsDBNull(i))
                            Console.Write("N/A|\n");
                        else
                        {
                            object o = myread.GetValue(i);
                            Type t = myread.GetFieldType(i);

                            s = myread.GetString(i);
                            Console.Write(s + "[");
                            if (o is SqlExtendedString)
                            {
                                SqlExtendedString se = (SqlExtendedString)o;
                                Console.Write("IriType=" + se.IriType + ";StrType=" + se.StrType + ";Value=" + se.ToString());
                                Console.Write(";ObjectType=" + o.GetType() + "]|\n");
                            }
                            else if (o is SqlRdfBox)
                            {
                                SqlRdfBox se = (SqlRdfBox)o;
                                Console.Write("Lang=" + se.StrLang + ";Type=" + se.StrType + ";Value=" + se.Value);
                                Console.Write(";ObjectType=" + o.GetType() + "]|\n");
                                object v = se.Value;
                                if (v is System.Byte[])
                                {
                                    byte[] vb = (byte[])v;
                                    for (int z = 0; z < vb.Length; z++)
                                    {
                                        Console.WriteLine(""+z+"="+vb[z]);
                                    }
                                }
                            }
                            else
                                Console.Write(o.GetType() + "]|\n");
                        }
                    }
                    r++;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("{0} Exception caught.", e);
            }
            finally
            {
                //        if (myread != null)
                //          myread.Close();

                if (c.State == ConnectionState.Open)
                    c.Close();

            }

        }
    }
}
```

Output log for example is in the log.txt:

``` programlisting
# log.txt
=== ROW === 0
res1[IriType=IRI;StrType=IRI;Value=res1;ObjectType=OpenLink.Data.Virtuoso.SqlExtendedString]|
GpM7[Lang=;Type=http://www.w3.org/2001/XMLSchema#base64Binary;Value=GpM7;ObjectType=OpenLink.Data.Virtuoso.SqlRdfBox]|
=== ROW === 1
res2[IriType=IRI;StrType=IRI;Value=res2;ObjectType=OpenLink.Data.Virtuoso.SqlExtendedString]|
0FB7[Lang=;Type=http://www.w3.org/2001/XMLSchema#hexBinary;Value=0FB7;ObjectType=OpenLink.Data.Virtuoso.SqlRdfBox]|
=== ROW === 2
res3[IriType=IRI;StrType=IRI;Value=res3;ObjectType=OpenLink.Data.Virtuoso.SqlExtendedString]|
GpM7[Lang=;Type=http://www.w3.org/2001/XMLSchema#base64Binary;Value=GpM7;ObjectType=OpenLink.Data.Virtuoso.SqlRdfBox]|
=== ROW === 3
res4[IriType=IRI;StrType=IRI;Value=res4;ObjectType=OpenLink.Data.Virtuoso.SqlExtendedString]|
0FB7[Lang=;Type=http://www.w3.org/2001/XMLSchema#hexBinary;Value=0FB7;ObjectType=OpenLink.Data.Virtuoso.SqlRdfBox]|
=== ROW === 4
res5[IriType=IRI;StrType=IRI;Value=res5;ObjectType=OpenLink.Data.Virtuoso.SqlExtendedString]|
0102030405[System.Byte[]]|
```

</div>
