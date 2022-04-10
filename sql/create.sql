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
D68_LOG numeric DEFAULT 0 NOT NULL constraint D68_LOG_positive check (D68_LOG >= 0),
D68_RP numeric DEFAULT 0 NOT NULL constraint D68_RP_positive check (D68_RP >= 0),
D68_RSECOCC numeric DEFAULT 0 NOT NULL constraint D68_RSECOCC_positive check (D68_RSECOCC >= 0),
D68_LOGVAC numeric DEFAULT 0 NOT NULL constraint D68_LOGVAC_positive check (D68_LOGVAC >= 0),
D68_NPER_RP numeric DEFAULT 0 NOT NULL constraint D68_NPER_RP_positive check (D68_NPER_RP >= 0)
);

CREATE TABLE IF NOT EXISTS stats_1975 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D75_POP int constraint D75_POP_positive check (D75_POP >= 0),
D75_LOG numeric DEFAULT 0 NOT NULL constraint D75_LOG_positive check (D75_LOG >= 0),
D75_RP numeric DEFAULT 0 NOT NULL constraint D75_RP_positive check (D75_RP >= 0),
D75_RSECOCC numeric DEFAULT 0 NOT NULL constraint D75_RSECOCC_positive check (D75_RSECOCC >= 0),
D75_LOGVAC numeric DEFAULT 0 NOT NULL constraint D75_LOGVAC_positive check (D75_LOGVAC >= 0),
D75_NPER_RP numeric DEFAULT 0 NOT NULL constraint D75_NPER_RP_positive check (D75_NPER_RP >= 0)
);

CREATE TABLE IF NOT EXISTS stats_1982 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D82_POP int constraint D82_POP_positive check (D82_POP >= 0),
D82_LOG numeric DEFAULT 0 NOT NULL constraint D82_LOG_positive check (D82_LOG >= 0),
D82_RP numeric DEFAULT 0 NOT NULL constraint D82_RP_positive check (D82_RP >= 0),
D82_RSECOCC numeric DEFAULT 0 NOT NULL constraint D82_RSECOCC_positive check (D82_RSECOCC >= 0),
D82_LOGVAC numeric DEFAULT 0 NOT NULL constraint D82_LOGVAC_positive check (D82_LOGVAC >= 0),
D82_NPER_RP numeric DEFAULT 0 NOT NULL constraint D82_NPER_RP_positive check (D82_NPER_RP >= 0)
);

CREATE TABLE IF NOT EXISTS stats_1990 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D90_POP int constraint D90_POP_positive check (D90_POP >= 0),
D90_LOG numeric DEFAULT 0 NOT NULL constraint D90_LOG_positive check (D90_LOG >= 0),
D90_RP numeric DEFAULT 0 NOT NULL constraint D90_RP_positive check (D90_RP >= 0),
D90_RSECOCC numeric DEFAULT 0 NOT NULL constraint D90_RSECOCC_positive check (D90_RSECOCC >= 0),
D90_LOGVAC numeric DEFAULT 0 NOT NULL constraint D90_LOGVAC_positive check (D90_LOGVAC >= 0),
D90_NPER_RP numeric DEFAULT 0 NOT NULL constraint D90_NPER_RP_positive check (D90_NPER_RP >= 0)
);

CREATE TABLE IF NOT EXISTS stats_1999 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
D99_POP int constraint D99_POP_positive check (D99_POP >= 0),
D99_LOG numeric DEFAULT 0 NOT NULL constraint D99_LOG_positive check (D99_LOG >= 0),
D99_RP numeric DEFAULT 0 NOT NULL constraint D99_RP_positive check (D99_RP >= 0),
D99_RSECOCC numeric DEFAULT 0 NOT NULL constraint D99_RSECOCC_positive check (D99_RSECOCC >= 0),
D99_LOGVAC numeric DEFAULT 0 NOT NULL constraint D99_LOGVAC_positive check (D99_LOGVAC >= 0),
D99_PMEN numeric DEFAULT 0 NOT NULL constraint D99_PMEN_positive check (D99_PMEN >= 0)
);

CREATE TABLE IF NOT EXISTS stats_2008 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
P08_POP int constraint P08_POP_positive check (P08_POP >= 0),
P08_LOG numeric DEFAULT 0 NOT NULL constraint P08_LOG_positive check (P08_LOG >= 0),
P08_RP numeric DEFAULT 0 NOT NULL constraint P08_RP_positive check (P08_RP >= 0),
P08_RSECOCC numeric DEFAULT 0 NOT NULL constraint P08_RSECOCC_positive check (P08_RSECOCC >= 0),
P08_LOGVAC numeric DEFAULT 0 NOT NULL constraint P08_LOGVAC_positive check (P08_LOGVAC >= 0),
P08_PMEN numeric DEFAULT 0 NOT NULL constraint P08_PMEN_positive check (P08_PMEN >= 0)
);

CREATE TABLE IF NOT EXISTS stats_2013 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
P13_POP int constraint P13_POP_positive check (P13_POP >= 0),
P13_LOG numeric DEFAULT 0 NOT NULL constraint P13_LOG_positive check (P13_LOG >= 0),
P13_RP numeric DEFAULT 0 NOT NULL constraint P13_RP_positive check (P13_RP >= 0),
P13_RSECOCC numeric DEFAULT 0 NOT NULL constraint P13_RSECOCC_positive check (P13_RSECOCC >= 0),
P13_LOGVAC numeric DEFAULT 0 NOT NULL constraint P13_LOGVAC_positive check (P13_LOGVAC >= 0),
P13_PMEN numeric DEFAULT 0 NOT NULL constraint P13_PMEN_positive check (P13_PMEN >= 0)
);

CREATE TABLE IF NOT EXISTS stats_2018 (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
P18_POP int constraint P18_POP_positive check (P18_POP >= 0),
P18_LOG numeric DEFAULT 0 NOT NULL constraint P18_LOG_positive check (P18_LOG >= 0),
P18_RP numeric DEFAULT 0 NOT NULL constraint P18_RP_positive check (P18_RP >= 0),
P18_RSECOCC numeric DEFAULT 0 NOT NULL constraint P18_RSECOCC_positive check (P18_RSECOCC >= 0),
P18_LOGVAC numeric DEFAULT 0 NOT NULL constraint P18_LOGVAC_positive check (P18_LOGVAC >= 0),
P18_PMEN numeric DEFAULT 0 NOT NULL constraint P18_PMEN_positive check (P18_PMEN >= 0)
);


