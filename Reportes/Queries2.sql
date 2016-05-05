USE Hospital;

# Desplegar a todos los pacientes
SELECT  
	Pa.IDPac,
	CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
	Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
	Pe.Telefono, 
	CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer;

# Desplegar todas las Citas 
SELECT 
	CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
	DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
    TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
    Ci.Diagnostico,
    Ci.Comentarios
FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
WHERE Ci.IDPac = Pa.IDPac AND Ci.IDMed = Me.IDMed AND Me.IDPer = Pe.IDPer;

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

#Desplegar los Resultados de todos los examenes de una Cita
SELECT 
	Result.IDLTRes, 
    CatRes.Nombre, 
    Result.esNormal AS Estatus,
    CONCAT(Result.Valor, ' ', IFNULL(CatRes.Unidades,'')) AS Resultados,
    CONCAT(CatRes.ValMin, ' - ', CatRes.ValMax) As 'Valores de Referencia',
    CatRes.Explicacion AS Detalles
FROM LTResult Result, LTCatalogoRes CatRes
WHERE Result.IDLTCatRes = CatRes.IDLTCatRes;


SELECT *
FROM LTResult;


# Regresa recetas
SELECT p.IDPac, r.*, mr.*, cm.* FROM receta r
JOIN medrecetado mr ON r.IDReceta=mr.IDReceta
JOIN catalogomedicinas cm ON cm.IDCatMed=mr.IDCatMed 
JOIN cita c ON r.IDCita=c.IDCita
JOIN paciente p ON p.IDPac=c.IDPac



/*

///////////////////////////////
*/



SELECT * 
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo
WHERE
	Test.IDCita = Ci.IDCita AND
	Test.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo;


SELECT *
FROM LabTest;




SELECT 
	DATE_FORMAT(Test.Fecha,'%d/%m/%Y') AS Fecha,  
    TIME_FORMAT(Test.Hora, '%H:%i') AS Hora
FROM Cita Ci, LabTest Test, LTCatalogo Catalogo, LTipo Tipo, LTResult Result, LTCatalogoRes CatalogoRes
WHERE
	Test.IDCita = Ci.IDCita AND
    Result.IDLabTest = Test.IDLabTest AND
    Result.IDLTCatRes = CatalogoRes.IDLTCatRes AND
    CatalogoRes.IDLTCat = Catalogo.IDLTCat AND
    Catalogo.IDLTipo = Tipo.IDLTipo;

