CREATE TABLE IF NOT EXISTS users (
	firstName 	varchar(30),
	lastName 	varchar(30),
	email 		varchar(30) UNIQUE NOT NULL,
	password	varchar(30),
	phoneNumber	varchar(30),
	userid 		INTEGER IDENTITY PRIMARY KEY
);

insert into users(firstName, lastName, email, password, phoneNumber, userid)
values ('TestFirstName','TestLastName','test@mail.com','TESTPASSWORD','1522334455',1)
