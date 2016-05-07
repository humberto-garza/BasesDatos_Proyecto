<?php
include '../conexionBD.php';

//Se reciben todas las variables por medio de post, el strin que viene dentro de los [] es el nombre del elemento html
$name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$ssn = $_POST['ssn'];
$sex = $_POST['sex'];

//Prepara y llama el stored procedure para modificar al empleado 
$stmt = mysqli_prepare($conexion, "CALL spModificarEmpleado(?,?,?,?)");
mysqli_stmt_bind_param($stmt, "ssss", $ssn, $sex, $last_name, $name);
mysqli_stmt_execute($stmt) or die("ERROR en query de Update: " . mysqli_error($conexion));;
mysqli_stmt_close($stmt);

//Se redirección a la confirmación
header("Location: ../confirmacion.php");
?> 
