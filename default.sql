CREATE TABLE USERS (
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(255),
    SURNAME VARCHAR(255),
    BIRTHDATE VARCHAR(10),
    EMAIL VARCHAR(255),
    USERNAME VARCHAR(255),
    PASSWORD VARCHAR(255),
    ROLE VARCHAR(50)
);

INSERT INTO USERS (NAME, SURNAME, BIRTHDATE, EMAIL, USERNAME, PASSWORD, ROLE)
VALUES
    ('John', 'Doe', '1990-01-01', 'john.doe@example.com', 'johndoe', 'password1', 'amministratore'),
    ('Jane', 'Smith', '1992-05-15', 'jane.smith@example.com', 'janesmith', 'password2', 'simpatizzante'),
    ('Michael', 'Johnson', '1985-09-20', 'michael.johnson@example.com', 'michaeljohnson', 'password3', 'simpatizzante'),
    ('Emily', 'Williams', '1998-03-10', 'emily.williams@example.com', 'emilywilliams', 'password4', 'simpatizzante'),
    ('Daniel', 'Brown', '1994-07-22', 'daniel.brown@example.com', 'danielbrown', 'password5', 'simpatizzante'),
    ('Sophia', 'Miller', '1987-12-05', 'sophia.miller@example.com', 'sophiamiller', 'password6', 'simpatizzante'),
    ('Matthew', 'Anderson', '1993-02-14', 'matthew.anderson@example.com', 'matthewanderson', 'password7', 'simpatizzante'),
    ('Olivia', 'Taylor', '1996-06-08', 'olivia.taylor@example.com', 'oliviataylor', 'password8', 'simpatizzante'),
    ('Andrew', 'Wilson', '1991-04-18', 'andrew.wilson@example.com', 'andrewwilson', 'password9', 'simpatizzante'),
    ('Emma', 'Thomas', '1989-08-30', 'emma.thomas@example.com', 'emmathomas', 'password10', 'simpatizzante'),
    ('Christopher', 'Martinez', '1997-11-12', 'christopher.martinez@example.com', 'christophermartinez', 'password11', 'simpatizzante'),
    ('Ava', 'Garcia', '1995-01-25', 'ava.garcia@example.com', 'avagarcia', 'password12', 'aderente'),
    ('David', 'Lopez', '1992-03-05', 'david.lopez@example.com', 'davidlopez', 'password13', 'aderente'),
    ('Mia', 'Hernandez', '1988-05-28', 'mia.hernandez@example.com', 'miahernandez', 'password14', 'aderente'),
    ('Joshua', 'Young', '1999-07-16', 'joshua.young@example.com', 'joshuayoung', 'password15', 'aderente'),
    ('Isabella', 'Lee', '1993-09-02', 'isabella.lee@example.com', 'isabellalee', 'password16', 'aderente'),
    ('Ethan', 'Clark', '1997-12-19', 'ethan.clark@example.com', 'ethanclark', 'password17', 'aderente'),
    ('Sophia', 'Rodriguez', '1994-02-09', 'sophia.rodriguez@example.com', 'sophiarodriguez', 'password18', 'aderente'),
    ('Alexander', 'Lewis', '1991-06-26', 'alexander.lewis@example.com', 'alexanderlewis', 'password19', 'aderente'),
    ('Emily', 'Hall', '1996-10-14', 'emily.hall@example.com', 'emilyhall', 'password20', 'amministratore');

CREATE TABLE PAYMENT (
    MESE INT,
    VALORE INT
);

INSERT INTO PAYMENT (MESE, VALORE)
VALUES
    (1, 100),
    (2, 200),
    (3, 150),
    (4, 300),
    (5, 250),
    (6, 180),
    (7, 0),
    (8, 0),
    (9, 0),
    (10, 0),
    (11, 0),
    (12, 0);


CREATE TABLE ACTIVITY (
    USERID INT,
    ACTIVITY1 BOOLEAN,
    ACTIVITY2 BOOLEAN,
    ACTIVITY3 BOOLEAN
);


INSERT INTO ACTIVITY (USERID, ACTIVITY1, ACTIVITY2, ACTIVITY3)
VALUES
    (2, true, true, false),
    (3, false, true, true),
    (4, false, false, true),
    (5, true, true, true),
    (6, true, false, true);

CREATE TABLE COUNTERS (
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    PAGENAME VARCHAR(300),
    HITS INT
);

