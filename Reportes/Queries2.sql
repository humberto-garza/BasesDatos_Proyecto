USE Hospital;

##############################################################################
# Desplegar a todos los Doctores
SELECT  
		M.IDMed,
        M.Especialidad,
		CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
		Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
		Pe.Telefono, 
		CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
	FROM Medico M, Persona Pe
	WHERE M.IDPer = Pe.IDPer;

##############################################################################
# Desplegar a todos los pacientes
SELECT  
	P.IDPac,
	CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
	Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
	Pe.Telefono, 
	CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer;

# SP Desplegar Info de Un paciente
SELECT  
	P.IDPac,
	CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
	Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
	Pe.Telefono, 
	CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer && P.IDPac = '1';
##############################################################################
# Desplegar todas las Citas 
SELECT 
	CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
	DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
    TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
    Ci.Diagnostico,
    Ci.Comentarios
FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
WHERE Ci.IDPac = Pa.IDPac AND Ci.IDMed = Me.IDMed AND Me.IDPer = Pe.IDPer;

# Desplegar todas las Citas de Un paciente
	SELECT 
		Ci.IDCita,
		CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
		DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
		TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
		Ci.Diagnostico,
		Ci.Comentarios
	FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
	WHERE 
		Ci.IDPac = Pa.IDPac AND 
		Ci.IDMed = Me.IDMed AND 
		Me.IDPer = Pe.IDPer AND  
		Ci.IDPac = '1';
##############################################################################
#Desplegar Los examenes de todas las Citas
SELECT
	Test.IDLabTest,
	Tipo.Tipo AS 'Tipo de Examen',
	Catalogo.Labtestname AS 'Examen',
	DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
    Test.Notas AS 'Comentarios'
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo
WHERE
	Test.IDCita = Ci.IDCita AND
	Test.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo;

#Desplegar Los examenes de una Cita
SELECT
	Test.IDLabTest,
	Tipo.Tipo AS 'Tipo de Examen',
	Catalogo.Labtestname AS 'Examen',
	DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
    Test.Notas AS 'Comentarios'
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo
WHERE
	Test.IDCita = Ci.IDCita AND
	Test.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo AND
    Ci.IDCita = '1';
    
#Desplegar Los examenes de una Persona
SELECT
	Test.IDLabTest,
	Tipo.Tipo AS 'Tipo de Examen',
	Catalogo.Labtestname AS 'Examen',
	DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
    Test.Notas AS 'Comentarios'
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo
WHERE
	Test.IDCita = Ci.IDCita AND
	Test.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo AND
    Ci.IDPac = '1';
    
##############################################################################
#Desplegar los Resultados de todos los examenes
SELECT 
	Result.IDLTRes, 
    CatRes.Nombre, 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles
FROM LTResult Result, LTCatalogoRes CatRes
WHERE Result.IDLTCatRes = CatRes.IDLTCatRes;

#Desplegar los Resultados de Un LabTest
SELECT 
	Result.IDLTRes, 
    CatRes.Nombre, 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles
FROM LTResult Result, LTCatalogoRes CatRes, LabTest LT 
WHERE 
	Result.IDLTCatRes = CatRes.IDLTCatRes AND
    Result.IDLabTest = LT.IDLabTest AND
    LT.IDLabTest = '1';


#Desplegar los Resultados de Una Cita
SELECT 
	Result.IDLTRes, 
    CatRes.Nombre, 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles
FROM LTResult Result, LTCatalogoRes CatRes, LabTest LT 
WHERE 
	Result.IDLTCatRes = CatRes.IDLTCatRes AND
    Result.IDLabTest = LT.IDLabTest AND
    LT.IDCita = '1';

#Desplegar los Resultados de Un Paciente
SELECT 
	Result.IDLTRes, 
    CatRes.Nombre, 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles
FROM LTResult Result, LTCatalogoRes CatRes, LabTest LT, Cita Ci
WHERE 
	Result.IDLTCatRes = CatRes.IDLTCatRes AND
    Result.IDLabTest = LT.IDLabTest AND
    LT.IDCita = Ci.IDCita AND
    Ci.IDPac = '1';
##############################################################################
#Desplegar ExResults de un Paciente
SELECT 
	Test.IDLabTest,
    DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
	Tipo.Tipo AS 'Tipo de Examen',
	Catalogo.Labtestname AS 'Examen',
	CatRes.Nombre AS 'Prueba', 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles,
	Test.Notas AS 'Comentarios'
FROM LTResult Result, LTCatalogoRes CatRes, LabTest Test, LTipo Tipo, LTCatalogo Catalogo, Cita Ci
WHERE 
	Result.IDLTCatRes = CatRes.IDLTCatRes AND
    Result.IDLabTest = Test.IDLabTest AND
    Test.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo AND
    Test.IDCita = Ci.IDCita AND
    Ci.IDPac = '1';

#Desplegar ExResults de una Cita
SELECT 
	Test.IDLabTest,
    DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
	Tipo.Tipo AS 'Tipo de Examen',
	Catalogo.Labtestname AS 'Examen',
	CatRes.Nombre AS 'Prueba', 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles,
	Test.Notas AS 'Comentarios'
FROM LTResult Result, LTCatalogoRes CatRes, LabTest Test, LTipo Tipo, LTCatalogo Catalogo, Cita Ci
WHERE 
	Result.IDLTCatRes = CatRes.IDLTCatRes AND
    Result.IDLabTest = Test.IDLabTest AND
    Test.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo AND
    Test.IDCita = Ci.IDCita AND
    Ci.IDCita = '1';


##############################################################################
#Desplegar Recetas de una Cita
SELECT 
	Re.IDReceta, CM.NombreComercial AS Medicamento, 
    CM.IngredientesActivos AS Compuestos,
    LM.Nombre AS Laboratorio,
    CM.Unidades AS Contenido,
    CM.Presentacion,
    CONCAT(CM.ContNeto, " ", CM.ContUnidad) AS 'Contenido Neto',
    CONCAT(MR.Dosis, " cada ", MR.Lapso, " ", MR.UnidadLapso) AS Dosis,
    MR.Notas AS Indicaciones    
FROM Cita Ci, Receta Re, MedRecetado MR, CatalogoMedicinas CM, LabMedico LM
WHERE 
	Re.IDCita = Ci.IDCita AND
	MR.IDReceta = Re.IDReceta AND
    MR.IDCatMed = CM.IDCatMed AND
    CM.IDLab = LM.IDLab AND
    Ci.IDCita = 2;
    
    
    

SELECT Ci.IDCita, Re.IDReceta, Re.Fecha
FROM Cita Ci, Receta Re
WHERE 
	Re.IDCita = Ci.IDCita
;




