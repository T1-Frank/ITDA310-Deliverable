CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`SystemCallPatient_BEFORE_INSERT` BEFORE INSERT ON `SystemCallPatient` FOR EACH ROW
BEGIN
	IF new.idSystemCall NOT IN ( select SystemCall.idSystemCall FROM SystemCall WHERE (NEW.idSystemCall = SystemCall.idSystemCall)) OR new.idPatient NOT IN (SELECT Patient.idNumber FROM Patient WHERE (NEW.idPatient = Patient.idNumber)) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'One or more referenced Parent records do not exist';
    END IF;
END