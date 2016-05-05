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
									
						<!--Welcome begins-->
						<div id="middleTwoColumn">
							<div class="h1title">
								<img src="images/icon_welcome.png" alt="Welcome" title="Welcome" />
								<h1>Bienvenido</h1>
								<span>... al proyecto de ejemplo para la materia de Base de Datos</span>
							</div>
							<img src="images/welcome_img_01.jpg" alt="Welcome" class="br5 mb15" />
							<p>Este es un ejemplo de como implementar los conceptos de Base de Datos a una aplicación web utilizando el el lenguaje de programación PHP y los conceptos básicos para accesar y modificar la base de datos que estamos utilizando para las pruebas.</p>
							<p>Esperamos que este ejemplo te sea de ayuda para el desarrollo de tu proyecto de bases de datos. </p>
							
			                <p><strong>¡Mucha suerte!</strong></p>
						</div>
						<!--Welcome ends-->
						
						<!--Sidebar begins-->
						<div id="sidebar">
						
							<!--Quick search #1 begins-->
							<div class="sidebarBlock top">
								<div class="h2title">
									<img src="images/icon_quickSearch.png" alt="Quick search" title="Quick search" />
									<h2>Nota Importante</h2>
								</div>
								<p>Este Templeate de ejemplo deberá ser usado exclusivamente para ejemplos académicos dentro de la materia de Base de Datos. De ninguna manera podrá ser distribuido a terceros, ni usado para generar aplicaciones comerciales ni personales fuera de los propósitos educativos de la materia.</p>
								<br />
							</div>
							<!--Quick search #1 ends-->
						</div>
						<!--Sidebar ends-->
											
					</div>
					<!--Middle part ends-->

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
