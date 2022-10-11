-- livesql.oracle.com


CREATE TABLE Instructors(
    Instructor CHAR(15) NOT NULL,
    HourlyRate INTEGER NOT NULL, 
    Subject CHAR(30) NOT NULL,
    PRIMARY KEY (Instructor, Subject));  

INSERT INTO Instructors VALUES ('Aleph', 10, 'MIDI controllers');        
INSERT INTO Instructors VALUES ('Aleph', 10, 'Sound mixing');         
INSERT INTO Instructors VALUES ('Aleph', 10, 'Synthesis algorithms');    
INSERT INTO Instructors VALUES ('Bit', 20, 'EDM synthesis');
INSERT INTO Instructors VALUES ('Bit', 20, 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Bit', 20, 'Sound mixing'); 
INSERT INTO Instructors VALUES ('CRC', 30, 'EDM synthesis');
INSERT INTO Instructors VALUES ('CRC', 30, 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Dat', 20, 'MIDI controllers');
INSERT INTO Instructors VALUES ('Dat', 20, 'EDM synthesis');
INSERT INTO Instructors VALUES ('Dat', 20, 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Emscr', 10, 'MIDI controllers');
INSERT INTO Instructors VALUES ('Emscr', 10, 'Synthesis algorithms');
INSERT INTO Instructors VALUES ('Emscr', 10, 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Emscr', 10, 'EDM synthesis'); 

CREATE TABLE Subjects(
    Subject Char(30) NOT NULL,
    NumStudentsEnrolled INTEGER NOT NULL, 
    PRIMARY KEY(Subject));

INSERT INTO Subjects VALUES ('Electronic Music Fundamentals', 10); 
INSERT INTO Subjects VALUES ('Synthesis algorithms', 20); 
INSERT INTO Subjects VALUES ('MIDI controllers', 30); 
INSERT INTO Subjects VALUES ('EDM synthesis', 40); 
INSERT INTO Subjects VALUES ('Sound mixing', 50);


-- Outputs amount of bonus paid to an instructor by subject 
SELECT I.Instructor, I.HourlyRate * S.NumStudentsEnrolled * 0.1 AS BonusBySubject, I.Subject
FROM Instructors I 
JOIN Subjects S
ON I.Subject = S.Subject;

-- Outputs highest amount of bonus paid to an instructor
SELECT MAX(SUM(I.HourlyRate * S.NumStudentsEnrolled * 0.1)) AS MaxBonus
FROM Instructors I 
JOIN Subjects S
ON I.Subject = S.Subject
GROUP BY I.Instructor;

-- ANSWER: Outputs instructors with the highest bonus amount paid
SELECT I.Instructor, SUM(I.HourlyRate * S.NumStudentsEnrolled  * 0.1) AS TotalBonus
FROM Instructors I 
JOIN Subjects S
ON I.Subject = S.Subject
GROUP BY I.Instructor
HAVING SUM (I.HourlyRate * S.NumStudentsEnrolled  * 0.1) = (
    SELECT MAX(SUM(I.HourlyRate * S.NumStudentsEnrolled  * 0.1)) AS maxBonus
    FROM Instructors I 
    JOIN Subjects S
    ON I.Subject = S.Subject
    GROUP BY I.Instructor
);