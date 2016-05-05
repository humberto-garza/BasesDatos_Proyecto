/*
Clase 10:30
	EQUIPO 6
	Humberto Garza 
	Elizabeth Villarreal
	Annette Garza
	Evan Juárez
*/

DROP SCHEMA Hospital;
CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Persona (
	IDPer INT NOT NULL AUTO_INCREMENT,
 	Sexo CHAR(5),
 	DoB DATE,
 	Nombre CHAR(30),
 	ApellidoP CHAR(20),
 	ApellidoM CHAR(20),
 	Telefono CHAR(20),
 	Calle CHAR(30),
 	NumeroCalle CHAR(10),
 	CP CHAR(10),
 	Ciudad CHAR(15),
 	Estado CHAR(20),
 	Pais CHAR(20),
	PRIMARY KEY (IDPer)
);

CREATE TABLE Paciente(
	IDPac INT NOT NULL AUTO_INCREMENT,
 	IDPer INT,
	PRIMARY KEY (IDPac),
	FOREIGN KEY (IDPer) REFERENCES Persona(IDPer)
);

CREATE TABLE Medico(
	IDMed INT NOT NULL AUTO_INCREMENT,
 	Especialidad CHAR(30),
 	IDPer INT,
	PRIMARY KEY (IDMed),
	FOREIGN KEY (IDPer) REFERENCES Persona(IDPer)
);

CREATE TABLE Cita(
	IDCita INT NOT NULL AUTO_INCREMENT,
	Altura DECIMAL(5,2),
	AlturaUnidades CHAR(5),
	Peso DECIMAL(5,2),
	PesoUnidades CHAR(5),
 	Fecha DATE,
 	Hora TIME,
 	Comentarios TEXT, 
 	Motivo TEXT, 
 	IDPac INT,
 	IDMed INT,
	PRIMARY KEY (IDCita),
	FOREIGN KEY (IDPac) REFERENCES Paciente(IDPac),
	FOREIGN KEY (IDMed) REFERENCES Medico(IDMed)
);
CREATE TABLE LTipo(
	IDLTipo INT NOT NULL AUTO_INCREMENT,
	Tipo CHAR(30),
	PRIMARY KEY (IDLTipo)
);

CREATE TABLE LTCatalogo(
	IDLTCat INT NOT NULL AUTO_INCREMENT,
	Labtestname CHAR(50),
	IDLTipo INT,
	PRIMARY KEY (IDLTCat),
	FOREIGN KEY (IDLTipo) REFERENCES LTipo(IDLTipo)
);

CREATE TABLE LabTest(
	IDLabTest INT NOT NULL AUTO_INCREMENT,
	Fecha DATE,
	Hora TIME,
	Notas TEXT, 
	IDCita INT,
	IDLTCat INT,
	PRIMARY KEY (IDLabTest),
	FOREIGN KEY (IDCita) REFERENCES Cita(IDCita),
	FOREIGN KEY (IDLTCat) REFERENCES LTCatalogo(IDLTCat)
);

CREATE TABLE LTCatalogoRes(
	IDLTCatRes INT NOT NULL AUTO_INCREMENT,
	Nombre CHAR(50),
	ValMin CHAR(10),
	ValMax CHAR(10),
	Unidades CHAR(10),
	Edad CHAR(5),
	Peso CHAR(5),
	PesoUnidades CHAR(5),
	Sexo CHAR(5),
	Explicacion TEXT,
	IDLTCat INT,
	PRIMARY KEY (IDLTCatRes),
	FOREIGN KEY (IDLTCat) REFERENCES LTCatalogo(IDLTCat)
);

CREATE TABLE LTResult(
	IDLTRes INT NOT NULL AUTO_INCREMENT,
	Valor CHAR(30),
	esNormal CHAR(10),
	Observaciones TEXT,
	IDLabTest INT,
	IDLTCatRes INT,
	PRIMARY KEY (IDLTRes),
	FOREIGN KEY (IDLabTest) REFERENCES LabTest(IDLabTest),
	FOREIGN KEY (IDLTCatRes) REFERENCES LTCatalogoRes(IDLTCatRes)
);

CREATE TABLE Receta(
	IDReceta INT NOT NULL AUTO_INCREMENT,
 	Fecha DATE,
 	IDCita INT,
	PRIMARY KEY (IDReceta),
	FOREIGN KEY (IDCita) REFERENCES Cita(IDCita)
);

CREATE TABLE LabMedico(
	IDLab INT NOT NULL AUTO_INCREMENT,
 	Nombre CHAR(20),
	PRIMARY KEY (IDLab)
);

CREATE TABLE CatalogoMedicinas(
	IDCatMed INT NOT NULL AUTO_INCREMENT,
 	Presentacion CHAR(15),
 	NombreComercial CHAR(25),
 	IngredientesActivos CHAR(40),
 	ContNeto CHAR(25),
 	ContUnidad CHAR(10),
 	Unidades DECIMAL(5),
 	IDLab INT,
	PRIMARY KEY (IDCatMed),
	FOREIGN KEY (IDLab) REFERENCES LabMedico(IDLab)
);

CREATE TABLE MedRecetado(
	IDMedRec INT NOT NULL AUTO_INCREMENT,
 	Dosis DECIMAL(10,2),
 	Lapso DECIMAL(5),
 	UnidadLapso CHAR(10),
 	Duracion DECIMAL(5),
 	UnidadDuracion CHAR(10),
 	Notas TEXT,
 	IDReceta INT,
 	IDCatMed INT,
	PRIMARY KEY (IDMedRec),
	FOREIGN KEY (IDReceta) REFERENCES Receta(IDReceta),
	FOREIGN KEY (IDCatMed) REFERENCES CatalogoMedicinas(IDCatMed)
);