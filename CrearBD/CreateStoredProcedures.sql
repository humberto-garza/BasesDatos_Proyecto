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
		CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
		DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
		TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
		Ci.Diagnostico,
		Ci.Comentarios
	FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
	WHERE Ci.IDPac = Pa.IDPac AND Ci.IDMed = Me.IDMed AND Me.IDPer = Pe.IDPer AND  Ci.IDPac = parIDPac;
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
		Ci.IDPac = parIDPac;
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
