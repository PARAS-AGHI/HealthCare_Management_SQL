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



**CHAPTER ONE: DATABASE DESIGN AND NORMALIZATION**

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





****CHAPTER TWO: SCHEMA IMPLEMENTATION USING MYSQL****

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
Purpose: It speeds up queries that involve operations like SELECT, WHERE, JOIN, ORDER BY
which allows the database engine to avoid scanning every row.













































