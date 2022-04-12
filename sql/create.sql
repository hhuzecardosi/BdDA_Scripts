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

CREATE TABLE IF NOT EXISTS statistiques (
CODGEO varchar(5) PRIMARY KEY REFERENCES communes(COM),
ANNEE smallint PRIMARY KEY,
INDICATEUR varchar(5) PRIMARY KEY REFERENCES indicateurs(CODE),
VALEUR numeric DEFAULT 0 NOT NULL
);

CREATE TABLE IF NOT EXISTS indicateurs (
CODE varchar(5) PRIMARY KEY,
LIBELLE varchar(255),
);