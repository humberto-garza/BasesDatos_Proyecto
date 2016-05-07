CREATE PROCEDURE getResultsDeCita (IN parIDCita INT)
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
		LT.IDCita = parIDCita;
END
