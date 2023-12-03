/*
  AUTOR: RenzoZ
  OBJETIVO: CREAR LAS TABLAS RESPECTIVAS A PARTIR DEL MODELO RELACIONAL PROPUESTO
*/



--CREACION DE LA TABLA DEPARTAMENTO, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE DEPARTAMENTO
(
COD_DEPARTAMENTO VARCHAR2(3),
NOM_DEPARTAMENTO VARCHAR(30) NOT NULL
) TABLESPACE TBS_D;

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT PK_COD_DEPARTAMENTO
PRIMARY KEY(COD_DEPARTAMENTO);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT UQ_NOM_DEPARTAMENTO
UNIQUE(NOM_DEPARTAMENTO);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT CK_COD_DEPARTAMENTO
CHECK (LENGTH(COD_DEPARTAMENTO) <= 3);




--CREACION DE LA TABLA PROVINCIA, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE PROVINCIA
(
COD_PROVINCIA VARCHAR2(5),
NOM_PROVINCIA VARCHAR2(50) NOT NULL,
COD_DEPARTAMENTO VARCHAR2(3)
) TABLESPACE TBS_D;

ALTER TABLE PROVINCIA
ADD CONSTRAINT PK_COD_PROVINCIA
PRIMARY KEY(COD_PROVINCIA);

ALTER TABLE PROVINCIA
ADD CONSTRAINT FK_COD_DEPARTAMENTO_PROVINCIA
FOREIGN KEY(COD_DEPARTAMENTO)
REFERENCES DEPARTAMENTO(COD_DEPARTAMENTO);

ALTER TABLE PROVINCIA
ADD CONSTRAINT UQ_NOM_PROVINCIA
UNIQUE(NOM_PROVINCIA);

ALTER TABLE PROVINCIA
ADD CONSTRAINT CK_COD_PROVINCIA
CHECK (LENGTH(COD_PROVINCIA) <= 5);

ALTER TABLE PROVINCIA
ADD CONSTRAINT CK_COD_DEPARTAMENTO_PROVINCIA
CHECK (LENGTH(COD_DEPARTAMENTO) <= 3);




--CREACION DE LA TABLA DISTRITO, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE DISTRITO
(
COD_UBIGEO VARCHAR2(7),
NOM_DISTRITO VARCHAR2(80) NOT NULL,
COD_PROVINCIA VARCHAR2(5)
) TABLESPACE TBS_D;

ALTER TABLE DISTRITO
ADD CONSTRAINT PK_COD_UBIGEO
PRIMARY KEY(COD_UBIGEO);

ALTER TABLE DISTRITO
ADD CONSTRAINT FK_COD_PROVINCIA_DISTRITO
FOREIGN KEY(COD_PROVINCIA)
REFERENCES PROVINCIA(COD_PROVINCIA);

ALTER TABLE DISTRITO
ADD CONSTRAINT UQ_NOM_DISTRITO
UNIQUE(NOM_DISTRITO);

ALTER TABLE DISTRITO
ADD CONSTRAINT CK_COD_UBIGEO
CHECK (LENGTH(COD_UBIGEO) <= 7);

ALTER TABLE DISTRITO
ADD CONSTRAINT CK_COD_PROVINCIA_DISTRITO
CHECK (LENGTH(COD_PROVINCIA) <= 5);




--CREACION DE LA TABLA PERSONA, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE PERSONA
(
COD_UUID VARCHAR2(9),
SEXO VARCHAR2(12) NOT NULL,
EDAD NUMBER NOT NULL,
COD_UBIGEO VARCHAR2(7)
)TABLESPACE TBS_D;

ALTER TABLE PERSONA
ADD CONSTRAINT PK_COD_UUID
PRIMARY KEY(COD_UUID);

ALTER TABLE PERSONA
ADD CONSTRAINT FK_COD_UBIGEO_PERSONA
FOREIGN KEY(COD_UBIGEO)
REFERENCES DISTRITO(COD_UBIGEO);

ALTER TABLE PERSONA
ADD CONSTRAINT CK_SEXO
CHECK(SEXO IN ('MASCULINO','FEMENINO'));

ALTER TABLE PERSONA
ADD CONSTRAINT CK_EDAD
CHECK(EDAD >= 0 AND EDAD <= 150);




--CREACION DE LA TABLA METODO_DETECCION, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE METODO_DETECCION
(
COD_METODO NUMBER,
NOM_METODO VARCHAR2(3)
)TABLESPACE TBS_D;

ALTER TABLE METODO_DETECCION
ADD CONSTRAINT PK_COD_METODO
PRIMARY KEY(COD_METODO);

ALTER TABLE METODO_DETECCION
ADD CONSTRAINT UQ_NOM_METODO
UNIQUE(NOM_METODO);

ALTER TABLE METODO_DETECCION
MODIFY (NOM_METODO NOT NULL);

ALTER TABLE METODO_DETECCION
ADD CONSTRAINT CK_NOM_METODO
CHECK(LENGTH(NOM_METODO) <= 3);




--CREACION DE LA TABLA CASOS_POSITIVOS, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE CASOS_POSITIVOS
(
COD_CASO NUMBER,
COD_UUID VARCHAR2(9),
COD_METODO NUMBER,
FECHA_RESULTADO DATE
) TABLESPACE TBS_D;

ALTER TABLE CASOS_POSITIVOS
ADD CONSTRAINT PK_COD_CASO
PRIMARY KEY(COD_CASO);

ALTER TABLE CASOS_POSITIVOS
ADD CONSTRAINT FK_COD_UUID_CASOS
FOREIGN KEY(COD_UUID)
REFERENCES PERSONA_C(COD_UUID);

ALTER TABLE CASOS_POSITIVOS
ADD CONSTRAINT FK_COD_METODO_CASOS
FOREIGN KEY(COD_METODO)
REFERENCES METODO_DETECCION(COD_METODO);

ALTER TABLE CASOS_POSITIVOS
ADD CONSTRAINT CK_COD_UUID_CASOS
CHECK(LENGTH(COD_UUID) <= 9);




--CREACION DE LA TABLA GRUPO_RIESGO, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE GRUPO_RIESGO
(
COD_GRUPO NUMBER,
TIPO_GRUPO VARCHAR2(200) NOT NULL
) TABLESPACE TBS_D;

ALTER TABLE GRUPO_RIESGO
ADD CONSTRAINT PK_COD_GRUPO
PRIMARY KEY(COD_GRUPO);

ALTER TABLE GRUPO_RIESGO
ADD CONSTRAINT UQ_TIPO_GRUPO
UNIQUE(TIPO_GRUPO);

ALTER TABLE GRUPO_RIESGO
ADD CONSTRAINT CK_TIPO_GRUPO
CHECK(LENGTH(TIPO_GRUPO) <= 200);




--CREACION DE LA TABLA FABRICANTE, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE FABRICANTE
(
COD_FABRICANTE NUMBER,
NOM_FABRICANTE VARCHAR2(30)
) TABLESPACE TBS_D;

ALTER TABLE FABRICANTE
ADD CONSTRAINT PK_COD_FABRICANTE
PRIMARY KEY(COD_FABRICANTE);

ALTER TABLE FABRICANTE
MODIFY (NOM_FABRICANTE NOT NULL);

ALTER TABLE FABRICANTE
ADD CONSTRAINT UQ_NOM_FABRICANTE
UNIQUE(NOM_FABRICANTE);

ALTER TABLE FABRICANTE
ADD CONSTRAINT CK_NOM_FABRICANTE
CHECK(LENGTH(NOM_FABRICANTE) <= 30);




--CREACION DE LA TABLA DIRESA, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE DIRESA
(
COD_DIRESA NUMBER,
CENTRO_DIRESA VARCHAR2(30) NOT NULL
)TABLESPACE TBS_D;

ALTER TABLE DIRESA
ADD CONSTRAINT PK_COD_DIRESA
PRIMARY KEY(COD_DIRESA);

ALTER TABLE DIRESA
ADD CONSTRAINT UQ_CENTRO_DIRESA
UNIQUE(CENTRO_DIRESA);

ALTER TABLE DIRESA
ADD CONSTRAINT CK_CENTRO_DIRESA
CHECK(LENGTH(CENTRO_DIRESA) <= 30);




--CREACION DE LA TABLA REGISTRO_VACUNACION, ASIGNACION A TABLESPACE Y CONSTRAINTS

CREATE TABLE REGISTRO_VACUNACION
(
COD_VACUNACION NUMBER,
COD_UUID VARCHAR2(9),
COD_DIRESA NUMBER,
COD_UBIGEO VARCHAR2(7),
COD_GRUPO NUMBER,
COD_FABRICANTE NUMBER,
NUM_DOSIS NUMBER NOT NULL,
FECHA_VACUNACION DATE NOT NULL,
CLASIFICACION_VACUNA VARCHAR2(3) NOT NULL,
TIPO_EDAD VARCHAR2(3) NOT NULL
) TABLESPACE TBS_D;

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT PK_COD_VACUNACION
PRIMARY KEY(COD_VACUNACION);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT FK_COD_UUID_VACUNACION
FOREIGN KEY(COD_UUID)
REFERENCES PERSONA_C(COD_UUID);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT FK_COD_DIRESA_VACUNACION
FOREIGN KEY(COD_DIRESA)
REFERENCES DIRESA(COD_DIRESA);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT FK_COD_UBIGEO_VACUNACION
FOREIGN KEY(COD_UBIGEO)
REFERENCES DISTRITO(COD_UBIGEO);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT FK_COD_GRUPO_VACUNACION
FOREIGN KEY(COD_GRUPO)
REFERENCES GRUPO_RIESGO(COD_GRUPO);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT FK_COD_FABRICANTE_VACUNACION
FOREIGN KEY(COD_FABRICANTE)
REFERENCES FABRICANTE(COD_FABRICANTE);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT CK_COD_UUID_VACUNACION
CHECK(LENGTH(COD_UUID) <= 9);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT CK_COD_UBIGEO_VACUNACION
CHECK(LENGTH(COD_UBIGEO) <= 7);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT CK_NUM_DOSIS_VACUNACION
CHECK(LENGTH(NUM_DOSIS) >= 0);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT CK_CLASIFICACION_VACUNA
CHECK(LENGTH(CLASIFICACION_VACUNA) <= 3);

ALTER TABLE REGISTRO_VACUNACION
ADD CONSTRAINT CK_TIPO_EDAD_VACUNACION
CHECK(LENGTH(TIPO_EDAD) <= 3);