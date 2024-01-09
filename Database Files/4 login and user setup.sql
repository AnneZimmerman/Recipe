--replace//loginname// and //password// with secret values from bault
--IMPORTANT create login in MASTER
--use MASTER

create login //loginname// with password = '//password//'

--important switch to HeartyHearthDB

create user dev_user from login //loginname//
alter role db_datareader add member dev_user
alter role db_datawriter add member dev_user
