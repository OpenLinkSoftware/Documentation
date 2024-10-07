<div id="servermainfunction" class="section">

<div class="titlepage">

<div>

<div>

### 18.5.4. Server Main Function

</div>

</div>

</div>

The server main function for a customized Virtuoso server has the
following format:

``` programlisting
static void (*old_ddl_hook) (client_connection_t *cli) = NULL;

static void
ddl_hook (client_connection_t *cli)
{
  if (old_ddl_hook)
    old_ddl_hook (cli);

  /* DDL code (depending on the server being fully initialized
    (ex: create table) ) goes here */
}

static void
init_func (void)
{
  old_ddl_hook = set_ddl_init_hook (ddl_hook);
  /* initialization code (prerequisite for server initialization
     (bif_define, unrelated init code) goes here */
}

int
main (int argc, char *argv[])
{
  VirtuosoServerSetInitHook (init_func);
  return VirtuosoServerMain (argc, argv);
}
```

There are three phases to custom code initialization:

|                                         |
|-----------------------------------------|
| execution of the `main()` function      |
| execution of the `init_func()` function |
| execution of the `ddl_hook()` function  |

The `init_func()` function is called before any server initialization
functions are called. This is typically a place for defining new VSEs,
allocation of synchronization objects (since the server does not have
any threads yet), and/or custom code initialization not related to
Virtuoso. Here, the `set_ddl_init_hook()` should be called also, if it
exists, to register the `ddl_hook()` callback function.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                        |
|:----------------------------:|:-----------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                  |
|                              | The `old_ddl_hook()` mechanism - this allows queuing of the ddl_hooks. |

</div>

The `ddl_hook()` function is called during normal startup just before
the roll forward, but after the server's internal structure has been
initialized. This is typically a place to execute SQL statements to
initialize the extension. The variable *`client_connection_t *`* is
passed to the function to provide the client connection that should be
used for SQL execution.

The `main()` function can call `VirtuosoServerSetInitHook()` if there is
any Virtuoso-related initialization to be performed, and should then
call the `VirtuosoServerMain()` function to start the Virtuoso server.
The `VirtuosoServerMain()` function will return control after the server
has been shut down.

</div>
