<div id="ch-sqlprocedures" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 11. SQL Procedure Language Guide

</div>

<div>

<div class="abstract">

**Abstract**

Stored procedures are a key component of database performance. The fewer
messages are sent between the client and the server for a given
transaction, the faster it will complete.

Virtuoso/PL is a simple and straightforward language for writing stored
procedures and triggers in Virtuoso. Its syntax is a combination of SQL
and C, making learning it as easy as possible. It offers the features
commonly found in database procedure languages in a simple, efficient
and concise package. This document presents the primary concepts of the
language and ends with a reference section.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">11.1. [General
Principles](ch-sqlprocedures.html#generalprinciples)</span>

<span class="section">11.2. [Scope of
Declarations](scopeofdeclaration.html)</span>

<span class="section">11.3. [Data Types](sqlpldatatypes.html)</span>

<span class="section">11.4. [Handling Result
Sets](resultsets.html)</span>

<span class="section">11.5. [Result Sets and Array
Parameters](arrays.html)</span>

<span class="section">11.6. [Exception
Semantics](exceptions.html)</span>

<span class="section">11.7. [Virtuoso/PL Syntax](plref.html)</span>

<span class="section">11.7.1. [Create Procedure
Statement](plref.html#createprocstmt)</span>

<span class="section">11.7.2. [Grant Execute
Statement](grantprocstmt.html)</span>

<span class="section">11.7.3. [Stored Procedures as Views & Derived
Tables](spasviewsandtablespl.html)</span>

<span class="section">11.7.4. [Keyword and Optional Procedure
Arguments](kwds.html)</span>

<span class="section">11.7.5. [if, while, for, foreach
statements](whilestmt.html)</span>

<span class="section">11.7.6. [compound
statement](compoundstmts.html)</span>

<span class="section">11.7.7. [goto, return
statements](gotortnstmts.html)</span>

<span class="section">11.7.8. [whenever
statement](wheneverstmt.html)</span>

<span class="section">11.7.9. [call, assignment
statements](callassignstmt.html)</span>

<span class="section">11.7.10. [open, fetch, close, select ... into
statements](openfetchetcintostmts.html)</span>

<span class="section">11.7.11. [FOR Select
Statement](forstmt.html)</span>

<span class="section">11.7.12. [SET statement](setstmt_01.html)</span>

<span class="section">11.7.13. [SET Triggers](settriggers.html)</span>

<span class="section">11.7.14. [Vectored
Procedures](vectoredprocedure.html)</span>

<span class="section">11.7.15. [FOR VECTORED
Statement](forvectorestatement.html)</span>

<span class="section">11.7.16. [Limitations on Vectored
Code](limitonvectorecode.html)</span>

<span class="section">11.7.17. [Data Types and
Vectoring](datatypesandvectoring.html)</span>

<span class="section">11.8. [Execute Stored Procedures via SELECT
statement](execsqlprocselect.html)</span>

<span class="section">11.9. [Execute Stored Procedures In
Background](execsqlprocfork.html)</span>

<span class="section">11.10. [CREATE ASSEMBLY Syntax - External
Libraries](createassembly.html)</span>

<span class="section">11.11. [CREATE PROCEDURE Syntax - External hosted
procedures](createexthostproc.html)</span>

<span class="section">11.12. [Asynchronous Execution and Multithreading
in Virtuoso/PL](asyncexecmultithread.html)</span>

<span class="section">11.12.1.
[Synchronization](asyncexecmultithread.html#synchronization)</span>

<span class="section">11.13. [Performance Tips](perftips.html)</span>

<span class="section">11.13.1. [Remember the
following:](perftips.html#remember)</span>

<span class="section">11.14. [Procedures and
Transactions](procedures_transactions.html)</span>

<span class="section">11.15. [Distributed Transaction & Two Phase
Commit](twopcimplementation.html)</span>

<span class="section">11.15.1. [Initiating Distributed
Transactions](twopcimplementation.html#twopc_send)</span>

<span class="section">11.15.2. [Responding to Distributed
Transactions](twopc_resp.html)</span>

<span class="section">11.15.3. [2PC Log &
Recovery](twopc_recovery.html)</span>

<span class="section">11.15.4. [Error Codes](twopc_errors.html)</span>

<span class="section">11.16. [Triggers](triggers_01.html)</span>

<span class="section">11.16.1. [The CREATE TRIGGER
statement](triggers_01.html#createtrigger)</span>

<span class="section">11.16.2. [Triggers on
Views](triggers_on_views.html)</span>

<span class="section">11.16.3. [The DROP TRIGGER
statement](droptrigger.html)</span>

<span class="section">11.16.4. [Triggers and Virtual
Database](triggers_vdb.html)</span>

<span class="section">11.17. [Character
Escaping](charescaping.html)</span>

<span class="section">11.17.1. [Statement
Level](charescaping.html#backslashstmt)</span>

<span class="section">11.17.2. [Connection
Level](backslashconlevel.html)</span>

<span class="section">11.17.3. [Server
Default](backslashserver.html)</span>

<span class="section">11.18. [Virtuoso/PL Scrollable
Cursors](plscrollcrsrs.html)</span>

<span class="section">11.18.1. [Declaring a Scrollable
Cursor](plscrollcrsrs.html#plscrolldeclare)</span>

<span class="section">11.18.2. [Opening a Scrollable
Cursor](plscrollopen.html)</span>

<span class="section">11.18.3. [Fetching Data From a Scrollable
Cursor](plscrollfetch.html)</span>

<span class="section">11.18.4. [Virtuoso/PL Scrollable Cursor
Examples](plscrollexamples.html)</span>

<span class="section">11.18.5. [FORWARD-ONLY (traditional cursor
statement) Example](plforwardonlycr.html)</span>

<span class="section">11.18.6. [DYNAMIC (traditional cursor statement)
Example](pldynamiccr.html)</span>

<span class="section">11.18.7. [KEYSET (traditional cursor statement)
Example](plkeysetcr.html)</span>

<span class="section">11.19. [Virtuoso PL
Modules](plmodules.html)</span>

<span class="section">11.19.1.
[Syntax](plmodules.html#plmodsyntax)</span>

<span class="section">11.19.2. [Security](plmodsecurity.html)</span>

<span class="section">11.20. [Handling Conditions In Virtuoso/PL
Procedures](handlingplcondit.html)</span>

<span class="section">11.20.1. [Declaring Condition
Handlers](handlingplcondit.html#declarecondit)</span>

<span class="section">11.20.2. [Stack Trace Reporting On Sql Error
Generation](stacktracesql.html)</span>

<span class="section">11.21. [Procedure Language
Debugger](pldebugger.html)</span>

<span class="section">11.21.1. [Branch
Coverage](pldebugger.html#pldbgplcoverage)</span>

<span class="section">11.21.2. [Coverage
Functions](pldcovfunctions.html)</span>

<span class="section">11.22. [Row Level
Security](rowlevelsecurity.html)</span>

<span class="section">11.22.1. [Row Level Security
Functions](rowlevelsecurity.html#pldrlsfunctions)</span>

<span class="section">11.23. [Vectored Execution and Query
Parallelization](vexqrparl.html)</span>

<span class="section">11.23.1. [Automatic Query
Parallelization](vexqrparl.html#vexqrparlautoqp)</span>

<span class="section">11.23.2. [Configuration Parameters for Vectoring
and Parallelization](vexqrparlconfp.html)</span>

</div>

<div id="generalprinciples" class="section">

<div class="titlepage">

<div>

<div>

## 11.1. General Principles

</div>

</div>

</div>

A stored procedure is a named piece of Virtuoso/PL code stored in the
SYS_PROCEDURES table. Stored procedures are created with the create
procedure statement and are used by executing a procedure call statement
through the regular SQL API.

A procedure takes zero or more arguments and optionally returns a value.
Procedure arguments may be input, output or input and output. In this
manner a procedure may modify a variable passed to it by its caller. If
the procedure is called from a call statement executed by a client
process, the client process gets back the procedure's return value and
the values of output parameters.

Procedures can be called with positional or keyword parameters. A call
with positional parameters will bind the first argument in the call to
the first parameter in the procedure parameter list and so on. A keyword
parameter call allows specifying named parameters, where the argument of
a given name is bound to the parameter of the same name in the
procedure's parameter list. Procedure parameters may be required or
optional. The combination of optional parameters and the keyword call
notation make it convenient to have procedures with large numbers of
parameters of which only part are used at any one time.

Procedures have local variables and cursors that are not visible to
other procedures. Procedures can call each other without limitations,
including recursively.

In addition to returning a value and changing values of output
parameters a procedure may yield one or more result sets. The client can
receive rows in result sets just like rows returned by a select
statement. A procedure calling another procedure cannot receive a result
set produced by the called procedure, however. While parameters and
return values work equally well between procedures as between procedure
and client application, a result set always goes to the client, even if
the procedure has been called by another procedure. A procedure view is
a separate construct which allows a procedure to iterate over another
procedure's result set. See the Procedure Views section.

A procedure consists of statements and expressions similar to those of
any procedural language. In addition, procedures may contain SQL
statements operating on the procedure's arguments and local variables.
Writing a stored procedure is thus much like using embedded SQL in C,
except that a stored procedure is typically much faster.

The elements of the procedure are:

<div class="itemizedlist">

- **Procedure Declaration. ** This is a create procedure statement that
  names the procedure and its arguments.

- **Variable Declaration. ** This declares a local variable for the
  procedure.

- **Cursor Declaration. ** This declares a cursor, A cursor allows a
  procedure to iterate over the rows produced by a select statement.

- **Manipulative SQL statement. ** This can be a delete or update
  statement, either searched or positioned, a cursor manipulation or
  other so called routine statement.

- **Control statement. ** This is any control structure, loop,
  assignment or procedure call.

- **Handler declaration. ** This specifies what to do in a specific
  exception situation. Exceptions are error conditions produced by SQL
  statements (e.g. deadlock) or 'not found' situations.

</div>

</div>

</div>
