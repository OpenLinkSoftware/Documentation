This chapter applies exclusively to the various commercial releases of Virtuoso. If you are working with the open source version, please refer to the instructions on the web site where you obtained it.

This chapter describes how to install OpenLink Virtuoso VDBMS. It contains both a quick start install guide and full walk through install guides for major platforms.

Virtuoso has been designed from the ground-up to be easy to implement.

The installation generally runs without problems, run the setup program or script and follow the on screen instruction prompts. You will be asked some questions, if in any doubt please follow the instructions in this guide in order to install and configure your Virtuoso components correctly.

Once installed, each instance of Virtuoso is controlled by an INI (initialization) file. This file links the Virtuoso Server process with an actual database file or device. For example, the demo instance of Virtuoso on all platforms is controlled by the demo.ini file that is found in the demo directory along with the demo.db and related files. There is a one-to-one relationship between server processes and database files.

The INI file is a text file consisting of keys and key values. You will set several of these values during installation. At any time thereafter, their values can be changed by editing the INI file with a standard text editor.

The details of the INI file sections, keys, and the meanings of the key values are described in the Configuring Server Startup Files section.

