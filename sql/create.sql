CREATE TABLE IF NOT EXISTS regions (
REG varchar(3) PRIMARY KEY,
NCC varchar(200),
LIBELLE varchar(200)
);


CREATE TABLE IF NOT EXISTS departements (
DEP varchar(3) PRIMARY KEY,
REG char(2) references regions(REG) ON DELETE CASCADE,
NCC varchar(200),
LIBELLE varchar(200)
);

CREATE TABLE IF NOT EXISTS communes (
COM varchar(5) PRIMARY KEY,
DEP char(3) references departements(DEP) ON DELETE CASCADE,
NCC varchar(200),
LIBELLE varchar(200)
);


CREATE TABLE IF NOT EXISTS departements_cheflieu (
DEP varchar(3) PRIMARY KEY,
CHEFLIEU char(5) references communes(COM) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS regions_cheflieu (
REG varchar(2) PRIMARY KEY,
CHEFLIEU char(5) references communes(COM) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS indicateurs (
CODE varchar(5) PRIMARY KEY,
LIBELLE varchar(255)
);

CREATE TABLE IF NOT EXISTS statistiques (
CODGEO varchar(5)REFERENCES communes(COM) ON DELETE CASCADE,
ANNEE smallint,
INDICATEUR varchar(5) REFERENCES indicateurs(CODE) ON DELETE CASCADE,
VALEUR numeric DEFAULT 0 NOT NULL,
PRIMARY KEY (CODGEO, ANNEE, INDICATEUR)
);
