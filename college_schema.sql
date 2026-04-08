-- Use the College database
CREATE DATABASE IF NOT EXISTS College;
USE College;

-- 1. Department Table
CREATE TABLE Department (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Faculty Table
CREATE TABLE Faculty (
    FacultyID INT AUTO_INCREMENT PRIMARY KEY,
    FacName VARCHAR(50) NOT NULL,
    DeptID INT NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3. Batch Table
CREATE TABLE Batch (
    BatchID INT AUTO_INCREMENT PRIMARY KEY,
    BatchName VARCHAR(50) NOT NULL,
    DeptID INT NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 4. Semester Table
CREATE TABLE Semester (
    SemesterID INT AUTO_INCREMENT PRIMARY KEY,
    SemesterName VARCHAR(50) NOT NULL,
    BatchID INT NOT NULL,
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 5. Student Table
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    BatchID INT NOT NULL,
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Subject Table
CREATE TABLE Subject (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(50) NOT NULL,
    SemesterID INT NOT NULL,
    FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);