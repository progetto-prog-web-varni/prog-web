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
    ('Sara', 'Barbi', '1990-01-01', 'sara.barbi@example.com', 'sarabarbi', '13Admin!', 'amministratore'),
    ('Emma', 'Rossi', '1992-05-15', 'emma.rossi@example.com', 'emmarossi', 'Age0002!', 'simpatizzante'),
    ('Giulia', 'Bianchi', '1985-09-20', 'giulia.bianchi@example.com', 'giuliabianchi', 'Age0003!', 'simpatizzante'),
    ('Gaia', 'Olivieri', '1998-03-10', 'gaia.olivieri@example.com', 'gaiaolivieri', 'Age0004!', 'simpatizzante'),
    ('Cecilia', 'Adami', '1994-07-22', 'cecilia.adami@example.com', 'ceciliadami', 'Age0005!', 'simpatizzante'),
    ('Sofia', 'Romano', '1987-12-05', 'sofia.romano@example.com', 'sofiaromano', 'Age0006!', 'simpatizzante'),
    ('Agnese', 'Gallo', '1993-02-14', 'agnese.gallo@example.com', 'agnesegallo', 'Age0007!', 'simpatizzante'),
    ('Anna', 'Costa', '1996-06-08', 'anna.costa@example.com', 'annacosta', 'Age0008!', 'simpatizzante'),
    ('Martina', 'Fontana', '1991-04-18', 'martina.fontana@example.com', 'martinafontana', 'Age0009!', 'simpatizzante'),
    ('Matteo', 'Russo', '1989-08-30', 'matteo.russo@example.com', 'matteorusso', 'Age0010!', 'simpatizzante'),
    ('Mattia', 'Ferrari', '1997-11-12', 'mattia.ferrari@example.com', 'mattiaferrari', 'Age0011!', 'simpatizzante'),
    ('Massimo', 'Marino', '1995-01-25', 'massimo.marino@example.com', 'massimomarino', 'Age0012!', 'aderente'),
    ('Federico', 'Greco', '1992-03-05', 'ferrico.greco@example.com', 'federicogreco', 'Age0013!', 'aderente'),
    ('Filippo', 'Barbieri', '1988-05-28', 'filippo.barbieri@example.com', 'filippobarbieri', 'Age0014!', 'aderente'),
    ('Francesco', 'Lombardi', '1999-07-16', 'francesco.lombardi@example.com', 'francescolombardi', 'Age0015!', 'aderente'),
    ('Andrea', 'Giordano', '1993-09-02', 'andrea.giordano@example.com', 'andreagiordano', 'Age0016!', 'aderente'),
    ('Davide', 'Colombo', '1997-12-19', 'davide.colombo@example.com', 'davidecolombo', 'Age0017!', 'aderente'),
    ('Samuele', 'Mancini', '1994-02-09', 'samuele.mancini@example.com', 'samuelemancini', 'Age0018!', 'aderente'),
    ('Gianmarco', 'Longo', '1991-06-26', 'gianmarco.longo@example.com', 'gianmarcolongo', 'Age0019!', 'aderente'),
    ('Luca', 'Leone', '1996-10-14', 'luca.leone@example.com', 'lucaleone', 'Age0020!' , 'aderente');


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

INSERT INTO COUNTERS (PAGENAME, HITS)
VALUES ('Home', 0),
       ('Chi_Siamo', 0),
       ('Attivita', 0),
       ('Contatti', 0),
       ('Signup', 0),
       ('Login', 0);





