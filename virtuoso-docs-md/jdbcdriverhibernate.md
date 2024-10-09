<div>

<div>

<div>

<div>

### 7.4.6. Virtuoso JDBC Driver Hibernate Support

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Introduction

</div>

</div>

</div>

<span class="emphasis">*What*</span>

Hibernate is a powerful, open source, high performance object/relational
persistence and query service. Hibernate lets you develop persistent
classes following object-oriented idiom - including association,
inheritance, polymorphism, composition, and collections. Hibernate
allows you to express queries in its own portable SQL extension (HQL),
as well as in native SQL, or with an object-oriented Criteria and
Example API.

<span class="emphasis">*Why*</span>

Hibernate employs very aggressive, and very intelligent first and second
level caching strategy, providing a high performance and scalable
development framework for Java. Greater cross portability and
productivity can also be achieve using hibernate as the same techniques
can be employed across multiple databases.

<span class="emphasis">*How*</span>

Hibernate uses JDBC for accessing databases and may require a given
database has a custom SQL dialect file that informs Hibernate what SQL
dialects are to be use for performing certain operations against the
target database. Although not strictly required, it should be used to
ensure Hibernate Query Language (HQL) statements are correctly converted
into the proper SQL dialect for the underlying database. Virtuoso
includes a new jar file called virt_dialect.jar containing the SQL
dialect mappings required between hibernate and Virtuoso and is used in
conjunction to the Virtuoso JDBC Drivers (virtjdbc3.jar or
virtjdbc4.jar).

</div>

<div>

<div>

<div>

<div>

#### Setup and Testing

</div>

</div>

</div>

Three <a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtJdbcHibernate/Hibernate_Examples.zip"
class="ulink" target="_top">sample programs</a> are provided to test
Virtuoso hibernate support. Extract the contents of the zip file to a
location of choice.

<div>

<div>

<div>

<div>

##### Requirements

</div>

</div>

</div>

<div>

- <a href="https://www.hibernate.org/" class="ulink"
  target="_top">Hibernate</a> 3.3 or higher

- JDK 5.0 or higher on any operating system

- Ant 1.6

- <a
  href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtJdbcHibernate/virt_dialect.jar"
  class="ulink" target="_top">Virtuoso SQL Dialect jar file</a>
  (virt_dialect.jar)

- <a
  href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtJdbcHibernate/virtjdbc4.jar"
  class="ulink" target="_top">Virtuoso JDBC Driver</a> (virtjdbc4.jar)

</div>

</div>

<div>

<div>

<div>

<div>

##### Building and running the example

</div>

</div>

</div>

The following Ant targets are available:

``` programlisting
clean         Clean the build directory
compile       Build example
run           Build and run example
```

</div>

<div>

<div>

<div>

<div>

##### Hibernate connection string

</div>

</div>

</div>

Edit the file `hibernate.cfg.xml` in the "bin" and "src" directories of
the hibernate application directory with the correct connection
attributes for the Virtuoso Server instance:

``` programlisting
$ more hibernate.cfg.xml
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">

<hibernate-configuration>

    <session-factory>

        <!-- Database connection settings -->

        <property name="connection.driver_class">virtuoso.jdbc4.Driver</property>
        <property name="connection.url">jdbc:virtuoso://localhost:1111/</property>
        <property name="connection.username">dba</property>
        <property name="connection.password">dba</property>

        <!-- JDBC connection pool (use the built-in) -->

        <property name="connection.pool_size">1</property>

        <!-- SQL dialect -->

        <property name="dialect">virtuoso.hibernate.VirtuosoDialect</property>

        <!-- Enable Hibernate's current session context -->

        <property name="current_session_context_class">thread</property>

        <!-- Disable the second-level cache  -->

        <property name="cache.provider_class">org.hibernate.cache.NoCacheProvider</property>

        <!-- Echo all executed SQL to stdout -->

        <property name="show_sql">true</property>

        <!-- Drop and re-create the database schema on startup -->

        <property name="hbm2ddl.auto">create</property>

        <mapping resource="events/Event.hbm.xml"/>

    </session-factory>

</hibernate-configuration>
```

The key attributes being

<div>

- <span class="emphasis">*connection.driver_class*</span>

  \- Virtuoso JDBC Driver class name, typically virtuoso.jdbc4.Driver

- <span class="emphasis">*connection.url*</span> - Virtuoso JDBC Driver
  connect string for target Virtuoso server instance, of the form
  `jdbc:virtuoso://hostname:portno`

- <span class="emphasis">*connection.username*</span>

  \- Virtuoso Server username

- <span class="emphasis">*connection.password*</span>

  \- Virtuoso Server password

</div>

</div>

</div>

</div>
