<div>

<div>

<div>

<div>

### 8.3.5. Manually creating EDM Associations (FKs) for the Progress isports database

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
    Customer and Invoice, identified by the presence of the scalar
    property Cust_Num in both entities. This is a one-to-many
    relationship, as a Customer may have any number of Invoices.

    <div>

    <div>

    **Figure 8.95. Association**

    <div>

    <div>

    ![Association](images/ui/mpro1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  To add the Association, right click on the Customer entity then Add
    -\> Association.

    <div>

    <div>

    **Figure 8.96. add the Association**

    <div>

    <div>

    ![add the Association](images/ui/mpro2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  You will now see the Add Association dialog.

    <div>

    <div>

    **Figure 8.97. Add Association dialog**

    <div>

    <div>

    ![Add Association dialog](images/ui/mpro3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  For this association the only thing that needs changing from the
    default, is the name of the Navigation Property from Invoice to
    invoices on the Customer end of the association.

    This better reflects the multiplicity of the association such that a
    Customer is associated with zero or many Invoices (plural).

    <div>

    <div>

    **Figure 8.98. Navigation Property name**

    <div>

    <div>

    ![Navigation Property name](images/ui/mpro4.png)

    </div>

    </div>

    </div>

      

    </div>

    Typically, here is where you will:

    <div>

    - Select the entity at each end of the association

    - Select the multiplicity of each end of the association, and

    - Provide suitable names for the association and its navigation
      properties

    </div>

5.  Once you then hit OK the diagram is refreshed to include the newly
    created association.

    <div>

    <div>

    **Figure 8.99. diagram**

    <div>

    <div>

    ![diagram](images/ui/mpro5.png)

    </div>

    </div>

    </div>

      

    </div>

6.  You now need to edit the mappings associated with the newly created
    association, so right-click the association on the diagram, and
    select Table Mapping to display the Mapping Details pane.

    <div>

    <div>

    **Figure 8.100. Table Mapping**

    <div>

    <div>

    ![Table Mapping](images/ui/mpro6.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Click that line reading \<Add a Table or View\> to reveal a drop
    down list of all entities.

    <div>

    <div>

    **Figure 8.101. Add a Table or View**

    <div>

    <div>

    ![Add a Table or View](images/ui/mpro7.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Here you need to select the entity on the right/far side of the
    association (the entity where the foreign key exists). In this
    example, it is the Invoice entity.

    <div>

    <div>

    **Figure 8.102. Entity**

    <div>

    <div>

    ![Entity](images/ui/mpro8.png)

    </div>

    </div>

    </div>

      

    </div>

9.  The Mapping Details pane now refreshes to display both ends of the
    association, requiring that you provide relevant target store data
    types in the Column column for the key fields, as depicted here.

    <div>

    <div>

    **Figure 8.103. Mapping Details**

    <div>

    <div>

    ![Mapping Details](images/ui/mpro9.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 8.104. Mapping Details**

    <div>

    <div>

    ![Mapping Details](images/ui/mpro10.png)

    </div>

    </div>

    </div>

      

    </div>

    <div>

    <div>

    **Figure 8.105. Mapping Details**

    <div>

    <div>

    ![Mapping Details](images/ui/mpro11.png)

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

    **Figure 8.106. Build the project**

    <div>

    <div>

    ![Build the project](images/ui/mpro12.png)

    </div>

    </div>

    </div>

      

    </div>

11. This should result in the following error:

    <div>

    <div>

    **Figure 8.107. Error**

    <div>

    <div>

    ![Error](images/ui/mpro13.png)

    </div>

    </div>

    </div>

      

    </div>

    This error indicates that there are two source columns - in this
    case, the Invoice entity's Scalar Property Cust_Num and Navigation
    Property Customer, which are both mapped to the same target column -
    the Progress column Invoice.Cust_Num - and this is not supported.

    <div>

    <div>

    **Figure 8.108. Error**

    <div>

    <div>

    ![Error](images/ui/mpro14.png)

    </div>

    </div>

    </div>

      

    </div>

12. The solution is simple! Simply delete the mapping of the Scalar
    Property Invoice.Cust_Num, since its only purpose is to hold data
    representing a relationship/association (it is a Foreign Key) which
    has already been represented by the newly created association and
    resulting Navigation Property Customer.

    Right click on Invoice.Cust_Num then Delete.

    <div>

    <div>

    **Figure 8.109. delete the mapping**

    <div>

    <div>

    ![delete the mapping](images/ui/mpro15.png)

    </div>

    </div>

    </div>

      

    </div>

13. The model diagram will refresh to reflect this change.

    <div>

    <div>

    **Figure 8.110. Model Diagram**

    <div>

    <div>

    ![Model Diagram](images/ui/mpro16.png)

    </div>

    </div>

    </div>

      

    </div>

14. Build the project, again, using Build -\> Build Solution.

    <div>

    <div>

    **Figure 8.111. Build project**

    <div>

    <div>

    ![Build project](images/ui/mpro17.png)

    </div>

    </div>

    </div>

      

    </div>

15. The project should now be fine.

    <div>

    <div>

    **Figure 8.112. Build Project**

    <div>

    <div>

    ![Build Project](images/ui/mpro18.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

You will need to repeat these steps for each association until you have
a completed Entity Data Model.

<div>

<div>

**Figure 8.113. Entity Data Model**

<div>

<div>

![Entity Data Model](images/ui/mpro19.png)

</div>

</div>

</div>

  

</div>

</div>
