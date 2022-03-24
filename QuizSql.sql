CREATE DATABASE Academy;
USE Academy;
CREATE TABLE Groups(
    Id int Primary Key Identity(1,1),
	Name nvarchar(255) unique

);
CREATE TABLE Students(
	Id int Primary Key Identity(1,1),
	Name nvarchar(25),
	Surname nvarchar(25),
	GroupId int,
	FOREIGN KEY (GroupId) REFERENCES Groups(Id)

);

ALTER TABLE Students add Grade int;


INSERT INTO Groups(Name) values('P224');
INSERT INTO Groups(Name) values('P124');
INSERT INTO Groups(Name) values('P221');

SELECT * FROM GROUPS 

INSERT INTO Students(Name,Surname,GroupId) values('Mehemmed','Ismayilov', 1);
INSERT INTO Students(Name,Surname,GroupId) values('Sadiqxan','Qayxanov', 1);
INSERT INTO Students(Name,Surname,GroupId) values('Altan','Ibrahimlli', 3);
INSERT INTO Students(Name,Surname,GroupId) values('Hemid','Memmedov', 1);

SELECT * FROM Students WHERE GroupId = 1;

SELECT Groups.Name,  Count (*) as 'Students Count' FROM Students
Inner Join Groups on Groups.Id=Students.GroupId
Group By Students.GroupId, Groups.Name

CREATE View MyView as 
SELECT Groups.Name Group_Name, Students.Name FirstName, Students.Surname LastName, Students.Grade FROM Students
Inner Join Groups on Groups.Id=Students.GroupId

Select * From MyView

Create Procedure CheckGrade @Grade int
As begin
Select * From Students Where Students.Grade > @Grade
END

Exec CheckGrade 80;









