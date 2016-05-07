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
	
	jQuery("#b_date").mask("99/99/9999");
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
												<h1>Crear Entidad</h1>
												<span>Por favor llena los datos para crear un nuevo registro</span>
										</div>
										
										
										<!--Contact Form begins-->
										<div id="contact-form">
												<form method="post" action="controllers/insertar_entidad.php">
                                                <h3>Datos Del Empleado</h3>
														<p class="input-block first">
																<label>
																		Nombre:
																</label>
																<input type="text" name="first_name">
														</p>
														<p class="input-block">
																<label>
																		Apellido:
																</label>
																<input type="text" name="last_name">
														</p>
														
                                                  
                                                        <p class="input-block first">
																<label>
																		SSN:
																</label>
																<input type="text" name="ssn">
														</p>
														
														
                                                       <p class="input-block last">
																<label>
																		Genero:
																</label>
																<span class="sidebar-form ">
                                                                    <label class="mt10">
                                                                            <input type="radio" value="M" name="sex">
                                                                            Masculino
                                                                            &nbsp; &nbsp; <input type="radio" name="sex" value="F">
                                                                            Femenino
                                                                    </label>
                                                                     
																</span>
                                                                
														</p>
                                                        
													
                                                        
														<div class="fr mt20">
														
                                                         <input class="button buttonBlue ml10" type="submit" value="Agregar">
                   										 <input class="button buttonGrey ml10" type="reset" value="Borrar Todo">
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
