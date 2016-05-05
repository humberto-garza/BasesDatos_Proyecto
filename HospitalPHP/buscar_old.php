<?php
include_once('conexionBD.php');
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
												<h1>Buscar Entidad</h1>
												<span>Por favor llena los datos para hacer la búsqueda</span>
										</div>
										
										
										<!--Contact Form begins-->
										<div id="contact-form">
												<form method="post">
                                                
														<p class="input-block first">
																<label>
																		Campo 1:
																</label>
																<input type="text" name="first_name">
														</p>
														<p class="input-block">
																<label>
																		Campo 2:
																</label>
																<input type="text" name="last_name">
														</p>
														<p class="input-block last">
																<label>
																		Campo 3:
																</label>
																<input type="text" name="ssn">
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
																<th>Campo 1</th>
																<th>Campo 2</th>
																<th>Campo 3</th>
                                                                <th>Campo 4</th>
																<th>Campo 5</th>
																<th>Campo 6</th>
                                                                <th>Campo 7</th>
																<th>Campo 8</th>
														</tr>
												</thead>
												<tbody>
														<tr>
																<td><a href="editar_entidad.php">Item 1</a></td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
																
														</tr>
														<tr>
																<td><a href="editar_entidad.php">Item 2</a></td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
														</tr>
														<tr>
																<td><a href="editar_entidad.php">Item 3</a></td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
														</tr>
														<tr>
																<td><a href="editar_entidad.php">Item 4</a></td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
																<td>Item</td>
                                                                <td>Item</td>
																<td>Item</td>
														</tr>
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
