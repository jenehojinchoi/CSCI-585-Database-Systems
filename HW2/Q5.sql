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

SELECT I1.Instructor
FROM Instructors I1
INNER JOIN Instructors I2 ON (I2.Instructor = I1.Instructor AND I2.Subject = 'Electronic Music Fundamentals')
INNER JOIN Instructors I3 ON (I3.Instructor = I1.Instructor AND I3.Subject = 'MIDI controllers')
WHERE I1.Subject = 'EDM synthesis';

-- Self join the table to find Instructors with all three subjects.
-- First inner join outputs instructors who teach "Electronic Music Fundamentals"
-- Second inner join outputs instructors who teach  "Electronic Music Fundamentals" and "MIDI controllers"
-- Then where outputs instructors who teach all three subjects, which outputs only one instructor (one row)