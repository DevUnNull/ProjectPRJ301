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
    Gender NVARCHAR(10) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(15) NOT NULL,
    Email NVARCHAR(60) NOT NULL
);

INSERT INTO Teacher(TeacherID, TeacherName, Gender, Address, Phone, Email) VALUES
(N'T001', N'Nguyễn Văn Anh',N'Nam', N'123 Đường Lê Lợi, Hà Nội', '84901234567', 'nguyenvana@gmail.com'),
(N'T002', N'Trần Thị Bích',N'Nữ', N'456 Đường Trần Hưng Đạo, TP.HCM', '84812345678', 'tranthib@gamil.com'),
(N'T003', N'Lê Văn Cao', N'Nam', N'789 Đường Nguyễn Huệ, Đà Nẵng', '84709876543', 'levanc@gamil.com');

-- --------------------------------------------------------

CREATE TABLE Semester (
    SemesterID NVARCHAR(10) NOT NULL PRIMARY KEY,
    SemesterName NVARCHAR(255) NOT NULL
    
);

INSERT INTO Semester (SemesterID, SemesterName) VALUES
(N'S1', N'1'),
(N'S2', N'2'),
(N'S3', N'3');

-- --------------------------------------------------------

CREATE TABLE Department (
  DepartmentID NVARCHAR(10) NOT NULL PRIMARY KEY,
  DepartmentName NVARCHAR(255) NOT NULL
);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(N'AL', N'AL-L201'),
(N'DE', N'DE-201'),
(N'BE', N'BE-201');

-- --------------------------------------------------------

CREATE TABLE Class (
    ClassID INT NOT NULL PRIMARY KEY,
    ClassName NVARCHAR(255) NOT NULL,
    DepartmentID NVARCHAR(10) NOT NULL REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Class (ClassID, ClassName, DepartmentID) VALUES
(1, N'SE1919', N'AL'),
(2, N'SE1920', N'BE'),
(3, N'SE1921', N'DE');

-- --------------------------------------------------------

CREATE TABLE AcademicYear (
    AcademicYearID NVARCHAR(10) NOT NULL,
    AcademicYearName NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_AcademicYear PRIMARY KEY (AcademicYearID)
);

INSERT INTO  AcademicYear (AcademicYearID, AcademicYearName) VALUES
(N'AY01', N'2023-2024'),
(N'AY02', N'2024-2025'),
(N'AY03', N'2025-2026');

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
    role int NOT NULL,
    FOREIGN KEY (role) REFERENCES Roles(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Account (id, username, password, email, role) VALUES
(1, N'Admin', N'123', N'admin@gmail.com', 1),
(2, N'Nguyễn Văn Anh', N'anh123', N'nguyenvana@gmail.com', 2),
(3, N'Trần Thị Bích', N'1234bich', N'tranthib@gmail.com', 2),
(4, N'Lê Văn Cao', N'caocaoqua', N'levanc@gmail.com', 2),
(5, N'Vương Văn Quang', N'quang2601', N'quang@fpt.edu.vn', 3),
(6, N'Nguyễn Quốc Anh', N'qanh2403', N'qanh@gmail.com', 3),
(7, N'Nguyễn Phương Nam', N'ngoisaophuongnam', N'nam@gmail.com', 3),
(8, N'Nguyễn Đình Nam', N'nam321', N'ndnam@fpt.edu.vn', 3);

-- --------------------------------------------------------

CREATE TABLE Student (
  StudentID NVARCHAR(50) NOT NULL PRIMARY KEY,
  StudentName NVARCHAR(50) NOT NULL,
  Gender NVARCHAR(15) NOT NULL,
  Address NVARCHAR(255) NOT NULL,
  Phone NVARCHAR(10) NOT NULL,
  Email NVARCHAR(60) NOT NULL,
  ClassID INT NOT NULL,
  FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

INSERT INTO Student (StudentID, StudentName, Gender, Address, Phone, Email, ClassID) VALUES
('HE111111', N'Vương Văn Quang',N'Nam', N'Hà Nội', '9797207493', 'quang@fpt.edu.vn', 1),
('HE222222', N'Nguyễn Quốc Anh',N'Nam', N'Hà Nội', '0912123456', 'qanh@gmail.com', 1),
('HE333333', N'Nguyễn Phương Nam',N'Nam', N'Hà Nội', '9797207493', 'nam@gmail.com', 2),
('HE444444', N'Nguyễn Đình Nam',N'Nam', N'Hà Nội', '0797207493', 'ndnam@fpt.edu.vn', 2);
-- --------------------------------------------------------

CREATE TABLE Branch (
    BranchID NVARCHAR(10) NOT NULL PRIMARY KEY,
    BranchName NVARCHAR(255) NOT NULL
);

INSERT INTO Branch (BranchID, BranchName) VALUES
(N'B01', N'Kinh tế'),
(N'B02', N'Ngôn ngữ'),
(N'B03', N'Công nghệ thông tin');

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
(N'2117100153', N'Toán Cao Cấp', N'TC2', N'B01'),
(N'2117100158', N'Xác suất thống kê', N'TC2', N'B01'),
(N'211710054', N'Tiếng Hàn', N'TC2', N'B02');

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
(39, 5, 6, 8, 7, N'T001', N'HE111111',N'2117100153', N'TC1', N'B02', N'S1', N'AY01'),
(40, 0, 0, 0, 0, N'T001', N'HE222222',N'2117100158', N'TC1', N'B02', N'S1', N'AY01'),
(41, 5, 6, 8, 7, N'T002', N'HE333333',N'2117100153', N'TC1', N'B02', N'S1', N'AY01'),
(50, 5, 6, 6, 8, N'T002', N'HE444444',N'2117100158', N'TC1', N'B02', N'S1', N'AY01');
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