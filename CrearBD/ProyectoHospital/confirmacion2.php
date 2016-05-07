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
                                
                                
                                		<div class="infoBox">
														<b>Entidad XXXXX:</b>
														Operaci&oacute;n realizada con &eacute;xito
                                                        <br><a href="index.php">Regresa al men&uacute; principal</a>
										</div>
                                
										
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
