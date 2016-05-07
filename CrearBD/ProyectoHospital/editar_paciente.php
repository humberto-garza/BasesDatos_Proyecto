<?php
include_once('conexionBD.php');

//Se obtiene el IDPac por medio del método get 
$IDPac = $_GET['IDPac'];

//query para obtener la información del empleado por medio de su IDpac	
$query_paciente = mysqli_query($conexion,"SELECT * FROM Paciente WHERE IDPac = ".$IDPac) or die ("ERROR EN EL QUERY: " . mysqli_error());

//extrayendo la fila devuelta en el query
$empleado = mysqli_fetch_array($query_paciente);	

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US"> 
<head>
<meta charset="UTF-8" /> 
<title>Hospital</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />	
<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/style_nivo.css" media="screen">
		
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/hoverIntent.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script src="js/jquery.maskedinput-1.2.2.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript">
// Slider stuff
$(window).load(function() {
    $('#slider').nivoSlider({
        effect:'slideInLeft', // Specify sets like: 'fold,fade,sliceDown'
        animSpeed:300, // Slide transition speed
        pauseTime:6000, // How long each slide will show
        directionNav:true, // Next & Prev navigation
        keyboardNav:true, // Use left & right arrows
        pauseOnHover:true // Stop animation while hovering
    });
});
</script>
<script type="text/javascript">
// Initialise menu plugin
jQuery(function(){
	jQuery('ul.sf-menu').superfish();
});
</script>
       
</head>

<body>
<div id="container">
<?php include_once("header.php"); ?>

<div id="contentContainer">
				
			   <?php include_once("navbar.php"); ?>
						
				<!--Content begins-->		
				<div id="content">
						
						<!--Middle part begins-->
						<div id="middlePart">
						
								<!--Welcome begins-->
								<div id="middleTwoColumn">
										<div class="h1title">
												<h1>Editar Paciente</h1>
												<span>Por favor cambia los datos que deseas modificar</span>
										</div>
										
										
										<!--Contact Form begins-->
										<div id="contact-form">
												<form method="post" action="controllers/actualizar_entidad.php">
                                                <h3>Datos Personales:</h3>
														 
                                                        <p class="input-block first">
																<label>
																		Nombres Completo:
																</label>
																<input type="text" name="Nombre Completo" value="<?php echo $paciente['Nombre Completo'] ?>">
														</p>
														<p class="input-block first">
																<label>
																		Fecha de Nacimiento:
																</label>
																<input type="date" name="Fecha de Nacimiento" value="<?php echo $paciente['Fecha de Nacimiento'] ?>">
														</p>	

														<p class="input-block first">
																<label>
																		Teléfono:
																</label>
																<input type="text" name="Teléfono" value="<?php echo $paciente['Telefono'] ?>">
														</p>															
                                                       <p class="input-block last">
														<label>
														   Género:
														</label>
														<span class="sidebar-form ">
                                                        <label class="mt10">
                                                        <?php
														if ($paciente['Sex'] == 'M')
														{
															echo "<input name=\"sex\" type=\"radio\" value=\"M\" checked=\"checked\" />Hombre&nbsp; &nbsp;";
															echo "<input name=\"sex\" type=\"radio\" value=\"F\"/>Mujer";
														}
														else
														{
														   echo "<input name=\"sex\" type=\"radio\" value=\"M\"/>Hombre&nbsp; &nbsp;";
														   echo "<input name=\"sex\" type=\"radio\" value=\"F\" checked=\"checked\" />Mujer";
														}
														?>
                                                        </label>             
														</span>
														</p>
                                                        
														
                                                        
														<div class="fr mt20">
														
                                                         <input class="button buttonBlue ml10" type="submit" value="Editar">

                                                         <input class="button buttonBlue ml10" type="submit" formaction="controllers/borrar_entidad.php" value="Borrar Registro">

                   										
														</div>
														<div class="clear mb20"></div>
												</form>
										</div>
										<!--Contact Form ends-->
										
										
										
								</div>
								<!--Welcome ends-->
								
								
								
						</div>
						<!--Middle part ends-->

						<div class="clear"></div>
						
						
						
						<div class="clear"></div>
						
				</div>
				<!--Content ends-->	

				<?php include_once("footer.php"); ?>
				
				
		</div>
		<!--ContentContainer ends-->	

</div>
<!--Container ends-->



</body>
</html>
