<div id="jdbcdriverhibernatesetupandtestingexmp" class="section">

<div class="titlepage">

<div>

<div>

### 7.4.7. Examples

</div>

</div>

</div>

To assist you further during your utilization or evaluation of
OpenLink's Drivers for JDBC a number of demonstration JDBC compliant
Applets and Applications are bundled with your OpenLink Driver for JDBC
installation,
<a href="http://docs.openlinksw.com/st/JDBCDemos.html" class="ulink"
target="_top">our demo programs</a> are provided in both binary and
source code format for your free use.

<div id="jdbcdriverhibernatesetupandtestingexmp1" class="section">

<div class="titlepage">

<div>

<div>

#### Example 1

</div>

</div>

</div>

This sample performs a simple insert and retrieval of data against the
Virtuoso database.

<div class="orderedlist">

1.  Open your command shell and change to the "ex1" directory

2.  The following required files need to be placed in the ./lib
    directory:

    ``` programlisting
    antlr-2.7.6.jar
    commons-collections-3.1.jar
    commons-logging-1.0.4.jar
    dom4j-1.6.1.jar
    hibernate3.jar
    javassist-3.4.GA.jar
    jta-1.1.jar
    lib.lst
    log4j-1.2.15.jar
    slf4j-api-1.5.10.jar
    slf4j-api-1.5.2.jar
    slf4j-jcl-1.5.10.jar
    virtjdbc4.jar
    virt_dialect.jar
    ```

3.  Run the example with "ant run" and read the log output on the
    console:

    ``` programlisting
    $ ant run
    Buildfile: build.xml

    clean:
       [delete] Deleting directory /Users/hughwilliams/hibernate/ex1/bin
        [mkdir] Created dir: /Users/hughwilliams/hibernate/ex1/bin

    copy-resources:
         [copy] Copying 3 files to /Users/hughwilliams/hibernate/ex1/bin
         [copy] Copied 2 empty directories to 1 empty directory under /Users/hughwilliams/hibernate/ex1/bin

    compile:
        [javac] Compiling 3 source files to /Users/hughwilliams/hibernate/ex1/bin

    run:
         [java] Hibernate: insert into Event (EVENT_DATE, title) values (?, ?)
         [java] Hibernate: select identity_value()
         [java] Hibernate: insert into Event (EVENT_DATE, title) values (?, ?)
         [java] Hibernate: select identity_value()
         [java] Hibernate: select event0_.EVENT_ID as EVENT1_0_, event0_.EVENT_DATE as EVENT2_0_, event0_.title as title0_ from Event event0_
         [java] Event: My Event1 Time: 2010-03-14 03:27:51.0
         [java] Event: My Event2 Time: 2010-03-14 03:27:53.0

    BUILD SUCCESSFUL
    Total time: 3 seconds
    ```

4.  Hibernate logging levels can be varied by changing the settings in
    the src/hibernate.cfg.xml and src/log4j.properties files.

</div>

</div>

<div id="jdbcdriverhibernatesetupandtestingexmp2" class="section">

<div class="titlepage">

<div>

<div>

#### Example 2

</div>

</div>

</div>

Hello World with Java Persistence

<div class="orderedlist">

1.  Open your command shell and change to the "ex2" directory

2.  The following required files need to be placed in the ./lib
    directory:

    ``` programlisting

    antlr-2.7.6.jar
    asm-attrs.jar
    asm.jar
    c3p0-0.9.0.jar
    cglib-2.1.3.jar
    commons-collections-2.1.1.jar
    commons-logging-1.0.4.jar
    dom4j-1.6.1.jar
    ejb3-persistence.jar
    freemarker.jar
    hibernate-annotations.jar
    hibernate-commons-annotations.jar
    hibernate-entitymanager.jar
    hibernate-tools.jar
    hibernate3.jar
    javassist.jar
    jboss-archive-browsing.jar
    jta.jar
    log4j-1.2.13.jar
    virtjdbc4.jar
    virt_dialect.jar
    ```

3.  Use "ant schemaexport" to export a database schema automatically to
    the database. Ignore any errors about failing ALTER TABLE
    statements, they are thrown because there are no tables when you run
    this for the first time.

    ``` programlisting
    $ ant schemaexport
    Buildfile: build.xml

    compile:

    copymetafiles:

    schemaexport:
    [hibernatetool] Executing Hibernate Tool with a JPA Configuration
    [hibernatetool] 1. task: hbm2ddl (Generates database schema)
    [hibernatetool]
    [hibernatetool]     drop table MESSAGES;
    [hibernatetool]
    [hibernatetool]     create table MESSAGES (
    [hibernatetool]         MESSAGE_ID decimal(20,0)  identity,
    [hibernatetool]         MESSAGE_TEXT varchar(255) null,
    [hibernatetool]         NEXT_MESSAGE_ID decimal(20,0) null,
    [hibernatetool]         primary key (MESSAGE_ID)
    [hibernatetool]     );
    [hibernatetool]
    [hibernatetool]     alter table MESSAGES
    [hibernatetool]         add
    [hibernatetool]         foreign key (NEXT_MESSAGE_ID)
    [hibernatetool]         references MESSAGES;

    BUILD SUCCESSFUL
    Total time: 2 seconds
    ```

4.  Check the DDL that was also exported to the file helloworld-ddl.sql

    ``` programlisting
    $ more helloworld-ddl.sql

        drop table MESSAGES;

        create table MESSAGES (
            MESSAGE_ID decimal(20,0)  identity,
            MESSAGE_TEXT varchar(255) null,
            NEXT_MESSAGE_ID decimal(20,0) null,
            primary key (MESSAGE_ID)
        );

        alter table MESSAGES
            add
            foreign key (NEXT_MESSAGE_ID)
            references MESSAGES;
    ```

5.  Run the example with "ant run" and read the log output on the
    console

    ``` programlisting
    $ ant run
    Buildfile: build.xml

    compile:

    copymetafiles:

    run:
         [java] 1 message(s) found:
         [java] Hello World with JPA

    BUILD SUCCESSFUL
    Total time: 2 seconds
    ```

6.  Call ant run again

    ``` programlisting
    $ ant run
    Buildfile: build.xml

    compile:

    copymetafiles:

    run:
         [java] 2 message(s) found:
         [java] Hello World with JPA
         [java] Hello World with JPA

    BUILD SUCCESSFUL
    Total time: 2 seconds
    ```

7.  If you call ant schemaexport again, all tables will be re-created

8.  Hibernate logging levels can be varied by changing the settings in
    the src/etc/log4j.properties and src/etc/META-INF/persistence.xml
    files

</div>

</div>

<div id="jdbcdriverhibernatesetupandtestingexmp3" class="section">

<div class="titlepage">

<div>

<div>

#### Example 3

</div>

</div>

</div>

This sample performs more complex insert and retrieval of data against
the Virtuoso database.

<div class="orderedlist">

1.  Open your command shell and change to the "ex3" directory

2.  The following required files need to be placed in the ./lib
    directory:

    ``` programlisting
    ```

    antlr-2.7.6.jar commons-collections-3.1.jar
    commons-logging-1.0.4.jar dom4j-1.6.1.jar hibernate3.jar
    javassist-3.4.GA.jar jta-1.1.jar libs.lst log4j-1.2.15.jar
    slf4j-api-1.5.10.jar slf4j-api-1.5.2.jar slf4j-jcl-1.5.10.jar
    virtjdbc4.jar virt_dialect.jar

3.  Run the example with "ant run" and read the log output on the
    console:

    ``` programlisting
    $ ant run
    Buildfile: build.xml

    clean:
       [delete] Deleting directory /Users/hughwilliams/hibernate/ex3/bin
        [mkdir] Created dir: /Users/hughwilliams/hibernate/ex3/bin

    copy-resources:
         [copy] Copying 4 files to /Users/hughwilliams/hibernate/ex3/bin
         [copy] Copied 2 empty directories to 1 empty directory under /Users/hughwilliams/hibernate/ex3/bin

    compile:
        [javac] Compiling 4 source files to /Users/hughwilliams/hibernate/ex3/bin
        [javac] Note: Some input files use unchecked or unsafe operations.
        [javac] Note: Recompile with -Xlint:unchecked for details.

    run:
         [java] Hibernate: insert into EVENTS (EVENT_DATE, title) values (?, ?)
         [java] Hibernate: select identity_value()
         [java] Hibernate: insert into EVENTS (EVENT_DATE, title) values (?, ?)
         [java] Hibernate: select identity_value()
         [java] Hibernate: insert into PERSON (age, firstname, lastname) values (?, ?, ?)
         [java] Hibernate: select identity_value()
         [java] Hibernate: select person0_.PERSON_ID as PERSON1_2_0_, event2_.EVENT_ID as EVENT1_0_1_, person0_.age as age2_0_, person0_.firstname as firstname2_0_, person0_.lastname as lastname2_0_, event2_.EVENT_DATE as EVENT2_0_1_, event2_.title as title0_1_, events1_.PERSON_ID as PERSON2_0__, events1_.EVENT_ID as EVENT1_0__ from PERSON person0_ left outer join PERSON_EVENT events1_ on person0_.PERSON_ID=events1_.PERSON_ID left outer join EVENTS event2_ on events1_.EVENT_ID=event2_.EVENT_ID where person0_.PERSON_ID=?
         [java] Hibernate: select event0_.EVENT_ID as EVENT1_0_0_, event0_.EVENT_DATE as EVENT2_0_0_, event0_.title as title0_0_ from EVENTS event0_ where event0_.EVENT_ID=?
         [java] Hibernate: select participan0_.EVENT_ID as EVENT1_1_, participan0_.PERSON_ID as PERSON2_1_, person1_.PERSON_ID as PERSON1_2_0_, person1_.age as age2_0_, person1_.firstname as firstname2_0_, person1_.lastname as lastname2_0_ from PERSON_EVENT participan0_ left outer join PERSON person1_ on participan0_.PERSON_ID=person1_.PERSON_ID where participan0_.EVENT_ID=?
         [java] Hibernate: insert into PERSON_EVENT (PERSON_ID, EVENT_ID) values (?, ?)
         [java] Hibernate: update PERSON set age=?, firstname=?, lastname=? where PERSON_ID=?
         [java] Added person 1 to event 2
         [java] Hibernate: insert into PERSON (age, firstname, lastname) values (?, ?, ?)
         [java] Hibernate: select identity_value()
         [java] Hibernate: select person0_.PERSON_ID as PERSON1_2_0_, person0_.age as age2_0_, person0_.firstname as firstname2_0_, person0_.lastname as lastname2_0_ from PERSON person0_ where person0_.PERSON_ID=?
         [java] Hibernate: select emailaddre0_.PERSON_ID as PERSON1_0_, emailaddre0_.EMAIL_ADDR as EMAIL2_0_ from PERSON_EMAIL_ADDR emailaddre0_ where emailaddre0_.PERSON_ID=?
         [java] Hibernate: insert into PERSON_EMAIL_ADDR (PERSON_ID, EMAIL_ADDR) values (?, ?)
         [java] Hibernate: select person0_.PERSON_ID as PERSON1_2_0_, person0_.age as age2_0_, person0_.firstname as firstname2_0_, person0_.lastname as lastname2_0_ from PERSON person0_ where person0_.PERSON_ID=?
         [java] Hibernate: select emailaddre0_.PERSON_ID as PERSON1_0_, emailaddre0_.EMAIL_ADDR as EMAIL2_0_ from PERSON_EMAIL_ADDR emailaddre0_ where emailaddre0_.PERSON_ID=?
         [java] Hibernate: insert into PERSON_EMAIL_ADDR (PERSON_ID, EMAIL_ADDR) values (?, ?)
         [java] Added two email addresses (value typed objects) to person entity : 1
         [java] Hibernate: select event0_.EVENT_ID as EVENT1_0_, event0_.EVENT_DATE as EVENT2_0_, event0_.title as title0_ from EVENTS event0_
         [java] Event: My Event Time: 2010-03-14 03:30:02.0
         [java] Event: My Event Time: 2010-03-14 03:30:06.0

    BUILD SUCCESSFUL
    Total time: 5 seconds
    ```

4.  Hibernate logging levels can be varied by changing the settings in
    the src/hibernate.cfg.xml and src/log4j.properties files.

</div>

</div>

<div id="jdbcdriverhibernatesetupandtestingexmp4" class="section">

<div class="titlepage">

<div>

<div>

#### Example 4

</div>

</div>

</div>

This example demonstrates how to make Multi Thread Virtuoso connection
using JDBC.

It starts 3 threads: one thread executes SPARQL select and two threads
execute SPARQL inserts:

``` programlisting
import java.util.*;
import java.sql.*;
import java.math.*;

public class MTtest extends Thread {

  int mode = 0;
  int startId = 0;

  static  String urlDB = "jdbc:virtuoso://localhost:1111";

 public MTtest(int _mode, int _init) {
   mode = _mode;
   startId = _init;
 }

 void prnRs(ResultSet rs)
 {
   try {
     ResultSetMetaData rsmd;

     System.out.println(">>>>>>>>");
     rsmd = rs.getMetaData();
     int cnt = rsmd.getColumnCount();

       while(rs.next()) {
         Object o;

         System.out.print("Thread:"+Thread.currentThread().getId()+"  ");
         for (int i = 1; i <= cnt; i++) {
           o = rs.getObject(i);
           if (rs.wasNull())
             System.out.print("<NULL> ");
           else
             System.out.print("["+ o + "] ");
         }
         System.out.println();
       }

   } catch (Exception e) {
     System.out.println(e);
     e.printStackTrace();
   }
   System.out.println(">>>>>>>>");
 }

 public static void main(String argv[])
 {
  try {

    Class.forName("virtuoso.jdbc3.Driver");

    Connection conn = DriverManager.getConnection(urlDB,"dba","dba");
    Statement st = conn.createStatement();

    st.execute("sparql clear graph <mttest>");
    st.execute("sparql insert into graph <mttest> { <xxx> <P01> \"test1\" }");
    st.execute("sparql insert into graph <mttest> { <xxx> <P01> \"test2\" }");
    st.execute("sparql insert into graph <mttest> { <xxx> <P01> \"test3\" }");
    st.execute("sparql insert into graph <mttest> { <xxx> <P01> \"test4\" }");
    st.execute("sparql insert into graph <mttest> { <xxx> <P01> \"test5\" }");
    conn.close();

    int init = 0;

    for(int i=0; i < 2; i++) {
      MTtest thr1 = new MTtest(1, init);
      init+=10;

      MTtest thr2 = new MTtest(0, init);
      init+=10;

      MTtest thr3 = new MTtest(0, init);
      init+=10;

      thr1.start();
      thr2.start();
      thr3.start();

      thr1.join();
      thr2.join();
      thr3.join();
    }

    System.out.println("===End===");

  } catch (Exception e) {
    System.out.print(e);
    e.printStackTrace();
  }
 }

 public void run( )
 {
  try {

    Connection conn = DriverManager.getConnection(urlDB,"dba","dba");
    Statement st;

    st = conn.createStatement();

    if (mode == 1)
    {
      String query = "sparql SELECT * from <mttest> WHERE {?s ?p ?o}";
      ResultSet rs = st.executeQuery(query);
      prnRs(rs);
    }
    else
    {
      long id = Thread.currentThread().getId();
      for (int i =0; i < 5; i++)
        st.execute("sparql insert into graph <mttest> { <xxx"+startId+"> <P"+id+"> \"test"+i+"\" }");

      System.out.println("\nThread:"+Thread.currentThread().getId()+"  ===Rows Inserted===");
    }

    conn.close();

  } catch (SQLException e) {
        System.out.println("===========================================================");
        System.out.println(">>["+e.getMessage()+"]");
        System.out.println(">>["+e.getErrorCode()+"]");
        System.out.println(">>["+e.getSQLState()+"]");
        System.out.println(e);
        System.out.println("===========================================================");
        e.printStackTrace();
        System.exit(-1);
  } catch (Exception e) {
        System.out.println("===========================================================");
        System.out.println(e);
        System.out.println("===========================================================");
        e.printStackTrace();
        System.exit(-1);
  }
 } // run( )

}
```

</div>

</div>
