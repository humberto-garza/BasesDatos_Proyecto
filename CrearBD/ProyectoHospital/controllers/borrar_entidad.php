<?php
include '../conexionBD.php';

//Se reciben todas las variables por medio de post, el strin que viene dentro de los [] es el nombre del elemento html
$ssn = $_POST['ssn'];

//Prepara y llama el stored procedure para modificar al empleado 
$stmt = mysqli_prepare($conexion, "CALL spBorrarEmpleado(?)");
mysqli_stmt_bind_param($stmt, "s", $ssn);
mysqli_stmt_execute($stmt) or die("ERROR en query de Delete: " . mysqli_error($conexion));;
mysqli_stmt_close($stmt);

//Se redirección a la confirmación
//header("Location: ../confirmacion2.php");

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


