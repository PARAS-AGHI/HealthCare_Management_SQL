**INTRODUCTION**


With the mushrooming of medical records, patient data, hospital operations and diagnostics,
effective and efficient management and analysis of healthcare information have become an
essential part in current digital healthcare system. The primary aim of this assignment is to
focus on the planning and execution of Clinical Management System (CMS) which focuses on
ensuring required storage, retrieval and analysis of medical data to support operational
efficiency in the healthcare industry.
This project progresses through multiple stages. Beginning with database design, in which the
concept of Entity-Relationship (ER) diagram and schema normalization will help in displaying a
strong foundation for structured and reliable handling of data. The database will then be
processed in MYSQL using primary keys and foreign keys as constraints to maintain the integrity
of data which includes customer data, billings, treatments or appointments, etc. In addition to
that many complex SQL queries will be designed to extract valuable insights. For example -
doctor performance, treatment outcome or utilization of resources of hospital. Apart from the
technical aspects, this assignment also focuses on the theoretical aspects of database
management. It includes the CAP theorem, ACID properties and the optimization techniques for
the large scale healthcare data management system. These principles make sure that the
system holds fundamental requirements like data consistency, data security, data availability
and fault tolerance. These factors are very crucial in the healthcare domain where data
accuracy and reliability are of prime importance.
With the combination of theory with practical, the project displays how clinical/healthcare
management system can serve as a robust tool in providing informed clinical decision,
improving operational efficiency of hospital and enhancing experience of the patient. The
assignment not only shows the technical SQL skills or data modelling but also highlights
importance of leveraging clinical data for overall system optimization.



**DATABASE DESIGN AND NORMALIZATION**

This project demonstrates a data warehouse management system to assist healthcare industry
in its efficient decision making. The main objective is to organize data related to doctors,
patients, billings, appointments, treatments, etc. involving the optimal utilization of hospital
resources and managing its operational efficiency. The data warehouse must perform the
following:
1. Displays the analytics regarding hospital operations, patient care and treatment
outcomes: Using the patients, doctors, nurses and departments tables, the data
warehouse system will analyze patient health outcomes, distribution of workload and
departmental efficiency and effectiveness to support the operations.
2. Keeping a track of patient interactions such as appointment history, medical records or
treatment feedback: By joining patients, doctors, nurses and rooms tables, this system
maintains a detailed record of diagnosis, appointments and stay duration in the hotels.
3. Calculate revenue with the help of billings, insurance settlements and fees paid by
patients: Records from the patients, insurance, medication, pharmacy tables allow
tracking of revenue across medicine sales, returned medications or direct normal
billings.
4. Records of cost related information which includes equipment usage, emergency
services and insurance claims: With the help of patients, insurance, pharmacies,
medications tables, it stores a systematic record of claims, pharmacy expenses and
treatment related costs.
5. Optimize hospital resource allocation which includes staff, rooms and equipment: The
nurse, room and department tables provide data to ensure that the resources of hospital
are being underutilized or overutilized.
6. Monitoring the medication usage and pharmacy: The medication and pharmacies
tables keep a check on medicine availability, prescriptions and logistics of the required
clinical stock.
7. Assist with detecting insurance fraud and verification of false claims: The patients and
insurance tables helps in verifying insurance claims for the treatments and hospital
records to point-out any outliers.


**Other features of this project include:**

• Presenting an Entity-Relationship (ER) diagram.

• Implementing the database structure in MYSQL using primary and foreign key
  constraints.
  
• Using SQL queries to interpret and analyze healthcare data through the database.

• Implementing ACID Properties in MySQL for reliable management of data.

• Implementing CAP theorem for distributed healthcare management system.



**Entities and Relationships (Design and Tables)**
The clinical database management system has 12 core entities:
1. Patients - It contains demographics and details about the patients (first name, last name,
address, gender, email, etc.)
2. Doctors - It stores details of the specialists in the hospital (name, specialization, contact
information, email address)
3. Departments - It has details of departments of hospital like Cardiology, Orthopedics, etc.
The details include name and location of the departments.
4. Nurse - It has information about staff assigned in different departments.
5. Appointments – It is the relationship between doctor and patients.
6. Medications – It records the name and quantity of stock available including dosage form.
7. Pharmacies – It is like dispensary units of medicines which are prescribed.
8. Insurance – It stores information about insurance companies which are covering for
patient’s insurance.
9. Bills – It captures records generated by hospitals for the patients. Also, it represents oneto-many relationship between room and bills.
10. Rooms – It stores information about rooms assigned to patients.


**Relationships Many-To-Many**

• Doctor_department – A doctor can have multiple departments and a department can
also have multiple doctors. It represents many-to-many relationship between doctors
and departments.

• Patient_Insurance – A patient can have multiple insurance policies, also a insurance
company can cover multiple patients. It displays many-to-many relationship between
patients and insurance providers.

• Patient_Doctors – A patient can consult many doctors and also doctors can treat
multiple patients as well. It is taken care by the entity called Appointments.



**Relationships One-To-Many**

• Room_Bills – One room can generate many bills as there can be a lot of patients in the
room. It is represented by the entity named as Bills.

_Note: Pharmacy and Medications are standalone in our schema this hospital management
system does not directly manage pharmacy inventory within the same database. Also, it is
aimed to allow future flexibility of new relations_


**ER Diagram**

<img width="625" height="443" alt="image" src="https://github.com/user-attachments/assets/70fb0bbb-5a94-4e13-9496-1ba38eae4322" />


**Normalization- 3NF**
Normalization in a dataset makes sure to improve integrity of data and reduce redundancy. The
Healthcare management system has been normalized up to third normal form/3NF. It can be
seen with the help of following example:
Patients-Appointments:

• If 1NF – Patient and appointment details are stored in one table which leads to
repetition of patient data.

• If 2NF – We split patients and appointments. Patient details will be stored only once and
appointment references to patient id.

• If 3NF – It includes 2NF and all non-key attributes are dependent on the key. For example
appointment reason or status depend on the appointment id and not on the patient id.





****SCHEMA IMPLEMENTATION USING MYSQL****

After completing the design, the next step is describing schema implementation. Basically, this
schema is prepared in such a way that it ensures data integrity, consistency, security and also
follows the principles of relational database management systems (RDBMS). The structure is in
a manner that it supports implementation of complex queries.
**Building/Creating schema:**
The schema building is initialized with CREATE query in MYSQL. The tables were implemented
using the following:

• Primary keys – for unique identification.

• Foreign keys – to establish relationships among tables.

• Constraints like NOT NULL, UNIQUE and DEFAULT for data reliability.

• Data types such as INT, DECIMAL, VARCHAR, DATE to align with database.

• Other datatypes like ENUM, ON DELETE CASCADE, etc.

The main entities include: Doctors, Patients, Departments, Nurses, Medications, Pharmacies,
Insurance, Rooms, Appointments, Bills.
The Junction tables are also created to solve the problem of relationships:

• Doctor_departments

• Patient_Insurance

• Appointments

• Bills

 Visual representation of table creation queries that were implemented:

 <img width="624" height="276" alt="image" src="https://github.com/user-attachments/assets/46542b2b-0eac-4e8c-80cf-773d2d89ce3b" />
 <img width="625" height="284" alt="image" src="https://github.com/user-attachments/assets/f5d1bee0-4b0e-4966-af9b-87da5e8ad504" />


** Indexing**

Indexing in MySQL is a database structure (tree or hash-based structure) that improves the
speed of retrieving data records on a table. Think of it like the index in the back of a book.
Without it, to find something you might have to read every page. With it, you can jump right to
the section where the information is.

**Purpose**: It speeds up queries that involve operations like SELECT, WHERE, JOIN, ORDER BY
which allows the database engine to avoid scanning every row.


<img width="624" height="310" alt="image" src="https://github.com/user-attachments/assets/a516f492-51b6-4242-9a8b-8d7851a38102" />


• The index (idx_dep_name) allows faster lookup of doctors with the help of department
name.

• The index (idx_room_status) helps is better retrieving of patient rooms for better
allocation.

• Departments are often searched by their names (e.g. Cardiology, Neurology). This index
(idx_dep_name) here speeds up the queries when filtering or joining by department.

• In a hospital, staff frequently check which rooms are Available or Occupied. Since status
has repeating values (ENUM), indexing reduces the time needed to locate the required
rows

**DATA IMPLEMENTATION AND VIEW CREATION**

In this task, realistic sample data is inserted into all the tables in the health management
system. The goal is to demonstrate how a real hospital management system works with data
such as patient records, appointments, billings, etc.

<img width="626" height="319" alt="image" src="https://github.com/user-attachments/assets/b4a55e58-494a-4c81-8469-acd2c2fa3ff1" />

<img width="625" height="324" alt="image" src="https://github.com/user-attachments/assets/0b00b89c-639a-496b-a216-7d4992304054" />

•	Each table contains 5 – 10 rows to ensure sufficient data diversity.

•	This data not only populates the table but also makes it possible to test relationships between the tables (many-to-many, one-to-many) and efficiency of queries using indexing.

**View**
A view in SQL is like a virtual table that is based in the result of Sql query. It does not have any
storage or stores data itself but presents data from one or more tables in a particular format. It
does not store data physically but only displays the output from underlying tables

**View 1:** Total bills per patient
This view displays a financial summary for each patient including the number of bills, total
charges, how much amount has been already paid, how much amount is pending.
It is helpful for:

• Accounting staff to manage billing records.

• Helps in making a decision for follow-ups and reminders about payments by patients.

<img width="625" height="323" alt="image" src="https://github.com/user-attachments/assets/ac9924d6-ac8e-4ccb-af28-7ec5b120fc8e" />

Here we have created a view named as **Patient_Billing_Summary**:

• First it selects patient_id

• Then it creates a patient name column by concatenating first and last name using
CONCAT.

• After that, it counts how many bills each patient has using COUNT. If no bill exists for the
patient, the output will be 0.

• SUM query – adds up all bill amount for each patient. Also referred as Total Bill.

• We have used CASE to distinguish the total paid vs pending amounts. If bill status is
‘Paid’ then add the amount else add zero.

• Similarly same thing is done for ‘Pending’

• JOINS the patient table with bills table on patient id.

• LEFT JOIN makes sure that all the patients are included even those with no bills.

• GROUP BY patient id and patient name



**View Two:** Monthly appointments trend
This view shows the trend of appointments per month, alongwith breaking of complete and
cancelled appointments.
It is helpful for:

• Useful for hospital administrators to keep a check on patient engagement and also gives
insight on doctor workload.

• Identification of season patterns (example cold-fever in winters).

• Assist in human resource allocation and planning.

<img width="625" height="304" alt="image" src="https://github.com/user-attachments/assets/53ab5610-9900-49fa-bced-0b9bfc4f1922" />

Here we have created a view as Monthly_Appointment_Trend:

• DATE_FORMAT - takes the appointment date field in year-month format.

• After that it counts the number of appointments using appointment id using the COUNT
query. It gives total appointments scheduled in a month.

• SUM – for each row if the status is ‘Completed’, add 1 otherwise add 0. It gives total
completed appointments in a month.

• In the same way another SUM is used which check the status of appointments as
‘Cancelled’. It gives total cancelled appointments for each month.

• GROUP BY – groups the results by month. It groups all the appointments happened in
the same month.

• ORDER BY – it sorts the output of appointments monthly in ascending order.





**ADVANCED SQL QUERIES**
In this chapter, advanced SQL queries that demonstrates meaningful business questions in the
healthcare industry. Each query addresses the use of advanced SQL features like joins,
conditional logics, subqueries and other functions. Here, explanation of business insights and
logic will be demonstrated of each procedure created and queries used in it.
**1. Bills Generation:**

<img width="626" height="319" alt="image" src="https://github.com/user-attachments/assets/b237656f-da9c-49f5-a62c-48b59a4db503" />
The procedure is named as generate_bills. It takes three input parameters patient_id, room_id, inp_amount.
What it does?

•	Inserts new row into the bills table.

•	Captures the patient, room, billing amount.

•	Automatically sets the date of the bill to current date.

•	Sets initial payment status as ‘Pending’.


<img width="625" height="329" alt="image" src="https://github.com/user-attachments/assets/7b85ed13-0267-4d1c-b69c-188b7a018c41" />

Business Insight:

•	It automates the billing process. The hospital reception does not have to explicitly use insert queries. It can simply enter patient, room and amount details.

•	It ensures consistency because every bill that is generated is in a standard format with a valid date and pending status.

•	Also, it helps in improving operational efficiency by reducing human error in billing, speeding up the payment workflow and ensuring that bills are properly tracked in the system.

•	From management’s point of view, it allows hospital to maintain up-to-date financial records which is important for annual audit, reporting and insurance claims.


<img width="625" height="135" alt="image" src="https://github.com/user-attachments/assets/045c338f-26b9-4a92-b001-ec384124e4db" />

Here, it is visible in the last entry.
**2.	Patient Visits:**

<img width="625" height="333" alt="image" src="https://github.com/user-attachments/assets/5f1fffd3-9a28-4d11-bbf5-ea0ece6cc1a9" />

The procedure is named as get_appointments_by_patient. It takes one parameter inp_pat_id which is nothing but a unique id of the patient.
What it does?

•	Extract all the details of for the patient whose id is being entered in the input.

•	Joins the appointment table with doctor’s table to process doctor’s name.

•	The fields include appointment id, doctor name, appointment date, appointment status, reason for visit.

•	Results are arranged in descending order by appointments because it helps in displaying the most recent appointments first.

<img width="625" height="340" alt="image" src="https://github.com/user-attachments/assets/79686d52-3a62-4257-8cf8-7092cdc18ce3" />

Business Insight:

•	It gives a complete history of patient’s visits in the hospital.

•	It is useful for doctors as they will can review patient’s previous visits before consultation and also tracks the progress of patient’s healthcare.

•	It is also helpful for hospital reception staff to check upcoming or previous appointments.

•	It also helps in effective hospital operations by reducing manual search via records, saving more time and prevent errors.



Output

<img width="626" height="78" alt="image" src="https://github.com/user-attachments/assets/cfeff5f6-7ae3-4d1e-8c81-4839724ed89f" />

**3.	Busy Average Doctor:**

<img width="625" height="321" alt="image" src="https://github.com/user-attachments/assets/acd2d460-79f2-4c95-9328-c464cd658f4a" />


The name of the procedure is Get_Busy_Doctors_Avg. It does not have any input parameter.
What it does?

•	Joins doctor and appointment table to check how many appointments each doctor has handled.

•	Group by doctor’s id or doctor’s name so that there is one record per doctor at least.

•	In nested query, it calculated average number of appointments per doctor and the outer query uses this average in the having clause.

•	Gives output of only those doctors whose appointment count is grater than average of appointments handled by doctor hospital wise.

Business Insight:

•	It helps in finding out doctors with high demand or doctors who are busy.

•	It can also help in detecting doctors who have high workload and if the hospital requires more staffing.

•	It is also helpful in monitoring performance of doctors as well.

•	It can also be helpful in redistributing work which is assigned to doctors.

Output:

<img width="625" height="323" alt="image" src="https://github.com/user-attachments/assets/b96845ce-e74d-4271-a140-fbab7dd593d3" />

**4.	Medicines Report:**
<img width="624" height="327" alt="image" src="https://github.com/user-attachments/assets/96347614-524f-40d6-a290-b97c9b34ef09" />

It is named as medication_stock_report. It has no parameters.
What it does?

•	It extracts medicine id, medicine name, dosage form and stock quantity from medication table.

•	If stock quantity is equal to 0, it shows ‘Out of stock’, if stock quantity is less than 20 it shows ‘Low stock’. Else, it shows ‘In stock’.

•	It is ordered by ascending order because it ensures the report that lists out of stock or low stock items at the top, so the medical department see the critical items at the top.


Business Insights:

•	It helps in quick identification of medicines which are out of stock or completely unavailable beneficial for inventory management and operations.

•	It highlights stocks which are almost depleted which acts as an early warning to re-order before a stockout happens.

•	Pharmacists can prioritize purchase orders and can ensure that most used drugs like insulin, pain relievers are never unavailable.

•	By monitoring low-stock drugs, hospitals can ensure continuity of patient care.

•	It is natural that medicine stock is a priority action for pharmacists and inventory management.

Output:

<img width="626" height="323" alt="image" src="https://github.com/user-attachments/assets/65606205-bbe9-4ed1-93ee-370c04b919e6" />


**5.	Nurse Allocation:**

<img width="624" height="324" alt="image" src="https://github.com/user-attachments/assets/bba6a184-3782-4134-bbef-cf5deef8867a" />

It is named as nurse_allocation_department_basis.
What it does?

•	It generates nurse allocation report department wise.

•	It starts with department table and uses left join nurse n on d.dep_id = n.dep_id. Basically, it includes all the departments even those where nurses are not assigned.

•	It selects column department name, count for total number of nurses allocated in that department, also group concatenation is done to list down name of all the nurses for that department separated by commas.

•	Then, it is grouped by department so it displays results per department.

Business Insight:

•	It helps us to see how many nurses are assigned to each department.

•	It helps in identifying understaffed departments which is very crucial for patient care because every hospital has some standard ratio for nurse-patient.

•	It is helpful in shift planning, scheduling and accountability.

•	Also, it shows departments which does not have nurses which highlights staffing gaps in those departments that may need immediate HR or managerial actions.

•	It is also helpful in preventing overstaffing in one department and understaffing in another.

Output:

<img width="625" height="323" alt="image" src="https://github.com/user-attachments/assets/2a6fa580-08da-4711-97b3-cbb0feba0728" />

**6.	Cancel Appointment**

<img width="625" height="343" alt="image" src="https://github.com/user-attachments/assets/9fb5dd8b-e522-45aa-9dce-8904ad80e503" />

The procedure is named as Cancel_Appointment. It takes one input as a parameter which is appointment id.

<img width="625" height="343" alt="image" src="https://github.com/user-attachments/assets/9aa9788f-9e99-4fce-a078-71b6a8955453" />

What it does?

•	First, an error handler is defined named as SqlException. If any sql error occurs during the transaction, the system will automatically roll back any partial changes that have happened.

•	The errors include invalid id, foreign key constraints or table lock etc.

•	It returns a message ‘Error: Appointment cancellation failed’ rather than corrupting the data.

•	Then, it begins transaction. Whatever is inside the transaction block, it treats it as one unit. If it is completed – Commit, if it fails -Rollback.

•	Coming to the main logic of this procedure, it updates the status of appointments as ‘Cancelled’ for the input appointment id. This ensures that the appointment is no longer active or scheduled.

•	After that it commits the transaction and returns a message ‘Appointment cancelled successfully’.

Business Insights:

•	It helps in keeping the appointment records consistent as once the appointment is cancelled, it is marked clearly in the system.

•	It helps in preventing overbooking as doctor’s schedule will automatically free up time slots for other patients.

•	Reception staff can easily manage cancellation of appointments without bothering about data corruption.

•	It automates operations which include updating billings, notifying doctors or allocations of rooms which are free.

Output:

<img width="624" height="314" alt="image" src="https://github.com/user-attachments/assets/b6954031-b8b2-4df8-b6e4-048b6d9bb223" />

This figure shows the message – Appointment cancelled successfully.

<img width="625" height="144" alt="image" src="https://github.com/user-attachments/assets/72b70462-91fd-43b8-9bc0-48c696bff276" />

Also, we can check here the status of Appointment id = 15, it is displaying ‘Cancelled’.


**APPLICATION OF CAP THEOREM**

The CAP theorem states that in any distributed database management system it is not possible to simultaneously guarantee all three of the following properties:
**Consistency:**
In layman terms, every read receives the most recent write or an error. In simple words, all the nodes in the system reflect the same data at any given time. For example, if a doctor updates a patient record on one server, all other servers immediately show the updated data when anyone queries it.
In healthcare, Consistency of data is very important when dealing with patient records because inaccurate or outdated data can be dangerous for the operational aspects of the system.
Note: To maintain consistency, the system may delay responses or reject requests until and unless all the nodes are synchronized.
**Availability:**
In availability, every request receives a response even if it is not the latest or current data. The system remains operative and responsive and it does not crash/hang. For example, if one of the servers of hospital database goes down other servers can still handle patient queries and appointment bookings without interruption.
In healthcare, Availability plays a very crucial role in emergency systems (eg. Ambulance data). The system should stay accessible even if multiple servers fail.
Availability may lead serving slightly less useful data if synchronization with other nodes is delayed.
**Partition Tolerance:**
In partition, the system continues to function correctly even if there are communication failures or network partition between distributed nodes. For example, if a network link between Hospital X and Hospital Y goes down, both can still function independently without having any access to each other’s data.
In healthcare, partition tolerance plays a very big role in geographically distributed systems where hospitals are connected via unstable networks.
In order to maintain partition tolerance, consistency and availability has to be sacrificed temporarily until the network recovers.

**Why a distributed system cannot guarantee Consistency, Partition & Availability at the same time?**
In a distributed system, data is stored across multiple nodes. If anything is working perfectly, it might appear that all the three properties are working together. But when a partition happens and some nodes cannot communicate with each other properly, the system is bound to make a choice:

•	In case it prioritizes consistency, it must block requests/returns errors until the data between the nodes is synchronized. It basically means that at this point Availability is lost i.e. the system becomes temporarily unavailable or might get slower.

•	In case it prioritizes Availability, it continues serving requests using the data that is already available in each node. It means consistency is lost at this point because different nodes may have different aspects of data.

Therefore, a distributed system cannot guarantee all the properties at a same time because they are always at a conflict with one another.
1.	CA (Consistency + Availability) – It works efficient when network is reliable.
2.	CP (Consistency + Partition Tolerance) – It prioritize actual data even though some requests fail.
3.	AP (Availability + Partition Tolerance) – It prioritizes uptime even the data is not reliant.





















