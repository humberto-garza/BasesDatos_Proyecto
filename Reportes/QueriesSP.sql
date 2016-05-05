USE Hospital;

# Desplegar la informacion de un paciente por ID
CALL getInfoPaciente(1);
# Desplegar las Citas de un paciente por ID
CALL getCitasPaciente(1);
# Desplegar los examenes de una Cita
CALL getExamenesDeCita(1);