<div id="compilingandlinking" class="section">

<div class="titlepage">

<div>

<div>

### 18.5.5. Compiling & Linking

</div>

</div>

</div>

The files should be compiled for the multi-threaded environment
appropriate to the operating system and should be linked accordingly
e.g. `-lm` , `-ldl` .

The Virtuoso distribution contains the following libraries/object files:

<div class="itemizedlist">

- **libvirtuoso-\* libraries/object files. ** The Virtuoso engine. The
  suffix denotes the kind of remote and threading support : -iodbc for
  iODBC, -udbc for UDBC, -t for native threads, -f for fiber threads.

- **c_javavm object file. ** the Virtuoso Java VM Integration file (no
  main function). This is the file to be linked in if the custom code
  executable needs to have Java VM support. To initialize the Java VM
  integration the C function `void bif_init_func_javavm (void)` should
  be called from the `VirtuosoServerSetInitHook` hook. This file
  references the `libjvm` library from the Java JRE, hence, should also
  be appended to your linker options.

- **c_bif_server_php object file. ** The Virtuoso PHP integration
  support library. This is the file to be linked in if the custom code
  executable needs to have the PHP support built in. To initialize the
  PHP engine integration the C++ function `void init_func_php (void)`
  should be called from the `VirtuosoServerSetInitHook` hook. Note that
  this file is a C++ object file and needs to be linked in accordingly.
  This file references the libphp4 library.

- **basec object file. ** The Virtuoso .NET CLR Integration file. This
  is the file to be linked in if the custom code executable needs to
  have the .NET CLR integration built in. This is a C file.

- **c_dotnet object file. ** The Virtuoso .NET CLR Integration file.
  This is the file to be linked in if the custom code executable needs
  to have the .NET CLR integration (and nothing but) built in. This is a
  C++ file. Binaries using this file should initialize the .NET CLR
  support by calling the C++ function `void bif_init_func_clr (void)`
  (defined in the basec object file) from the
  `VirtuosoServerSetInitHook` hook. In order for the .NET CLR support to
  work correctly the `::CoInitialize` Win32 COM API should also be
  called before the `VirtuosoServerMain` call.

- **sql_code_javavm object file. ** This contains the DDL definitions
  for the Java VM support. Executables using that binary should call the
  `sqls_define_javavm` function in their DDL init hook.

- **sql_code_xslt object file. ** This contains the DDL definitions of
  the XSLT stylesheets used in the Java VM & CLI support. Executables
  using that binary should call the `sqls_define_xslt` function in their
  DDL init hook.

- **sql_code_clr object file. ** This contains the DDL definitions for
  the .NET CLR integration support. Executables using that binary should
  call the `sqls_define_clr` function in their DDL init hook.

</div>

</div>
