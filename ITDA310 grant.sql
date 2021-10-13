/*Receptionist grant statements*/
Grant select, insert, update on mydb.patient to 'receptionist'@'localhost';
grant select,insert,update,delete on mydb.visit to 'receptionist'@'localhost';
grant select,insert,update,delete on mydb.systemcallpatient to 'receptionist'@'localhost';
/*Community Healthcare worker grant statements*/
grant select,insert,update,delete on mydb.household to 'CHW'@'localhost';
grant select,insert,update,delete on mydb.householdmembers to 'CHW'@'localhost';
grant select,insert,update,delete on mydb.assessmentdata to 'CHW'@'localhost';
grant select,insert,update,delete on mydb.chwtreatment to 'CHW'@'localhost';
grant select on mydb.chw_followups to 'CHW'@'localhost';
/*Clinician grant statements*/
grant select,update on mydb.visit to 'Clinician'@'localhost';
grant select on mydb.assessmentdata to 'Clinician'@'localhost';
grant select on mydb.chwtreatment to 'Clinician'@'localhost';
grant select,insert,update,delete on mydb.diagnosis to 'Clinician'@'localhost';
grant select,insert,update,delete on mydb.treatment to 'Clinician'@'localhost';
grant select,insert,update,delete on mydb.prescription to 'Clinician'@'localhost';
/*Pharmacist grant statements*/
grant select on mydb.prescription to 'pharmacist'@'localhost';
grant select on mydb.prescription_view to 'pharmacist'@'localhost';