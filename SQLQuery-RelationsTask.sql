CREATE DATABASE RelationsTasks

USE RelationsTasks

-- ONE TO ONE RELATION
CREATE TABLE Users (
    ID INT IDENTITY PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
);

CREATE TABLE Profiles (
    ProfileID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    UserID INT UNIQUE FOREIGN KEY (UserID) REFERENCES Users (ID)
);
--DROP TABLE Profiles

SELECT * FROM Users
INSERT INTO Users 
VALUES ('elvin','elvin123'),('eldar','eldar245'),('ramin','ramin456')

SELECT * FROM Profiles
INSERT INTO Profiles 
VALUES ('Elvin','Sarkarov',1),('Eldar','Seferov',2),('Ramin','Residov',3)

-- ONE TO MANY RELATION
CREATE TABLE Departments (
    ID INT IDENTITY PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL,
);


CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DepartmentID INT FOREIGN KEY (DepartmentID) REFERENCES Departments (ID)
);

SELECT * FROM Departments
INSERT INTO Departments 
VALUES ('IT'),('SMM'),('HR')


--DROP TABLE Employees
SELECT * FROM Employees
INSERT INTO Employees 
VALUES ('Elcin','Qafarov',1),('Samir','Agayev',1),('Amil','Qedirov',2),('Fidan','Qedirova',3),('Ayan','Qedimova',2)

-- JOINS 

SELECT * FROM Users
INNER JOIN Profiles 
ON Users.ID = Profiles.UserID;

SELECT * FROM Users
FULL OUTER JOIN Profiles 
ON Users.ID = Profiles.UserID;


SELECT * FROM Departments
LEFT JOIN Employees 
ON Departments.ID = Employees.DepartmentID;


SELECT * FROM Departments
RIGHT JOIN Employees 
ON Departments.ID = Employees.DepartmentID;

SELECT * FROM Departments
CROSS JOIN Employees;

--SELECT * FROM Employees
--JOIN Departments
--ON Employees.EmployeeID > Departments.ID

CREATE TABLE Positions (
    ID INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    DependPosId INT REFERENCES Positions (ID)
);

SELECT * FROM Positions
INSERT INTO Positions 
VALUES ('Boss', NULL),('Senior dev',1),('Mid dev',2),('Mid dev',2),('Junior dev',3)

SELECT * FROM Positions as depPos
JOIN Positions as pos
ON depPos.DependPosId = pos.ID