<?php
$config_array = parse_ini_file('config.ini');

$conexion =  mysqli_connect($config_array['host'], $config_array['user'], $config_array['password']);
mysqli_set_charset($conexion, 'utf8');
if (!$conexion) {
    die('No pudo conectarse: ' . mysqli_error());
}

$conexion_base = mysqli_select_db($conexion, $config_array['database']);

//Verificando que la conexión se haya hecho a la BD
if (!$conexion_base) {
    die ('No se encuentra la base de datos seleccionada : ' . mysqli_error());
}

?>
