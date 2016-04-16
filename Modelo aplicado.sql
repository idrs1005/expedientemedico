CREATE TABLE tbl_Persona
(
	ID_Persona           INTEGER NOT NULL,
	Foto_Perfil          BLOB NULL,
	Nombre               VARCHAR(50) NOT NULL,
	Apellido1            VARCHAR(50) NOT NULL,
	Apellido2            VARCHAR(50) NULL,
	Identificacion       INTEGER NOT NULL,
	Fecha_Nacimiento     DATE NULL,
	Sexo                 INTEGER NULL,
	Usuario              VARCHAR(20) NOT NULL,
	Correo               VARCHAR(60) NOT NULL,
	password_digest      VARCHAR(255) NULL,
	Tipo                 INTEGER NULL,
	Validado             INTEGER NULL,
	UNIQUE (Correo),
	UNIQUE (Usuario),
	UNIQUE (Identificacion)
);

ALTER TABLE tbl_Persona
ADD PRIMARY KEY (ID_Persona);

ALTER TABLE tbl_Persona CHANGE COLUMN ID_Persona ID_Persona INTEGER AUTO_INCREMENT;


CREATE TABLE tbl_Medico
(
	ID_Medico            INTEGER NOT NULL,
	Codigo_Licencia      VARCHAR(50) NULL,
	Validado             INTEGER NULL,
	ID_Persona           INTEGER NOT NULL,
	UNIQUE (Codigo_Licencia),
	UNIQUE (ID_Persona)
);

ALTER TABLE tbl_Medico
ADD PRIMARY KEY (ID_Medico);

ALTER TABLE tbl_Medico
ADD FOREIGN KEY R_16 (ID_Persona) REFERENCES tbl_Persona (ID_Persona);

ALTER TABLE tbl_Medico CHANGE COLUMN ID_Medico ID_Medico INTEGER AUTO_INCREMENT;


CREATE TABLE tbl_Validacion
(
	ID_Validacion        INTEGER NOT NULL,
	Codigo_Validacion    VARCHAR(64) NOT NULL,
	ID_Persona           INTEGER NULL,
	UNIQUE (Codigo_Validacion)
);

ALTER TABLE tbl_Validacion
ADD PRIMARY KEY (ID_Validacion);

ALTER TABLE tbl_Validacion CHANGE COLUMN ID_Validacion ID_Validacion INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Validacion
ADD FOREIGN KEY R_1 (ID_Persona) REFERENCES tbl_Persona (ID_Persona);







CREATE TABLE tbl_Experiencia
(
	ID_Experiencia       INTEGER NOT NULL,
	Experiencia          VARCHAR(150) NOT NULL,
	ID_Medico            INTEGER NOT NULL
);

ALTER TABLE tbl_Experiencia
ADD PRIMARY KEY (ID_Experiencia);

ALTER TABLE tbl_Experiencia CHANGE COLUMN ID_Experiencia ID_Experiencia INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Experiencia
ADD FOREIGN KEY R_3 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);



CREATE TABLE tbl_Premio
(
	ID_Premio            INTEGER NOT NULL,
	Premio               VARCHAR(150) NOT NULL,
	ID_Medico            INTEGER NOT NULL
);

ALTER TABLE tbl_Premio
ADD PRIMARY KEY (ID_Premio);

ALTER TABLE tbl_Premio CHANGE COLUMN ID_Premio ID_Premio INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Premio
ADD FOREIGN KEY R_4 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Publicacion
(
	ID_Publicacion       INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL,
	Publicacion          VARCHAR(150) NOT NULL
);

ALTER TABLE tbl_Publicacion
ADD PRIMARY KEY (ID_Publicacion);

ALTER TABLE tbl_Publicacion CHANGE COLUMN ID_Publicacion ID_Publicacion INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Publicacion
ADD FOREIGN KEY R_5 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Educacion
(
	ID_Educacion         INTEGER NOT NULL,
	Titulo_Obtenido      VARCHAR(150) NOT NULL,
	ID_Medico            INTEGER NOT NULL
);

ALTER TABLE tbl_Educacion
ADD PRIMARY KEY (ID_Educacion);

ALTER TABLE tbl_Educacion CHANGE COLUMN ID_Educacion ID_Educacion INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Educacion
ADD FOREIGN KEY R_6 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Procedimiento
(
	ID_Procedimiento     INTEGER NOT NULL,
	Procedimiento        CHAR(100) NOT NULL,
	UNIQUE(Procedimiento)
);

ALTER TABLE tbl_Procedimiento
ADD PRIMARY KEY (ID_Procedimiento);

ALTER TABLE tbl_Procedimiento CHANGE COLUMN ID_Procedimiento ID_Procedimiento INTEGER AUTO_INCREMENT;




CREATE TABLE tbl_ProcedimientoPorMedico
(
	ID_Procedimiento_Por_Medico INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL,
	ID_Procedimiento     INTEGER NOT NULL,
	Precio               INTEGER NULL
);

ALTER TABLE tbl_ProcedimientoPorMedico
ADD PRIMARY KEY (ID_Procedimiento_Por_Medico);

ALTER TABLE tbl_ProcedimientoPorMedico CHANGE COLUMN ID_Procedimiento_Por_Medico ID_Procedimiento_Por_Medico INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_ProcedimientoPorMedico
ADD FOREIGN KEY R_7 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);

ALTER TABLE tbl_ProcedimientoPorMedico
ADD FOREIGN KEY R_9 (ID_Procedimiento) REFERENCES tbl_Procedimiento (ID_Procedimiento);




CREATE TABLE tbl_AreaTrabajo
(
	ID_AreaTrabajo       INTEGER NOT NULL,
	AreaTrabajo          VARCHAR(50) NOT NULL,
	UNIQUE(AreaTrabajo)
);

ALTER TABLE tbl_AreaTrabajo
ADD PRIMARY KEY (ID_AreaTrabajo);

ALTER TABLE tbl_AreaTrabajo CHANGE COLUMN ID_AreaTrabajo ID_AreaTrabajo INTEGER AUTO_INCREMENT;




CREATE TABLE tbl_AreaTrabajoPorMedico
(
	ID_AreaTrabajo_Por_Medico INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL,
	ID_AreaTrabajo       INTEGER NOT NULL
);

ALTER TABLE tbl_AreaTrabajoPorMedico
ADD PRIMARY KEY (ID_AreaTrabajo_Por_Medico);

ALTER TABLE tbl_AreaTrabajoPorMedico CHANGE COLUMN ID_AreaTrabajo_Por_Medico ID_AreaTrabajo_Por_Medico INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_AreaTrabajoPorMedico
ADD FOREIGN KEY R_10 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);

ALTER TABLE tbl_AreaTrabajoPorMedico
ADD FOREIGN KEY R_12 (ID_AreaTrabajo) REFERENCES tbl_AreaTrabajo (ID_AreaTrabajo);




CREATE TABLE tbl_Afiliacion
(
	ID_Afiliacion        INTEGER NOT NULL,
	Afiliacion           VARCHAR(100) NOT NULL,
	ID_Medico            INTEGER NOT NULL
);

ALTER TABLE tbl_Afiliacion
ADD PRIMARY KEY (ID_Afiliacion);

ALTER TABLE tbl_Afiliacion CHANGE COLUMN ID_Afiliacion ID_Afiliacion INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Afiliacion
ADD FOREIGN KEY R_13 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Idioma
(
	ID_Idioma            INTEGER NOT NULL,
	Idioma               VARCHAR(50) NOT NULL,
	UNIQUE(Idioma)
);

ALTER TABLE tbl_Idioma
ADD PRIMARY KEY (ID_Idioma);

ALTER TABLE tbl_Idioma CHANGE COLUMN ID_Idioma ID_Idioma INTEGER AUTO_INCREMENT;




CREATE TABLE tbl_IdiomaPorMedico
(
	ID_Idioma_Por_Medico INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL,
	ID_Idioma            INTEGER NOT NULL
);

ALTER TABLE tbl_IdiomaPorMedico
ADD PRIMARY KEY (ID_Idioma_Por_Medico);

ALTER TABLE tbl_IdiomaPorMedico CHANGE COLUMN ID_Idioma_Por_Medico ID_Idioma_Por_Medico INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_IdiomaPorMedico
ADD FOREIGN KEY R_15 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);

ALTER TABLE tbl_IdiomaPorMedico
ADD FOREIGN KEY R_18 (ID_Idioma) REFERENCES tbl_Idioma (ID_Idioma);




CREATE TABLE tbl_Especialidad
(
	ID_Especialidad      INTEGER NOT NULL,
	Especialidad         VARCHAR(75) NOT NULL,
	UNIQUE(Especialidad)
);

ALTER TABLE tbl_Especialidad
ADD PRIMARY KEY (ID_Especialidad);

ALTER TABLE tbl_Especialidad CHANGE COLUMN ID_Especialidad ID_Especialidad INTEGER AUTO_INCREMENT;




CREATE TABLE tbl_EspecialidadPorMedico
(
	ID_Especialidad_Por_Medico INTEGER NOT NULL,
	ID_Especialidad      INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL
);

ALTER TABLE tbl_EspecialidadPorMedico
ADD PRIMARY KEY (ID_Especialidad_Por_Medico);

ALTER TABLE tbl_EspecialidadPorMedico CHANGE COLUMN ID_Especialidad_Por_Medico ID_Especialidad_Por_Medico INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_EspecialidadPorMedico
ADD FOREIGN KEY R_22 (ID_Especialidad) REFERENCES tbl_Especialidad (ID_Especialidad);

ALTER TABLE tbl_EspecialidadPorMedico
ADD FOREIGN KEY R_24 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Subespecialidad
(
	ID_Subespecialidad   INTEGER NOT NULL,
	Subespecialidad      VARCHAR(75) NOT NULL,
	ID_Especialidad			 INTEGER NOT NULL,
	UNIQUE(Subespecialidad)
);

ALTER TABLE tbl_Subespecialidad
ADD PRIMARY KEY (ID_Subespecialidad);

ALTER TABLE tbl_Subespecialidad CHANGE COLUMN ID_Subespecialidad ID_Subespecialidad INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Subespecialidad
ADD FOREIGN KEY R_99 (ID_Especialidad) REFERENCES tbl_Especialidad (ID_Especialidad);




CREATE TABLE tbl_SubespecialidadPorMedico
(
	ID_Subespecialidad_Por_Medico INTEGER NOT NULL,
	ID_Subespecialidad   INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL
);

ALTER TABLE tbl_SubespecialidadPorMedico
ADD PRIMARY KEY (ID_Subespecialidad_Por_Medico);

ALTER TABLE tbl_SubespecialidadPorMedico CHANGE COLUMN ID_Subespecialidad_Por_Medico ID_Subespecialidad_Por_Medico INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_SubespecialidadPorMedico
ADD FOREIGN KEY R_19 (ID_Subespecialidad) REFERENCES tbl_Subespecialidad (ID_Subespecialidad);

ALTER TABLE tbl_SubespecialidadPorMedico
ADD FOREIGN KEY R_21 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Agenda
(
	ID_Agenda            INTEGER NOT NULL,
	ID_Medico            INTEGER NOT NULL,
	ID_CentroMedico      INTEGER NULL,
	Nombre               CHAR(100) NOT NULL
);

ALTER TABLE tbl_Agenda
ADD PRIMARY KEY (ID_Agenda);

ALTER TABLE tbl_Agenda CHANGE COLUMN ID_Agenda ID_Agenda INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Agenda
ADD FOREIGN KEY R_49 (ID_Medico) REFERENCES tbl_Medico (ID_Medico);




CREATE TABLE tbl_Dia
(
	ID_Dia               INTEGER NOT NULL,
	Dia                  VARCHAR(20) NULL
);

ALTER TABLE tbl_Dia
ADD PRIMARY KEY (ID_Dia);

ALTER TABLE tbl_Dia CHANGE COLUMN ID_Dia ID_Dia INTEGER AUTO_INCREMENT;

INSERT INTO tbl_Dia (Dia) VALUES('Lunes');
INSERT INTO tbl_Dia (Dia) VALUES('Martes');
INSERT INTO tbl_Dia (Dia) VALUES('Miércoles');
INSERT INTO tbl_Dia (Dia) VALUES('Jueves');
INSERT INTO tbl_Dia (Dia) VALUES('Viernes');
INSERT INTO tbl_Dia (Dia) VALUES('Sábado');
INSERT INTO tbl_Dia (Dia) VALUES('Domingo');




CREATE TABLE tbl_Horario
(
	ID_Horario           INTEGER NOT NULL,
	ID_Agenda            INTEGER NOT NULL,
	ID_Dia               INTEGER NOT NULL,
	Hora_Inicio          TIME NOT NULL,
	Hora_Final           TIME NOT NULL
);

ALTER TABLE tbl_Horario
ADD PRIMARY KEY (ID_Horario);

ALTER TABLE tbl_Horario CHANGE COLUMN ID_Horario ID_Horario INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_Horario
ADD FOREIGN KEY R_50 (ID_Agenda) REFERENCES tbl_Agenda (ID_Agenda);

ALTER TABLE tbl_Horario
ADD FOREIGN KEY R_51 (ID_Dia) REFERENCES tbl_Dia (ID_Dia);




CREATE TABLE tbl_AdministradorAgenda
(
	ID_AdministradorAgenda      INTEGER NOT NULL,
	ID_Agenda                   INTEGER NOT NULL,
	ID_Persona                  INTEGER NOT NULL
);

ALTER TABLE tbl_AdministradorAgenda
ADD PRIMARY KEY (ID_AdministradorAgenda);

ALTER TABLE tbl_AdministradorAgenda CHANGE COLUMN ID_AdministradorAgenda ID_AdministradorAgenda INTEGER AUTO_INCREMENT;

ALTER TABLE tbl_AdministradorAgenda
ADD FOREIGN KEY R_52 (ID_Persona) REFERENCES tbl_Persona (ID_Persona);

ALTER TABLE tbl_AdministradorAgenda
ADD FOREIGN KEY R_53 (ID_Agenda) REFERENCES tbl_Agenda (ID_Agenda);


##############
##PROCEDURES##
##############


DELIMITER //
CREATE PROCEDURE is_contrasena(IN contrasena VARCHAR(20), IN ID INT)
BEGIN
SELECT Usuario
FROM tbl_Persona P
WHERE ID = P.ID_Persona and P.Contrasena = AES_ENCRYPT(contrasena, 'ABCD1234efgh5678');
END
//

DELIMITER //
CREATE PROCEDURE contrasena(IN ID INT)
BEGIN
UPDATE tbl_Persona P
SET Contrasena = AES_ENCRYPT(P.Contrasena, 'ABCD1234efgh5678')
WHERE ID = P.ID_Persona;
END
//
DELIMITER;

DELIMITER //

CREATE TRIGGER encry_password
AFTER INSERT ON tbl_Persona FOR EACH ROW
BEGIN
   SET Contrasena = AES_ENCRYPT(Contrasena, 'ABCD1234efgh5678');
END //

DELIMITER ;
