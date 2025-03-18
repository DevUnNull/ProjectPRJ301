use master
go
create database Project_PRJ301
go
use Project_PRJ301
go

-- --------------------------------------------------------

CREATE TABLE Teacher (
    TeacherID NVARCHAR(10) NOT NULL PRIMARY KEY,
    TeacherName NVARCHAR(50) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Phone BIGINT NOT NULL,
    Email NVARCHAR(60) NOT NULL
);

INSERT INTO Teacher(TeacherID, TeacherName, Address, Phone, Email) VALUES
('T001', N'Nguyễn Văn Anh', N'123 Đường Lê Lợi, Hà Nội', 84901234567, 'nguyenvana@example.com'),
('T002', N'Trần Thị Bích', N'456 Đường Trần Hưng Đạo, TP.HCM', 84812345678, 'tranthib@example.com'),
('T003', N'Lê Văn Cao', N'789 Đường Nguyễn Huệ, Đà Nẵng', 84709876543, 'levanc@example.com');

-- --------------------------------------------------------

CREATE TABLE Semester (
    SemesterID NVARCHAR(10) NOT NULL PRIMARY KEY,
    SemesterName NVARCHAR(255) NOT NULL,
    
);

INSERT INTO Semester (SemesterID, SemesterName) VALUES
(N'HK1', N'1'),
(N'HK2', N'2'),
(N'HK3', N'3');

-- --------------------------------------------------------

CREATE TABLE Department (
  DepartmentID NVARCHAR(10) NOT NULL PRIMARY KEY,
  DepartmentName NVARCHAR(255) NOT NULL,
  DepartmentContact NVARCHAR(50) NOT NULL
);

INSERT INTO Department (DepartmentID, DepartmentName, DepartmentContact) VALUES
(N'CNTT', N'Công Nghệ Thông Tin', N'cntt@gmail.com'),
(N'LYHOASINH', N'Lý Hóa Sinh', N'lyhoasinh@gmail.com'),
(N'TOAN', N'Sư Phạm Toán', N'toan@gmail.com');

-- --------------------------------------------------------

CREATE TABLE Class (
    ClassID INT NOT NULL PRIMARY KEY,
    ClassName NVARCHAR(255) NOT NULL,
    DepartmentID NVARCHAR(10) NOT NULL REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Class (ClassID, ClassName, DepartmentID) VALUES
(1, N'HE123456', N'CNTT'),
(2, N'HE123768', N'TOAN'),
(3, N'HE987654', N'CNTT');

-- --------------------------------------------------------

CREATE TABLE AcademicYear (
    AcademicYearID NVARCHAR(10) NOT NULL,
    AcademicYearName NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_AcademicYear PRIMARY KEY (AcademicYearID)
);

INSERT INTO  AcademicYear (AcademicYearID, AcademicYearName) VALUES
(N'NH01', N'2017-2018'),
(N'NH02', N'2018-2019'),
(N'NH03', N'2019-2020');

-- --------------------------------------------------------

CREATE TABLE Roles (
    RoleId INT NOT NULL PRIMARY KEY,
    Role NVARCHAR(50) NOT NULL
);

INSERT INTO Roles (RoleId, Role) VALUES
(1, N'Admin'),
(2, N'Teacher'),
(3, N'Student');
-- --------------------------------------------------------

CREATE TABLE Account (
    Id INT NOT NULL PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    RoleId INT NOT NULL,
    FOREIGN KEY (RoleId) REFERENCES Roles(RoleId) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Account (Id, Username, Password, Email, RoleId) VALUES
(1, N'Admin', N'123', N'admin@gmail.com', 1),
(2, N'Nguyễn Văn Anh', N'anh123', N'nguyenvana@example.com', 2),
(3, N'Trần Thị Bích', N'1234bich', N'tranthib@example.com', 2),
(4, N'Lê Văn Cao', N'caocaoqua', N'levanc@example.com', 2),
(5, N'Vương Văn Quang', N'quang2601', N'quang@fpt.edu.vn', 3),
(6, N'Nguyễn Quốc Anh', N'qanh2403', N'qanh@gmail.com', 3),
(7, N'Nguyễn Phương Nam', N'ngoisaophuongnam', N'nam@gmail.com', 3),
(8, N'Nguyễn Đình Nam', N'nam321', N'ndnam@fpt.edu.vn', 3);

-- --------------------------------------------------------

CREATE TABLE Student (
  StudentID NVARCHAR(50)  NOT NULL PRIMARY KEY,
  StudentName NVARCHAR(50) NOT NULL,
  Address NVARCHAR(255) NOT NULL,
  Phone BIGINT NOT NULL,
  Email NVARCHAR(60) NOT NULL,
  ClassID INT NOT NULL,
  FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

INSERT INTO Student (StudentID, StudentName, Address, Phone, Email, ClassID) VALUES
('HE111111', N'Vương Văn Quang', N'Hà Nội', 9797207493, 'quang@fpt.edu.vn', 1),
('HE222222', N'Nguyễn Quốc Anh', N'Hà Nội', 0912123456, 'qanh@gmail.com', 1),
('HE333333', N'Nguyễn Phương Nam', N'Hà Nội', 9797207493, 'nam@gmail.com', 2),
('HE444444', N'Nguyễn Đình Nam', N'Hà Nội', 0797207493, 'ndnam@fpt.edu.vn', 2);

-- --------------------------------------------------------

CREATE TABLE Branch (
    BranchID NVARCHAR(10) NOT NULL PRIMARY KEY,
    BranchName NVARCHAR(255) NOT NULL
);

INSERT INTO Branch (BranchID, BranchName) VALUES
(N'TL01', N'Chính trị và Xã Hội'),
(N'TL02', N'Chuyên Nghành'),
(N'TL03', N'Du Học');

-- --------------------------------------------------------

CREATE TABLE Credit (
    CreditID NVARCHAR(10) NOT NULL PRIMARY KEY,
    Credits INT NOT NULL
);

INSERT INTO Credit (CreditID, Credits) VALUES
(N'TC1', 1),
(N'TC2', 2),
(N'TC3', 3);

-- --------------------------------------------------------

CREATE TABLE Subject (
    SubjectID NVARCHAR(10) NOT NULL PRIMARY KEY,
    SubjectName NVARCHAR(255) NOT NULL,
    CreditID NVARCHAR(10) NOT NULL REFERENCES Credit(CreditID) ON DELETE CASCADE ON UPDATE CASCADE,
    BranchID NVARCHAR(10) NOT NULL REFERENCES Branch(BranchID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Subject (SubjectID, SubjectName, CreditID, BranchID) VALUES
(N'2117100153', N'Toán Cao Cấp', N'TC2', N'TL02'),
(N'2117100158', N'Lập Trình Di Động', N'TC2', N'TL02'),
(N'211710054', N'Triết Học', N'TC2', N'TL01');

-- --------------------------------------------------------

CREATE TABLE Subject_Teacher (
    SubjectID NVARCHAR(10) NOT NULL,
    TeacherID NVARCHAR(10) NOT NULL,
    PRIMARY KEY (SubjectID, TeacherID), 
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID) ON DELETE CASCADE ON UPDATE CASCADE  
);

INSERT INTO Subject_Teacher (SubjectID, TeacherID) VALUES
(N'2117100153', N'T001'),  
(N'2117100158', N'T002'); 

-- --------------------------------------------------------
CREATE TABLE Grades (
  GradeID INT NOT NULL PRIMARY KEY,  
  Factor1 FLOAT NOT NULL,
  Factor3 FLOAT NOT NULL,
  Factor6 FLOAT NOT NULL,
  TotalGrade FLOAT NOT NULL,
  TeacherID NVARCHAR(10) NOT NULL REFERENCES Teacher(TeacherID) ON UPDATE CASCADE,
  StudentID NVARCHAR(50) NOT NULL REFERENCES Student(StudentID) ON UPDATE CASCADE,
  SubjectID NVARCHAR(10) NULL REFERENCES Subject(SubjectID) ON DELETE SET NULL ON UPDATE CASCADE,
  CreditID NVARCHAR(10) NOT NULL REFERENCES Credit(CreditID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  BranchID NVARCHAR(10) NOT NULL REFERENCES Branch(BranchID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  SemesterID NVARCHAR(10) NOT NULL REFERENCES Semester(SemesterID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  AcademicYearID NVARCHAR(10) NOT NULL REFERENCES AcademicYear(AcademicYearID) ON UPDATE NO ACTION ON DELETE NO ACTION,  
  CONSTRAINT chk_Factor CHECK (Factor1 >= 0 AND Factor3 >= 0 AND Factor6 >= 0 AND TotalGrade >= 0 AND TotalGrade <= 10) 
);

INSERT INTO Grades (GradeID, Factor1, Factor3, Factor6, TotalGrade, TeacherID, StudentID, SubjectID, CreditID, BranchID, SemesterID, AcademicYearID) VALUES
(39, 5, 6, 8, 7, N'T001', N'HE111111',N'2117100153', N'TC1', N'TL02', N'HK1', N'NH01'),
(40, 0, 0, 0, 0, N'T001', N'HE222222',N'2117100158', N'TC1', N'TL02', N'HK1', N'NH01'),
(41, 5, 6, 8, 7, N'T002', N'HE333333',N'2117100153', N'TC1', N'TL02', N'HK1', N'NH01'),
(50, 5, 6, 6, 8, N'T002', N'HE444444',N'2117100158', N'TC1', N'TL02', N'HK1', N'NH01');

-- --------------------------------------------------------

-- Check and add the teacherID column to the Teacher table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Teacher') AND name = 'TeacherID')
BEGIN
    ALTER TABLE Teacher ADD TeacherID INT;
END;

-- Check and add the studentID column to the Student table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Student') AND name = 'StudentID')
BEGIN
    ALTER TABLE Student ADD StudentID INT;
END

-- Check and add the creditID column to the Credit table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Credit') AND name = 'CreditID')
BEGIN
    ALTER TABLE Credit ADD CreditID INT;
END

-- Trigger to delete grades when a teacher is deleted
GO
CREATE TRIGGER trg_DeleteGrades_Teacher 
ON Teacher
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Grades WHERE TeacherID IN (SELECT TeacherID FROM deleted);
    DELETE FROM Teacher WHERE TeacherID IN (SELECT TeacherID FROM deleted);
END;
GO

-- Trigger to delete grades when a student is deleted
GO
CREATE TRIGGER trg_DeleteGrades_Student 
ON Student
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Grades WHERE StudentID IN (SELECT StudentID FROM deleted);
    DELETE FROM Student WHERE StudentID IN (SELECT StudentID FROM deleted);
END;
GO

-- Trigger to delete grades when a credit is deleted
GO
CREATE TRIGGER trg_DeleteGrades_Credit 
ON Credit
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Grades WHERE CreditID IN (SELECT CreditID FROM deleted);
    DELETE FROM Credit WHERE CreditID IN (SELECT CreditID FROM deleted);
END;
GO