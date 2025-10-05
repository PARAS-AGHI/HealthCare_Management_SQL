create database healthcare; 
use healthcare;

create table Patients (
    patient_id int auto_increment primary key,
    first_name varchar(60) not null,
    last_name varchar(60) not null,
    dob date not null,
    gender enum('Male', 'Female', 'Other'),
    phone varchar(15) unique,
    email varchar(100) unique,
    address varchar(500));

create table Doctor (
    doc_id int auto_increment primary key,
    first_name varchar(60) not null,
    last_name varchar(60) not null,
    field_specialization varchar(100) not null,
    phone varchar(20) unique,
    email varchar(100) unique);
    
    
create table Departments (
    dep_id int auto_increment primary key,
    department_name varchar(70) unique,
    location varchar(100) not null);
    
    
create table Nurse (
    nurse_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    dep_id int,
    foreign key (dep_id) references Departments(dep_id));
    
create table Medication (
    med_id int auto_increment primary key,
    med_name varchar(150) not null,
    dosage_form varchar(50),
    stock_quantity int DEFAULT 0
);


create table Pharmacies (
    pharma_id int auto_increment primary key,
    pharma_name varchar(150) not null,
    location varchar(200),
    phone varchar(15)
);

create table Insurance (
    ins_id int auto_increment primary key,
    provider_name varchar(100) not null,
    contact_info varchar(255)
);


create table Room (
    room_id int auto_increment primary key,
    room_no varchar(10) unique not null,
    room_type enum('General', 'ICU', 'Private') not null,
    status enum('Available', 'Occupied') default 'Available'
);


-- Many to many
-- on delete cascade - if a row in parent table is deleted a row in child table will also be deleted

create table Doctor_Department (
    doc_id int,
    dep_id int,
    primary key (doc_id, dep_id),
    foreign key (doc_id) references Doctor(doc_id) on delete cascade,
    foreign key (dep_id) references Departments(dep_id) on delete cascade
);


create table Appointments (
    appn_id int auto_increment primary key,
    patient_id int,
    doc_id int,
    appointment_date datetime not null,
    reason varchar(855),
    status enum('Scheduled', 'Completed', 'Cancelled') default 'Scheduled',
    foreign key (patient_id) references Patients(patient_id) on delete cascade,
    foreign key (doc_id) references Doctor(doc_id) on delete cascade
);

create table Patient_Insurance (
    patient_id int,
    ins_id int,
    policy_number varchar(20) unique not null,
    primary key (patient_id, ins_id),
    foreign key (patient_id) references Patients(patient_id) on delete cascade,
    foreign key (ins_id) references Insurance(ins_id) on delete cascade
);

-- One to many 

create table Bills (
    bill_id int auto_increment primary key,
    patient_id int,
    room_id int,
    amount decimal(10,2) not null,
    bill_date date not null,
    payment_status enum('Pending', 'Paid') default 'Pending',
    foreign key (patient_id) references Patients(patient_id) on delete cascade,
    foreign key (room_id) references Room(room_id) on delete set null
);

-- INDEXES

create index idx_dep_name on Departments(department_name);

create index idx_room_status on Room(status);

 
 
 -- Chapter 3
 
 insert into Patients (first_name, last_name, dob, gender, phone, email, address) values
('John', 'Doe', '1985-06-12', 'Male', '1111111111', 'john.doe@example.com', 'Berlin, Germany'),
('Emily', 'Smith', '1990-03-25', 'Female', '2222222222', 'emily.smith@example.com', 'Munich, Germany'),
('Michael', 'Brown', '1975-11-05', 'Male', '3333333333', 'michael.brown@example.com', 'Hamburg, Germany'),
('Sophia', 'Miller', '2000-01-15', 'Female', '4444444444', 'sophia.miller@example.com', 'Cologne, Germany'),
('David', 'Wilson', '1988-08-08', 'Male', '5555555555', 'david.wilson@example.com', 'Frankfurt, Germany');

insert into Doctor (first_name, last_name, field_specialization, phone, email) values
('Alice', 'Johnson', 'Cardiology', '6666666666', 'alice.johnson@hospital.com'),
('Robert', 'Williams', 'Neurology', '7777777777', 'robert.williams@hospital.com'),
('Linda', 'Taylor', 'Orthopedics', '8888888888', 'linda.taylor@hospital.com'),
('James', 'Anderson', 'Dermatology', '9999999999', 'james.anderson@hospital.com'),
('Olivia', 'Thomas', 'Pediatrics', '1010101010', 'olivia.thomas@hospital.com');


insert into Departments (department_name, location) values
('Cardiology', 'Building A - F2'),
('Neurology', 'Building B - F1'),
('Orthopedics', 'Building A - F3'),
('Dermatology', 'Building C - F1'),
('Pediatrics', 'Building D - F2');

insert into Nurse (first_name, last_name, dep_id) values
('Karen', 'Lopez', 1),
('Daniel', 'Clark', 2),
('Laura', 'Lewis', 3),
('Mark', 'Walker', 4),
('Emma', 'Hall', 5);


insert into Medication (med_name, dosage_form, stock_quantity) values
('Paracetamol', 'Tablet', 200),
('Amoxicillin', 'Capsule', 150),
('Ibuprofen', 'Tablet', 300),
('Cough Syrup', 'Liquid', 100),
('Insulin', 'Injection', 80);


insert into Pharmacies (pharma_name, location, phone) values
('CityCare Pharmacy', 'Berlin Central', '2020202020'),
('MediPlus', 'Munich Downtown', '2121212121'),
('HealthFirst Pharmacy', 'Hamburg Center', '2323232323'),
('Wellness Pharma', 'Cologne West', '2424242424'),
('LifeCare Pharmacy', 'Frankfurt East', '2525252525');


insert into Insurance (provider_name, contact_info) values	
('AOK Health', 'aok-contact@aok.de'),
('TK Insurance', 'tk-support@tk.de'),
('Barmer Insurance', 'barmer@barmer.de'),
('DAK Health', 'dak@dak.de'),
('Allianz Health', 'allianz@allianz.de');


insert into Room (room_no, room_type, status) values
('101', 'General', 'Available'),
('102', 'ICU', 'Occupied'),
('103', 'Private', 'Available'),
('104', 'General', 'Occupied'),
('105', 'Private', 'Available');


insert into Doctor_Department (doc_id, dep_id) values
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5);  


insert into Appointments (patient_id, doc_id, appointment_date, reason, status) values
(1, 1, '2025-09-20 10:00:00', 'Chest pain', 'Scheduled'),
(2, 2, '2025-09-21 11:30:00', 'Headache and dizziness', 'Completed'),
(3, 3, '2025-09-22 09:00:00', 'Back pain', 'Scheduled'),
(4, 4, '2025-09-22 14:00:00', 'Skin rash', 'Cancelled'),
(5, 5, '2025-09-23 15:00:00', 'Child vaccination', 'Scheduled');


insert into Patient_Insurance (patient_id, ins_id, policy_number) values
(1, 1, 'AOK123'),
(1, 2, 'TK456'),
(2, 3, 'BAR789'),
(3, 4, 'DAK321'),
(5, 5, 'ALL654');


insert into Bills (patient_id, room_id, amount, bill_date, payment_status) values
(1, 1, 500.00, '2025-09-18', 'Pending'),
(2, 2, 1500.00, '2025-09-17', 'Paid'),
(3, 3, 800.00, '2025-09-18', 'Pending'),
(4, 4, 1200.00, '2025-09-16', 'Paid'),
(5, 5, 600.00, '2025-09-18', 'Pending');



-- View 1

create view Patient_Billing_Summary as
select
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) as patient_name,
    COUNT(b.bill_id) as total_bills,
    SUM(b.amount) as total_amount,
    SUM(case when b.payment_status = 'Paid' then b.amount else 0 end) as paid_amount,
    SUM(case when b.payment_status = 'Pending' then b.amount else 0 end) as pending_amount
from Patients p
left join Bills b on p.patient_id = b.patient_id
group by p.patient_id, patient_name;



-- View 2

create view Monthly_Appointment_Trend as
select 
    DATE_FORMAT(appointment_date, '%Y-%m') as month,
    COUNT(appn_id) as total_appointments,
    SUM(case when status = 'Completed' then 1 else 0 end) as completed_appointments,
    SUM(case when status = 'Cancelled' then 1 else 0 end) as cancelled_appointments
from Appointments
group by DATE_FORMAT(appointment_date, '%Y-%m')
order by month;



-- Task 4

START TRANSACTION;

-- Step 1: Mark the room as available
UPDATE Room 
SET status = 'Available'
WHERE room_id = 2;

-- Step 2: Mark the patient’s bill as paid
UPDATE Bills 
SET payment_status = 'Paid'
WHERE patient_id = 2
  AND room_id = 2;

COMMIT;



-- *****************************************************8

-- Procedures
call get_busy_doctor(2);
call get_appointments_by_patient(1);
call generate_bills(3, 2, 750.00);
call nurse_allocation_department_basis();
call Medication_Stock_Report();
call Rank_doctors_by_completed_appointments();
call Get_Busy_Doctors_Avg();


select * from bills;

INSERT INTO Doctor (first_name, last_name, field_specialization, phone, email) VALUES
('Alice', 'Brown', 'Cardiology', '1111111111', 'alice.brown@hospital.com'),
('John', 'Smith', 'Neurology', '2222222222', 'john.smith@hospital.com'),
('Emily', 'Clark', 'Orthopedics', '3333333333', 'emily.clark@hospital.com');

INSERT INTO Appointments (patient_id, doc_id, appointment_date, reason, status) VALUES
(1, 1, '2025-09-01 10:00:00', 'Heart Checkup', 'Completed'),
(2, 1, '2025-09-02 11:00:00', 'Follow-up', 'Completed'),
(3, 1, '2025-09-05 12:00:00', 'Routine Checkup', 'Completed'),

(4, 2, '2025-09-01 09:30:00', 'Migraine', 'Completed'),
(5, 2, '2025-09-03 14:00:00', 'Headache', 'Completed'),

(6, 3, '2025-09-04 16:00:00', 'Knee Pain', 'Scheduled');




INSERT INTO Patients (first_name, last_name, dob, gender, phone, email, address)
VALUES ('Sarah', 'Green', '1992-07-20', 'Female', '6666666667', 'sarah.green@example.com', 'Stuttgart, Germany');




call Cancel_Appointment(15);


select * from appointments;



create index idx_appn_patient on Appointments(patient_id);
create index idx_appn_date on Appointments(appointment_date);

 
 
 
create view Doctor_Appointment_Summary as
select doc_id, COUNT(appn_id) AS appointment_count
from Appointments
group by doc_id;



select d.doc_id, CONCAT(d.first_name, ' ', d.last_name) AS doctor_name, s.appointment_count
from Doctor d
join Doctor_Appointment_Summary s on d.doc_id = s.doc_id
where s.appointment_count > (select avg(appointment_count) from Doctor_Appointment_Summary);


 
 
 
 
 
 
 
 
 
 
 
 
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    