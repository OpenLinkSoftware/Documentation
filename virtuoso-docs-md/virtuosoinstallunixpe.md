<div>

<div>

<div>

<div>

## 2.3. Installing the Virtuoso Universal Server on Unix-like OS (AIX, HP-UX, Linux, Solaris, etc.)

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 2.3.1. Installation

</div>

</div>

</div>

Once the required tar file has been downloaded from the web or ftp site
and placed in a designated installation directory the installation
process is ready to commence.

<div>

- Choose or create a suitable user account to own your Virtuoso
  installation.

- Un-tar the file to obtain the install script and archive file using a
  command like this, where XX specifies the OS identifier (e.g., l3 =
  Linux glibc23 x86, l9 = Linux glibc25 x86_64, sv = Solaris 2.10
  x86_64, etc.):

  ``` programlisting
  tar -xvf XXvpz2zz.tar
  ```

- If a license file exists, place this in the same directory as the
  installation files, and it will automatically be applied during
  installation. If upgrading an existing Virtuoso instance, be sure to
  take a backup of your database file and shut down the existing
  instance before proceeding.

- Run the install script using the following command:

  ``` programlisting
  $ sh ./install.sh

  - Extracting Virtuoso Universal Server vX.Y

  - Creating default environment settings

  - Creating default database settings
  Installing new virtuoso.ini in $VIRTUOSO_HOME/database
  Installing new php.ini in $VIRTUOSO_HOME/database
  Creating symlink to $VIRTUOSO_HOME/bin/virtuoso-iodbc-t

  - Registering ODBC drivers

  - Registering .NET provider for Mono

  - Installing VAD packages in database (this can take some time)

  - Checking where license should be stored

  - Starting OpenLink License Manager

  - Checking for initial Virtuoso license

  - Starting Virtuoso server instance

  - Finalizing installation

  This concludes the first part of the installation.

  Please start a browser manually and open the following URL to finalize
  the installation process:

       http://<hostname>:8890/install/

  Installation completed
  $
  ```

- Proceed to the Configuration section below.

</div>

</div>

</div>
