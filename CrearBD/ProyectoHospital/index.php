<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US"> 

<head>
	<meta charset="UTF-8" /> 
	<title>Hospital Team Six</title>

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
	<img src="images/icon_welcome.png" alt="Wel
	come" title="Welcome" />
	<h1>Bienvenidos</h1>
	<br>
	<br>
	<span>Aquí se presentaral el proyecto final de la materia Bases de Datos impartido por Lorena Gómez en el cual se creó una Base de Datos para un hospital. A continuación mostramos nuestro proyecto. </span>
	</div>
	<img src="images/welcome_img_01.jpg" alt="Welcome" class="br5 mb15" />
	</div>
	<!--Welcome ends-->

	<!--Sidebar begins-->
	<div id="sidebar">

	<!--Quick search #1 begins-->
	<div class="sidebarBlock top">
	<div class="h2title">
	<h2>Integrantes del Equipo</h2>
	</div>

	<p> Las personas que estuvieron encargadas de este proyecto fue el equipo 6 el cual esta integrado por</p>
	<br>
	<p> Humbero Garza	A00808689</p>
	<br>
	<p> Elizabeth Villarreal	A01036194</p>
	<br>
	<p> Annette Garza	A01196162</p>
	<br>
	<p> Evan Juarez	A01324998</p>
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




