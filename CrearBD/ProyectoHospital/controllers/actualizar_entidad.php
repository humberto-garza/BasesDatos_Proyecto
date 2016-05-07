<?php
include '../conexionBD.php';

//Se reciben todas las variables por medio de post, el strin que viene dentro de los [] es el nombre del elemento html
$nombre = $_POST['Nombre Completo'];
$FechadeNacimiento = $_POST['Fecha de Nacimiento'];
$telefono = $_POST['Teléfono'];
$sex = $_POST['sex'];

//Prepara y llama el stored procedure para modificar al empleado 
$stmt = mysqli_prepare($conexion, "CALL modificarPaciente(?,?,?,?)");
mysqli_stmt_bind_param($stmt, "ssss", $nombre,$Fechadenacimiento, $telefono, $sex,);
mysqli_stmt_execute($stmt) or die("ERROR en query de Update: " . mysqli_error($conexion));;
mysqli_stmt_close($stmt);

//Se redirección a la confirmación
//header("Location: ../confirmacion.php"); // lo que comentamos para encontrar error 

/// esto es lo que se agrego 
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
