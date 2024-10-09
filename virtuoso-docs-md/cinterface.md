<div>

<div>

<div>

<div>

## 18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 18.5.1. Virtuoso Server Extension Interface (VSEI)

</div>

</div>

</div>

The Virtuoso Server Extension Interface allows Virtuoso functionality to
be extended by including new functions written in other languages such
as C. These new functions are SQL callable.

These functions share the same C prototype and use Virtuoso internal
APIs to do the following:

|                                                          |
|----------------------------------------------------------|
| Retrieve arguments.                                      |
| Assign values to output parameters.                      |
| Compile and execute SQL/PL statements and fetch results. |
| Signal SQL errors.                                       |
| Return values.                                           |

A SQL-callable C function is called a Virtuoso Server Extension (VSE).
These are external functions integrated into Virtuoso by linking their
executable produced with a Virtuoso server in library format, rather
than executable. VSEs were formally known as BIFs, which stood for
Built-In Functions. Such functions must be exported using the
`bif_define()` or `bif_define_typed()` C-functions when initializing the
extended Virtuoso server.

These functions will thereafter be invoked on server threads. The
functions should be re-entrant and comply to some simple memory
management conventions outlined below.

These functions may execute arbitrary C code and call arbitrary APIs, to
the extent these are compatible with the host operating system's
threading model.

Virtuoso VSEs can be debugged within the normal C debugger by either
starting Virtuoso under the debugger in foreground mode or by attaching
the debugger to a running process.

Stack consumption should not be excessive: threads normally have 100K of
stack on 32 bit platforms. The stack size may however be increased by
settings in the virtuoso.ini file.

</div>

</div>
