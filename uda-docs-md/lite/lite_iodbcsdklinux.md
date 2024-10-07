<div id="lite_iodbcsdklinux" class="section">

<div class="titlepage">

<div>

<div>

## 11.1. iODBC SDK on Unix

</div>

</div>

</div>

Unlike Windows, Unix has historically never come with a system-wide ODBC
installation, therefore there is greater scope for setting everything up
the way you wish.

Also on Unix, there are two main-stream implementations of ODBC:
UnixODBC and iODBC. The former comes with a QT-based implementation of a
GUI, while iODBC provides a GTK+-based administrator.

The iODBC package is available in several formats - source tarball,
source RPM, and a choice of binary components. Installing the binary
packages is a simple exercise - for example,

``` programlisting
sudo rpm -Uhv libiodbc-3.0.6-2.i386-glibc21.rpm
```

will install the iODBC runtime library.

There follows an alternative, walking through an unpacking, configure
and build of the complete sources from tarball:

``` programlisting
zsh, purple  6:10PM C/ % tar xvpfz libiodbc-3.0.6.tar.gz
libiodbc-3.0.6/
libiodbc-3.0.6/admin/
libiodbc-3.0.6/admin/Makefile.am
libiodbc-3.0.6/admin/Makefile.in
[snip]
zsh, purple  6:10PM C/ % cd libiodbc-3.0.6
zsh, purple  6:10PM libiodbc-3.0.6/ % ls
AUTHORS       LICENSE       NEWS       bin/      etc/        mac/
COPYING       LICENSE.BSD   README     configure*    include/    samples/
```

Configuration, starting with a check of interesting options specific to
iODBC:

``` programlisting
zsh, purple  6:10PM libiodbc-3.0.6/ % ./configure --help
Defaults for the options are specified in brackets.
Configuration:
  -h, --help              display this help and exit
      --help=short        display options specific to this package
      --help=recursive    display the short help of all the included packages
[snip]
--enable-fast-install=PKGS  optimize for fast installation default=yes
--disable-libtool-lock  avoid locking (might break parallel builds)
--enable-gui            build GUI applications (default),
--disable-gui           build GUI applications
--disable-gtktest       Do not try to compile and run a test GTK program
--enable-odbc3          build ODBC 3.x compatible driver manager (default)
--disable-odbc3         build ODBC 2.x compatible driver manager
[snip]
zsh, purple 6:10PM libiodbc-3.0.6/ % ./configure --prefix=/usr/local/stow/iodbc --with-gtk --enable-gui &amp;&amp; nice make
checking for a BSD-compatible install... /bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
```

Installation, starting with becoming root by sudo, then stow-ing the
package correctly into /usr/local:

``` programlisting
zsh, purple  6:15PM libiodbc-3.0.6/ % sudo -s
Password:
zsh, purple  6:17PM libiodbc-3.0.6/ # make install
Making install in admin
make[1]: Entering directory `/home/tim/C/libiodbc-3.0.6/admin'
[snip]
make[2]: Nothing to be done for `install-exec-am'.
make[2]: Nothing to be done for `install-data-am'.
make[2]: Leaving directory `/home/tim/C/libiodbc-3.0.6'
make[1]: Leaving directory `/home/tim/C/libiodbc-3.0.6'
zsh, purple  6:18PM libiodbc-3.0.6/ # cd /usr/local/stow/
zsh, purple  6:18PM stow/ # chmod -R og=rX iodbc/
zsh, purple  6:18PM stow/ # stow iodbc/
zsh, purple  6:18PM stow/ # ^D
zsh, purple  6:18PM libiodbc-3.0.6/ % ls /usr/local/stow/iodbc/bin/
iodbc-config*  iodbcadm-gtk*  odbctest*
```

</div>
