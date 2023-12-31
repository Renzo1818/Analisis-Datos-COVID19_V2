/*
  AUTOR: RenzoZ
  OBJETIVO: TABLAS TEMPORALES PARA LA IMPORTACIÓN DE DATOS MASIVOS DEL MINSA
*/


/*
  CREACION DE LA TABLA DICC_CASOS
  FUENTE DE DATOS MASIVOS: https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa
*/

CREATE TABLE DICC_CASOS
(
FECHA_CORTE DATE,
ID_PERSONA VARCHAR2(12),
UBIGEO VARCHAR2(6),
DEPARTAMENTO VARCHAR2(32),
PROVINCIA VARCHAR2(32),
DISTRITO VARCHAR2(32),
METODODX VARCHAR2(3),
EDAD NUMBER,
SEXO VARCHAR2(12),
FECHA_RESULTADO DATE
);



/*
  CREACION DE LA TABLA DICC_VACUNAS
  FUENTE DE DATOS MASIVOS: https://www.datosabiertos.gob.pe/dataset/vacunaci%C3%B3n-contra-covid-19-ministerio-de-salud-minsa
*/

CREATE TABLE DICC_VACUNAS
(
FECHA_CORTE DATE,
UUID VARCHAR2(12),
GRUPO_RIESGO VARCHAR2(500),
EDAD NUMBER,
SEXO VARCHAR2(12),
FECHA_VACUNACION DATE,
DOSIS NUMBER,
FABRICANTE VARCHAR2(20),
DIRESA VARCHAR2(50),
DEPARTAMENTO VARCHAR2(40),
DISTRITO VARCHAR2(40),
PROVINCIA VARCHAR2(40),
CLASIFICACION_VACUNA VARCHAR2(4),
TIPO_EDAD VARCHAR2(4)
);



/*
  CREACION DE LAS TABLAS DICC_DEPARTAMENTO, DICC_PROVINCIA, DICC_DISTRITO
  FUENTE DE DATOS MASIVOS: https://www.datosabiertos.gob.pe/dataset/codigos-equivalentes-de-ubigeo-del-peru
*/

CREATE TABLE DICC_DEPARTAMENTO
(
COD_DEPARTAMENTO VARCHAR2(3),
NOM_DEPARTAMENTO VARCHAR(30)
);


CREATE TABLE DICC_PROVINCIA
(
COD_PROVINCIA VARCHAR2(5),
NOM_PROVINCIA VARCHAR2(50),
COD_DEPARTAMENTO VARCHAR2(3)
)

  
CREATE TABLE DICC_DISTRITO
(
COD_UBIGEO VARCHAR2(7),
NOM_DISTRITO VARCHAR2(80),
COD_PROVINCIA VARCHAR2(5)
);
