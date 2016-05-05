USE Hospital;

# Desplegar a Todos los pacientes
SELECT  CONCAT(Pe.Nombre, Pe. Pe.ApellidoP, Pe.ApellidoM) As Nombre Completo 
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer;


SELECT * 
FROM Paciente P, Persona Pe
WHERE P.IDPer = Pe.IDPer;


