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
POPULATION int constraint POPULATION_positive check (POPULATION >= 0),
LOGEMENTS numeric DEFAULT 0 NOT NULL constraint LOGEMENTS_positive check (LOGEMENTS >= 0),
RESIDENCE numeric DEFAULT 0 NOT NULL constraint RESIDENCE_positive check (RESIDENCE >= 0),
LOGEMENTS_SECONDAIRE numeric DEFAULT 0 NOT NULL constraint LOGEMENTS_SECONDAIRE_positive check (LOGEMENTS_SECONDAIRE >= 0),
LOGEMENTS_VACANTS numeric DEFAULT 0 NOT NULL constraint LOGEMENTS_VACANTS_positive check (LOGEMENTS_VACANTS >= 0),
POPULATION_MENAGES numeric DEFAULT 0 NOT NULL constraint POPULATION_MENAGES_positive check (POPULATION_MENAGES >= 0)
);