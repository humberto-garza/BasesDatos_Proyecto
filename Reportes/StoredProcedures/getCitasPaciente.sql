CREATE PROCEDURE getCitasPaciente (IN parIDPac INT)
BEGIN
SELECT 
	CONCAT(Pe.Nombre, ' ', Pe.ApellidoP,  ' ', Pe.ApellidoM) As Medico,
		DATE_FORMAT(Ci.Fecha,'%d/%m/%Y') AS Fecha,  
		TIME_FORMAT(Ci.Hora, '%H:%i') AS Hora,
		Ci.Diagnostico,
		Ci.Comentarios
	FROM Cita Ci, Paciente Pa, Medico Me, Persona Pe
	WHERE Ci.IDPac = Pa.IDPac AND Ci.IDMed = Me.IDMed AND Me.IDPer = Pe.IDPer AND  Ci.IDPac = parIDPac;
END
