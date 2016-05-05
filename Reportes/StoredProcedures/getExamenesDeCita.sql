CREATE PROCEDURE getExamenesDeCita (IN parIDCita INT)
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
END
