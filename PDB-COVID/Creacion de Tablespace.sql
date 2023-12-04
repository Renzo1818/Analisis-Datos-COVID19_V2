/*
  AUTOR: RenzoZ
  OBJETIVO: CREAR LOS RESPECTIVOS TABLESPACE PARA ALMACENAR LOS DATOS Y SU POSTERIOR MULTIPLEXACIÓN
*/


-- CREACION DEL TABLESPACE TBS_D

CREATE TABLESPACE TBS_D
DATAFILE
'C:\app\Administrador\oradata\WAREHOUSE\PDB_COVID\TBS_D.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G,
'D:\oradata\PDB_COVID\TBS_D.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G,
'E:\oradata\PDB_COVID\TBS_D.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G;



-- CREACION DEL TABLESPACE UNDO TBS_U

CREATE UNDO TABLESPACE TBS_U
DATAFILE
'C:\app\Administrador\oradata\WAREHOUSE\PDB_COVID\TBS_U.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G,
'D:\oradata\PDB_COVID\TBS_U.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G,
'E:\oradata\PDB_COVID\TBS_U.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G;



-- CREACIÓN DEL TABLESPACE TEMPORAL TBS_T

CREATE TEMPORARY TABLESPACE TBS_T
TEMPFILE
'C:\app\Administrador\oradata\WAREHOUSE\PDB_COVID\TBS_T.DBF'
SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE 4G;