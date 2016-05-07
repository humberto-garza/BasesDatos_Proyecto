USE Hospital;

# Desplegar la informacion de un paciente por ID
CALL getInfoPaciente(1);
# Desplegar las Citas de un paciente por ID
CALL getCitasPaciente(1);
# Desplegar los examenes de una Cita
CALL getExamenesDeCita(1);

# Detalles del Paciente 1
CALL getPacientes();
CALL getInfoPaciente(6);
CALL getLabsDePaciente(6);
CALL getResultsDePaciente(6);
CALL getExResDePaciente(6);
CALL getRecetasDePaciente(1);

SELECT *
FROM Paciente Pa, Persona Pe
Where Pa.IDPer = Pe.IDPer;

# EN PHP LO hacemos Booleano Para Resaltar los Anormales
# Examenes top n por una fecha
# Medicinas mas recetadas Por fecha rango etc...
# QUienes han subido de peso
# Historial de peso y altura
# Borrar e Insertar
# Insertar una receta




