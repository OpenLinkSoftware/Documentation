<div>

<div>

<div>

<div>

### 17.3.8. CA Keys Import using Conductor

</div>

</div>

</div>

The Virtuoso Conductor allows easy import of user-level CA (Certificate
Authority) Keys through System Admin -\> User Accounts -\> Edit.

The dba user (typically) or other users may need CA keys to execute
different services.

For ODS, the dba user must import a certificate with primary key and
with name id_rsa. The process takes the following steps:

<div>

1.  A signing authority (e.g., RSA Labs) generates a site certificate.

2.  The site certificate is used to generate certificates for ODS users.

3.  The site certificate is imported with name id_rsa for user dba using
    the Conductor.

    <div>

    <div>

    **Figure 17.6. Conductor CA Keys Import**

    <div>

    <div>

    ![Conductor CA Keys Import](images/ui/foafssl27.png)

    </div>

    </div>

    </div>

      

    </div>

4.  As a result, the ODS user certificates can be authenticated against
    the site certificate.

</div>

If there is a service that requires a different key, the Conductor can
be used to import another certificate for the relevant user.

You can use a Key from a global signing authority or produce a
self-signed key using the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/conductor_dav.vad"
class="ulink" target="_top">Virtuoso Conductor</a> .

Details and more information how to generate the key see in the next
section.

</div>
