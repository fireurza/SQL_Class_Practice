spool F:\Documents\School\INSY3304\Project22_amk.txt
set echo on

--Drop all existing tables

DROP TABLE apptdetail_lxs;
DROP TABLE appointment_lxs;
DROP TABLE patient_lxs;
DROP TABLE doctor_lxs;
DROP TABLE insurance_lxs;
DROP TABLE status_lxs;
DROP TABLE reason_lxs;
DROP TABLE block_lxs;
DROP TABLE billingType_lxs;

--Create all tables

CREATE TABLE billingType_lxs(
billingType  VARCHAR(3)  NOT NULL,
rateTypeDesc  VARCHAR(15),
PRIMARY KEY (billingType)
);

CREATE TABLE block_lxs(
blockCode VARCHAR(2) NOT NULL,
blockdesc VARCHAR(10),
blocktime VARCHAR(15),
PRIMARY KEY(blockCode)
);

CREATE TABLE reason_lxs(
apptReasonCode VARCHAR(4)  NOT NULL,
apptReasonDesc VARCHAR(30),
PRIMARY KEY (apptReasonCode)
);


CREATE TABLE status_lxs(
apptStatusCode VARCHAR(3) NOT NULL,
apptStatusDesc VARCHAR(25),
PRIMARY KEY (apptStatusCode)
);


CREATE TABLE insurance_lxs(
insCoID NUMBER(4) NOT NULL,
insCoName VARCHAR(20),
PRIMARY KEY (insCoID)
);



CREATE TABLE doctor_lxs(
doctorID NUMBER(2) NOT NULL,
doctorFname VARCHAR(15),
doctorLname VARCHAR(15),
PRIMARY KEY(doctorID)
);



CREATE TABLE patient_lxs(
patientID NUMBER(3) NOT NULL,
patientFname VARCHAR(15) ,
patientLname VARCHAR(15),
patientPhone VARCHAR(15) ,
PRIMARY KEY(patientID)
);



CREATE TABLE appointment_lxs(
apptID NUMBER(3) NOT NULL,
apptDate DATE,
apptTime VARCHAR(8),
patientID NUMBER(3),
doctorID NUMBER(2),
billingType VARCHAR(3),
insCoID NUMBER(4),
apptStatusCode VARCHAR(3),
PRIMARY KEY(apptID),
FOREIGN KEY(patientID) REFERENCES patient_lxs,
FOREIGN KEY(doctorID) REFERENCES doctor_lxs,
FOREIGN KEY(billingType) REFERENCES billingType_lxs,
FOREIGN KEY(insCoID) REFERENCES insurance_lxs,
FOREIGN KEY(apptStatusCode) REFERENCES status_lxs
);




CREATE TABLE ApptDetail_lxs(
apptID NUMBER(3) NOT NULL,
apptReasonCode VARCHAR(4) NOT NULL,
blockCode VARCHAR(2),
PRIMARY KEY(apptID,apptReasonCode),
FOREIGN KEY(apptID) REFERENCES appointment_lxs,
FOREIGN KEY(apptReasonCode) REFERENCES reason_lxs,
FOREIGN KEY(blockCode) REFERENCES block_lxs
);


--Descriptions for each table



DESCRIBE billingType_lxs

DESCRIBE block_lxs

DESCRIBE reason_lxs

DESCRIBE status_lxs

DESCRIBE insurance_lxs

DESCRIBE doctor_lxs

DESCRIBE patient_lxs

DESCRIBE appointment_lxs

DESCRIBE ApptDetail_lxs


COMMIT;

-- PART II
   
--INSERT 



INSERT INTO billingType_lxs
VALUES ('I','Insurance');

INSERT INTO billingType_lxs
VALUES ('SP','Self Pay');

INSERT INTO billingType_lxs
VALUES ('WC','Worker''s Comp');



INSERT INTO block_lxs
VALUES ('L1','Level 1','10 Minutes');

INSERT INTO block_lxs
VALUES ('L2','Level 2','15 Minutes');

INSERT INTO block_lxs
VALUES ('L3','Level 3','20 Minutes');

INSERT INTO block_lxs
VALUES ('L4','Level 4','30 Minutes');



INSERT INTO reason_lxs
VALUES ('NP','New Patient');

INSERT INTO reason_lxs
VALUES ('GBP','General Back Pain');

INSERT INTO reason_lxs
VALUES ('PSF','Post-Surgery Follow Up');

INSERT INTO reason_lxs
VALUES ('SR','Sature Removal');

INSERT INTO reason_lxs
VALUES ('PT','Physical Therapy');

INSERT INTO reason_lxs
VALUES ('AI','Auto Injury');



INSERT INTO status_lxs
VALUES ('CM','Complete');

INSERT INTO status_lxs
VALUES ('CN','Confirmed');

INSERT INTO status_lxs
VALUES ('NC','Not Confirmed');



INSERT INTO insurance_lxs
VALUES (323,'Humana');

INSERT INTO insurance_lxs
VALUES (129,'Blue Cross');

INSERT INTO insurance_lxs
VALUES (210,'State Farm');

INSERT INTO insurance_lxs
VALUES (135,'TriCare');



INSERT INTO doctor_lxs
VALUES (2,'Michael','Smith');

INSERT INTO doctor_lxs
VALUES (5,'Janice','May');

INSERT INTO doctor_lxs
VALUES (3,'Ray','Schultz');



INSERT INTO patient_lxs
VALUES (101,'Wesley','Tanner','8175551193');

INSERT INTO patient_lxs
VALUES (100,'Breanna','Rhodes','2145559191');

INSERT INTO patient_lxs
VALUES (15,'Jeff','Miner','4695552301');

INSERT INTO patient_lxs
VALUES (77,'Kim','Jackson','8175554911');

INSERT INTO patient_lxs
VALUES (119,'Mary','Vaughn','8175552334');

INSERT INTO patient_lxs
VALUES (97,'Chris','Mancha','4695553440');

INSERT INTO patient_lxs
VALUES (28,'Renee','Walker','2145559285');

INSERT INTO patient_lxs
VALUES (105,'Johny','Redmond','2145551084');

INSERT INTO patient_lxs
VALUES (84,'James','Clayton','2145559285');

INSERT INTO patient_lxs
VALUES (23,'Shelby','Day','8175551198');


INSERT INTO appointment_lxs
VALUES (101,'1-SEP-2018','9:00AM',101,2,'I',323,'CM');

INSERT INTO appointment_lxs
VALUES (102,'1-SEP-2018','9:00AM',100,5,'I',129,'CM');

INSERT INTO appointment_lxs
VALUES (103,'1-SEP-2018','9:30AM',15,2,'SP',NULL,'CM');

INSERT INTO appointment_lxs
VALUES (104,'1-SEP-2018','9:30AM',77,3,'WC',210,'CM');

INSERT INTO appointment_lxs
VALUES (105,'1-SEP-2018','9:45AM',119,2,'I',129,'CM');

INSERT INTO appointment_lxs
VALUES (106,'1-SEP-2018','10:00AM',97,3,'SP',NULL,'CN');

INSERT INTO appointment_lxs
VALUES (107,'1-SEP-2018','10:30AM',28,3,'I',129,'CN');

INSERT INTO appointment_lxs
VALUES (108,'1-SEP-2018','10:30AM',105,2,'I',323,'NC');

INSERT INTO appointment_lxs
VALUES (109,'1-SEP-2018','11:00AM',84,5,'I',135,'CN');

INSERT INTO appointment_lxs
VALUES (110,'1-SEP-2018','11:00AM',84,3,'I',135,'CN');

INSERT INTO appointment_lxs
VALUES (111,'1-SEP-2018','1:00PM',23,3,'I',323,'NC');



INSERT INTO ApptDetail_lxs
VALUES (101,'NP','L1');

INSERT INTO ApptDetail_lxs
VALUES (101,'GBP','L2');

INSERT INTO ApptDetail_lxs
VALUES (102,'PSF','L1');

INSERT INTO ApptDetail_lxs
VALUES (102,'SR','L1');

INSERT INTO ApptDetail_lxs
VALUES (103,'PSF','L1');

INSERT INTO ApptDetail_lxs
VALUES (104,'PT','L3');

INSERT INTO ApptDetail_lxs
VALUES (105,'NP','L1');

INSERT INTO ApptDetail_lxs
VALUES (105,'AI','L2');

INSERT INTO ApptDetail_lxs
VALUES (106,'PT','L4');

INSERT INTO ApptDetail_lxs
VALUES (107,'PT','L3');

INSERT INTO ApptDetail_lxs
VALUES (108,'GBP','L2');

INSERT INTO ApptDetail_lxs
VALUES (109,'PSF','L1');

INSERT INTO ApptDetail_lxs
VALUES (110,'PT','L4');

INSERT INTO ApptDetail_lxs
VALUES (111,'PT','L4');

COMMIT;

--close and stop logging
spool off
set echo off