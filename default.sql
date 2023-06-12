CREATE TABLE USERS (
    ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(255),
    SURNAME VARCHAR(255),
    BIRTHDATE VARCHAR(10),
    EMAIL VARCHAR(255),
    PHONE VARCHAR(12),
    USERNAME VARCHAR(255),
    PASSWORD VARCHAR(255),
    ROLE VARCHAR(50)
);

INSERT INTO USERS (NAME, SURNAME, BIRTHDATE, EMAIL, PHONE, USERNAME, PASSWORD, ROLE)
VALUES
    ('Sara', 'Barbi', '1990-01-01', 'sara.barbi@example.com', '123-123-1234', 'admin', '13Adm1n!', 'amministratore'),
    ('Emma', 'Rossi', '1992-05-15', 'emma.rossi@example.com', '123-123-1234', 'emmarossi', 'Age0002!', 'simpatizzante'),
    ('Giulia', 'Bianchi', '1985-09-20', 'giulia.bianchi@example.com', '123-123-1234' ,'giuliabianchi', 'Age0003!', 'simpatizzante'),
    ('Gaia', 'Olivieri', '1998-03-10', 'gaia.olivieri@example.com', '123-123-1234','gaiaolivieri', 'Age0004!', 'simpatizzante'),
    ('Cecilia', 'Adami', '1994-07-22', 'cecilia.adami@example.com', '123-123-1234', 'ceciliadami', 'Age0005!', 'simpatizzante'),
    ('Sofia', 'Romano', '1987-12-05', 'sofia.romano@example.com','123-123-1234', 'sofiaromano', 'Age0006!', 'simpatizzante'),
    ('Agnese', 'Gallo', '1993-02-14', 'agnese.gallo@example.com', '123-123-1234', 'agnesegallo', 'Age0007!', 'simpatizzante'),
    ('Anna', 'Costa', '1996-06-08', 'anna.costa@example.com', '123-123-1234', 'annacosta', 'Age0008!', 'simpatizzante'),
    ('Martina', 'Fontana', '1991-04-18', 'martina.fontana@example.com', '123-123-1234', 'martinafontana', 'Age0009!', 'simpatizzante'),
    ('Matteo', 'Russo', '1989-08-30', 'matteo.russo@example.com', '123-123-1234', 'matteorusso', 'Age0010!', 'simpatizzante'),
    ('Mattia', 'Ferrari', '1997-11-12', 'mattia.ferrari@example.com', '123-123-1234', 'mattiaferrari', 'Age0011!', 'simpatizzante'),
    ('Massimo', 'Marino', '1995-01-25', 'massimo.marino@example.com', '123-123-1234', 'massimomarino', 'Age0012!', 'aderente'),
    ('Federico', 'Greco', '1992-03-05', 'ferrico.greco@example.com', '123-123-1234', 'federicogreco', 'Age0013!', 'aderente'),
    ('Filippo', 'Barbieri', '1988-05-28', 'filippo.barbieri@example.com', '123-123-1234', 'filippobarbieri', 'Age0014!', 'aderente'),
    ('Francesco', 'Lombardi', '1999-07-16', 'francesco.lombardi@example.com', '123-123-1234', 'francescolombardi', 'Age0015!', 'aderente'),
    ('Andrea', 'Giordano', '1993-09-02', 'andrea.giordano@example.com', '123-123-1234', 'andreagiordano', 'Age0016!', 'aderente'),
    ('Davide', 'Colombo', '1997-12-19', 'davide.colombo@example.com',  '123-123-1234', 'davidecolombo', 'Age0017!', 'aderente'),
    ('Samuele', 'Mancini', '1994-02-09', 'samuele.mancini@example.com', '123-123-1234', 'samuelemancini', 'Age0018!', 'aderente'),
    ('Gianmarco', 'Longo', '1991-06-26', 'gianmarco.longo@example.com', '123-123-1234', 'gianmarcolongo', 'Age0019!', 'aderente'),
    ('Luca', 'Leone', '1996-10-14', 'luca.leone@example.com', 'lucaleone', '123-123-1234', 'Age0020!' , 'aderente');


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
    USERID INT PRIMARY KEY,
    ACTIVITY1 BOOLEAN,
    ACTIVITY2 BOOLEAN,
    ACTIVITY3 BOOLEAN,
    FOREIGN KEY (USERID) REFERENCES USERS(ID) ON DELETE CASCADE
);


INSERT INTO ACTIVITY (USERID, ACTIVITY1, ACTIVITY2, ACTIVITY3)
VALUES
    (1, false, false, false),
    (2, false, false, false),
    (3, false, false, false),
    (4, false, false, false),
    (5, false, false, false),
    (6, false, false, false),
    (7, false, false, false),
    (8, false, false, false),
    (9, false, false, false),
    (10, false, false, false),
    (11, false, false, false),
    (12, false, false, false),
    (13, false, false, false),
    (14, false, false, false),
    (15, false, false, false),
    (16, false, false, false),
    (17, false, false, false),
    (18, false, false, false),
    (19, false, false, false),
    (20, false, false, false);

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





