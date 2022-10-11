-- livesql.oracle.com


CREATE TABLE Enrollment ( 
    SID INTEGER NOT NULL, 
    ClassName VARCHAR(35) NOT NULL, 
    Grade CHAR(10) NOT NULL 
);

INSERT INTO Enrollment VALUES (123, 'Synthesis algorithms', 'A');
INSERT INTO Enrollment VALUES (123, 'EDM synthesis', 'B');
INSERT INTO Enrollment VALUES (123, 'MIDI Controllers', 'B');
INSERT INTO Enrollment VALUES (662, 'Sound mixing', 'B');
INSERT INTO Enrollment VALUES (662, 'EDM synthesis', 'A');
INSERT INTO Enrollment VALUES (662, 'Electronic Music Fundamentals', 'A');
INSERT INTO Enrollment VALUES (662, 'MIDI Controllers', 'B');
INSERT INTO Enrollment VALUES (345, 'MIDI Controllers', 'A');
INSERT INTO Enrollment VALUES (345, 'Electronic Music Fundamentals', 'B');
INSERT INTO Enrollment VALUES (345, 'EDM synthesis', 'A');
INSERT INTO Enrollment VALUES (555, 'EDM synthesis', 'B');
INSERT INTO Enrollment VALUES (555, 'Electronic Music Fundamentals', 'B');
INSERT INTO Enrollment VALUES (213, 'Electronic Music Fundamentals', 'A');

SELECT ClassName, COUNT(*) AS Total 
FROM Enrollment 
GROUP BY ClassName 
ORDER BY Total DESC;