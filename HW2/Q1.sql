-- livesql.oracle.com


-- original
CREATE TABLE ProjectRoomBookings ( 
    roomNum INTEGER NOT NULL, 
    startTime INTEGER NOT NULL, 
    endTime INTEGER NOT NULL, 
    groupName CHAR(10) NOT NULL, 
    PRIMARY KEY (roomNum, startTime) 
);

INSERT INTO ProjectRoomBookings VALUES (1, 2, 5, 'A');
INSERT INTO ProjectRoomBookings VALUES (1, 10, 12, 'B');

SELECT * 
FROM ProjectRoomBookings;

-- new
CREATE TABLE NewProjectRoomBookings ( 
    roomNum INTEGER NOT NULL, 
    startTimeForAnHour INTEGER NOT NULL, 
    groupName CHAR(10) NOT NULL, 
    PRIMARY KEY (roomNum, startTimeForAnHour) 
);

INSERT INTO NewProjectRoomBookings VALUES (1, 2, 'A');
INSERT INTO NewProjectRoomBookings VALUES (1, 3, 'A');
INSERT INTO NewProjectRoomBookings VALUES (1, 4, 'A');
INSERT INTO NewProjectRoomBookings VALUES (1, 10, 'B');
INSERT INTO NewProjectRoomBookings VALUES (1, 11, 'B');

SELECT * 
FROM NewProjectRoomBookings;

-- (1) 
-- To ensure that end time is always after start time:
-- I created a column called 'startTimeForAnHour' to represent just one hour, [startTimeForAnHour:00 - startTimeForAnHour:59]
-- In original table, to reserve a room from time i to i+x, there was only one row inserted.
-- On the other hand, there should be one row for each hour they want to reserve. 
-- As this table does not require users to manually enter start time and end time, illegal cases can be avoided.
-- Assumption: startTimeForAnHour will be from [0, 23]

-- (2) 
-- To ensure that same rooms are not booked by multiple groups at the same time
-- I set the combination of room number and timeForAnHour as primary key of the table.
-- This is to make sure that one room for an hour can only be reserved by only group.
