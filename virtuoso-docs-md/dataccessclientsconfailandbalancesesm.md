<div id="dataccessclientsconfailandbalancesesm" class="section">

<div class="titlepage">

<div>

<div>

### 7.8.5. Sesame

</div>

</div>

</div>

<div id="dataccessclientsconfailandbalancesesmf" class="section">

<div class="titlepage">

<div>

<div>

#### Failover Connect String format

</div>

</div>

</div>

``` programlisting
VirtuosoRepository("server1:port1,server2:port2,server3", "uid", "pwd");
```

</div>

<div id="dataccessclientsconfailandbalancesesmr" class="section">

<div class="titlepage">

<div>

<div>

#### Round Robin Connect String format

</div>

</div>

</div>

``` programlisting
VirtuosoRepository("server1:port1,server2:port2,server3", "uid", "pwd");
((VirtuosoRepository)repository).setRoundrobin(true);
```

</div>

<div id="dataccessclientsconfailandbalancesesms" class="section">

<div class="titlepage">

<div>

<div>

#### Sample program

</div>

</div>

</div>

``` programlisting
/*
 *  $Id$
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
 */

import java.sql.*;
import java.util.*;
import java.lang.*;

import org.openrdf.model.*;
import org.openrdf.query.*;
import org.openrdf.repository.*;
import org.openrdf.rio.*;
import virtuoso.jdbc4.*;

import virtuoso.sesame2.driver.*;

public class TestSesame2 {

  public static void main(String[] args) {

      Repository repository = new
    VirtuosoRepository("localhost:1111,localhost:1311,localhost:1312,localhost:1313", "dba", "dba");
      ((VirtuosoRepository)repository).setRoundrobin(true);

      RepositoryConnection con = null;
      Random rnd = new Random();
      for (int i = 0; i < 1000000; ) {
      try {
          if (null == con) {
          System.out.println("New connection");
          con = repository.getConnection();
          }

          TupleQuery query = con.prepareTupleQuery(
              QueryLanguage.SPARQL, "INSERT INTO <test_g> { <sub" + i + "> <pred> <obj" + i+ "> . " +
              " <r" + Math.abs (rnd.nextInt()) + "> <rndpred> <r" + Math.abs (rnd.nextInt ()) + "> . }");
          TupleQueryResult queryResult = query.evaluate();
          /*long count = 0;
          while (queryResult.hasNext())
          {
          queryResult.next();
          count++;
          if (count % 1000 == 0)
          {
              System.out.println("Passed " + count + " results...");
          }
          }
          */
          queryResult.close();
          i++;
          try { Thread.sleep(100); } catch (InterruptedException ie) { }

      } catch (Exception e) {
          String state = "";
          if (e.getCause() instanceof SQLException) {
          state = ((SQLException)e.getCause()).getSQLState();
          }
          System.out.println("ERROR:" + state + " " + e.getCause());
          try { Thread.sleep(2000); } catch (InterruptedException ie) { }
          System.out.println("ERROR:" + e.toString ());
          if (state == "")
            e.printStackTrace();
          try {
          if (con != null /*&& (state == "08U01" || state == "S2801")*/) {
              System.out.println("Closing Connection.");
              con.close();
              con = null;
          }
          } catch (RepositoryException re) {
          System.out.println("Test Failed.");
          re.printStackTrace();
          System.exit (1);
          }
      } finally {
      }
      }
  }
}
```

</div>

</div>
