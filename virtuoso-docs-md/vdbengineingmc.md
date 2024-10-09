<div>

<div>

<div>

<div>

### 8.4.5. Manually creating EDM Associations (FKs) for the Ingres Tutorial database

</div>

</div>

</div>

The following steps will detail what is required to manually create
"Associations" in your Entity Data Model.

Before commencing the process, you will need to determine where these
associations exist and their multiplicity (e.g., one-to-one,
one-to-many, etc.).

<span class="emphasis">*Note:*</span> These steps will need to be
repeated for each association.

<div>

1.  The first Association I will deal with is the relationship between
    cust_orders and cust_info, identified by the presence of the Scalar
    Property cust_no in both entities. This is a one-to-one
    mpmprelationship, as an entry in a customer order may only be
    associated with one customer's information.

    <div>

    <div>

    **Figure 8.174. Association**

    <div>

    <div>

    ![Association](images/ui/ming1.png)

    </div>

    </div>

    </div>

      

    </div>

2.  To add the Association, right click on the Customer entity then Add
    -\> Association.

    <div>

    <div>

    **Figure 8.175. add the Association**

    <div>

    <div>

    ![add the Association](images/ui/ming2.png)

    </div>

    </div>

    </div>

      

    </div>

3.  You will now see the Add Association dialog.

    <div>

    <div>

    **Figure 8.176. Add Association dialog**

    <div>

    <div>

    ![Add Association dialog](images/ui/ming3.png)

    </div>

    </div>

    </div>

      

    </div>

4.  Once you then hit OK the diagram is refreshed to include the newly
    created association.

5.  You now need to edit the mappings associated with the newly created
    association, so right-click the association on the diagram and
    select

    <span class="emphasis">*Table Mapping*</span>

    to display the

    <span class="emphasis">*Mapping Details*</span>

    pane.

    <div>

    <div>

    **Figure 8.177. Navigation Property name**

    <div>

    <div>

    ![Navigation Property name](images/ui/ming4.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Click that line reading \<Add a Table or View\> to reveal a drop
    down list of all entities.

    <div>

    <div>

    **Figure 8.178. Add a Table or View**

    <div>

    <div>

    ![Add a Table or View](images/ui/ming5.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Here you need to select the entity on the right/far side of the
    association (the entity where the foreign key exists). In this
    example, it is the cust_orders entity.

    <div>

    <div>

    **Figure 8.179. Entity**

    <div>

    <div>

    ![Entity](images/ui/ming6.png)

    </div>

    </div>

    </div>

      

    </div>

8.  The Mapping Details pane now refreshes to display both ends of the
    association, requiring that you provide relevant target store data
    types in the Column column for the key fields, as depicted here.

    <div>

    <div>

    **Figure 8.180. Mapping Details**

    <div>

    <div>

    ![Mapping Details](images/ui/ming7.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Once the mapping is complete, you can build the project using Build
    -\> Build Solution. NOTE: It is worthwhile building as each
    association is made, since the error messages can be a little
    confusing.

    <div>

    <div>

    **Figure 8.181. Build the project**

    <div>

    <div>

    ![Build the project](images/ui/ming8.png)

    </div>

    </div>

    </div>

      

    </div>

10. This should result in the following error:

    <div>

    <div>

    **Figure 8.182. Error**

    <div>

    <div>

    ![Error](images/ui/ming9.png)

    </div>

    </div>

    </div>

      

    </div>

    This error indicates that there are two sources - in this case, the
    cust_orders entity's Scalar Property cust_no and the Navigation
    Property cust_info in - which are being mapped to the same target
    column - the Ingres column cust_orders.cust_no - which is not
    supported.

    <div>

    <div>

    **Figure 8.183. Error**

    <div>

    <div>

    ![Error](images/ui/ming10.png)

    </div>

    </div>

    </div>

      

    </div>

11. The solution is simple! Simply delete the mapping for Scalar
    Property cust_orders.cust_no since its only purpose is to hold data
    representing a relationship/association (it is a Foreign Key), which
    has already been represented by the newly-created association and
    resulting Navigation Property cust_no.

    Right-click on cust_orders.cust_no then Delete.

    <div>

    <div>

    **Figure 8.184. delete the mapping**

    <div>

    <div>

    ![delete the mapping](images/ui/ming11.png)

    </div>

    </div>

    </div>

      

    </div>

12. The model diagram will refresh to reflect this change.

    <div>

    <div>

    **Figure 8.185. Model Diagram**

    <div>

    <div>

    ![Model Diagram](images/ui/ming12.png)

    </div>

    </div>

    </div>

      

    </div>

13. Build the project, again, using Build -\> Build Solution.

    <div>

    <div>

    **Figure 8.186. Build project**

    <div>

    <div>

    ![Build project](images/ui/ming13.png)

    </div>

    </div>

    </div>

      

    </div>

14. The project should now be fine.

    <div>

    <div>

    **Figure 8.187. Build Project**

    <div>

    <div>

    ![Build Project](images/ui/ming14.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

You will need to repeat these steps for each association until you have
a completed Entity Data Model.

<div>

<div>

**Figure 8.188. Entity Data Model**

<div>

<div>

![Entity Data Model](images/ui/ming15.png)

</div>

</div>

</div>

  

</div>

</div>
