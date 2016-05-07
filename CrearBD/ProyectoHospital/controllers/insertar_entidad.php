<?php
include '../conexionBD.php';

//Se reciben todas las variables por medio de post. Utilizar los mismos nombres que se ponen como "name" de cada elemento
$name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$ssn = $_POST['ssn'];
$sex = $_POST['sex'];

//Prepara y llama el stored procedure para insertar al empleado 
$stmt = mysqli_prepare($conexion, "CALL spCrearEmpleado(?,?,?,?)");
mysqli_stmt_bind_param($stmt, "ssss", $ssn, $sex, $last_name, $name);
mysqli_stmt_execute($stmt) or die("ERROR en query de Insert: " . mysqli_error($conexion));;
mysqli_stmt_close($stmt);

//redireccionamiento a la confirmación
//header("Location: ../confirmacion.php");

$url = "../confirmacion.php";
		$delay = 0;
		try {
			if (!headers_sent() && $delay == 0) {
				ob_end_clean();
				header("Location: " . $url);
			}
			// Performs a redirect once headers have been sent
			echo "<meta http-equiv=\"Refresh\" content=\"" . $delay . "; URL=" . $url . "\">";
			exit();
		} catch (Exception $err) {
			return $err->getMessage();
		}
?> 
