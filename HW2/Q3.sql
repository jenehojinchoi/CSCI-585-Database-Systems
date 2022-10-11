-- livesql.oracle.com


CREATE TABLE Projects ( 
    PID CHAR(10) NOT NULL, 
    Step INTEGER NOT NULL, 
    Status CHAR(10) NOT NULL, 
    PRIMARY KEY (PID, Step) 
);

INSERT INTO Projects VALUES ('P100', 0, 'C');
INSERT INTO Projects VALUES ('P100', 1, 'W');
INSERT INTO Projects VALUES ('P100', 2, 'W');
INSERT INTO Projects VALUES ('P201', 0, 'C');
INSERT INTO Projects VALUES ('P201', 1, 'C');
INSERT INTO Projects VALUES ('P333', 0, 'W');
INSERT INTO Projects VALUES ('P333', 1, 'W');
INSERT INTO Projects VALUES ('P333', 2, 'W');
INSERT INTO Projects VALUES ('P333', 3, 'W');

SELECT PID 
FROM ( 
    SELECT PID, COUNT(Status) AS cCount 
    FROM Projects 
    WHERE Status = 'C' 
    GROUP BY PID) 
WHERE cCount = 1;