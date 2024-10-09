<div>

<div>

<div>

<div>

### 16.17.12. Loading RDF

</div>

</div>

</div>

There are many functions for loading RDF text, in RDF/XML and Turtle.

For loading RDF/XML, the best way is to split the data to be loaded into
multiple streams and load these in parallel using
<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">RDF_LOAD_RDFXML ()</code></a> . To avoid running out of
rollback space for large files and in order to have multiple concurrent
loads not interfere with each other, the row autocommit mode should be
enabled.

For example,

``` programlisting
log_enable (2);
-- switch row-by-row autocommit on and logging off for this session
DB.DBA.RDF_LOAD_RDFXML (file_to_string_output ('file.xml'), 'base_uri', 'target_graph');
-- more files here ...
checkpoint;
```

Loading a file with text like the above with isql will load the data.
Since the transaction logging is off, make a manual checkpoint at the
end to ensure that data is persisted upon server restart since there is
no roll forward log.

If large amounts of data are to be loaded, run multiple such streams in
parallel. One may have for example 6 streams for 4 cores. This means
that if up to two threads wait for disk, there is still work for all
cores.

Having substantially more threads than processors or disks is not
particularly useful.

There exist multithreaded load functions which will load one file on
multiple threads:
<a href="rdfapi.html#rdfapidataimportttlpmt" class="link"
title="Using TTLP_MT">the DB.DBA.TTLP_MT() function</a> and
<a href="rdfapi.html#rdfapidataimportxmlttlpmt" class="link"
title="Using RDF_LOAD_RDFXML_MT">the DB.DBA.RDF_LOAD_RDFXML_MT()
function</a> . Experience shows that loading multiple files on one
thread per file is better.

For loading Turtle, some platforms may have a non-reentrant Turtle
parser. This means that only one load may run at a time. One can try
this by calling <a href="rdfapi.html#rdfapidataimport" class="link"
title="Data Import"><code class="function">ttlp ()</code></a> from two
sessions at the same time. If these do not execute concurrently, then
the best way may be to try
<a href="rdfapi.html#rdfapidataimport" class="link"
title="Data Import"><code class="function">ttlp_mt</code></a> and see if
this runs faster than a single threaded ttlp call.

<div>

<div>

<div>

<div>

#### RDF Bulk Load Utility

</div>

</div>

</div>

The RDF loader utility facilitates parallel bulk loading of multiple RDF
files. The utility maintains a database table containing a list of files
to load and the status of each file, whether not loaded, loaded or
loaded with error. The table also records load start and end times.

One must have a dba group login for using this and the virtuoso.ini file
access control list must be set up so that the Virtuoso server can open
the files to load.

Files are added to the load list with the function
<a href="fn_ld_dir.html" class="link" title="ld_dir"><code
class="function">ld_dir</code></a> :

``` programlisting
ld_dir (in dir_path varchar, in file_mask varchar, in target_graph varchar);
```

The file mask is a SQL like pattern to match against the files in the
directory. For example:

``` programlisting
ld_dir ('/data8/2848260', '%.gz', 'http://bsbm.org');
```

would load the RDF in all files ending in .gz from the directory given
as first parameter. The RDF would be loaded in the http://bsbm.org
graph.

If NULL is given for the graph, each file may go to a different graph
specified in a separate file with the name of the RDF source file plus
the extension .graph.

A .graph file contains the target graph URI without any other content or
whitespace.

The layout of the load_list table is as follows:

``` programlisting
create table DB.DBA.LOAD_LIST (
  ll_file varchar,
  ll_graph varchar,
  ll_state int default 0, -- 0 not started, 1 going, 2 done
  ll_started datetime,
  ll_done datetime,
  ll_host int,
  ll_work_time integer,
  ll_error varchar,
  primary key (ll_file))
alter index LOAD_LIST on DB.DBA.LOAD_LIST partition (ll_file varchar)
create index LL_STATE on DB.DBA.LOAD_LIST (ll_state, ll_file, ll_graph) partition (ll_state int)
;
```

This table may be checked at any time during bulk load for the progress
of the load. ll_state is 1 for files being loaded and 2 for files whose
loading has finished. ll_error is NULL if the load finished without
error, else it is the error message.

In order to load data from the files in load_list, run as dba:

``` programlisting
DB.DBA.rdf_loader_run ();
```

One may run several of these commands on parallel sessions for better
throughput.

On a cluster one can do:

``` programlisting
cl_exec ('rdf_ld_srv ()');
```

This will start one <a href="fn_rdf_loader_run.html" class="link"
title="rdf_loader_run">rdf_loader_run()</a> on each node of the cluster.
Note that in such a setting all the server processes must see the same
files at the same path.

On an isql session one may execute rdf_loader_run () & several times,
forking a new isql for each such command, similarly to what a Unix shell
does.

Because this load is non-transactional and non-logged, one must do an
explicit checkpoint after the load to guarantee a persistent state.

On a single server do:

``` programlisting
checkpoint;
```

On a cluster do:

``` programlisting
cl_exec ('checkpoint');
```

The server(s) are online and can process queries and transactions while
a bulk load is in progress. Periodic checkpoints may occur during the
load but the state is guaranteed to be consistent only after running a
checkpoint after all the bulk load threads have finished.

A bulk load should not be forcibly stopped. To make a controlled stop,
run:

``` programlisting
rdf_load_stop ();
```

This will cause the files being loaded at the time to finish load but no
new loads will start until explicitly started with
<a href="fn_rdf_loader_run.html" class="link"
title="rdf_loader_run">rdf_loader_run()</a> .

Specially note that on a cluster the database will be inconsistent if
one server process does a checkpoint and another does not. Thus
guaranteeing a checkpoint on all is necessary. This is easily done with
an isql script with the following content:

``` programlisting
ld_dir ('/data8/2848260', '%.gz', 'http://bsbm.org');

-- Record CPU time
select getrusage ()[0] + getrusage ()[1];

rdf_loader_run () &
rdf_loader_run () &
rdf_loader_run () &
rdf_loader_run () &
rdf_loader_run () &
rdf_loader_run () &
rdf_loader_run () &
rdf_loader_run () &

wait_for_children;
checkpoint;

-- Record CPU time
select getrusage ()[0] + getrusage ()[1];
```

For a cluster, the equivalent is:

``` programlisting
ld_dir ('/data8/2848260', '%.gz', 'http://bsbm.org');

cl_exec ('DB.DBA.RDF_LD_SRV (2)');

cl_exec ('checkpoint');
```

<a href="fn_rdf_loader_run.html" class="link"
title="rdf_loader_run">rdf_loader_run()</a> recognizes several file
types, including .ttl, .nt, .xml, .rdf, .owl, .nq, .n4, and others.
Internally the function uses
<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.ttlp()</code></a> or
<a href="fn_rdf_load_rdfxml.html" class="link"
title="DB.DBA.RDF_LOAD_RDFXML"><code
class="function">DB.DBA.rdf_load_rdfxml</code></a> , as appropriate.

See <a href="rdfperfloading.html#rdfperfloadinglod" class="link"
title="Loading LOD RDF data">the next section</a> for detailed
description of the <a href="fn_rdf_loader_run.html" class="link"
title="rdf_loader_run">rdf_loader_run()</a> function.

</div>

<div>

<div>

<div>

<div>

#### Loading LOD RDF data

</div>

</div>

</div>

To load the rdf data to LOD instance, perform the following steps:

<div>

- Configure & start cluster

- Execute the file:

  ``` programlisting
  --
  --  $Id$
  --
  --  Alternate RDF index scheme for cases where G unspecified
  --
  --  This file is part of the OpenLink Software Virtuoso Open-Source (VOS)
  --  project.
  --
  --  Copyright (C) 1998-2024 OpenLink Software
  --
  --  This project is free software; you can redistribute it and/or modify it
  --  under the terms of the GNU General Public License as published by the
  --  Free Software Foundation; only version 2 of the License, dated June 1991.
  --
  --  This program is distributed in the hope that it will be useful, but
  --  WITHOUT ANY WARRANTY; without even the implied warranty of
  --  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  --  General Public License for more details.
  --
  --  You should have received a copy of the GNU General Public License along
  --  with this program; if not, write to the Free Software Foundation, Inc.,
  --  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
  --
  --

  drop index RDF_QUAD_OGPS;
  checkpoint;
  create table R2 (G iri_id_8, S iri_id_8, P iri_id_8, O any, primary key (S, P, O, G))
  alter index R2 on R2 partition (S int (0hexffff00));

  log_enable (2);
  insert into R2 (G, S, P, O) SELECT G, S, P, O from rdf_quad;

  drop table RDF_QUAD;
  alter table r2 rename RDF_QUAD;
  checkpoint;
  create bitmap index RDF_QUAD_OPGS on RDF_QUAD (O, P, G, S) partition (O varchar (-1, 0hexffff));
  create bitmap index RDF_QUAD_POGS on RDF_QUAD (P, O, G, S) partition (O varchar (-1, 0hexffff));
  create bitmap index RDF_QUAD_GPOS on RDF_QUAD (G, P, O, S) partition (O varchar (-1, 0hexffff));

  checkpoint;
  ```

- Execute:

  ``` programlisting
  SQL>cl_exec ('checkpoint);
  ```

- Execute ld_dir ('directory' , 'mask' , 'graph'), for ex:

  ``` programlisting
  SQL>ld_dir ('/dbs/data', '*.gz', 'http://dbpedia.org');
  ```

- Execute on every node with separate client:

  ``` programlisting
  SQL>rdf_loader_run();
  ```

</div>

</div>

<div>

<div>

<div>

<div>

#### Loading UniProt RDF data

</div>

</div>

</div>

To load the uniprot data, create a function for example such as:

``` programlisting
create function DB.DBA.UNIPROT_LOAD (in log_mode integer := 1)
{
  DB.DBA.RDF_LOAD_RDFXML_MT (file_to_string_output('filename1'),'http://base_uri_1', 'destination_graph_1', log_mode, 3);
  DB.DBA.RDF_LOAD_RDFXML_MT (file_to_string_output('filename2'),'http://base_uri_2', 'destination_graph_2', log_mode, 3);
  ...
  DB.DBA.RDF_LOAD_RDFXML_MT (file_to_string_output('filename9'),'http://base_uri_9', 'destination_graph_9', log_mode, 3);
}
```

If you are starting from blank database and you can drop it and
re-create in case of error signaled, use it this way:

``` programlisting
checkpoint;
checkpoint_interval(6000);
DB.DBA.UNIPROT_LOAD (0),
checkpoint;
checkpoint_interval(60);
```

If the database contains important data already and there's no way to
stop it and backup before the load then use:

``` programlisting
checkpoint;
checkpoint_interval(6000);
DB.DBA.UNIPROT_LOAD (),
checkpoint;
checkpoint_interval(60);
```

Note that the 'number of threads' parameter of DB.DBA.RDF_LOAD_RDFXML()
mentions threads used to process data from file, an extra thread will
read the text and parse it, so for 4 CPU cores there's no need in
parameter value greater than 3. Three processing threads per one parsing
tread is usually good ratio because parsing is usually three times
faster than the rest of loading so CPU loading is well balanced. If for
example you are using 2 x Quad Xeon, then you can choose between 8
single-threaded parsers or 2 parsers with 3 processing threads each.
With 4 cores you may simply load file after file with 3 processing
threads. The most important performance tuning is to set the
\[Parameters\] section of virtuoso configuration file:

``` programlisting
NumberOfBuffers = 1000000
MaxDirtyBuffers = 800000
MaxCheckpointRemap = 1000000
DefaultIsolation = 2
```

Note: these numbers are reasonable for 16 GB RAM Linux box. Usually when
there are no such massive operations as loading huge database, you can
set up the values as:

``` programlisting
NumberOfBuffers = 1500000
MaxDirtyBuffers = 1200000
MaxCheckpointRemap = 1500000
DefaultIsolation = 2
```

<div>

|                            |                                                                                                  |
|:--------------------------:|:-------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                        |
|                            | <a                                                                                               
                              href="http://www.openlinksw.com/dataspace/dav/wiki/Main/VirtConfigScale#Configuration%20Options"  
                              class="ulink" target="_top">Virtuoso Configuration Options</a>                                    |

</div>

<div>

|                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|:--------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | Tip:                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|                            | Thus after loading all data you may wish to shutdown, tweak and start server again. If you have ext2fs or ext3fs filesystem, then it's better to have enough free space on disk not to make it more than 80% full. When it's almost full it may allocate database file badly, resulting in measurable loss of disk access speed. That is not Virtuoso-specific fact, but a common hint for all database-like applications with random access to big files. |

</div>

Here is an example of using awk file for splitting big file smaller
ones:

``` programlisting
BEGIN {
    file_part=1000
    e_line = "</rdf:RDF>"
        cur=0
        cur_o=0
    file=0
    part=file_part
      }
    {
        res_file_i="res/"FILENAME
        line=$0
        s=$1
        res_file=res_file_i"_"file".rdf"

        if (index (s, "</rdf:Description>") == 1)
        {
        cur=cur+1
        part=part-1
        }

        if (part > 0)
        {
            print line >> res_file
        }

        if (part == 0)
        {
#       print "===================== " cur
            print line >> res_file
        print e_line >> res_file
        close (res_file)
        file=file+1
        part=file_part
            res_file=res_file_i"_"file".rdf"
        system ("cp beg.txt " res_file)
        }
        }
END { }
```

</div>

<div>

<div>

<div>

<div>

#### Loading DBPedia RDF data

</div>

</div>

</div>

You can use the following script as an example for loading DBPedia RDF
data in Virtuoso:

``` programlisting
#!/bin/sh

PORT=$1
USER=$2
PASS=$3
file=$4
g=$5
LOGF=`basename $0`.log

if [ -z "$PORT" -o -z "$USER" -o -z "$PASS" -o -z "$file" -o -z "$g" ]
then
  echo "Usage: `basename $0` [DSN] [user] [password] [ttl-file] [graph-iri]"
  exit
fi

if [ ! -f "$file" -a ! -d "$file" ]
then
    echo "$file does not exists"
    exit 1
fi

mkdir READY 2>/dev/null
rm -f $LOGF $LOGF.*

echo "Starting..."
echo "Logging into: $LOGF"

DOSQL ()
{
    isql $PORT $USER $PASS verbose=on banner=off prompt=off echo=ON errors=stdout exec="$1" > $LOGF
}

LOAD_FILE ()
{
    f=$1
    g=$2
    echo "Loading $f (`cat $f | wc -l` lines) `date \"+%H:%M:%S\"`" | tee -a $LOG

    DOSQL "ttlp_mt (file_to_string_output ('$f'), '', '$g', 17); checkpoint;" > $LOGF

    if [ $? != 0 ]
    then
    echo "An error occurred, please check $LOGF"
    exit 1
    fi

    line_no=`grep Error $LOGF | awk '{ match ($0, /line [0-9]+/, x) ; match (x[0], /[0-9]+/, y); print y[0] }'`
    newf=$f.part
    inx=1
    while [ ! -z "$line_no" ]
    do
    cat $f |  awk "BEGIN { i = 1 } { if (i==$line_no) { print \$0; exit; } i = i + 1 }"  >> bad.nt
    line_no=`expr $line_no + 1`
    echo "Retrying from line $line_no"
    echo "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> ." > tmp.nt
    cat $f |  awk "BEGIN { i = 1 } { if (i>=$line_no) print \$0; i = i + 1 }"  >> tmp.nt
    mv tmp.nt $newf
    f=$newf
    mv $LOGF $LOGF.$inx
    DOSQL "ttlp_mt (file_to_string_output ('$f'), '', '$g', 17); checkpoint;" > $LOGF

    if [ $? != 0 ]
    then
        echo "An error occurred, please check $LOGF"
        exit 1
    fi
    line_no=`grep Error $LOGF | awk '{ match ($0, /line [0-9]+/, x) ; match (x[0], /[0-9]+/, y); print y[0] }'`
    inx=`expr $inx + 1`
    done
    rm -f $newf 2>/dev/null
    echo "Loaded.  "
}

echo "======================================="
echo "Loading started."
echo "======================================="

if [ -f "$file" ]
then
    LOAD_FILE $file $g
    mv $file READY 2>> /dev/null
elif [ -d "$file" ]
then
    for ff in `find $file -name '*.nt'`
    do
    LOAD_FILE $ff $g
    mv $ff READY 2>> /dev/null
    done
else
   echo "The input is not file or directory"
fi
echo "======================================="
echo "Final checkpoint."
DOSQL "checkpoint;" > temp.res
echo "======================================="
echo "Check bad.nt file for skipped triples."
echo "======================================="

exit 0
```

</div>

<div>

<div>

<div>

<div>

#### Loading Bio2RDF data

</div>

</div>

</div>

The shell script below was used to import files in n3 notation into
OpenLink Virtuoso RDF storage.

When an syntax error it will cut content from next line and will retry.
This was used on ubuntu linux to import bio2rdf and freebase dumps.

Note it uses gawk, so it must be available on system where is tried.
Also for recovery additional disk space is needed at max the size of
original file.

``` programlisting
#!/bin/bash

PASS=$1
f=$2
g=$3

# Usage
if [ -z "$PASS" -o -z "$f" -o -z "$g" ]
then
  echo "Usage: $0 [password] [ttl-file] [graph-iri]"
  exit
fi

if [ ! -f "$f" ]
then
    echo "$f does not exists"
    exit
fi

# Your port here
PORT=1111  #`inifile -f dbpedia.ini -s Parameters -k ServerPort`
if test -z "$PORT"
then
    echo "Cannot find INI and inifile command"
    exit
fi

# Initial run
isql $PORT dba $PASS verbose=on banner=off prompt=off echo=ON errors=stdout exec="ttlp_mt (file_to_string_output ('$f'), '', '$g'); checkpoint;" > $0.log

# If disconnect etc.
if [ $? != 0 ]
then
    echo "An error occurred, please check $0.log"
    exit
fi

# Check for error
line_no=`grep Error $0.log | awk '{ match ($0, /line [0-9]+/, x) ; match (x[0], /[0-9]+/, y); print y[0] }'`
newf=$f.part
inx=1

# Error recovery
while [ ! -z "$line_no" ]
do
    cat $f |  awk "BEGIN { i = 0 } { if (i==$line_no) { print \$0; exit; } i = i + 1 }"  >> bad.nt
    line_no=`expr $line_no + 1`
    echo "Retrying from line $line_no"
    cat $f |  awk "BEGIN { i = 0 } { if (i>=$line_no) print \$0; i = i + 1 }"  > tmp.nt
    mv tmp.nt $newf
    f=$newf
    mv $0.log $0.log.$inx
    # Run the recovered part
    isql $PORT dba $PASS verbose=on banner=off prompt=off echo=ON errors=stdout exec="ttlp_mt (file_to_string_output ('$f'), '', '$g'); checkpoint;" > $0.log

    if [ $? != 0 ]
    then
    echo "An error occurred, please check $0.log"
    exit
    fi
   line_no=`grep Error $0.log | awk '{ match ($0, /line [0-9]+/, x) ; match (x[0], /[0-9]+/, y); print y[0] }'`
   inx=`expr $inx + 1`
done
```

</div>

</div>
