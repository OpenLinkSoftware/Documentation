<div id="instrdfvs" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.27. How can I insert RDF data from Visual Studio to Virtuoso?

</div>

</div>

</div>

The following example shows how to insert RDF Data from Visual Studio to
Virtuoso:

``` programlisting
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
    class Test_Insert
    {
        [STAThread]
        static void Main(string[] args)
        {
            IDataReader myread = null;
            IDbConnection c;

            c = new VirtuosoConnection("HOST=localhost:1111;UID=dba;PWD=dba;Charset=UTF-8");

            IDbCommand cmd = c.CreateCommand();
            int ros;

            try
            {
                c.Open();

                cmd.CommandText = "sparql clear graph <ado.net>";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P01> \"131\"^^<http://www.w3.org/2001/XMLSchema#short> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P02> \"1234\"^^<http://www.w3.org/2001/XMLSchema#integer> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P03> \"12345.12\"^^<http://www.w3.org/2001/XMLSchema#float> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P04> \"123456.12\"^^<http://www.w3.org/2001/XMLSchema#double> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P05> \"123456.12\"^^<http://www.w3.org/2001/XMLSchema#decimal> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P06> \"01020304\"^^<http://www.w3.org/2001/XMLSchema#hexBinary> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P07> \"01.20.1980T04:51:13\"^^<http://www.w3.org/2001/XMLSchema#dateTime> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P08> \"01.20.1980\"^^<http://www.w3.org/2001/XMLSchema#date> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P09> \"01:20:19\"^^<http://www.w3.org/2001/XMLSchema#time> }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql insert into graph <ado.net> { <a> <P10> \"test\" }";
                cmd.ExecuteNonQuery();

                cmd.CommandText = "sparql define output:format '_JAVA_' insert into graph <ado.net> { <b> `iri($?)` `bif:__rdf_long_from_batch_params($?,$?,$?)` }";

//add Object URI
                add_triple(cmd, "S01", 1, "test1", null);

//add Object BNode
                add_triple(cmd, "S02", 1, "_:test2", null);

//add Literal
                add_triple(cmd, "S03", 3, "test3", null);

//add Literal with Datatype
                add_triple(cmd, "S04", 4, "1234", "http://www.w3.org/2001/XMLSchema#integer");

//add Literal with Lang
                add_triple(cmd, "S05", 5, "test5", "en");

                add_triple(cmd, "S06", 3, (short)123, null);
                add_triple(cmd, "S07", 3, 1234, null);
                add_triple(cmd, "S08", 3, (float)12345.12, null);
                add_triple(cmd, "S09", 3, 123456.12, null);
                add_triple(cmd, "S10", 3, new DateTime(2001, 02, 23, 13, 44, 51, 234), null);
                add_triple(cmd, "S11", 3, new DateTime(2001, 02, 24), null);
                add_triple(cmd, "S12", 3, new TimeSpan(19, 41, 23), null);

                add_triple(cmd, "S13", 4, "GpM7", "http://www.w3.org/2001/XMLSchema#base64Binary");
                add_triple(cmd, "S14", 4, "0FB7", "http://www.w3.org/2001/XMLSchema#hexBinary");
                byte[] bin_val = { 0x01, 0x02, 0x03, 0x04, 0x05 };
                add_triple(cmd, "S15", 3, bin_val, null);

            }
            catch (Exception e)
            {
                Console.WriteLine("{0} Exception caught.", e);
            }
            finally
            {

                if (c.State == ConnectionState.Open)
                    c.Close();

            }

        }

        static void add_triple(IDbCommand cmd, string sub, int ptype, object val, string val_add)
        {
                cmd.Parameters.Clear();

                IDbDataParameter param = cmd.CreateParameter();
                param.ParameterName = "p1";
                param.DbType = DbType.AnsiString;
                param.Value = sub;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p2";
                param.DbType = DbType.Int32;
                param.Value = ptype;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p3";
                if (val != null && val.GetType() == typeof (System.String))
                    param.DbType = DbType.AnsiString;
                param.Value = val;
                cmd.Parameters.Add(param);

                param = cmd.CreateParameter();
                param.ParameterName = "p4";
                param.DbType = DbType.AnsiString;
                param.Value = val_add;
                cmd.Parameters.Add(param);

                cmd.ExecuteNonQuery();
        }

    }
}
```

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                    |
|:--------------------------:|:-------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                          |
|                            | <a href="rdfinsertmethods.html" class="link"                       
                              title="16.9. RDF Insert Methods in Virtuoso">RDF Insert Methods in  
                              Virtuoso</a>                                                        |

</div>

</div>
