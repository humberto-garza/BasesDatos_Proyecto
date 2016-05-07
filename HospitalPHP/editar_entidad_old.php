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
												<h1>Editar Entidad</h1>
												<span>Por favor cambia los datos que deseas modificar</span>
										</div>
										
										
										<!--Contact Form begins-->
										<div id="contact-form">
												<form method="post" >
                                                <h3>Datos Personales</h3>
														<p class="input-block first">
																<label>
																		Campo 1:
																</label>
																<input type="text" name="first_name" value="Dato 1">
														</p>
														<p class="input-block">
																<label>
																		Campo 2:
																</label>
																<input type="text" name="m_init" value="Dato 2">
														</p>
														<p class="input-block last">
																<label>
																		Campo 3:
																</label>
																<input type="text" name="last_name" value="Dato 3">
														</p>
                                                        
                                                        <p class="input-block first">
																<label>
																		Campo 4:
																</label>
																<input type="text" name="ssn" value="Dato 4">
														</p>
														<p class="input-block">
																<label>
																		Campo 5:
																</label>
																<input type="text" id="b_date" name="b_date" value="Dato 5">
														</p>
														
                                                       <p class="input-block last">
																<label>
																		Campo 6:
																</label>
																<span class="sidebar-form ">
                                                                    <label class="mt10">
                                                                           <input type="radio" selected name="btn1" value="nopreference">
                                                                            Opcion 1
                                                                            &nbsp; &nbsp; <input type="radio" checked="checked" name="btn1" value="nopreference">
                                                                            Opcion 2
                                                                    </label>
                                                                     
																</span>
                                                                
														</p>
                                                        
														<p class="textarea-block">
																<label>
																		Campo 7:
																</label>
																
                                                                <input type="text" class="full-width"  value="XXXXXXXXXXXX">
														</p>
                                                        <h3>Datos Corporativos</h3>
                                                        
                                                        <p class="input-block first">
																<label>
																		Campo 8:
																</label>
																<input type="text" name="salary" value="10,000">
														</p>
														<p class="input-block">
																<label>
																		Supervisor:
																</label>
																<select name="super_ssn">
                                                                     
                                                                        <option>Selecciona una Opcion</option>
                                                                        <option value="">Option #1</option>
                                                                        <option value="">Option #2</option>
                                                                        <option selected value="">Option #3</option>
                                                                        <option value="">Option #4</option>
                                                                        <option value="">Option #5</option>
                                                                        <option value="">Option #6</option>
                                                                
                                                                </select>
														</p>
														<p class="input-block last">
																<label>
																		Departamento:
																</label>
																<select name="department">
                                                                       <option>Selecciona una Opcion</option>
                                                                        <option selected value="">Option #1</option>
                                                                        <option value="">Option #2</option>
                                                                        <option  value="">Option #3</option>
                                                                        <option value="">Option #4</option>
                                                                        <option value="">Option #5</option>
                                                                        <option value="">Option #6</option>
                                                                </select>
														</p>
                                                        
														<div class="fr mt20">
														
                                                         <input class="button buttonBlue ml10" type="submit" value="Editar">
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
