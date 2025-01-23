CREATE TABLE utilisateur(
    idUtil CHAR(4) PRIMARY KEY ,
    nomUtil VARCHAR(30) NOT NULL,
    prenomUtil VARCHAR(30)NOT NULL,
    emailUtil VARCHAR(30)NOT NULL UNIQUE 
)

CREATE TABLE evenement(
    idEvnt CHAR(4) PRIMARY KEY ,
    titrEvnt VARCHAR(30) NOT NULL,
    descriptionEvnt VARCHAR(30)NOT NULL,
    DateTimeEvnt DATETIME ,
    catégorieEvnt VARCHAR(30)NOT NULL,
    tarifEvnt  VARCHAR(30)NOT NULL
)

CREATE TABLE salle(
    idSalle CHAR(4) PRIMARY KEY ,
    capacitéNbrPlc VARCHAR(30) NOT NULL,
    description VARCHAR(30)NOT NULL
)

CREATE TABLE billet(
    idBit CHAR(4) PRIMARY KEY ,
    TypeBit VARCHAR(30) NOT NULL , 
    numéroPlc VARCHAR(30) NOT NULL , 
    idRsv char(4) , CONSTRAINT fk_reservatio FOREIGN KEY(idRsv) REFERENCES reservation(idRsv) 
    on delete cascade on update cascade
)

CREATE TABLE reservation(
    idRsv CHAR(4) PRIMARY KEY ,
    nombreBitNorm VARCHAR(30) NOT NULL ,
    nombreBitRedt VARCHAR(30) NOT NULL ,
    idUtil VARCHAR(4),
    CONSTRAINT fk_utilisateur FOREIGN KEY(idUtil) REFERENCES utilisateur( idUtil)
    on delete cascade on update cascade 
)

CREATE TABLE edition(
    idEdition CHAR(4) PRIMARY KEY ,
    dateEvent DATETIME  ,
    idSalle char(4) ,
    CONSTRAINT fk_Salle FOREIGN KEY(idSalle) REFERENCES salle( idSalle) 
    on delete cascade on update cascade ,
    idRsv char(4), 
    CONSTRAINT fk_reservation FOREIGN KEY(idRsv) REFERENCES reservation( idRsv)
     on delete cascade on update cascade,
    idEvnt char(4) ,
    CONSTRAINT fk_evenement FOREIGN KEY(idEvnt) REFERENCES evenement( idEvnt)
     on delete cascade on update cascade 
)