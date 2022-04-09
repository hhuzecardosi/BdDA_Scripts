CREATE TABLE IF NOT EXISTS regions (
REG varchar(3) PRIMARY KEY,
NCC varchar(200),
LIBELLE varchar(200)
);


CREATE TABLE IF NOT EXISTS departements (
DEP varchar(3) PRIMARY KEY,
REG char(2) references regions(REG),
NCC varchar(200),
LIBELLE varchar(200)
);

CREATE TABLE IF NOT EXISTS communes (
COM varchar(5) PRIMARY KEY,
REG char(2) references regions(REG),
DEP char(3) references departements(DEP),
NCC varchar(200),
LIBELLE varchar(200)
);


CREATE TABLE IF NOT EXISTS departements_cheflieu (
DEP varchar(3) PRIMARY KEY,
CHEFLIEU char(5) references communes(COM)
);

CREATE TABLE IF NOT EXISTS regions_cheflieu (
REG varchar(2) PRIMARY KEY,
CHEFLIEU char(5) references communes(COM)
);

CREATE TABLE IF NOT EXISTS stats_1968 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D68_POP int constraint D68_POP_positive check (D68_POP >= 0),
D68_LOG varchar(50),
D68_RP varchar(50),
D68_RSECOCC varchar(50),
D68_LOGVAC varchar(50),
D68_NPER_RP varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_1975 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D75_POP int constraint D75_POP_positive check (D75_POP >= 0),
D75_LOG varchar(50),
D75_RP varchar(50),
D75_RSECOCC varchar(50),
D75_LOGVAC varchar(50),
D75_NPER_RP varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_1982 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D82_POP int constraint D82_POP_positive check (D82_POP >= 0),
D82_LOG varchar(50),
D82_RP varchar(50),
D82_RSECOCC varchar(50),
D82_LOGVAC varchar(50),
D82_NPER_RP varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_1990 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D90_POP int constraint D90_POP_positive check (D90_POP >= 0),
D90_LOG varchar(50),
D90_RP varchar(50),
D90_RSECOCC varchar(50),
D90_LOGVAC varchar(50),
D90_NPER_RP varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_1999 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D99_POP int constraint D99_POP_positive check (D99_POP >= 0),
D99_LOG varchar(50),
D99_RP varchar(50),
D99_RSECOCC varchar(50),
D99_LOGVAC varchar(50),
D99_PMEN varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_2008 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
P08_POP int constraint P08_POP_positive check (P08_POP >= 0),
P08_LOG varchar(50),
P08_RP varchar(50),
P08_RSECOCC varchar(50),
P08_LOGVAC varchar(50),
P08_PMEN varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_2013 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
P13_POP int constraint P13_POP_positive check (P13_POP >= 0),
P13_LOG varchar(50),
P13_RP varchar(50),
P13_RSECOCC varchar(50),
P13_LOGVAC varchar(50),
P13_PMEN varchar(50)
);

CREATE TABLE IF NOT EXISTS stats_2018 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
P18_POP int constraint P18_POP_positive check (P18_POP >= 0),
P18_LOG varchar(50),
P18_RP varchar(50),
P18_RSECOCC varchar(50),
P18_LOGVAC varchar(50),
P18_PMEN varchar(50)
);

