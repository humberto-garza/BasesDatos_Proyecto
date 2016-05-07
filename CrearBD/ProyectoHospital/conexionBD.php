<?php
$conexion =  mysqli_connect('localhost:3306', 'root', 'Samylinda02');
mysqli_set_charset($conexion,'utf8');
if (!$conexion) {
    die('No pudo conectarse: ' . mysqli_error());
}

$conexion_base = mysqli_select_db($conexion,'hospital');

//Verificando que la conexión se haya hecho a la BD
if (!$conexion_base) {
    die ('No se encuentra la base de datos seleccionada : ' . mysqli_error());
    
}

?>