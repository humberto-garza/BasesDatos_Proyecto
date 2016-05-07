<?php
include_once('conexionBD.php');
//$busqueda_query = "SELECT * FROM Employee ";
//$resultado_busqueda = mysqli_query($conexion,$busqueda_query) or die ("ERROR EN EL QUERY: " . mysqli_error());
$resultado_busquedaSP = mysqli_query($conexion, "CALL getDoctores") or die("ERROR EN EL QUERY: " . mysqli_error());

?>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US"> 
<head>
<meta charset="UTF-8" /> 
<title>TEC Company</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />	
<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/style_nivo.css" media="screen">
		
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/hoverIntent.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
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
								<div class="fourColumn preColumn">
												
										</div>
								<!--Welcome begins-->
								<div id="middleTwoColumn">
										<div class="h1title">
												<h1>Buscar Doctor</h1>
												<span>Por favor llena los datos del doctor para poder iniciar tu búsqueda</span>
										</div>
										
										
										<!--Contact Form begins-->
										<div id="contact-form">
												<form method="post">

                                               			 <p class="input-block last">
																<label>
																		ID Doctor:
																</label>
																<input type="text" name="ID Paciente">
														</p>

														<p class="input-block first">
																<label>
																		Nombre Completo:
																</label>
																<input type="text" name="Nombre Completo">
														</p>
														
                                                        
                                                        
                                                        
														<div class="fr mt20">
														
                                                       <input class="button buttonBlue ml10" type="submit" name="btn_buscar_resultado_busqueda" value="Buscar">
														</div>
														<div class="clear mb20"></div>
												</form>
										</div>
										<!--Contact Form ends-->
										
										
										
										
										
								</div>
								<!--Welcome ends-->
                                
                                <div id="middleFullWidth">
                                	<table class="tableBlue">
												<thead>
														<tr>
																<th>ID Doctor</th>
																<th>Especialidad</th>
																<th>Nombre Completo</th>
																<th>Sexo</th>
																<th>Fecha de Nacimiento</th>
                                                                <th>Teléfono</th>
																<th>Dirección</th>
								
														</tr>
												</thead>
												<tbody>
                                                <?php 
													  if (isset($resultado_busquedaSP)) {
															while ($row =  mysqli_fetch_array($resultado_busquedaSP)) {
															echo 
        													"	
															<tr>
																<td><a href=\"editar_entidad.php?ssn=".$row['IDMed']."\">".$row['IDMed'] ."</a></td>
																<td>".$row['Especialidad'] ."</td>
																<td>".$row['Nombre Completo'] ."</td>
																<td>".$row['Sexo'] ."</td>
                                                                <td>".$row['Fecha de Nacimiento'] ."</td>
																<td>".$row['Telefono'] ."</td>
																<td>".$row['Direccion'] ."</td>
                                                              
														    </tr>";
															}
													  }
	                                             ?>
												</tbody>
										</table>
                                </div>
								
								<!--Sidebar begins-->
								<div id="sidebar">
								
										
										
										
								</div>
								<!--Sidebar ends-->
								
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
