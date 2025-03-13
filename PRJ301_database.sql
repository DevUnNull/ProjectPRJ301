use master
go
create database Project_PRJ301
go
use Project_PRJ301
go

-- --------------------------------------------------------

CREATE TABLE Teacher (
    teacherID NVARCHAR(10) NOT NULL PRIMARY KEY,
    teacherName NVARCHAR(50) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL,
    email NVARCHAR(60) NOT NULL
);

INSERT INTO Teacher(teacherID, teacherName, address, phone, email) VALUES
(N'000001', N'Nguyễn Thị A', N'Hà Nội', 2578934659, N'a@gmail.com'),
(N'000002', N'Nguyễn Văn B', N'Hà Nội', 7972074938, N'b@gmail.com'),
(N'000003', N'Nguyễn Văn C', N'Hà Nội', 1234569642, N'c@gmail.com'),
(N'000004', N'Nguyễn Thị D', N'Hà Nội', 7972074934, N'd@gmail.com');

-- --------------------------------------------------------

CREATE TABLE Semester (
    semesterID NVARCHAR(10) NOT NULL PRIMARY KEY,
    semesterName NVARCHAR(255) NOT NULL,
    
);

INSERT INTO Semester (semesterID, semesterName) VALUES
(N'HK1', N'1'),
(N'HK2', N'2'),
(N'HK3', N'3');

-- --------------------------------------------------------

CREATE TABLE Department (
  departmentID NVARCHAR(10) NOT NULL PRIMARY KEY,
  departmentName NVARCHAR(255) NOT NULL,
  departmentContact NVARCHAR(50) NOT NULL
);

INSERT INTO Department (departmentID, departmentName, departmentContact) VALUES
(N'CNTT', N'Công Nghệ Thông Tin', N'cntt@gmail.com'),
(N'LYHOASINH', N'Lý Hóa Sinh', N'lyhoasinh@gmail.com'),
(N'TOAN', N'Sư Phạm Toán', N'toan@gmail.com');

-- --------------------------------------------------------

CREATE TABLE Class (
    classID INT NOT NULL PRIMARY KEY,
    className NVARCHAR(255) NOT NULL,
    departmentID NVARCHAR(10) NOT NULL REFERENCES Department(departmentID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Class (classID, className, departmentID) VALUES
(1, N'HE123456', N'CNTT'),
(2, N'HE123768', N'TOAN'),
(3, N'HE987654', N'CNTT');

-- --------------------------------------------------------

CREATE TABLE AcademicYear (
    academicYearID NVARCHAR(10) NOT NULL,
    academicYearName NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_academicYear PRIMARY KEY (academicYearID)
);

INSERT INTO  AcademicYear (academicYearID, academicYearName) VALUES
(N'NH01', N'2017-2018'),
(N'NH02', N'2018-2019'),
(N'NH03', N'2019-2020');

-- --------------------------------------------------------

CREATE TABLE AcademicPeriod (
    periodID NVARCHAR(10) NOT NULL PRIMARY KEY,
    periodName NVARCHAR(255) NOT NULL
);

INSERT INTO AcademicPeriod (periodID, periodName) VALUES
(N'NKCD02', N'2018-2022'),
(N'NKDH01', N'2017-2021'),
(N'NKDH02', N'2019-2023');

-- --------------------------------------------------------

CREATE TABLE Roles (
    id INT NOT NULL PRIMARY KEY,
    role NVARCHAR(50) NOT NULL
);

INSERT INTO Roles (id, role) VALUES
(1, N'Admin'),
(2, N'Teacher'),
(3, N'Student');
-- --------------------------------------------------------

CREATE TABLE Account (
    id INT NOT NULL PRIMARY KEY,
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(50) NOT NULL,
    role INT NOT NULL,
    FOREIGN KEY (role) REFERENCES Roles(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Account (id, username, password, email, role) VALUES
(1, N'Admin', N'123', N'admin@gmail.com', 1),
(2, N'phophong', N'123', N'phophong@gmail.com', 3);

-- --------------------------------------------------------

CREATE TABLE Student (
  studentID INT NOT NULL PRIMARY KEY,
  studentName NVARCHAR(50) NOT NULL,
  address NVARCHAR(255) NOT NULL,
  phone BIGINT NOT NULL,
  email NVARCHAR(60) NOT NULL,
  classID INT NOT NULL,
  FOREIGN KEY (classID) REFERENCES Class(classID)
);

INSERT INTO Student (studentID, studentName, address, phone, email, classID) VALUES
(1, N'Vương Văn Quang', N'Hà Nội', 9797207493, 'quang@fpt.edu.vn', 1),
(2, N'Nguyễn Quốc Anh', N'Hà Nội', 0912123456, 'qanh@gmail.com', 1),
(3, N'Nguyễn Phương Nam', N'Hà Nội', 9797207493, 'nam@gmail.com', 2),
(4, N'Nguyễn Đình Nam', N'Hà Nội', 0797207493, 'ndnam@fpt.edu.vn', 2);

-- --------------------------------------------------------

CREATE TABLE Branch (
    branchID NVARCHAR(10) NOT NULL PRIMARY KEY,
    branchName NVARCHAR(255) NOT NULL
);

INSERT INTO Branch (branchID, branchName) VALUES
(N'TL01', N'Chính trị và Xã Hội'),
(N'TL02', N'Chuyên Nghành'),
(N'TL03', N'Du Học');

-- --------------------------------------------------------

CREATE TABLE Credit (
    creditID NVARCHAR(10) NOT NULL PRIMARY KEY,
    creditHours INT NOT NULL
);

INSERT INTO Credit (creditID, creditHours) VALUES
(N'TC1', 1),
(N'TC2', 2),
(N'TC3', 3);

-- --------------------------------------------------------

CREATE TABLE Classification (
    classificationID INT NOT NULL PRIMARY KEY, 
    minGrade FLOAT NOT NULL, 
    maxGrade FLOAT NOT NULL, 
    classificationName NVARCHAR(30) NOT NULL
);
INSERT INTO Classification (classificationID, minGrade, maxGrade, classificationName) VALUES
(1, 0, 5, N'Poor'),
(2, 5.1, 6.5, N'Satisfactory'),
(3, 6.6, 7.5, N'Good'),
(4, 7.6, 8.5, N'Very Good'),
(5, 8.6, 10, N'Excellent');
-- --------------------------------------------------------

CREATE TABLE Subject (
    subjectID NVARCHAR(10) NOT NULL PRIMARY KEY,
    subjectName NVARCHAR(255) NOT NULL,
    creditID NVARCHAR(10) NOT NULL REFERENCES Credit(creditID) ON DELETE CASCADE ON UPDATE CASCADE,
    branchID NVARCHAR(10) NOT NULL REFERENCES Branch(branchID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Subject (subjectID, subjectName, creditID, branchID) VALUES
(N'2117100153', N'Toán Cao Cấp', N'TC2', N'TL02'),
(N'2117100158', N'Lập Trình Di Động', N'TC2', N'TL02'),
(N'211710054', N'Triết Học', N'TC2', N'TL01');

-- --------------------------------------------------------

CREATE TABLE Subject_Teacher (
    subjectID NVARCHAR(10) NOT NULL,
    teacherID NVARCHAR(10) NOT NULL,
    PRIMARY KEY (subjectID, teacherID), 
    FOREIGN KEY (subjectID) REFERENCES Subject(subjectID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (teacherID) REFERENCES Teacher(teacherID) ON DELETE CASCADE ON UPDATE CASCADE  
);

INSERT INTO Subject_Teacher (subjectID, teacherID) VALUES
(N'2117100153', N'000001'),  
(N'2117100158', N'000002'); 

-- --------------------------------------------------------
CREATE TABLE Grades (
  gradeID INT NOT NULL PRIMARY KEY,  
  factor1 FLOAT NOT NULL,
  factor3 FLOAT NOT NULL,
  factor6 FLOAT NOT NULL,
  totalGrade FLOAT NOT NULL,
  teacherID NVARCHAR(10) NOT NULL REFERENCES Teacher(teacherID) ON UPDATE CASCADE,
  studentID INT NOT NULL REFERENCES Student(studentID) ON UPDATE CASCADE,
  subjectID NVARCHAR(10) NULL REFERENCES Subject(subjectID) ON DELETE SET NULL ON UPDATE CASCADE,
  creditID NVARCHAR(10) NOT NULL REFERENCES Credit(creditID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  branchID NVARCHAR(10) NOT NULL REFERENCES Branch(branchID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  semesterID NVARCHAR(10) NOT NULL REFERENCES Semester(semesterID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  academicYearID NVARCHAR(10) NOT NULL REFERENCES AcademicYear(academicYearID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  CONSTRAINT chk_factor CHECK (factor1 >= 0 AND factor3 >= 0 AND factor6 >= 0 AND totalGrade >= 0 AND totalGrade <= 10) 
);

INSERT INTO Grades (gradeID, factor1, factor3, factor6, totalGrade, teacherID, studentID, subjectID, creditID, branchID, semesterID, academicYearID) VALUES
(39, 5, 6, 8, 7, N'000001', 1, N'2117100153', N'TC1', N'TL02', N'HK1', N'NH01'),
(40, 0, 0, 0, 0, N'000001', 2, N'2117100153', N'TC1', N'TL02', N'HK1', N'NH01'),
(41, 5, 6, 8, 7, N'000002', 3, N'2117100153', N'TC1', N'TL02', N'HK1', N'NH01'),
(50, 5, 6, 6, 8, N'000002', 4, N'2117100153', N'TC1', N'TL02', N'HK1', N'NH01');

-- --------------------------------------------------------

-- Check and add the teacherID column to the Teacher table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Teacher') AND name = 'teacherID')
BEGIN
    ALTER TABLE Teacher ADD teacherID INT;
END;

-- Check and add the studentID column to the Student table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Student') AND name = 'studentID')
BEGIN
    ALTER TABLE Student ADD studentID INT;
END

-- Check and add the creditID column to the Credit table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Credit') AND name = 'creditID')
BEGIN
    ALTER TABLE Credit ADD creditID INT;
END

-- Trigger to delete grades when a teacher is deleted
GO
CREATE TRIGGER trg_DeleteGrades_Teacher 
ON Teacher
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Grades WHERE teacherID IN (SELECT teacherID FROM deleted);
    DELETE FROM Teacher WHERE teacherID IN (SELECT teacherID FROM deleted);
END;
GO

-- Trigger to delete grades when a student is deleted
GO
CREATE TRIGGER trg_DeleteGrades_Student 
ON Student
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Grades WHERE studentID IN (SELECT studentID FROM deleted);
    DELETE FROM Student WHERE studentID IN (SELECT studentID FROM deleted);
END;
GO

-- Trigger to delete grades when a credit is deleted
GO
CREATE TRIGGER trg_DeleteGrades_Credit 
ON Credit
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Grades WHERE creditID IN (SELECT creditID FROM deleted);
    DELETE FROM Credit WHERE creditID IN (SELECT creditID FROM deleted);
END;
GO