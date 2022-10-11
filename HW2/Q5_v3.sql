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


SELECT DISTINCT(Instructor) FROM Instructors I
WHERE
EXISTS (
    SELECT *
    FROM Instructors I2 
    WHERE I2.Instructor = I.Instructor AND Subject = 'Electronic Music Fundamentals'
)
AND EXISTS (
    SELECT *
    FROM Instructors I2
    WHERE I2.Instructor = I.Instructor AND Subject = 'MIDI controllers')
AND EXISTS (
    SELECT *
    FROM Instructors I2 
    WHERE I2.Instructor = I.Instructor AND Subject = 'EDM synthesis'
);

-- I am using EXISTS to see if there exists instructors that teach all three subjects
-- and outputs only unique instructors