--CREATE NEW DATABASE
create DATABASE TollCollection
ON  PRIMARY
( NAME = TollCollection, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TollCollection.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON
( NAME =TollCollection_log, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TollCollection_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB );



GO
--USE TollCollection;

GO
-- Create TollPlaza table
 

CREATE TABLE TollPlaza (
    PlazaID INT PRIMARY KEY,
    [Name] VARCHAR(50),
   [ Location] VARCHAR(100),
    NumberOfLanes INT
);
GO
-- Inserting into TollPlaza

insert into TollPlaza(PlazaID,[Name],[ Location],NumberOfLanes)
values(1,'dhaka_south','dhaka',3),
(2,'AkhtaruZaman_flyover','ctg',2),
(3,'AkhtaruZaman_flyover','ctg',1),
(4,'Hanif_flyover','dhaka',1),
(5,'Hanif_flyover','dhaka',2),
(6,'GEC_flyover','ctg',3),
(7,'GEC_flyover','ctg',1),
(8,'GEC_flyover','ctg',2),
(9,'dhaka_North','dhaka',4),
(10,'dhaka_North','dhaka',4);


GO
--Create Vehicle table

CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    LicensePlate VARCHAR(15),
    VehicleType VARCHAR(50)DEFAULT NULL,
VehicleColor varchar(50)DEFAULT NULL,
UserName varchar(50) DEFAULT NULL,
Gender varchar(20) DEFAULT NULL,
Amount int DEFAULT '0',
);
GO
-- Inserting into Vehicle

INSERT INTO Vehicle
(VehicleID,LicensePlate,VehicleType,VehicleColor,UserName,Gender,Amount)
VALUES(10,'CTG123','Car','red','Rahim','male',550),
(11,'dh123','motorCycle','yellow','Rimu','female',50),
(12,'ctg234','Truck','yellow','karim','male',1000),
(13,'kh234','bus','white','Ripu','male',1000),
(14,'ctg3456','bus','red','vipul','male',1000),
(15,'dh4567','Truck','blue','karim','male',1000),
(16,'dh4568','Truck','red','jahirul','male',1000),
(17,'dh1239','motorCycle','blue','jimu','female',50),
(18,'kh1210','motorCycle','yellow','Rimu','female',50),
(19,'ctg3466','motorCycle','red','sipul','male',1000),
    (20,'CTG123','Car','red','abc','female',550);
Go
-- Create TollTransaction table

create TABLE TollTransaction (
    TransactionID INT PRIMARY KEY ,
    PlazaID INT,
    VehicleID INT,
    DATE_TIME DATETIME,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (PlazaID) REFERENCES TollPlaza(PlazaID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);
GO
-- Inserting into TollTransaction
 
insert into TollTransaction (TransactionID,PlazaID, VehicleID, DATE_TIME, Amount)
VALUES (110,1, 10, '2024-05-01 08:30:00',110.00),
       (112,2, 11, '2024-05-02 09:15:00', 650.00),
       (113,3, 12, '2024-05-03 10:00:00', 700.00),
       (114,4, 13, '2024-05-04 08:00:00', 450.00),
       (115,5, 14, '2024-05-05 11:00:00', 1000.00),
       (116,6, 15, '2024-05-06 11:15:00', 100.00),
       (117,7, 16, '2024-05-07 12:10:00', 200.00),
       (118,8, 17, '2024-05-08 12:15:00', 300.00),
       (119,9, 18, '2024-05-09 12:20:00', 400.00),
       (120,10,19, '2024-05-10 01:00:00', 500.00);
   
GO
--create table Vehicle_Type

CREATE TABLE VehicleType (
    TypeID INT PRIMARY KEY,
    VehicleType VARCHAR(50)
);
GO
-- Inserting into VehicleType

insert into VehicleType (TypeID, VehicleType)
VALUES
    (1, 'Car'),
    (2, 'Bus'),
    (3, 'Truck'),
    (4, 'Motorcycle');
	GO
--create table Payment_Method

   create TABLE PaymentMethod (
    MethodID INT PRIMARY KEY,
    MethodName VARCHAR(50)
);
--Inserting table Payment_Method
insert into PaymentMethod (MethodID, MethodName)
VALUES
    (1, 'Cash'),
    (2, 'Card'),
    (3, 'Mobile Payment');


-- Create Users table (optional)
CREATE TABLE Users (
    UserID INT  PRIMARY KEY,
    Username VARCHAR(50) NOT NULL ,
    Password VARCHAR(100) NOT NULL,
    Role VARCHAR(20)
);

GO

-- Inserting into Users
insert into Users (UserID,Username, Password, Role)
VALUES (121,'admin', 'adminpass', 'Admin'),
       (122,'operator', 'operatorpass', 'Operator');
 