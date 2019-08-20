--Aaron Michael Kurth
--Project 3

spool F:\Documents\School\INSY3304\Project3_amk.txt

set echo on

-Project 3 formating
--#1 Show headings in entirety
COLUMN PatientPhone FORMAT a12
COLUMN Billingtype FORMAT a11
COLUMN BlockCode FORMAT a9
COLUMN ApptStatusCode FORMAT a14
COLUMN ApptReasonCode FORMAT a14
COLUMN ReasonCode FORMAT a10
COLUMN PayType FORMAT a7
COLUMN Description FORMAT a13
COLUMN "Pay Type" FORMAT a8
COLUMN "Block Code" FORMAT a10
COLUMN "Reason Code" FORMAT a11
COLUMN "Description" FORMAT a22

--#2 Setting line size to 120
SET LINESIZE 120



-- Project 2 Tables

--drop tables
DROP TABLE APPTDETAIL_amk;
DROP TABLE APPOINTMENT_amk;
DROP TABLE REASON_amk;
DROP TABLE STATUS_amk;
DROP TABLE BLOCK_amk;
DROP TABLE PATIENT_amk;
DROP TABLE DOCTOR_amk;
DROP TABLE BILLINGTYPE_amk;
DROP TABLE INSCO_amk;

--Part Ia. Create Tables

CREATE TABLE INSCO_amk (
InsCoID		NUMBER(3),
InsCoName	VARCHAR(20),
PRIMARY KEY (InsCoID)
);

CREATE TABLE BILLINGTYPE_amk (
Billingtype		VARCHAR(2),
BillingTypeDesc	VARCHAR(20)	NOT NULL,
PRIMARY KEY (BillingType)
);

CREATE TABLE DOCTOR_amk (
DoctorID		NUMBER(1),
DoctorFName	VARCHAR(20)	NOT NULL,
DoctorLName	VARCHAR(20)	NOT NULL,
PRIMARY KEY (DoctorID)
);

CREATE TABLE PATIENT_amk (
PatientID		NUMBER(3),
PatientFName	VARCHAR(20)	NOT NULL,
PatientLName	VARCHAR(20)	NOT NULL,
PatientPhone	VARCHAR(10),
PRIMARY KEY (PatientID)
);

CREATE TABLE BLOCK_amk (
BlockCode	CHAR(2),
BlockDesc	VARCHAR(10)	NOT NULL,
BlockTime		VARCHAR(10)	NOT NULL,
PRIMARY KEY (BlockCode)
);

CREATE TABLE STATUS_amk (
ApptStatusCode	CHAR(2),
ApptStatusDesc	VARCHAR(20)	NOT NULL,
PRIMARY KEY (ApptStatusCode)
);

CREATE TABLE REASON_amk (
ApptReasonCode	VARCHAR(3),
ApptReasonDesc	VARCHAR(30)	NOT NULL,
PRIMARY KEY (ApptReasonCode)
);

CREATE TABLE APPOINTMENT_amk (
ApptID		NUMBER(3),
ApptDate		DATE		NOT NULL,
ApptTime		VARCHAR(10)	NOT NULL,
PatientID		NUMBER(3)	NOT NULL,
DoctorID		NUMBER(1)	NOT NULL,
BillingType	VARCHAR(2)	NOT NULL,
InsCoID		NUMBER(3),
ApptStatusCode	CHAR(2)		NOT NULL,
PRIMARY KEY (ApptID),
FOREIGN KEY (InsCoID) REFERENCES INSCO_amk,
FOREIGN KEY (BillingType) REFERENCES BILLINGTYPE_amk,
FOREIGN KEY (DoctorID) REFERENCES DOCTOR_amk,
FOREIGN KEY (PatientID) REFERENCES PATIENT_amk,
FOREIGN KEY (ApptStatusCode) REFERENCES STATUS_amk
);

CREATE TABLE APPTDETAIL_amk (
ApptID		NUMBER(3),
ApptReasonCode	VARCHAR(3),
BlockCode	CHAR(2)		NOT NULL,
PRIMARY KEY (ApptID, ApptReasonCode),
FOREIGN KEY (BlockCode) REFERENCES BLOCK_amk
);


--Part Ib. Describe Tables

DESCRIBE INSCO_amk
DESCRIBE BILLINGTYPE_amk
DESCRIBE DOCTOR_amk
DESCRIBE PATIENT_amk
DESCRIBE BLOCK_amk
DESCRIBE STATUS_amk
DESCRIBE REASON_amk
DESCRIBE APPOINTMENT_amk
DESCRIBE APPTDETAIL_amk

--Part II. Insert Data

INSERT ALL
	INTO INSCO_amk VALUES (323,'Humana')
	INTO INSCO_amk VALUES (129,'Blue Cross')
	INTO INSCO_amk VALUES (210,'State Farm')
	INTO INSCO_amk VALUES (135,'TriCare')
	INTO BILLINGTYPE_amk VALUES ('I','Insurance')
	INTO BILLINGTYPE_amk VALUES ('SP','Self Pay')
	INTO BILLINGTYPE_amk VALUES ('WC','Worker''s Comp')
	INTO DOCTOR_amk VALUES (2,'Michael','Smith')
	INTO DOCTOR_amk VALUES (5,'Janice','May')
	INTO DOCTOR_amk VALUES (3,'Ray','Schultz')
	INTO PATIENT_amk VALUES (101,'Wesley','Tanner','8175551193')
	INTO PATIENT_amk VALUES (100,'Breanna','Rhodes','2145559191')
	INTO PATIENT_amk VALUES (15,'Jeff','Miner','4695552301')
	INTO PATIENT_amk VALUES (77,'Kim','Jackson','8175554911')
	INTO PATIENT_amk VALUES (119,'Mary','Vaughn','8175552334')
	INTO PATIENT_amk VALUES (97,'Chris','Mancha','4695553340')
	INTO PATIENT_amk VALUES (28,'Renee','Walker','2145559285')
	INTO PATIENT_amk VALUES (105,'Johnny','Redmond','2145551084')
	INTO PATIENT_amk VALUES (84,'James','Clayton','2145559285')
	INTO PATIENT_amk VALUES (23,'Shelby','Day','8175551198')
	INTO BLOCK_amk VALUES ('L1','Level 1','10 Minutes')
	INTO BLOCK_amk VALUES ('L2','Level 2','15 Minutes')
	INTO BLOCK_amk VALUES ('L3','Level 3','20 Minutes')
	INTO BLOCK_amk VALUES ('L4','Level 4','30 Minutes')
	INTO STATUS_amk VALUES ('CM','Complete')
	INTO STATUS_amk VALUES ('CN','Confirmed')
	INTO STATUS_amk VALUES ('NC','Not Confirmed')
	INTO REASON_amk VALUES ('NP','New Patient')
	INTO REASON_amk VALUES ('GBP','General Back Pain')
	INTO REASON_amk VALUES ('PSF','Post-Surgery Follow Up')
	INTO REASON_amk VALUES ('SR','Suture Removal')
	INTO REASON_amk VALUES ('PT','Physical Therapy')
	INTO REASON_amk VALUES ('AI','Auto Injury')
	INTO APPOINTMENT_amk VALUES (101,'01-SEP-2018','9:00 AM',101,2,'I',323,'CM')
	INTO APPOINTMENT_amk VALUES (102,'01-SEP-2018','9:00 AM',100,5,'I',129,'CM')
	INTO APPOINTMENT_amk VALUES (103,'01-SEP-2018','9:30 AM',15,2,'SP',NULL,'CM')
	INTO APPOINTMENT_amk VALUES (104,'01-SEP-2018','9:40 AM',77,3,'WC',210,'CM')
	INTO APPOINTMENT_amk VALUES (105,'01-SEP-2018','9:45 AM',119,2,'I',129,'CM')
	INTO APPOINTMENT_amk VALUES (106,'01-SEP-2018','10:00 AM',97,3,'SP',NULL,'CN')
	INTO APPOINTMENT_amk VALUES (107,'01-SEP-2018','10:30 AM',28,3,'I',129,'CN')
	INTO APPOINTMENT_amk VALUES (108,'01-SEP-2018','10:30 AM',105,2,'I',323,'NC')
	INTO APPOINTMENT_amk VALUES (109,'01-SEP-2018','11:00 AM',84,5,'I',135,'CN')
	INTO APPOINTMENT_amk VALUES (110,'01-SEP-2018','11:15 AM',84,3,'I',135,'CN')
	INTO APPOINTMENT_amk VALUES (111,'01-SEP-2018','1:00 PM',23,3,'I',323,'NC')
	INTO APPTDETAIL_amk VALUES  (101,'NP','L1')
	INTO APPTDETAIL_amk VALUES  (101,'GBP','L2')
	INTO APPTDETAIL_amk VALUES  (102,'PSF','L1')
	INTO APPTDETAIL_amk VALUES  (102,'SR','L1')
	INTO APPTDETAIL_amk VALUES  (103,'PSF','L1')
	INTO APPTDETAIL_amk VALUES  (104,'PT','L3')
	INTO APPTDETAIL_amk VALUES  (105,'NP','L1')
	INTO APPTDETAIL_amk VALUES  (105,'AI','L2')
	INTO APPTDETAIL_amk VALUES  (106,'PT','L4')
	INTO APPTDETAIL_amk VALUES  (107,'PT','L3')
	INTO APPTDETAIL_amk VALUES  (108,'GBP','L2')
	INTO APPTDETAIL_amk VALUES  (109,'PSF','L1')
	INTO APPTDETAIL_amk VALUES  (110,'PT','L4')
	INTO APPTDETAIL_amk VALUES  (111,'PT','L4')
SELECT * FROM dual;

COMMIT;

--PART IIb. Retrieve Data


SELECT * FROM INSCO_amk;
SELECT * FROM BILLINGTYPE_amk;
SELECT * FROM DOCTOR_amk;
SELECT * FROM PATIENT_amk;
SELECT * FROM BLOCK_amk;
SELECT * FROM STATUS_amk;
SELECT * FROM REASON_amk;
SELECT * FROM APPOINTMENT_amk;
SELECT * FROM APPTDETAIL_amk;

--PART III. Make changes

UPDATE PATIENT_amk
	SET PatientPhone = '2145551234'
	WHERE PatientID = 15;

INSERT INTO PATIENT_amk
	VALUES (120,'Amanda','Green',NULL);

INSERT INTO BLOCK_amk
	VALUES ('L5','Level 5','45 minutes');

INSERT INTO REASON_amk
	VALUES ('CSW','Complete Spinal Workup');

INSERT INTO INSCO_amk
	VALUES (324,'Cigna');

UPDATE APPOINTMENT_amk
	SET ApptDate = '02-SEP-2018'
	WHERE ApptID = 109 OR ApptID = 110 OR ApptID = 111;

INSERT INTO APPOINTMENT_amk
	VALUES (112,'03-SEP-2018','10:30 AM',120,2,'WC',324,'NC');

INSERT ALL
	INTO APPTDETAIL_amk VALUES (112,'NP','L1')
	INTO APPTDETAIL_amk VALUES (112,'CSW','L5')
SELECT * FROM dual;

COMMIT;

--PART IV. Sorted Select

SELECT * FROM INSCO_amk
	ORDER BY InsCoID;
SELECT * FROM BILLINGTYPE_amk
	ORDER BY BillingType;
SELECT * FROM DOCTOR_amk
	ORDER BY DoctorID;
SELECT * FROM PATIENT_amk
	ORDER BY PatientID;
SELECT * FROM BLOCK_amk
	ORDER BY BlockCode;
SELECT * FROM STATUS_amk
	ORDER BY ApptStatusCode;
SELECT * FROM REASON_amk
	ORDER BY ApptReasonCode;
SELECT * FROM APPOINTMENT_amk
	ORDER BY ApptID;
SELECT * FROM APPTDETAIL_amk
	ORDER BY ApptID, ApptReasonCode;



--Project 3 steps

--#4 Drop BlockTime and add new BlockMinutes and update each row
ALTER TABLE BLOCK_amk
DROP COLUMN BlockTime;

ALTER TABLE BLOCK_amk
	ADD BlockMinutes Number(3);

UPDATE BLOCK_amk
	SET BlockMinutes = 10
	WHERE BlockCode = 'L1';

UPDATE BLOCK_amk
	SET BlockMinutes = 15
	WHERE BlockCode = 'L2';

UPDATE BLOCK_amk
	SET BlockMinutes = 20
	WHERE BlockCode = 'L3';

UPDATE BLOCK_amk
	SET BlockMinutes = 30
	WHERE BlockCode = 'L4';

UPDATE BLOCK_amk
	SET BlockMinutes = 45
	WHERE BlockCode = 'L5';


--#5 Add new appt by generating ApptID and apptdetails
INSERT INTO APPOINTMENT_amk
	VALUES ((SELECT MAX(ApptID) + 1 FROM APPOINTMENT_amk),'03-SEP-2018','11:00 AM',15,2,'SP',NULL,'CN');

INSERT INTO APPTDETAIL_amk
	VALUES ((SELECT MAX(ApptID) + 1 FROM APPTDETAIL_amk),'PSF','L2');

--#6 add new Appointment to appointment and apptdetails
INSERT INTO APPOINTMENT_amk
	VALUES ((SELECT MAX(ApptID) + 1 FROM APPOINTMENT_amk),'04-SEP-2018','09:00 AM',101,3,'I',323,'NC');

INSERT INTO APPTDETAIL_amk
	VALUES ((SELECT MAX(ApptID) + 1 FROM APPTDETAIL_amk),'PT','L4');

--#7 Add new appt status
INSERT INTO STATUS_amk
	VALUES ('CX','Cancelled');

--#8 Update apptstatus for 108
UPDATE APPOINTMENT_amk
	SET ApptStatusCode = 'CX'
	WHERE ApptID = 108;

--#9 Commit
COMMIT;

--#10 List patient with no number
SELECT PatientID, PatientFName, PatientLName
	FROM PATIENT_amk
	WHERE PatientPhone IS NULL;

--#11 list the count of unique insurance companies
SELECT COUNT(DISTINCT InsCoID) AS "Insurance Co Count" FROM APPOINTMENT_amk;

--#12 Count appt per reason code
SELECT ApptReasonCode AS ReasonCode, COUNT(ApptID) AS ApptCount
	FROM APPTDETAIL_amk
	GROUP BY ApptReasonCode;

--#13 List paytype and count appt per type
SELECT BillingType AS PayType, COUNT(ApptID) AS PayCount
	FROM APPOINTMENT_amk
	GROUP BY BillingType;

--#14 list all appt detail columns in order
SELECT ApptID, ApptReasonCode AS ReasonCode, BlockCode
	FROM APPTDETAIL_amk
	ORDER BY ApptID, ReasonCode;

#15 List avg of minutes for rows in appt detail
SELECT CONCAT(AVG(BlockMinutes), ' Minutes')
	AS "Avg Appt Time"
	FROM APPTDETAIL_amk
	JOIN BLOCK_amk ON APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode;

--#16 list appt id, date, pat id, pat last name, doc id, doc last name, appt status desc for all appt on or after 9/2/18. format date as mm/dd/yy
SELECT ApptID AS "Appt ID", TO_CHAR(ApptDate, 'mm/dd/yy') AS "Date", APPOINTMENT_amk.PatientID AS "Patient ID", PATIENT_amk.PatientLName AS "Patient Last Name", APPOINTMENT_amk.DoctorID AS "Doctor ID", DOCTOR_amk.DoctorLName AS "Doctor Last Name", STATUS_amk.ApptStatusDesc AS "Appt Status Desc"
	FROM APPOINTMENT_amk, PATIENT_amk, DOCTOR_amk, STATUS_amk
	WHERE APPOINTMENT_amk.PatientID = PATIENT_amk.PatientID
	AND APPOINTMENT_amk.DoctorID = DOCTOR_amk.DoctorID
	AND APPOINTMENT_amk.ApptStatusCode = STATUS_amk.ApptStatusCode
	AND ApptDate >= '02-SEP-2018';

--#17
SELECT APPOINTMENT_amk.ApptID AS "Appt ID", ApptDate AS "Date", ApptTime AS "Time", BLOCK_amk.BlockMinutes AS "Total Minutes"
	FROM APPOINTMENT_amk, BLOCK_amk, APPTDETAIL_amk
	WHERE APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID
	AND APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode
	GROUP BY APPOINTMENT_amk.ApptID, ApptDate,ApptTime, BLOCK_amk.BlockMinutes;

--#18
SELECT BLOCK_amk.BlockCode AS "BlockCode", BlockDesc AS "Description", COUNT(APPOINTMENT_amk.ApptID) AS "Count"
	FROM BLOCK_amk, APPOINTMENT_amk, APPTDETAIL_amk
	WHERE BLOCK_amk.BlockCode = APPTDETAIL_amk.BlockCode
	AND APPTDETAIL_amk.ApptID = APPOINTMENT_amk.ApptID
	GROUP BY BLOCK_amk.BlockCode, BlockDesc
	ORDER BY COUNT(APPOINTMENT_amk.ApptID) DESC;

--#19
SELECT PATIENT_amk.PatientID AS "Patient ID", PatientFName AS "First Name", PatientLName AS "Last Name", '(' || SUBSTR(PatientPhone, 1,3) ||')'|| SUBSTR(PatientPhone, 4,3) ||'-'|| SUBSTR(PatientPhone, 7,4) AS "Phone"
	FROM PATIENT_amk
	ORDER BY PATIENT_amk.PatientID;

--#20
SELECT BILLINGTYPE_amk.BillingType AS "Pay Type", BillingTypeDesc AS "Description", COUNT(APPOINTMENT_amk.ApptID) AS "Count"
	FROM BILLINGTYPE_amk, APPOINTMENT_amk
	WHERE BILLINGTYPE_amk.BillingType = APPOINTMENT_amk.BillingType
	GROUP BY BILLINGTYPE_amk.BillingType, BillingTypeDesc
	ORDER BY COUNT(APPOINTMENT_amk.ApptID) DESC;

--#21
SELECT PATIENT_amk.PatientID AS "Patient ID", PatientFName AS "First Name", PatientLName AS "Last Name", '(' || SUBSTR(PatientPhone, 1,3) ||')'|| SUBSTR(PatientPhone, 4,3) ||'-'|| SUBSTR(PatientPhone, 7,4) AS "Phone"
	FROM PATIENT_amk, APPOINTMENT_amk
	WHERE PATIENT_amk.PatientID = APPOINTMENT_amk.PatientID
	AND APPOINTMENT_amk.BillingType = 'SP';

--#22
SELECT ApptID AS "Appt ID", TO_CHAR(ApptDate, 'mm-dd-yy') AS "Date", APPOINTMENT_amk.PatientID AS "Patient ID", PATIENT_amk.PatientLName AS "Patient Last Name", APPOINTMENT_amk.DoctorID AS "Doctor ID", DOCTOR_amk.DoctorLName AS "Doctor Last Name", BILLINGTYPE_amk.BillingType AS "Pay Type", STATUS_amk.ApptStatusDesc AS "Appt Status Desc"
	FROM APPOINTMENT_amk, PATIENT_amk, DOCTOR_amk, STATUS_amk, BILLINGTYPE_amk
	WHERE APPOINTMENT_amk.PatientID = PATIENT_amk.PatientID
	AND APPOINTMENT_amk.DoctorID = DOCTOR_amk.DoctorID
	AND APPOINTMENT_amk.ApptStatusCode = STATUS_amk.ApptStatusCode
	AND APPOINTMENT_amk.BillingType = BILLINGTYPE_amk.BillingType
	AND ApptDate >= '03-SEP-2018'
	ORDER BY ApptID;

--#23
SELECT DOCTOR_amk.DoctorID AS "Dr ID", (DoctorFName ||' '|| DoctorLName) AS "Dr Name", COUNT(APPOINTMENT_amk.ApptID) AS "Appt Count"
	FROM DOCTOR_amk, APPOINTMENT_amk
	WHERE DOCTOR_amk.DoctorID = APPOINTMENT_amk.DoctorID
	GROUP BY DOCTOR_amk.DoctorID, DoctorFName, DoctorLName
	ORDER BY DoctorLName;

--#24
SELECT PATIENT_amk.PatientID AS "Patient ID", PatientFName AS "Patient First Name", PatientLName AS "Patient Last Name", COUNT(APPOINTMENT_amk.ApptID) AS "Appt Count"
	FROM PATIENT_amk, APPOINTMENT_amk
	WHERE PATIENT_amk.PatientID = APPOINTMENT_amk.PatientID
	GROUP BY PATIENT_amk.PatientID, PatientFName, PatientLName
	ORDER BY COUNT(APPOINTMENT_amk.ApptID) DESC;

--#25
SELECT APPOINTMENT_amk.ApptID AS "Appt", TO_CHAR(ApptDate, 'mm-dd-yy') AS "Date", APPOINTMENT_amk.PatientID AS "Patient ID", (PATIENT_amk.PatientFName ||' '|| PATIENT_amk.PatientLName) AS "Patient Name", APPOINTMENT_amk.DoctorID AS "Dr ID", DOCTOR_amk.DoctorLName AS "Dr Name", COUNT (APPTDETAIL_amk.ApptReasonCode) AS "Code Count"
	FROM APPOINTMENT_amk, PATIENT_amk, DOCTOR_amk, APPTDETAIL_amk
	WHERE APPOINTMENT_amk.PatientID = PATIENT_amk.PatientID
	AND APPOINTMENT_amk.DoctorID = DOCTOR_amk.DoctorID
	AND APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID
	GROUP BY APPOINTMENT_amk.ApptID,ApptDate, APPOINTMENT_amk.PatientID, PATIENT_amk.PatientFName, PATIENT_amk.PatientLName, APPOINTMENT_amk.DoctorID, DOCTOR_amk.DoctorLName
	ORDER BY COUNT (APPTDETAIL_amk.ApptReasonCode) DESC, APPOINTMENT_amk.ApptID;

--#26
SELECT APPOINTMENT_amk.ApptID AS "ApptID", ApptDate AS "Date", ApptTime AS "Time", SUM(BLOCK_amk.BlockMinutes) AS "Total Minutes"
	FROM APPOINTMENT_amk, BLOCK_amk, APPTDETAIL_amk
	WHERE APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID 
	AND APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode
	GROUP BY APPOINTMENT_amk.ApptID, ApptDate, ApptTime
	HAVING SUM(BLOCK_amk.BlockMinutes) = 
		(SELECT MAX(sumQty) FROM (SELECT ApptID, SUM(BLOCK_amk.BlockMinutes) sumQty
							FROM APPTDETAIL_amk, BLOCK_amk
							WHERE APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode
							GROUP BY ApptID));

--#27
SELECT DOCTOR_amk.DoctorID AS "Dr ID", (DoctorFName ||' '|| DoctorLName) AS "Name", COUNT(APPOINTMENT_amk.ApptID) AS "Appt Count"
	FROM DOCTOR_amk, APPOINTMENT_amk
	WHERE DOCTOR_amk.DoctorID = APPOINTMENT_amk.DoctorID
	GROUP BY DOCTOR_amk.DoctorID, DoctorFName, DoctorLName
	HAVING COUNT(APPOINTMENT_amk.ApptID) =
		(SELECT MIN(docQty) FROM (SELECT DoctorID, COUNT(ApptID) docQty
						FROM APPOINTMENT_amk
						GROUP BY DoctorID));

--#28
SELECT APPOINTMENT_amk.ApptID AS "Appt ID", ApptDate AS "Date", APPOINTMENT_amk.PatientID AS "Patient ID", PATIENT_amk.PatientLName AS "Patient Name", APPOINTMENT_amk.DoctorID AS "Doctor ID", DOCTOR_amk.DoctorLName AS "Doctor Name"
	FROM APPOINTMENT_amk, PATIENT_amk, DOCTOR_amk, BLOCK_AMK, APPTDETAIL_amk
	WHERE APPOINTMENT_amk.PatientID = PATIENT_amk.PatientID
	AND APPOINTMENT_amk.DoctorID = DOCTOR_amk.DoctorID
	AND APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID
	AND APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode
	GROUP BY APPOINTMENT_amk.ApptID, ApptDate, APPOINTMENT_amk.PatientID, PATIENT_amk.PatientLName, APPOINTMENT_amk.DoctorID, DOCTOR_amk.DoctorLName
	HAVING SUM(BLOCK_amk.BlockMinutes) >= 30
	ORDER BY SUM(BLOCK_amk.BlockMinutes) DESC, APPOINTMENT_amk.ApptID;
	
--#29
SELECT APPOINTMENT_amk.ApptID AS "Appt ID", ApptDate AS "Date", PATIENT_amk.PatientLName AS "Patient", DOCTOR_amk.DoctorLName AS "Doctor", SUM(BLOCK_amk.BlockMinutes) AS "TotalMinutes"
	FROM APPOINTMENT_amk, PATIENT_amk, DOCTOR_amk, APPTDETAIL_amk, BLOCK_amk
	WHERE APPOINTMENT_amk.PatientID = PATIENT_amk.PatientID
	AND APPOINTMENT_amk.DoctorID = DOCTOR_amk.DoctorID
	AND APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID
	AND APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode
	GROUP BY APPOINTMENT_amk.ApptID, ApptDate, PATIENT_amk.PatientLName, DOCTOR_amk.DoctorLName
	HAVING SUM(BLOCK_amk.BlockMinutes) > (SELECT AVG(BlockMinutes)
						FROM BLOCK_amk
						INNER JOIN APPTDETAIL_amk ON APPTDETAIL_amk.BlockCode = BLOCK_amk.BlockCode)
	ORDER BY APPOINTMENT_amk.ApptID;
	
--#30
SELECT APPOINTMENT_amk.ApptID AS "ApptID", ApptDate AS "Date", PATIENT_amk.PatientLName AS "Patient", BILLINGTYPE_amk.BillingType AS "PayType", INSCO_amk.InsCoName AS "InsCo", COUNT(APPTDETAIL_amk.ApptReasonCode) AS "ReasonCount"
	FROM APPOINTMENT_amk, PATIENT_amk, BILLINGTYPE_amk, INSCO_amk, APPTDETAIL_AMK
	WHERE APPOINTMENT_amk.PatientID = PATIENT_amk.PatientID
	AND APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID
	AND APPOINTMENT_amk.BillingType = BILLINGTYPE_amk.BillingType
	AND APPOINTMENT_amk.InsCoID = INSCO_amk.InsCoID
	GROUP BY APPOINTMENT_amk.ApptID, ApptDate, PATIENT_amk.PatientLName, BILLINGTYPE_amk.BillingType, INSCO_amk.InsCoName
	HAVING COUNT(APPTDETAIL_AMK.ApptReasonCode) >= 2
	ORDER BY COUNT(APPTDETAIL_AMK.ApptReasonCode) DESC, APPOINTMENT_amk.ApptID;

--#31
SELECT REASON_amk.ApptReasonCode AS "Reason Code", ApptReasonDesc As "Description", BLOCK_amk.BlockCode AS "Block Code", CONCAT(CONCAT(NumOfMin, ' '), 'Minutes') AS "Minutes"
	FROM Reason_amk, APPTDETAIL_amk, Block_amk, (SELECT APPOINTMENT_amk.ApptID, MAX(BlockMinutes) AS NumOfMin
							FROM APPOINTMENT_amk, APPTDETAIL_amk, BLOCK_amk
							WHERE APPOINTMENT_amk.ApptID = APPTDETAIL_amk.ApptID
							AND BLOCK_amk.BlockCode = APPTDETAIL_amk.BlockCode
							GROUP BY APPOINTMENT_amk.ApptID) t1
	WHERE REASON_amk.ApptReasonCode = APPTDETAIL_amk.ApptReasonCode
	AND BLOCK_amk.BlockCode = APPTDETAIL_amk.BlockCode
	AND t1.ApptID = APPTDETAIL_amk.ApptID;



spool off

set echo off

