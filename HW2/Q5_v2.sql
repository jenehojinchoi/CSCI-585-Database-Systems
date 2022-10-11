-- livesql.oracle.com


CREATE TABLE Instructors( 
    Instructor CHAR(15) NOT NULL, 
    Subject CHAR(30) NOT NULL, 
    PRIMARY KEY (Instructor, Subject)
);

INSERT INTO Instructors VALUES ('Aleph', 'MIDI controllers');
INSERT INTO Instructors VALUES ('Aleph', 'Sound mixing');
INSERT INTO Instructors VALUES ('Aleph', 'Synthesis algorithms');
INSERT INTO Instructors VALUES ('Bit', 'EDM synthesis');
INSERT INTO Instructors VALUES ('Bit', 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Bit', 'Sound mixing');
INSERT INTO Instructors VALUES ('CRC', 'EDM synthesis');
INSERT INTO Instructors VALUES ('CRC', 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Dat', 'MIDI controllers');
INSERT INTO Instructors VALUES ('Dat', 'EDM synthesis');
INSERT INTO Instructors VALUES ('Dat', 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Emscr', 'MIDI controllers');
INSERT INTO Instructors VALUES ('Emscr', 'Synthesis algorithms');
INSERT INTO Instructors VALUES ('Emscr', 'Electronic Music Fundamentals');
INSERT INTO Instructors VALUES ('Emscr', 'EDM synthesis');

SELECT Instructor 
FROM Instructors 
WHERE Subject IN ('Electronic Music Fundamentals', 'MIDI controllers', 'EDM synthesis') 
GROUP BY Instructor 
HAVING Count(*) = 3;

-- Select rows in instructors table with instructors who teach at least one subject among three subjects
-- Rows will have some duplicates, so group by Instructor to output unique instructors
-- Then filter by count(rows) = 3 so that the query outputs only the instructors who teach all three subjects