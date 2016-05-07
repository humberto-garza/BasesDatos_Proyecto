USE Hospital;

# Mostrar Info de un Paciente por Nombre
SELECT *
FROM Persona Pe, Paciente Pa
WHERE Pa.IDPer = Pe.ID AND Nombre="Samantha Elizabeth";

# Mostrar las Citas de un paciente por nombres
SELECT *
FROM Cita C
WHERE C.IDPac = 
(
SELECT Pa.ID
FROM Persona Pe, Paciente Pa
WHERE Pa.IDPer = Pe.ID AND Nombre="Samantha Elizabeth"
);

# Historial de Examenes de Laboratorio de Una Persona
SELECT DISTINCT *
FROM LabTest LT
WHERE  LT.IDCita IN
(
	SELECT ID
	FROM Cita C
	WHERE C.IDPac = 
	(
		SELECT Pa.ID
		FROM Persona Pe, Paciente Pa
		WHERE Pa.IDPer = Pe.ID AND Nombre="Erika Illeana"
	)
);

# Historial de Resultados de Laboratorio de Una Persona
SELECT DISTINCT Exams.Fecha, Exams.Hora, Exams.Notas, Res.*
FROM LTResult Res, 
(
	SELECT DISTINCT *
	FROM LabTest LT
	WHERE  LT.IDCita IN
	(
		SELECT ID
		FROM Cita C
		WHERE C.IDPac = 
		(
			SELECT Pa.ID
			FROM Persona Pe, Paciente Pa
			WHERE Pa.IDPer = Pe.ID AND Nombre="Erika Illeana"
		)
	)
) Exams
WHERE Res.IDLabTest = Exams.ID;


# Historial de Resultados de Laboratorio de Una Persona Completo
SELECT Results.Fecha, Results.Hora, Results.Notas, Ti.Tipo, Cat.Labtestname, CRes.Nombre, Results.Valor AS Resultados,  CRes.Unidades, CONCAT(CRes.ValMin, ' - ', CRes.ValMax) AS Rango, CRes.Explicacion
FROM LTCatalogoRes CRes, LTCatalogo Cat, LTipo Ti, 
(
	SELECT DISTINCT Exams.Fecha, Exams.Hora, Exams.Notas, Res.*
	FROM LTResult Res, 
	(
		SELECT DISTINCT *
		FROM LabTest LT
		WHERE  LT.IDCita IN
		(
			SELECT ID
			FROM Cita C
			WHERE C.IDPac = 
			(
				SELECT Pa.ID
				FROM Persona Pe, Paciente Pa
				WHERE Pa.IDPer = Pe.ID AND Nombre="Erika Illeana"
			)
		)
	) Exams
	WHERE Res.IDLabTest = Exams.ID
) Results
WHERE Results.IDLTCatRes = CRes.ID AND CRes.IDLTCat = Cat.ID AND Cat.IDLTipo = Ti.ID
ORDER BY Results.Fecha;

/*





*/










# Regresa recetas
SELECT p.IDPac, r.*, mr.*, cm.* FROM receta r
JOIN medrecetado mr ON r.IDReceta=mr.IDReceta
JOIN catalogomedicinas cm ON cm.IDCatMed=mr.IDCatMed 
JOIN cita c ON r.IDCita=c.IDCita
JOIN paciente p ON p.IDPac=c.IDPac;



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


