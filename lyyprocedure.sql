CREATE PROCEDURE lyy1 ()
BEGIN 
DECLARE STOP INT DEFAULT 0;
DECLARE N VARCHAR(20);
DECLARE A INT;
DECLARE _YOUBIAO CURSOR FOR SELECT NAME,AGE FROM test.test1110;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET STOP=1;
OPEN _YOUBIAO;

FETCH _YOUBIAO INTO N,A;

start TRANSACTION;
WHILE STOP<>1
DO
if A<700
then
UPDATE test.test1110 SET NAME='xiaopan' where test1110.age = A;

END if;
FETCH _YOUBIAO INTO N,A;
END WHILE;
COMMIT;

END

call lyy1

drop PROCEDURE lyy1

select * from yemp_boss \

SELECT datediff('2016-01-01','2016-09-01') result1


###########################

create PROCEDURE bosslyy( out d int)
BEGIN
DECLARE a datetime;
DECLARE b datetime;
DECLARE c datetime;
DECLARE d int;
DECLARE _stop int;
DECLARE a_cursor CURSOR for select b_handle_time,f_handle_time,g_handle_time,num from yemp_boss;
DECLARE CONTINUE HANDLER for not found set _stop=1;
open a_cursor;
start TRANSACTION;
FETCH a_cursor into a,b,c,d;
while _stop<>1
do
set d=0;
if a is not null 
then 
set d =  DATEDIFF('2016-01-01','2016-09-01');
end if;
end while;
commit;
END;
update yemp_boss set num=0 
call bosslyy( @d )
select @d
select * from yemp_boss
drop procedure bosslyy


create PROCEDURE bosslyy( out d int)
BEGIN
DECLARE a datetime;
DECLARE b datetime;
DECLARE c datetime;
DECLARE d int;
DECLARE _stop int;
DECLARE a_cursor CURSOR for select b_handle_time,f_handle_time,g_handle_time,num from yemp_boss;
DECLARE CONTINUE HANDLER for not found set _stop=1;
open a_cursor;
start TRANSACTION;
FETCH a_cursor into a,b,c,d;
while _stop<>1
do
set d=0;

set d =  DATEDIFF('2016-01-01','2016-09-01');

commit;
END;


#################################

create PROCEDURE bosslyy( )
BEGIN
DECLARE a datetime;
DECLARE b datetime;
DECLARE c datetime;
DECLARE d int;
DECLARE _stop int;
DECLARE a_cursor CURSOR for select b_handle_time,f_handle_time,g_handle_time,num from yemp_boss;
DECLARE CONTINUE HANDLER for not found set _stop=1;
open a_cursor;
start TRANSACTION;
FETCH a_cursor into a,b,c,d;
while _stop<>1
do
set d=0;
if a is not null 
then 
#set d =  DATEDIFF(c,a);
update yemp_boss set num = DATEDIFF(c,a) where yemp_boss.g_handle_time=c and yemp_boss.b_handle_time = a;
ELSE
if b is not NULL
then
#set d = DATEDIFF(b,a); 
update yemp_boss set num = DATEDIFF(c,b) where yemp_boss.g_handle_time=c and yemp_boss.b_handle_time = b;
ELSE
update yemp_boss set num = 0 where yemp_boss.f_handle_time is null  and yemp_boss.b_handle_time is null;
END if;
end IF;
FETCH a_cursor into a,b,c,d;
end while;
commit;
END;

update yemp_boss set num=0 
call bosslyy
select * from yemp_boss
drop procedure bosslyy

########################################

create PROCEDURE bosslyy( out d int)
BEGIN
DECLARE a datetime;
DECLARE b datetime;
DECLARE c datetime;
DECLARE d int;
DECLARE _stop int;
DECLARE a_cursor CURSOR for select b_handle_time,f_handle_time,g_handle_time,num from yemp_boss;
DECLARE CONTINUE HANDLER for not found set _stop=1;
open a_cursor;
start TRANSACTION;
FETCH a_cursor into a,b,c,d;

set d=0;
set d =  DATEDIFF('2016-01-01','2016-09-01');
commit;
END;

update yemp_boss set num=0 
call bosslyy( @d )
select @d
select * from yemp_boss
drop procedure bosslyy

#########################################

#prowage(ID int, PName char(10), wage int)
create PROCEDURE low_prowage
BEGIN
DECLARE count_lower int;
DECLARE count_wage int;
#DECLARE c_wage CURSOR FOR SELECT count(wage) prowage WHERE wage<2000;
SET count_lower = SELECT count(wage) FROM prowage WHERE wage<2000;

WHILE 2*count_lower <= SELECT count(*) FROM prowage
DO
	UPDATE prowage SET wage = wage + 100;
	SET count_wage =count_wage + 100;
END WHILE;
END;

CREATE PROCEDURE lowavg_prowage
BEGIN
DECLARE count_lower int;
DECLARE count_wage int;
#DECLARE c_wage CURSOR FOR SELECT count(wage) prowage WHERE wage<2000;
SET count_avg = SELECT avg(wage) FROM prowage WHERE wage<2000;

WHILE count_avg < 4500
DO
	UPDATE prowage SET wage = wage + 200;
	SET count_avg = SELECT avg(wage) FROM prowage WHERE wage<2000;
END WHILE;
END;

#member(MID CHAR(10),MName char(50))
#F(FID CHAR(10),FName char(50))
#score(SID INT, FID CHAR(10),MID CHAR(10), score INT)
CREATE PROCEDURE count_test 
BEGIN



