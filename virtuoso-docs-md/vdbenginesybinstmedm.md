<div>

<div>

<div>

<div>

### 8.7.5. Manually creating EDM Associations (FKs) for the Sybase pubs2 database

</div>

</div>

</div>

The following steps will detail what is required to manually create
"Associations" in your Entity Data Model.

You will need to determine where these associations exist and their
multiplicity (one-to-one, one-to-many, etc.) before commencing with the
following steps.

<span class="emphasis">*Note:*</span> These steps will need to be
repeated for each association.

<div>

1.  The first Association will deal with is the relationship between
    publishers and titles, identified by the presence of the scalar
    property pub_id in both entities. This is a one-to-many
    relationship, as a Customer may have any number of Invoices.

    <div>

    <div>

    **Figure 8.351. Association**

    <div>

    <div>

    ![Association](images/ui/spro1.png)

    </div>

    </div>

    </div>

      

    </div>

    This is a one to many relationship insomuch that publishers may have
    zero or many titles.

2.  To add the Association, right click on the publishers entity then
    Add -\> Association.

    <div>

    <div>

    **Figure 8.352. add the Association**

    <div>

    <div>

    ![add the Association](images/ui/spro2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  You will now see the Add Association dialog.

    <div>

    <div>

    **Figure 8.353. Add Association dialog**

    <div>

    <div>

    ![Add Association dialog](images/ui/spro3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  For this association the only thing that needs changing is the name
    of the Navigation Property from publishers to publisher on the
    publishers end of the association.

    This more correctly reflects the multiplicity of the association
    such that a publisher is associated with zero or many titles
    (plural).

    <div>

    <div>

    **Figure 8.354. Navigation Property name**

    <div>

    <div>

    ![Navigation Property name](images/ui/spro4.png)

    </div>

    </div>

    </div>

      

    </div>

5.  Once you then hit OK the diagram is refreshed to include the newly
    created association.

    <div>

    <div>

    **Figure 8.355. diagram**

    <div>

    <div>

    ![diagram](images/ui/spro5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  You now need to edit the mappings associated with the newly created
    association, so right-click the association on the diagram, and
    select Table Mapping to display the Mapping Details pane.

    <div>

    <div>

    **Figure 8.356. Table Mapping**

    <div>

    <div>

    ![Table Mapping](images/ui/spro6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click that line reading \<Add a Table or View\> to reveal a drop
    down list of all entities.

    <div>

    <div>

    **Figure 8.357. Add a Table or View**

    <div>

    <div>

    ![Add a Table or View](images/ui/spro7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Here you need to select the entity on the right/far side of the
    association (the entity where the foreign key exists). In this
    example, it is the titles entity.

    <div>

    <div>

    **Figure 8.358. Entity**

    <div>

    <div>

    ![Entity](images/ui/spro8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  The Mapping Details pane now refreshes to display both ends of the
    association, requiring that you provide relevant target store data
    types in the Column column for the key fields, as depicted here.

    <div>

    <div>

    **Figure 8.359. Mapping Details**

    <div>

    <div>

    ![Mapping Details](images/ui/spro9.png)

    </div>

    </div>

    </div>

      

    </div>

10. Once the mapping is complete, you can build the project using Build
    -\> Build Solution. NOTE: It is worthwhile building as each
    association is made, since the error messages can be a little
    confusing.

    <div>

    <div>

    **Figure 8.360. Build the project**

    <div>

    <div>

    ![Build the project](images/ui/spro10.png)

    </div>

    </div>

    </div>

      

    </div>

11. This should result in the following error:

    <div>

    <div>

    **Figure 8.361. Error**

    <div>

    <div>

    ![Error](images/ui/spro11.png)

    </div>

    </div>

    </div>

      

    </div>

    It seems that this error is attempting to say that there are two
    mappings which map to the same target source column.

    In this case it is the target column titles.pub_id.

    That is, the scalar property pub_id and the Navigation Property
    publishers in the Invoice entity, both map to the Sybase table
    column titles.pub_id - which is not supported

    <div>

    <div>

    **Figure 8.362. Error**

    <div>

    <div>

    ![Error](images/ui/spro12.png)

    </div>

    </div>

    </div>

      

    </div>

12. The solution is simple! Simply delete the scalar property
    titles.pub_id since its purpose is only to hold data representing a
    relationship/association (it is a Foreign Key) which has already
    been represented by the newly created association and resulting
    Navigation Property publishers.

    Right click on titles.pub_id then Delete.

    <div>

    <div>

    **Figure 8.363. delete the mapping**

    <div>

    <div>

    ![delete the mapping](images/ui/spro13.png)

    </div>

    </div>

    </div>

      

    </div>

13. The model diagram will refresh to reflect this change.

    <div>

    <div>

    **Figure 8.364. Model Diagram**

    <div>

    <div>

    ![Model Diagram](images/ui/spro14.png)

    </div>

    </div>

    </div>

      

    </div>

14. Build the project, again, using Build -\> Build Solution.

    <div>

    <div>

    **Figure 8.365. Build project**

    <div>

    <div>

    ![Build project](images/ui/spro15.png)

    </div>

    </div>

    </div>

      

    </div>

15. The project should now be fine.

    <div>

    <div>

    **Figure 8.366. Build Project**

    <div>

    <div>

    ![Build Project](images/ui/spro16.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

You will need to repeat these steps for each association until you have
a completed Entity Data Model.

<div>

<div>

**Figure 8.367. Entity Data Model**

<div>

<div>

![Entity Data Model](images/ui/spro17.png)

</div>

</div>

</div>

  

</div>

</div>
