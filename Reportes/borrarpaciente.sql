CALL getCitasPaciente(1);

# Borrar Todos los medicamentos recetados
DELETE MR1.* FROM MedRecetado AS MR1
WHERE MR1.IDMedRec IN
(	
	SELECT *
    FROM 
    (
		SELECT MR.IDMedRec
		FROM Cita Ci, Receta Re, MedRecetado MR
		WHERE Ci.IDCita = Re.IDCita AND
		MR.IDReceta = Re.IDReceta AND
		Ci.IDPac = 1 
    ) x
);

# Borrar Todas las recetas
DELETE Re1.* FROM Receta AS Re1
WHERE Re1.IDReceta IN
(	
	SELECT *
    FROM 
    (
		SELECT Re.IDReceta
		FROM Cita Ci, Receta Re
		WHERE Ci.IDCita = Re.IDCita AND
		Ci.IDPac = 1 
    ) x
);

# Borrar Todos los resultados
DELETE LTR1.* FROM LTResult AS LTR1
WHERE LTR1.IDLTRes IN
(	
	SELECT *
    FROM 
    (
		SELECT LTR.IDLTRes
		FROM Cita Ci, LabTest LT, LTResult LTR
		WHERE Ci.IDPac = 1 AND
        LT.IDCita = Ci.IDCita AND
        LTR.IDLabTest = LT.IDLabTest
    ) x
);

# Borrar Todos los Examenes
DELETE LT1.* FROM LabTest AS LT1
WHERE LT1.IDLabTest IN
(	
	SELECT *
    FROM 
    (
		SELECT LT.IDLabTest
		FROM Cita Ci, LabTest LT
		WHERE Ci.IDPac = 1 AND
        LT.IDCita = Ci.IDCita
    ) x
);

# Borrar Todas las citas
DELETE Ci1.* FROM Cita AS Ci1
WHERE Ci1.IDCita IN
(	
	SELECT *
    FROM 
    (
		SELECT Ci.IDCita
		FROM Cita Ci
		WHERE Ci.IDPac = 1
    ) x
);

# Borrar El Paciente
DELETE FROM Paciente WHERE IDPac = 1;

