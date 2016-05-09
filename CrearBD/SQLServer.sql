CREATE TABLE Persona (
	ID INT identity(1,1),
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
	

	PRIMARY KEY (ID)
);

CREATE TABLE Paciente(
	ID INT identity(1,1),
 	IDPer int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDPer) REFERENCES Persona(ID)
);

CREATE TABLE Medico(
	ID  INT identity(1,1),
 	Especialidad CHAR(30),
 	IDPer int,

	PRIMARY KEY (ID),
	FOREIGN KEY (IDPer) REFERENCES Persona(ID)
);

CREATE TABLE Cita(
	ID INT identity(1,1),
	Altura CHAR(5),
	AlturaUnidades CHAR(5),
	Peso CHAR(5),
	PesoUnidades CHAR(5),
 	Fecha DATE,
 	Hora TIME,
 	Comentarios TEXT, 
 	Motivo TEXT, 
 	IDPac int,
 	IDMed int,
	PRIMARY KEY (ID),
	FOREIGN KEY (IDPac) REFERENCES Paciente(ID),
	FOREIGN KEY (IDMed) REFERENCES Medico(ID)
);

CREATE TABLE LTCatalogo(
	ID INT identity(1,1),
	Labtestname CHAR(50),
	
	PRIMARY KEY (ID)
);

CREATE TABLE LabTest(
	ID INT identity(1,1),
	Fecha DATE,
	Hora TIME,
	Notas TEXT, 
	IDCita int,
	IDLTCat int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDCita) REFERENCES Cita(ID),
	FOREIGN KEY (IDLTCat) REFERENCES LTCatalogo(ID)
);

CREATE TABLE LTCatalogoRes(
	ID INT identity(1,1),
	Nombre CHAR(50),
	ValMin CHAR(10),
	ValMax CHAR(10),
	Unidades CHAR(10),
	Edad CHAR(5),
	Peso CHAR(5),
	PesoUnidades CHAR(5),
	Sexo CHAR(5),
	IDLTCat int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDLTCat) REFERENCES LabTest(ID)
);

CREATE TABLE LTResult(
	ID INT identity(1,1),
	Valor CHAR(10),
	esNormal CHAR(10),
	Observaciones TEXT,
	IDLabTest int,
	IDLTCatRes int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDLabTest) REFERENCES LabTest(ID),
	FOREIGN KEY (IDLTCatRes) REFERENCES LTCatalogoRes(ID)
);

CREATE TABLE Receta(
	ID INT identity(1,1),
 	Fecha DATE,
 	IDCita int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDCita) REFERENCES Cita(ID)
);

CREATE TABLE LabMedico(
	ID INT identity(1,1),
 	Nombre CHAR(20),
	
	PRIMARY KEY (ID)
);

CREATE TABLE CatalogoMed(
	ID INT identity(1,1),
 	Presentacion CHAR(15),
 	NombreComercial CHAR(25),
 	IngredientesActivos CHAR(40),
 	ContNeto CHAR(25),
 	ContUnidad CHAR(10),
 	Unidades DECIMAL(5),
 	IDLab int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDLab) REFERENCES LabMedico(ID)
);

CREATE TABLE Medicamento(
	ID INT identity(1,1),
 	Dosis DECIMAL(10,2),
 	Lapso DECIMAL(5),
 	UnidadLapso CHAR(10),
 	Duracion DECIMAL(5),
 	UnidadDuracion CHAR(10),
 	Notas TEXT,
 	IDReceta int,
 	IDCatMed int,
	
	PRIMARY KEY (ID),
	FOREIGN KEY (IDReceta) REFERENCES Receta(ID),
	FOREIGN KEY (IDReceta) REFERENCES CatalogoMed(ID)
);
