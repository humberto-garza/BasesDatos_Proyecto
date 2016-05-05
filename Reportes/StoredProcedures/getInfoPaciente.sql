CREATE PROCEDURE getInfoPaciente (IN parIDPac INT)
BEGIN
	SELECT  
		P.IDPac,
		CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As 'Nombre Completo', 
		Pe.Sexo, DATE_FORMAT(Pe.DoB,'%d/%m/%Y') AS 'Fecha de Nacimiento', 
		Pe.Telefono, 
		CONCAT(Pe.Calle, ' ', Pe.NumeroCalle, '. ', Pe.Ciudad, ', ', Pe.Estado, ', ', Pe.Pais, '. ', Pe.CP) AS Direccion
	FROM Paciente P, Persona Pe
	WHERE P.IDPer = Pe.IDPer && P.IDPac = parIDPac;

END
