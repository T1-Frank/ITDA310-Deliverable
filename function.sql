CREATE FUNCTION `Amount_Required` (
medicationName VARCHAR(45)
)
RETURNS INTEGER
BEGIN
	DECLARE return_value INTEGER;
    declare difference integer;
    declare initial integer;
    declare rCollected integer;
    declare rnumber integer;
    declare amount integer;
    declare id integer;
    SET return_value = 0;
    Create temporary table table_drug;
    insert into table_drug
    select *
    from mydb.prescription
    where mydb.precription.medication = medicationName;
    while(Select count(*) from mybd.table_drug) > 0
    DO
		select table_drug.idPrecription,table_drug.initialCollected, table_drug.repeatno, table_drug.repeatscollected, table_drug.amount
        into id,initial,rnumber,rCollected,amount
		from mybd.table_drug
        limit 1;
        if (initial = 0) then
			set return_value = return_value + amount +amount*(rnumber-rCollected);
        end if;
        delete from table_drug where table_drug.idPrescription = id;
    END while;
    drop temporary table mydb.table_drug;
	RETURN return_value;
END