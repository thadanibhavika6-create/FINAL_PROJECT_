--create departments table 

CREATE TABLE Departments_FPP (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments_FPP
(DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');


--create students table

CREATE TABLE Students_FPP (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

INSERT INTO Students_FPP
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');

--create courses table

CREATE TABLE Courses_FPP (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments_FPP(DepartmentID)
);

INSERT INTO Courses_FPP
(CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4);


--create instructors table

CREATE TABLE Instructors_FPP (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments_FPP(DepartmentID)
);

INSERT INTO Instructors_FPP
(InstructorID, FirstName, LastName, Email, DepartmentID)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2);

--create enrollemts table
CREATE TABLE Enrollments_FPP (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,

    FOREIGN KEY (StudentID)
    REFERENCES Students_FPP(StudentID),

    FOREIGN KEY (CourseID)
    REFERENCES Courses_FPP(CourseID)
);

INSERT INTO Enrollments_FPP
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');


-- 1. PERFORM CRUD OPERATIONS ON ALL TABLES

-- STUDENTS TABLE

--create
INSERT INTO Students_FPP
VALUES
(3, 'Rahul', 'Patel', 'rahul@email.com', '2001-06-10', '2023-08-01');

--READ
SELECT * FROM Students_FPP;

--update
UPDATE Students_FPP
SET Email = 'rahul.patel@email.com'
WHERE StudentID = 3;

--delete
DELETE FROM Students_FPP
WHERE StudentID = 3;

-- COURSES TABLE

--create
INSERT INTO Courses_FPP
VALUES
(103, 'Operating Systems', 1, 4);

--read
SELECT * FROM Courses_FPP;

--update
UPDATE Courses_FPP
SET Credits = 5
WHERE CourseID = 103;

--delete
DELETE FROM Courses_FPP
WHERE CourseID = 103;

-- INSTRUCTORS TABLE
--create
INSERT INTO Instructors_FPP
VALUES
(3, 'David', 'Shah', 'david@univ.com', 1);

--read
SELECT * FROM Instructors_FPP;

--update
UPDATE Instructors_FPP
SET Email = 'david.shah@univ.com'
WHERE InstructorID = 3;

--delete
DELETE FROM Instructors_FPP
WHERE InstructorID = 3;

-- ENROLLMENTS TABLE

--create
INSERT INTO Enrollments_FPP
VALUES
(3, 1, 102, '2023-08-01');

--read
SELECT * FROM Enrollments_FPP;

--update
UPDATE Enrollments_FPP
SET EnrollmentDate = '2023-08-15'
WHERE EnrollmentID = 3;

--delete
DELETE FROM Enrollments_FPP
WHERE EnrollmentID = 3;


-- DEPARTMENTS TABLE

--create
INSERT INTO Departments_FPP
VALUES
(3, 'Physics');

--read
SELECT * FROM Departments_FPP;

--update
UPDATE Departments_FPP
SET DepartmentName = 'Physics and Science'
WHERE DepartmentID = 3;

--delete
DELETE FROM Departments_FPP
WHERE DepartmentID = 3;

-- 2. RETRIEVE STUDENTS WHO ENROLLED AFTER 2022

SELECT *
FROM Students_FPP
WHERE EnrollmentDate > '2022-12-31';

-- 3. RETRIEVE COURSES OFFERED BY THE MATHEMATICS DEPARTMENT WITH A LIMIT OF 5 COURSE

SELECT
    c.CourseID,
    c.CourseName,
    c.DepartmentID,
    c.Credits
FROM Courses_FPP c
INNER JOIN Departments_FPP d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;


-- 4. GET NUMBER OF STUDENTS ENROLLED IN EACH COURSE FILTERING FOR COURSES WITH MORE THAN 5 STUDENTS

SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS StudentCount
FROM Courses_FPP c
INNER JOIN Enrollments_FPP e
ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;

-- 5. FIND STUDENTS ENROLLED IN BOTH INTRODUCTION TO SQL AND DATA STRUCTURES

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students_FPP s
INNER JOIN Enrollments_FPP e
ON s.StudentID = e.StudentID
INNER JOIN Courses_FPP c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

-- 6. FIND STUDENTS WHO ARE EITHER ENROLLED IN  INTRODUCTION TO SQL OR DATA STRUCTURES

SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students_FPP s
INNER JOIN Enrollments_FPP e
ON s.StudentID = e.StudentID
INNER JOIN Courses_FPP c
ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

-- 7. CALCULATE THE AVERAGE NUMBER OF CREDITS FOR ALL COURSES

SELECT
    AVG(Credits) AS AverageCredits
FROM Courses_FPP;

-- 8. FIND THE MAXIMUM SALARY OF INSTRUCTORS IN THE COMPUTER SCIENCE DEPARTMENT

-- 9. COUNT THE NUMBER OF STUDENTS ENROLLED IN EACH DEPARTMENT

SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments_FPP d
LEFT JOIN Courses_FPP c
ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments_FPP e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 10. INNER JOINS RETRIEVE STUDENTS AND THEIR CORRESPONDING COURSES

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName
FROM Students_FPP s
INNER JOIN Enrollments_FPP e
ON s.StudentID = e.StudentID
INNER JOIN Courses_FPP c
ON e.CourseID = c.CourseID;

-- 11. LEFT JOIN:RETRIEVE ALL STUDENTS AND THEIR CORRESPONDING COURSES, IF ANY

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseID,
    c.CourseName
FROM Students_FPP s
LEFT JOIN Enrollments_FPP e
ON s.StudentID = e.StudentID
LEFT JOIN Courses_FPP c
ON e.CourseID = c.CourseID;

-- 12. SUBQUERY: FIND STUDENTS ENROLLED IN COURSES THAT HAVE MORE THAN 10 STUDENTS

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students_FPP s
INNER JOIN Enrollments_FPP e
ON s.StudentID = e.StudentID
WHERE e.CourseID IN
(
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
);


-- 13. EXTRACT THE YEAR FROM THE ENROLLMENTDATE  OF STUDENTS

SELECT
    StudentID,
    FirstName,
    LastName,
    EXTRACT(YEAR FROM EnrollmentDate) AS EnrollmentYear
FROM Students_FPP;

-- 14. CONCATENATE THE INSTRUCTOR'S FIRST AND LAST NAME

SELECT
    InstructorID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors_FPP;


-- 15. CALCULATE THE RUNNING TOTAL OF STUDENTS ENROLLED IN COURSES

SELECT
    EnrollmentID,
    StudentID,
    CourseID,
    EnrollmentDate,
    COUNT(*) OVER
    (
        ORDER BY EnrollmentDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Enrollments_FPP;


-- 16. LABEL STUDENTS AS SENIOR OR JUNIOR BASED ON THEIR YEAR OF ENROLLMENT

SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        WHEN EnrollmentDate < CURRENT_DATE - INTERVAL '4 years'
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel
FROM Students_FPP;