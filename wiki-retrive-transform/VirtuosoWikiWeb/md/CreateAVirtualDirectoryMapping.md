::: {.topic-text}
\

[]{#Advanced Virtuoso Configuration: Creating a Virtual Directory Mapping} Advanced Virtuoso Configuration: Creating a Virtual Directory Mapping
================================================================================================================================================

1.  Access your Virtuoso Conductor with a Web browser.\
    \
2.  Log in to the Conductor.\
    \
3.  Go to **Web Application Server** tab and then go to the **Virtual
    Domains & Directories** tab.\
    \
4.  From the list of **HTTP Hosts**, click the icon in front of the
    **Interface** value.\
    \
5.  Click the **Add new directory** link.\
    \
6.  Choose the **File System** type and press the button **Next.**\
    \
    1.  Enter **`/admin2`** for **Path**.\
    2.  Enter **`/admin2`** for **Physical Path** and **`index.vsp`**
        (or whatever your VSP file is called) for the **Default page**
        if required.\
    3.  Leave other fields as is, and press the **Save Changes**
        button.\
        \
7.  You should now be able to access your VSP page successfully at
    either URL \--\
    -   `http://hostname:portno/admin2`\
    -   `http://hostname:portno/admin2/index.vsp`
:::
