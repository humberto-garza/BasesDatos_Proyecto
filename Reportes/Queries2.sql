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
    
    
#Desplegar Recetas de un Paciente
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
    Ci.IDPac = 2;


##############################################################################
#Update Paciente
UPDATE Persona Pe 
JOIN Paciente Pa ON Pe.IDPer = Pa.IDPer 
SET 
Pe.Nombre = parNombre,
Pe.ApellidoP = parApellidoP,
Pe.ApellidoM = parApellidoM,
Pe.DoB = parDoB,
Pe.Telefono = parTelefono,
Pe.Sexo = parSexo
WHERE Pa.IDPac = 1;

#Update Medico

UPDATE Medico Me
SET 
Me.Especialidad = parEspecialidad
WHERE Me.IDMed = parIDMed;

UPDATE Persona Pe, Medico Me
JOIN Medico Me ON Pe.IDPer = Me.IDPer 
SET 
Pe.Nombre = parNombre,
Pe.ApellidoP = parApellidoP,
Pe.ApellidoM = parApellidoM,
Pe.DoB = parDoB,
Pe.Telefono = parTelefono,
Pe.Sexo = parSexo
WHERE Me.IDMed = parIDMed;

##############################################################################
# Get Info De un medico
SELECT  
M.IDMed,
M.Especialidad,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
Pe.Telefono, 
CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Medico M, Persona Pe
WHERE M.IDPer = Pe.IDPer && M.IDMed = 1;

##############################################################################
# Get Info De un medico


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
	Re.IDReceta = '1';




SELECT *
FROM Cita Ci, Paciente Pa, Medico Me, Persona PeP, Persona PeM
WHERE 
	Ci.IDPac = Pa.IDPac AND
    Ci.IDMed = Me.IDMed AND
    Pa.IDPer = PeP.IDPer AND
    Me.IDPer = PeM.IDPer;


# Desplegar todas las citas
SELECT 
Pa.IDPac, 
Pa.Paciente,
Me.IDMed,
Me.Medico,
Ci.Fecha,
Ci.Hora,
Ci.Diagnostico,
Ci.Comentarios
FROM Cita Ci, 
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa,
(
SELECT Me.IDMed, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Medico'
FROM Medico Me, Persona Pe
WHERE Me.IDPer = Pe.IDPer
) Me
WHERE 
	Ci.IDPac = Pa.IDPac AND
    Ci.IDMed = Me.IDMed;

# Desplegar todos los examenes
SELECT
Test.IDLabTest,
Pa.IDPac,
Pa.Paciente,
Tipo.Tipo AS 'Tipo de Examen',
Catalogo.Labtestname AS 'Examen',
DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
Test.Notas AS 'Comentarios'
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo,
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa
WHERE
Test.IDCita = Ci.IDCita AND
Test.IDLTCat = Catalogo.IDLTCat AND
Catalogo.IDLTipo = Tipo.IDLTipo AND
Ci.IDPAc = Pa.IDPac;

# Desplegar todas las recetas
SELECT 
Re.IDReceta,
DATE_FORMAT(Re.Fecha,'%d/%m/%Y') AS Fecha,
Pa.IDPac, 
Pa.Paciente,
Me.IDMed,
Me.Medico
FROM Cita Ci, 
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa,
(
SELECT Me.IDMed, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Medico'
FROM Medico Me, Persona Pe
WHERE Me.IDPer = Pe.IDPer
) Me, Receta Re
WHERE 
	Ci.IDPac = Pa.IDPac AND
    Ci.IDMed = Me.IDMed AND
    Re.IDCita = Ci.IDCita
ORDER BY Re.Fecha DESC;

# Desplegar una receta
CALL getRecetaDeIDRec(1);
CALL getRecetas();

# Desplegar resultados de un examen
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
Test.IDLabTest = 2;


# Citas de un medico
SELECT 
Ci.IDCita,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
Ci.Diagnostico,
Ci.Comentarios
FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
WHERE Ci.IDPac = Pa.IDPac AND Ci.IDMed = Me.IDMed AND Me.IDPer = Pe.IDPer AND Ci.IDMed = 5
ORDER BY Ci.Fecha DESC;

# Recetas del medico
SELECT 
Re.IDReceta, 
Re.Fecha,
CM.NombreComercial AS Medicamento, 
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
Ci.IDMed = parIDMed;

# Reporte Anormal
SELECT 
Tipo.Tipo AS 'Tipo de Examen',
Catalogo.Labtestname AS 'Examen',
CatRes.Nombre AS 'Prueba', 
Result.esNormal AS Estatus,
COUNT(CatRes.Nombre) AS 'Total de Examenes Anormales'
FROM LTResult Result, LTCatalogoRes CatRes, LabTest Test, LTipo Tipo, LTCatalogo Catalogo, Cita Ci
WHERE 
Result.IDLTCatRes = CatRes.IDLTCatRes AND
Result.IDLabTest = Test.IDLabTest AND
Test.IDLTCat = Catalogo.IDLTCat AND
Catalogo.IDLTipo = Tipo.IDLTipo AND
Test.IDCita = Ci.IDCita AND
Result.esNormal = 'Anormal'
GROUP BY CatRes.Nombre
ORDER BY COUNT(CatRes.Nombre) DESC;
    
    
SELECT
Test.IDLabTest,
Pa.IDPac,
Pa.Paciente,
Tipo.Tipo AS 'Tipo de Examen',
Catalogo.Labtestname AS 'Examen',
DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
Test.Notas AS 'Comentarios',
Co.Estatus
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo,
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa,
(
SELECT LT.IDLabTest, MIN(LR.esNormal) as Estatus
FROM LabTest LT, LTResult LR
WHERE LR.IDLabTest = LT.IDLabTest
GROUP BY LT.IDLabTest
) Co
WHERE
Test.IDCita = Ci.IDCita AND
Test.IDLTCat = Catalogo.IDLTCat AND
Catalogo.IDLTipo = Tipo.IDLTipo AND
Ci.IDPAc = Pa.IDPac AND
Test.IDLabTest = Co.IDLabTest
ORDER BY Test.Fecha DESC;
    

    
SELECT
Test.IDLabTest,
Pa.IDPac,
Pa.Paciente,
Tipo.Tipo AS 'Tipo de Examen',
Catalogo.Labtestname AS 'Examen',
DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
Test.Notas AS 'Comentarios',
Co.Estatus
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo,
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa,
(
SELECT LT.IDLabTest, MIN(LR.esNormal) as Estatus
FROM LabTest LT, LTResult LR
WHERE LR.IDLabTest = LT.IDLabTest
GROUP BY LT.IDLabTest
) Co
WHERE
Test.IDCita = Ci.IDCita AND
Test.IDLTCat = Catalogo.IDLTCat AND
Catalogo.IDLTipo = Tipo.IDLTipo AND
Ci.IDPAc = Pa.IDPac AND
Test.IDLabTest = Co.IDLabTest AND
Test.Fecha > '2015-1-1' AND
Test.Fecha < '2016-12-12'
ORDER BY Test.Fecha DESC;

CALL getLabsFechas('2010-1-1','2016-1-1');







SELECT
Tipo.IDLTipo AS 'Numero Examen',
Tipo.Tipo AS 'Tipo de Examen',
MIN(DATE_FORMAT(Test.Fecha,'%d/%m/%Y')) AS 'Fecha mas antigua', 
MAX(DATE_FORMAT(Test.Fecha,'%d/%m/%Y')) AS 'Fecha mas reciente',  
COUNT(Tipo.Tipo) AS Total
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo,
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa,
(
SELECT LT.IDLabTest, MIN(LR.esNormal) as Estatus
FROM LabTest LT, LTResult LR
WHERE LR.IDLabTest = LT.IDLabTest
GROUP BY LT.IDLabTest
) Co
WHERE
Test.IDCita = Ci.IDCita AND
Test.IDLTCat = Catalogo.IDLTCat AND
Catalogo.IDLTipo = Tipo.IDLTipo AND
Ci.IDPAc = Pa.IDPac AND
Test.IDLabTest = Co.IDLabTest AND
Test.Fecha >= '2000-1-1' AND
Test.Fecha <= '2016-1-1'
GROUP BY Tipo.Tipo
ORDER BY COUNT(Tipo.Tipo) DESC;


CALL getRecetaDeIDRec(4);

parfini
parfend


SELECT 
	CM.NombreComercial AS Medicamento,
	MIN(DATE_FORMAT(Re.Fecha,'%d/%m/%Y')) AS 'Fecha mas antigua', 
	MAX(DATE_FORMAT(Re.Fecha,'%d/%m/%Y')) AS 'Fecha mas reciente', 
	CM.IngredientesActivos AS Compuestos,
	LM.Nombre AS Laboratorio,
	CM.Unidades AS Contenido,
	CM.Presentacion,
	CONCAT(CM.ContNeto, " ", CM.ContUnidad) AS 'Contenido Neto',
	COUNT(CM.IDCatMed) AS Total
FROM Cita Ci, Receta Re, MedRecetado MR, CatalogoMedicinas CM, LabMedico LM
WHERE 
	Re.IDCita = Ci.IDCita AND
	MR.IDReceta = Re.IDReceta AND
	MR.IDCatMed = CM.IDCatMed AND
	CM.IDLab = LM.IDLab AND
	Re.Fecha >= '2000-1-1' AND
	Re.Fecha <= '2016-1-1'
GROUP BY CM.IDCatMed
ORDER BY COUNT(CM.IDCatMed)

SELECT 
Pa.IDPac,
Pa.Paciente,
DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS 'Fecha', 
Tipo.Tipo AS 'Tipo de Examen',
Catalogo.Labtestname AS 'Examen',
CatRes.Nombre AS 'Prueba', 
CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
Result.esNormal AS Estatus
FROM LTResult Result, LTCatalogoRes CatRes, LabTest Test, LTipo Tipo, LTCatalogo Catalogo, Cita Ci,
(
SELECT Pa.IDPac, CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Paciente'
FROM Paciente Pa, Persona Pe
WHERE Pa.IDPer = Pe.IDPer
) Pa
WHERE
Result.IDLTCatRes = CatRes.IDLTCatRes AND
Result.IDLabTest = Test.IDLabTest AND
Test.IDLTCat = Catalogo.IDLTCat AND
Catalogo.IDLTipo = Tipo.IDLTipo AND
Test.IDCita = Ci.IDCita AND
Ci.IDPAc = Pa.IDPac AND
Result.esNormal = 'Anormal' AND
Test.Fecha >= parfini AND
Test.Fecha <= parfend
ORDER BY Test.Fecha DESC, Pa.Paciente DESC;

CALL getRecetasDePaciente(1);


SELECT 
DATE_FORMAT(Fecha,'%d/%m/%Y') AS 'Fecha', 
CONCAT(Peso, ' ', PesoUnidades) AS Peso,
CONCAT(Altura, ' ', AlturaUnidades) AS Altura
FROM Cita Ci
WHERE Ci.IDPac = 1
ORDER BY Ci.Fecha DESC;



CALL getCitasCompletas();



SELECT IDReceta
FROM Receta Re, Cita Ci
WHERE Re.IDCita = Ci.IDCita AND Ci.IDPac = 1;







