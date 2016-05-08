USE Hospital;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDoctores`()
BEGIN
SELECT  
M.IDMed,
M.Especialidad,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
Pe.Telefono, 
CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Medico M, Persona Pe
WHERE M.IDPer = Pe.IDPer;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCitasPaciente`(IN parIDPac INT)
BEGIN
SELECT 
Ci.IDCita,
Ci.IDMed,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
Ci.Diagnostico,
Ci.Comentarios
FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
WHERE Ci.IDPac = Pa.IDPac AND Ci.IDMed = Me.IDMed AND Me.IDPer = Pe.IDPer AND  Ci.IDPac = parIDPac
ORDER BY Ci.Fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamenesDeCita`(IN parIDCita INT)
BEGIN
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
Ci.IDCita  = parIDCita;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExResDeCita`(IN parIDCita INT)
BEGIN
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
Ci.IDCita = parIDCita;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExResDePaciente`(IN parIDPac INT)
BEGIN
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
Ci.IDPac = parIDPac
ORDER BY Test.Fecha DESC;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoPaciente`(IN parIDPac INT)
BEGIN
SELECT  
P.IDPac,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
Pe.Telefono, 
CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer && P.IDPac = parIDPac;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLabsDeCita`(IN parIDCita INT)
BEGIN
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
Ci.IDCita = parIDCita;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLabsDePaciente`(IN parIDPac INT)
BEGIN
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
Ci.IDPac = parIDPac;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPacientes`()
BEGIN
SELECT  
P.IDPac,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
Pe.Telefono, 
CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResultsDeCita`(IN parIDCita INT)
BEGIN
SELECT 
Result.IDLabTest, 
CatRes.Nombre, 
Result.esNormal AS Estatus,
CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
CatRes.Explicacion AS Detalles
FROM LTResult Result, LTCatalogoRes CatRes, LabTest LT 
WHERE 
Result.IDLTCatRes = CatRes.IDLTCatRes AND
Result.IDLabTest = LT.IDLabTest AND
LT.IDCita = parIDCita;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResultsDeLabTest`(IN parIDLabTest INT)
BEGIN
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
LT.IDLabTest = parIDLabTest;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResultsDePaciente`(IN parIDPac INT)
BEGIN
SELECT 
Result.IDLabTest, 
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
Ci.IDPac = parIDPac;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetaDeCita`(IN parIDCita INT)
BEGIN
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
Ci.IDCita = parIDCita;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetasDePaciente`(IN parIDPac INT)
BEGIN
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
CONCAT(MR.Duracion, " ", MR.UnidadDuracion) AS Duracion,
MR.Notas AS Indicaciones    
FROM Cita Ci, Receta Re, MedRecetado MR, CatalogoMedicinas CM, LabMedico LM
WHERE 
Re.IDCita = Ci.IDCita AND
MR.IDReceta = Re.IDReceta AND
MR.IDCatMed = CM.IDCatMed AND
CM.IDLab = LM.IDLab AND
Ci.IDPac = parIDPac;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarPaciente`(
IN parIDPac INT,
IN parNombre CHAR(30), 
IN parApellidoP CHAR(20), 
IN parApellidoM CHAR(20),
IN parDoB DATE, 
IN parTelefono CHAR(20),
IN parSexo CHAR(5))
BEGIN
UPDATE Persona Pe 
JOIN Paciente Pa ON Pe.IDPer = Pa.IDPer 
SET 
Pe.Nombre = parNombre,
Pe.ApellidoP = parApellidoP,
Pe.ApellidoM = parApellidoM,
Pe.DoB = parDoB,
Pe.Telefono = parTelefono,
Pe.Sexo = parSexo
WHERE Pa.IDPac = parIDPac;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoMedico`(IN parIDMed INT)
BEGIN
SELECT  
M.IDMed,
M.Especialidad,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
Pe.Telefono, 
CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Medico M, Persona Pe
WHERE M.IDPer = Pe.IDPer && M.IDMed = parIDMed;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarEspecialidad`(
IN parIDMed INT,
IN parEspecialidad CHAR(30)
)
BEGIN

UPDATE Medico Me
SET 
Me.Especialidad = parEspecialidad
WHERE Me.IDMed = parIDMed;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarMedico`(
IN parIDMed INT,
IN parEspecialidad CHAR(30),
IN parNombre CHAR(30), 
IN parApellidoP CHAR(20), 
IN parApellidoM CHAR(20),
IN parDoB DATE, 
IN parTelefono CHAR(20),
IN parSexo CHAR(5))
BEGIN

CALL modificarEspecialidad(parIDMed, parEspecialidad);

UPDATE Persona Pe
JOIN Medico Me ON Pe.IDPer = Me.IDPer 
SET 
Pe.Nombre = parNombre,
Pe.ApellidoP = parApellidoP,
Pe.ApellidoM = parApellidoM,
Pe.DoB = parDoB,
Pe.Telefono = parTelefono,
Pe.Sexo = parSexo
WHERE Me.IDMed = parIDMed;

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetasFechaDePaciente`(IN parIDPac INT)
BEGIN
SELECT Re.IDReceta, Re.Fecha
FROM Cita Ci, Receta Re
WHERE Re.IDCita = Ci.IDCita AND Ci.IDPac = parIDPac
ORDER BY Re.Fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetaDeIDRec`(IN parIDReceta INT)
BEGIN
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
Re.IDReceta = parIDReceta;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCitasCompletas`()
BEGIN
SELECT 
Ci.IDCita,
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
Ci.IDMed = Me.IDMed
ORDER BY Ci.Fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLabs`()
BEGIN
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
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetas`()
BEGIN
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExResDeIDLabTest`(IN parIDLabTest INT)
BEGIN
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
Test.IDLabTest = parIDLabTest;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCitasMedico`(IN parIDMed INT)
BEGIN
SELECT 
Ci.IDCita,
CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
Ci.Diagnostico,
Ci.Comentarios
FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
WHERE Ci.IDPac = Pa.IDPac AND 
Ci.IDMed = Me.IDMed AND 
Me.IDPer = Pe.IDPer AND 
Ci.IDMed = parIDMed
ORDER BY Ci.Fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetasDeMedico`(IN parIDMed INT)
BEGIN
SELECT 
Re.IDReceta, 
DATE_FORMAT(Re.Fecha,'%d/%m/%Y') AS Fecha,
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReporteAnormales`()
BEGIN
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLabsFechas`(IN parfini DATE, IN parfend DATE)
BEGIN
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
Test.Fecha >= fini AND
Test.Fecha <= fend
ORDER BY Test.Fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecetasFechas`(IN parfini DATE, IN parfend DATE)
BEGIN
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
Re.Fecha >= parfini AND
Re.Fecha <= parfend
GROUP BY CM.IDCatMed
ORDER BY COUNT(CM.IDCatMed) DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExAnPacienteFechas`(IN parfini DATE, IN parfend DATE)
BEGIN
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
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHistorialPeso`(IN parIDPac INT)
BEGIN
SELECT 
CONCAT(Peso, ' ', PesoUnidades) AS Peso,
CONCAT(Altura, ' ', AlturaUnidades) AS Altura
FROM Cita Ci
WHERE Ci.IDPac = parIDPac
ORDER BY Ci.Fecha DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCitasFechas`(IN parfini DATE, IN parfend DATE)
BEGIN
SELECT 
Ci.IDCita,
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
Ci.IDMed = Me.IDMed AND
Ci.Fecha >= parfini AND
Ci.Fecha <= parfend
ORDER BY Ci.Fecha DESC;
END$$
DELIMITER ;


#mysql-ctl cli
#DROP PROCEDURE IF EXISTS getHistorialPeso;

